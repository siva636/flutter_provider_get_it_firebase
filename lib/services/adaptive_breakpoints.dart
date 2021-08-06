import 'package:flutter/material.dart';

// This is according to the latest breakpoints system as of 6-Aug-2021:
// https://material.io/design/layout/responsive-layout-grid.html#breakpoints
enum AdaptiveWindowType {
  xsmall,
  small,
  smallPlus,
  medium,
  large,
}

final Map<AdaptiveWindowType, int> _operatorMap = {
  AdaptiveWindowType.xsmall: 0,
  AdaptiveWindowType.small: 1,
  AdaptiveWindowType.smallPlus: 2,
  AdaptiveWindowType.medium: 3,
  AdaptiveWindowType.large: 4,
};

int _relativeSize(AdaptiveWindowType adaptiveWindowType) {
  return _operatorMap[adaptiveWindowType]!;
}

extension AdaptiveWindowTypeExtension on AdaptiveWindowType {
  bool operator <=(AdaptiveWindowType other) =>
      _relativeSize(this) <= _relativeSize(other);

  bool operator <(AdaptiveWindowType other) =>
      _relativeSize(this) < _relativeSize(other);

  bool operator >=(AdaptiveWindowType other) =>
      _relativeSize(this) >= _relativeSize(other);

  bool operator >(AdaptiveWindowType other) =>
      _relativeSize(this) > _relativeSize(other);
}

class BreakpointsInfo {
  const BreakpointsInfo({
    required this.adaptiveWindowType,
    required this.columns,
    required this.margin,
    required this.gutter,
  });

  final AdaptiveWindowType adaptiveWindowType;
  final int columns;
  final double margin;
  final double gutter;
}

AdaptiveWindowType getWindowType(BuildContext context) {
  return getBreakpointsInfo(context).adaptiveWindowType;
}

BreakpointsInfo getBreakpointsInfo(BuildContext context) {
  double width = MediaQuery.of(context).size.width;

  if (width > 0 && width <= 599) {
// xsmall
    return BreakpointsInfo(
        adaptiveWindowType: AdaptiveWindowType.xsmall,
        columns: 4,
        margin: 16,
        gutter: 16);
  } else if (width >= 600 && width <= 904) {
    // small
    return BreakpointsInfo(
        adaptiveWindowType: AdaptiveWindowType.small,
        columns: 8,
        margin: 32,
        gutter: 32);
  } else if (width >= 905 && width <= 1239) {
    // smallPlus
    return BreakpointsInfo(
      adaptiveWindowType: AdaptiveWindowType.smallPlus,
      columns: 12,
      margin: (width - 840) / 2,
      gutter: 32,
    );
  } else if (width >= 1240 && width <= 1439) {
    // medium
    return BreakpointsInfo(
        adaptiveWindowType: AdaptiveWindowType.medium,
        columns: 12,
        margin: 200,
        gutter: 32);
  } else if (width >= 1440) {
    // large
    return BreakpointsInfo(
      adaptiveWindowType: AdaptiveWindowType.large,
      columns: 12,
      margin: (width - 1040) / 2,
      gutter: 32,
    );
  } else {
    throw AssertionError('Something unexpected happened');
  }
}
