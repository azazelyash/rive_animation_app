import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class signinButton extends StatelessWidget {
  const signinButton({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.zero,
      onPressed: () {},
      icon: SvgPicture.asset(
        text,
        height: 64,
        width: 64,
      ),
    );
  }
}
