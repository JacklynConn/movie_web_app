import 'package:flutter/cupertino.dart';

class Responsive{
  const Responsive();

  bool isMobile(context) => MediaQuery.of(context).size.width < 850;

  bool isTablet(context) => MediaQuery.of(context).size.width >= 850 && MediaQuery.of(context).size.width < 1100;

  bool isDesktop(context) => MediaQuery.of(context).size.width >= 1100;

  bool isLargeDesktop(context) => MediaQuery.of(context).size.width >= 1440;

  bool isExtraLargeDesktop(context) => MediaQuery.of(context).size.width >= 4000;

  // bool isPortrait(context) => MediaQuery.of(context).orientation == Orientation.portrait;
  //
  // bool isLandscape(context) => MediaQuery.of(context).orientation == Orientation.landscape;
  //
  // double screenWidth(context) => MediaQuery.of(context).size.width;
  //
  // double screenHeight(context) => MediaQuery.of(context).size.height;
  //
  // double blockSizeWidth(context) => MediaQuery.of(context).size.width / 100;
  //
  // double blockSizeHeight(context) => MediaQuery.of(context).size.height / 100;
  //
  // double textMultiplier(context) => MediaQuery.of(context).size.height / 100;
  //
  // double imageSizeMultiplier(context) => MediaQuery.of(context).size.width / 100;
}