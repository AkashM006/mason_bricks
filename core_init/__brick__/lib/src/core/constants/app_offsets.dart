import 'package:{{ project_name.snakeCase() }}/src/core/constants/size.dart';
import 'package:flutter/material.dart';

// Just a sample, change implementation when required
// Call the init method inside the build() of a top level widget that doesn't re-render
class AppOffsets {
  static late BoxConstraints formWidthConstraint;
  static late BoxConstraints messageWidthConstaint;
  static late EdgeInsets screenPadding;
  static late BorderRadius cardBorderRadius;

  static void init(BuildContext context) {
    formWidthConstraint = const BoxConstraints(maxWidth: 500);
    messageWidthConstaint = BoxConstraints(
      maxWidth: SizeConfig.safeBlockHorizontal * 80 > 600
          ? 600
          : SizeConfig.safeBlockHorizontal * 80,
    );
    screenPadding = EdgeInsets.symmetric(
      vertical: SizeConfig.safeBlockVertical * 2,
      horizontal: SizeConfig.safeBlockHorizontal * 5,
    );
    cardBorderRadius = BorderRadius.circular(16);
  }
}
