import 'package:flutter/material.dart';

EdgeInsets getPadding({
  double? all,
  double? left,
  double? top,
  double? right,
  double? bottom,
}) {
  return EdgeInsets.fromLTRB(
    left ?? all ?? 0,
    top ?? all ?? 0,
    right ?? all ?? 0,
    bottom ?? all ?? 0,
  );
}

EdgeInsets getMargin({
  double? all,
  double? left,
  double? top,
  double? right,
  double? bottom,
}) =>
    getPadding(
      all: all,
      left: left,
      top: top,
      right: right,
      bottom: bottom,
    );
