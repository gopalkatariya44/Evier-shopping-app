import 'package:flutter/material.dart';

import 'custom_gradient.dart';

class CustomBoxDecoration extends BoxDecoration {
  const CustomBoxDecoration()
      : super(
          borderRadius: const BorderRadius.all(const Radius.circular(5)),
          gradient: const CustomGradient(),
          color: Colors.white,
        );
}
