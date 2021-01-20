import 'package:flutter/material.dart';

class SeparatedRow extends StatelessWidget {
  final List<Widget> children;
  final Widget separator;
  final bool includeOuterSeparators;
  final MainAxisAlignment mainAxisAlignment;

  const SeparatedRow({
    @required this.children,
    this.separator,
    this.includeOuterSeparators = false,
    this.mainAxisAlignment = MainAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = [];
    final int index = includeOuterSeparators ?? false ? 1 : 0;

    separatorBuilder(BuildContext context, int index) =>
        separator ??
        const SizedBox(
          width: 8.0,
        );

    if (this.children != null && this.children.isNotEmpty) {
      if (includeOuterSeparators ?? false) {
        children.add(separatorBuilder(context, 0));
      }

      for (int i = 0; i < this.children.length; i++) {
        children.add(this.children[i]);

        if (this.children.length - i != 1) {
          children.add(separatorBuilder(context, i + index));
        }
      }

      if (includeOuterSeparators ?? false) {
        children.add(separatorBuilder(context, this.children.length));
      }
    }

    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: children,
    );
  }
}
