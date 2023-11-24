import 'package:flutter/material.dart';

// this class is used to get the screen size
class Screen {
  static const double _figmaWidth = 430;
  static const double _figmaHeight = 932;

  static double _heightWithoutStatusBarAndBottomBar(BuildContext context) =>
      MediaQuery.of(context).size.height -
      MediaQuery.of(context).padding.top -
      MediaQuery.of(context).padding.bottom;

  static double _widthWithoutLeftRight(BuildContext context) =>
      MediaQuery.of(context).size.width -
      MediaQuery.of(context).padding.left -
      MediaQuery.of(context).padding.right;

  static double designToScreenHeight(
          BuildContext context, double designHeight) =>
      _heightWithoutStatusBarAndBottomBar(context) *
      designHeight /
      Screen._figmaHeight;

  static double designToScreenWidth(BuildContext context, double designWidth) =>
      _widthWithoutLeftRight(context) * designWidth / Screen._figmaWidth;

  // static double safeAreaHeight(BuildContext context) =>
  //     MediaQuery.of(context).padding.top +
  //     MediaQuery.of(context).padding.bottom;
  // static double safeAreaHeightWithoutBottomBar(BuildContext context) =>
  //     MediaQuery.of(context).padding.top;
  // static double safeAreaHeightWithoutTopBar(BuildContext context) =>
  //     MediaQuery.of(context).padding.bottom;
  // static double safeAreaWidth(BuildContext context) =>
  //     MediaQuery.of(context).padding.left +
  //     MediaQuery.of(context).padding.right;
  // static double safeAreaWidthWithoutLeftRight(BuildContext context) =>
  //     MediaQuery.of(context).padding.left;
  // static double safeAreaWidthWithoutRight(BuildContext context) =>
  //     MediaQuery.of(context).padding.right;
  // static double safeAreaWidthWithoutLeft(BuildContext context) =>
  //     MediaQuery.of(context).padding.left;

  // static double _width(BuildContext context) =>
  //     MediaQuery.of(context).size.width;
  // static double height(BuildContext context) =>
  //     MediaQuery.of(context).size.height;

  // static double statusBarHeight(BuildContext context) =>
  //     MediaQuery.of(context).padding.top;
  // static double bottomBarHeight(BuildContext context) =>
  //     MediaQuery.of(context).padding.bottom;
}
