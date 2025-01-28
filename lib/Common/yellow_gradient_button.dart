import 'package:flutter/material.dart';

import '../../util/color_util.dart';

class YellowGradientButtonDecoration extends BoxDecoration {
  YellowGradientButtonDecoration()
      : super(
    borderRadius: const BorderRadius.all(Radius.circular(5.0)),
    gradient: LinearGradient(
      begin: Alignment.bottomLeft,
      colors: [
        ColorUtil.yellowSwatch[900]!,
        ColorUtil.yellowSwatch[800]!,
        ColorUtil.yellowSwatch[700]!,
        ColorUtil.yellowSwatch[600]!,
      ],
    ),
  );
}
