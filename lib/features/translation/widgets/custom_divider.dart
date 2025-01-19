import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // line
        const Expanded(
          child: Divider(
            indent: 70,
            endIndent: 20,
            thickness: 1.5,
            color: Colors.grey,
          ),
        ),
        // icon
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_circle_right_outlined,
              size: 40,
              color: Colors.grey,
            ))
      ],
    );
  }
}
