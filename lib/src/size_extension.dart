import 'dart:math';

import 'package:flutter/material.dart';

import 'screen_util.dart';

extension SizeExtension on num {
  ///[ScreenUtil.setWidth]
  double wIndexed(int index) => ScreenUtil().setWidth(this, index: index);

  ///[ScreenUtil.setHeight]
  double hIndexed(int index) => ScreenUtil().setHeight(this, index: index);

  ///[ScreenUtil.radius]
  double rIndexed(int index) => ScreenUtil().radius(this, index: index);

  ///[ScreenUtil.diagonal]
  double dgIndexed(int index) => ScreenUtil().diagonal(this, index: index);

  ///[ScreenUtil.diameter]
  double dmIndexed(int index) => ScreenUtil().diameter(this, index: index);

  ///[ScreenUtil.setSp]
  double spIndexed(int index) => ScreenUtil().setSp(this, index: index);

  ///smart size :  it check your value - if it is bigger than your value it will set your value
  ///for example, you have set 16.sm() , if for your screen 16.sp() is bigger than 16 , then it will set 16 not 16.sp()
  ///I think that it is good for save size balance on big sizes of screen
  double spMinIndexed(int index) => min(toDouble(), spIndexed(index));

  @Deprecated('use spMin instead')
  double smIndexed(int index) => min(toDouble(), spIndexed(index));

  double spMaxIndexed(int index) => max(toDouble(), spIndexed(index));

  ///屏幕宽度的倍数
  ///Multiple of screen width
  double swIndexed(int index) => ScreenUtil().screenWidth(index) * this;

  ///屏幕高度的倍数
  ///Multiple of screen height
  double shIndexed(int index) => ScreenUtil().screenHeight(index) * this;

  ///[ScreenUtil.setHeight]
  SizedBox verticalSpaceIndexed(int index) => ScreenUtil().setVerticalSpacing(this, index: index);

  ///[ScreenUtil.setVerticalSpacingFromWidth]
  SizedBox verticalSpaceFromWidthIndexed(int index) => ScreenUtil().setVerticalSpacingFromWidth(this, index: index);

  ///[ScreenUtil.setWidth]
  SizedBox horizontalSpaceIndexed(int index) => ScreenUtil().setHorizontalSpacing(this, index: index);

  ///[ScreenUtil.radius]
  SizedBox horizontalSpaceRadiusIndexed(int index) => ScreenUtil().setHorizontalSpacingRadius(this, index: index);

  ///[ScreenUtil.radius]
  SizedBox verticalSpacingRadiusIndexed(int index) => ScreenUtil().setVerticalSpacingRadius(this, index: index);

  ///[ScreenUtil.diameter]
  SizedBox horizontalSpaceDiameterIndexed(int index) => ScreenUtil().setHorizontalSpacingDiameter(this, index: index);

  ///[ScreenUtil.diameter]
  SizedBox verticalSpacingDiameterIndexed(int index) => ScreenUtil().setVerticalSpacingDiameter(this, index: index);

  ///[ScreenUtil.diagonal]
  SizedBox horizontalSpaceDiagonalIndexed(int index) => ScreenUtil().setHorizontalSpacingDiagonal(this, index: index);

  ///[ScreenUtil.diagonal]
  SizedBox verticalSpacingDiagonalIndexed(int index) => ScreenUtil().setVerticalSpacingDiagonal(this, index: index);
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
