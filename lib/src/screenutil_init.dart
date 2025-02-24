import 'dart:async';
import 'dart:collection';

import 'package:flutter/widgets.dart';

import './_flutter_widgets.dart';
import 'screen_util.dart';
import 'screenutil_mixin.dart';

typedef RebuildFactor = bool Function(MediaQueryData old, MediaQueryData data);

typedef ScreenUtilInitBuilder = Widget Function(
  BuildContext context,
  Widget? child,
);

abstract class RebuildFactors {
  static bool size(MediaQueryData old, MediaQueryData data) {
    return old.size != data.size;
  }

  static bool orientation(MediaQueryData old, MediaQueryData data) {
    return old.orientation != data.orientation;
  }

  static bool sizeAndViewInsets(MediaQueryData old, MediaQueryData data) {
    return old.viewInsets != data.viewInsets;
  }

  static bool change(MediaQueryData old, MediaQueryData data) {
    return old != data;
  }

  static bool always(MediaQueryData _, MediaQueryData __) {
    return true;
  }

  static bool none(MediaQueryData _, MediaQueryData __) {
    return false;
  }
}

abstract class FontSizeResolvers {
  static double width(num fontSize, ScreenUtil instance, {required int index}) {
    return instance.setWidth(fontSize, index: index);
  }

  static double height(num fontSize, ScreenUtil instance, {required int index}) {
    return instance.setHeight(fontSize, index: index);
  }

  static double radius(num fontSize, ScreenUtil instance, {required int index}) {
    return instance.radius(fontSize, index: index);
  }

  static double diameter(num fontSize, ScreenUtil instance, {required int index}) {
    return instance.diameter(fontSize, index: index);
  }

  static double diagonal(num fontSize, ScreenUtil instance, {required int index}) {
    return instance.diagonal(fontSize, index: index);
  }
}

class ScreenUtilInit extends StatefulWidget {
  /// A helper widget that initializes [ScreenUtil]
  const ScreenUtilInit({
    Key? key,
    this.builder,
    this.child,
    this.rebuildFactor = RebuildFactors.size,
    this.designSizes = const [ScreenUtil.defaultSize],
    this.splitScreenMode = false,
    this.minTextAdapt = false,
    this.useInheritedMediaQuery = false,
    this.ensureScreenSize = false,
    this.enableScaleWH,
    this.enableScaleText,
    this.responsiveWidgets,
    this.excludeWidgets,
    this.fontSizeResolver = FontSizeResolvers.width,
  }) : super(key: key);

  final ScreenUtilInitBuilder? builder;
  final Widget? child;
  final bool splitScreenMode;
  final bool minTextAdapt;
  final bool useInheritedMediaQuery;
  final bool ensureScreenSize;
  final bool Function()? enableScaleWH;
  final bool Function()? enableScaleText;
  final RebuildFactor rebuildFactor;
  final FontSizeResolver fontSizeResolver;

  /// The [Size] of the device in the design draft, in dp
  final List<Size> designSizes;
  final Iterable<String>? responsiveWidgets;
  final Iterable<String>? excludeWidgets;

  @override
  State<ScreenUtilInit> createState() => _ScreenUtilInitState();
}

class _ScreenUtilInitState extends State<ScreenUtilInit> with WidgetsBindingObserver {
  final _canMarkedToBuild = HashSet<String>();
  final _excludedWidgets = HashSet<String>();
  MediaQueryData? _mediaQueryData;
  final _binding = WidgetsBinding.instance;
  final _screenSizeCompleter = Completer<void>();

  @override
  void initState() {
    if (widget.responsiveWidgets != null) {
      _canMarkedToBuild.addAll(widget.responsiveWidgets!);
    }

    ScreenUtil.enableScale(enableWH: widget.enableScaleWH, enableText: widget.enableScaleText);

    _validateSize().then(_screenSizeCompleter.complete);

    super.initState();
    _binding.addObserver(this);
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    _revalidate();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _revalidate();
  }

  MediaQueryData? _newData() {
    return MediaQuery.maybeOf(context);
  }

  Future<void> _validateSize() async {
    if (widget.ensureScreenSize) return ScreenUtil.ensureScreenSize();
  }

  void _markNeedsBuildIfAllowed(Element el) {
    final widgetName = el.widget.runtimeType.toString();
    if (_excludedWidgets.contains(widgetName)) return;
    final allowed = widget is SU ||
        _canMarkedToBuild.contains(widgetName) ||
        !(widgetName.startsWith('_') || flutterWidgets.contains(widgetName));

    if (allowed) el.markNeedsBuild();
  }

  void _updateTree(Element el) {
    _markNeedsBuildIfAllowed(el);
    el.visitChildren(_updateTree);
  }

  void _revalidate([void Function()? callback]) {
    final oldData = _mediaQueryData;
    final newData = _newData();

    if (newData == null) return;

    if (oldData == null || widget.rebuildFactor(oldData, newData)) {
      setState(() {
        _mediaQueryData = newData;
        _updateTree(context as Element);
        callback?.call();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final mq = _mediaQueryData;

    if (mq == null) return const SizedBox.shrink();

    if (!widget.ensureScreenSize) {
      ScreenUtil.configure(
        data: mq,
        designSizes: widget.designSizes,
        splitScreenMode: widget.splitScreenMode,
        minTextAdapt: widget.minTextAdapt,
        fontSizeResolver: widget.fontSizeResolver,
      );

      return widget.builder?.call(context, widget.child) ?? widget.child!;
    }

    return FutureBuilder<void>(
      future: _screenSizeCompleter.future,
      builder: (c, snapshot) {
        ScreenUtil.configure(
          data: mq,
          designSizes: widget.designSizes,
          splitScreenMode: widget.splitScreenMode,
          minTextAdapt: widget.minTextAdapt,
          fontSizeResolver: widget.fontSizeResolver,
        );

        if (snapshot.connectionState == ConnectionState.done) {
          return widget.builder?.call(context, widget.child) ?? widget.child!;
        }

        return const SizedBox.shrink();
      },
    );
  }

  @override
  void dispose() {
    _binding.removeObserver(this);
    super.dispose();
  }
}
