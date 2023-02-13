// ignore: file_names
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rive/rive.dart';

class AnimatedBtn extends StatelessWidget {
  const AnimatedBtn({
    super.key,
    required RiveAnimationController btnAnimationController,
    required this.press,
  }) : _btnAnimationController = btnAnimationController;

  final RiveAnimationController _btnAnimationController;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        height: 64,
        width: 300,
        child: Stack(
          children: <Widget>[
            RiveAnimation.asset(
              "assets/RiveAssets/button.riv",
              controllers: [_btnAnimationController],
            ),
            Positioned.fill(
                top: 8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.arrow_forward,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Login Now",
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
