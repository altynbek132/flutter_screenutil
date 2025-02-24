import 'dart:math';

import 'package:flutter/material.dart';

import 'screen_util.dart';

extension SizeExtension on num {
  ///[ScreenUtil.setWidth]
  double get w => ScreenUtil().setWidth(this, index: 0);

  ///[ScreenUtil.setHeight]
  double get h => ScreenUtil().setHeight(this, index: 0);

  ///[ScreenUtil.radius]
  double get r => ScreenUtil().radius(this, index: 0);

  ///[ScreenUtil.diagonal]
  double get dg => ScreenUtil().diagonal(this, index: 0);

  ///[ScreenUtil.diameter]
  double get dm => ScreenUtil().diameter(this, index: 0);

  ///[ScreenUtil.setSp]
  double get sp => ScreenUtil().setSp(this, index: 0);

  ///smart size :  it check your value - if it is bigger than your value it will set your value
  ///for example, you have set 16.sm() , if for your screen 16.sp() is bigger than 16 , then it will set 16 not 16.sp()
  ///I think that it is good for save size balance on big sizes of screen
  double get spMin => min(toDouble(), sp);

  @Deprecated('use spMin instead')
  double get sm => min(toDouble(), sp);

  double get spMax => max(toDouble(), sp);

  ///屏幕宽度的倍数
  ///Multiple of screen width
  double get sw => ScreenUtil().screenWidth(0) * this;

  ///屏幕高度的倍数
  ///Multiple of screen height
  double get sh => ScreenUtil().screenHeight(0) * this;

  ///[ScreenUtil.setHeight]
  SizedBox get verticalSpace => ScreenUtil().setVerticalSpacing(this, index: 0);

  ///[ScreenUtil.setVerticalSpacingFromWidth]
  SizedBox get verticalSpaceFromWidth => ScreenUtil().setVerticalSpacingFromWidth(this, index: 0);

  ///[ScreenUtil.setWidth]
  SizedBox get horizontalSpace => ScreenUtil().setHorizontalSpacing(this, index: 0);

  ///[ScreenUtil.radius]
  SizedBox get horizontalSpaceRadius => ScreenUtil().setHorizontalSpacingRadius(this, index: 0);

  ///[ScreenUtil.radius]
  SizedBox get verticalSpacingRadius => ScreenUtil().setVerticalSpacingRadius(this, index: 0);

  ///[ScreenUtil.diameter]
  SizedBox get horizontalSpaceDiameter => ScreenUtil().setHorizontalSpacingDiameter(this, index: 0);

  ///[ScreenUtil.diameter]
  SizedBox get verticalSpacingDiameter => ScreenUtil().setVerticalSpacingDiameter(this, index: 0);

  ///[ScreenUtil.diagonal]
  SizedBox get horizontalSpaceDiagonal => ScreenUtil().setHorizontalSpacingDiagonal(this, index: 0);

  ///[ScreenUtil.diagonal]
  SizedBox get verticalSpacingDiagonal => ScreenUtil().setVerticalSpacingDiagonal(this, index: 0);
}

extension EdgeInsetsExtension on EdgeInsets {
  /// Creates adapt insets using r [SizeExtension].
  EdgeInsets get r => copyWith(
        top: top.r,
        bottom: bottom.r,
        right: right.r,
        left: left.r,
      );

  EdgeInsets get dm => copyWith(
        top: top.dm,
        bottom: bottom.dm,
        right: right.dm,
        left: left.dm,
      );

  EdgeInsets get dg => copyWith(
        top: top.dg,
        bottom: bottom.dg,
        right: right.dg,
        left: left.dg,
      );

  EdgeInsets get w => copyWith(
        top: top.w,
        bottom: bottom.w,
        right: right.w,
        left: left.w,
      );

  EdgeInsets get h => copyWith(
        top: top.h,
        bottom: bottom.h,
        right: right.h,
        left: left.h,
      );
}

extension BorderRadiusExtension on BorderRadius {
  /// Creates adapt BorderRadius using r [SizeExtension].
  BorderRadius get r => copyWith(
        bottomLeft: bottomLeft.r,
        bottomRight: bottomRight.r,
        topLeft: topLeft.r,
        topRight: topRight.r,
      );

  BorderRadius get w => copyWith(
        bottomLeft: bottomLeft.w,
        bottomRight: bottomRight.w,
        topLeft: topLeft.w,
        topRight: topRight.w,
      );

  BorderRadius get h => copyWith(
        bottomLeft: bottomLeft.h,
        bottomRight: bottomRight.h,
        topLeft: topLeft.h,
        topRight: topRight.h,
      );
}

extension RadiusExtension on Radius {
  /// Creates adapt Radius using r [SizeExtension].
  Radius get r => Radius.elliptical(x.r, y.r);

  Radius get dm => Radius.elliptical(x.dm, y.dm);

  Radius get dg => Radius.elliptical(x.dg, y.dg);

  Radius get w => Radius.elliptical(x.w, y.w);

  Radius get h => Radius.elliptical(x.h, y.h);
}

extension BoxConstraintsExtension on BoxConstraints {
  /// Creates adapt BoxConstraints using r [SizeExtension].
  BoxConstraints get r => this.copyWith(
        maxHeight: maxHeight.r,
        maxWidth: maxWidth.r,
        minHeight: minHeight.r,
        minWidth: minWidth.r,
      );

  /// Creates adapt BoxConstraints using h-w [SizeExtension].
  BoxConstraints get hw => this.copyWith(
        maxHeight: maxHeight.h,
        maxWidth: maxWidth.w,
        minHeight: minHeight.h,
        minWidth: minWidth.w,
      );

  BoxConstraints get w => this.copyWith(
        maxHeight: maxHeight.w,
        maxWidth: maxWidth.w,
        minHeight: minHeight.w,
        minWidth: minWidth.w,
      );

  BoxConstraints get h => this.copyWith(
        maxHeight: maxHeight.h,
        maxWidth: maxWidth.h,
        minHeight: minHeight.h,
        minWidth: minWidth.h,
      );
}
