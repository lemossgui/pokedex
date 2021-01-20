import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pokedex/export.dart';

extension FontsFunctions on TextStyle {
  TextStyle copyWithBold() {
    return copyWith(fontWeight: FontWeight.bold);
  }

  TextStyle copyWithPrimaryColor() {
    return copyWith(color: primaryColor);
  }

  TextStyle copyWithSecondaryTextColor() {
    return copyWith(color: secondaryTextColor);
  }

  TextStyle copyWithSecondaryColor() {
    return copyWith(color: secondaryColor);
  }

  TextStyle copyWithError() {
    return copyWith(color: Colors.red);
  }
}
