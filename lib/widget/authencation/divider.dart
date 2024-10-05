import 'package:flutter/material.dart';

class DividerOr extends StatelessWidget {
  const DividerOr({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Flexible(
          child: Divider(
            indent: 50,
            endIndent: 15,
            thickness: 0.6,
          ),
        ),
        Text(
          'Hoặc',
        ),
        Flexible(
          child: Divider(
            indent: 15,
            endIndent: 50,
            thickness: 0.6,
          ),
        )
      ],
    );
  }
}
