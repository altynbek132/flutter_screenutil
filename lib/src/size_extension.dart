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

// ================================================================================================================== //
  ///[ScreenUtil.setWidth]
  double get w => wIndexed(0);

  ///[ScreenUtil.setHeight]
  double get h => hIndexed(0);

  ///[ScreenUtil.radius]
  double get r => rIndexed(0);

  ///[ScreenUtil.diagonal]
  double get dg => dgIndexed(0);

  ///[ScreenUtil.diameter]
  double get dm => dmIndexed(0);

  ///[ScreenUtil.setSp]
  double get sp => spIndexed(0);

  ///smart size :  it check your value - if it is bigger than your value it will set your value
  ///for example, you have set 16.sm() , if for your screen 16.sp() is bigger than 16 , then it will set 16 not 16.sp()
  ///I think that it is good for save size balance on big sizes of screen
  double get spMin => spMinIndexed(0);

  @Deprecated('use spMin instead')
  double get sm => smIndexed(0);

  double get spMax => spMaxIndexed(0);

  ///屏幕宽度的倍数
  ///Multiple of screen width
  double get sw => swIndexed(0);

  ///屏幕高度的倍数
  ///Multiple of screen height
  double get sh => shIndexed(0);

  ///[ScreenUtil.setHeight]
  SizedBox get verticalSpace => verticalSpaceIndexed(0);

  ///[ScreenUtil.setVerticalSpacingFromWidth]
  SizedBox get verticalSpaceFromWidth => verticalSpaceFromWidthIndexed(0);

  ///[ScreenUtil.setWidth]
  SizedBox get horizontalSpace => horizontalSpaceIndexed(0);

  ///[ScreenUtil.radius]
  SizedBox get horizontalSpaceRadius => horizontalSpaceRadiusIndexed(0);

  ///[ScreenUtil.radius]
  SizedBox get verticalSpacingRadius => verticalSpacingRadiusIndexed(0);

  ///[ScreenUtil.diameter]
  SizedBox get horizontalSpaceDiameter => horizontalSpaceDiameterIndexed(0);

  ///[ScreenUtil.diameter]
  SizedBox get verticalSpacingDiameter => verticalSpacingDiameterIndexed(0);

  ///[ScreenUtil.diagonal]
  SizedBox get horizontalSpaceDiagonal => horizontalSpaceDiagonalIndexed(0);

  ///[ScreenUtil.diagonal]
  SizedBox get verticalSpacingDiagonal => verticalSpacingDiagonalIndexed(0);

// ================================================================================================================== //
  ///[ScreenUtil.setWidth]
  double get w2 => wIndexed(1);

  ///[ScreenUtil.setHeight]
  double get h2 => hIndexed(1);

  ///[ScreenUtil.radius]
  double get r2 => rIndexed(1);

  ///[ScreenUtil.diagonal]
  double get dg2 => dgIndexed(1);

  ///[ScreenUtil.diameter]
  double get dm2 => dmIndexed(1);

  ///[ScreenUtil.setSp]
  double get sp2 => spIndexed(1);

  ///smart size :  it check your value - if it is bigger than your value it will set your value
  ///for example, you have set 16.sm() , if for your screen 16.sp() is bigger than 16 , then it will set 16 not 16.sp()
  ///I think that it is good for save size balance on big sizes of screen
  double get spMin2 => spMinIndexed(1);

  @Deprecated('use spMin instead')
  double get sm2 => smIndexed(1);

  double get spMax2 => spMaxIndexed(1);

  ///屏幕宽度的倍数
  ///Multiple of screen width
  double get sw2 => swIndexed(1);

  ///屏幕高度的倍数
  ///Multiple of screen height
  double get sh2 => shIndexed(1);

  ///[ScreenUtil.setHeight]
  SizedBox get verticalSpace2 => verticalSpaceIndexed(1);

  ///[ScreenUtil.setVerticalSpacingFromWidth]
  SizedBox get verticalSpaceFromWidth2 => verticalSpaceFromWidthIndexed(1);

  ///[ScreenUtil.setWidth]
  SizedBox get horizontalSpace2 => horizontalSpaceIndexed(1);

  ///[ScreenUtil.radius]
  SizedBox get horizontalSpaceRadius2 => horizontalSpaceRadiusIndexed(1);

  ///[ScreenUtil.radius]
  SizedBox get verticalSpacingRadius2 => verticalSpacingRadiusIndexed(1);

  ///[ScreenUtil.diameter]
  SizedBox get horizontalSpaceDiameter2 => horizontalSpaceDiameterIndexed(1);

  ///[ScreenUtil.diameter]
  SizedBox get verticalSpacingDiameter2 => verticalSpacingDiameterIndexed(1);

  ///[ScreenUtil.diagonal]
  SizedBox get horizontalSpaceDiagonal2 => horizontalSpaceDiagonalIndexed(1);

  ///[ScreenUtil.diagonal]
  SizedBox get verticalSpacingDiagonal2 => verticalSpacingDiagonalIndexed(1);
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
