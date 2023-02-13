import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'package:rive_animation/components/animated_Btn.dart';
import 'package:rive_animation/components/other_signin_method.dart';
import 'package:rive_animation/components/sign_in_form.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late RiveAnimationController _btnAnimationController;

  /* ----------------------- Button Aimation Controller ----------------------- */

  @override
  void initState() {
    _btnAnimationController = OneShotAnimation(
      "active",
      autoplay: false,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /* ------------------------------- Background ------------------------------- */

          Positioned(
            width: MediaQuery.of(context).size.width * 1.7,
            bottom: 200,
            left: 100,
            child: Image.asset("assets/Backgrounds/Spline.png"),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 10),
            ),
          ),
          const RiveAnimation.asset(
            "assets/RiveAssets/shapes.riv",
            fit: BoxFit.fill,
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 35, sigmaY: 35),
              child: const SizedBox(),
            ),
          ),

          /* ------------------------------- Front Text ------------------------------- */

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  SizedBox(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "yash\nvishwakarma",
                          style: GoogleFonts.quicksand(
                            textStyle: const TextStyle(
                              height: 1.1,
                              fontWeight: FontWeight.bold,
                              fontSize: 44,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          "This app was created by Yash Vishwakarma, to understand the use of Rive Animation in Flutter Applications.",
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Spacer(
                    flex: 2,
                  ),

                  /* ------------------------------ Login Button ------------------------------ */

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AnimatedBtn(
                        btnAnimationController: _btnAnimationController,
                        press: () {
                          Feedback.forTap(context);
                          _btnAnimationController.isActive = true;
                          customSigninDialog(context);
                        },
                      ),
                    ],
                  ),

                  /* ------------------------------- Bottom Text ------------------------------ */

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24.0),
                    child: Text(
                      "By Signing In you agree to our terms and conditions. This app was created by Yash Vishwakarma.",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        textStyle: const TextStyle(
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<Object?> customSigninDialog(BuildContext context) {
    return showGeneralDialog(
      barrierDismissible: true,
      barrierLabel: "Sign In",
      context: context,
      pageBuilder: (context, _, __) => Center(
        child: Container(
          height: 600,
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.95),
            borderRadius: const BorderRadius.all(
              Radius.circular(40),
            ),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(
              clipBehavior: Clip.none,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 26.0,
                    vertical: 16,
                  ),
                  child: Column(
                    children: <Widget>[
                      Text(
                        "Sign In",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        "This app was created by Yash Vishwakarma, to understand the use of Rive Animation in Flutter Applications.",
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),

                      /* ---------------------------------- Form ---------------------------------- */

                      const PopupBox(),

                      /* --------------------------------- Or Part -------------------------------- */

                      Row(
                        children: const <Widget>[
                          Expanded(child: Divider()),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8.0,
                            ),
                            child: Text(
                              "Or",
                              style: TextStyle(
                                color: Colors.black26,
                              ),
                            ),
                          ),
                          Expanded(child: Divider()),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 20.0,
                        ),
                        child: Text(
                          "Signin Using Email, Apple or Google",
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                              color: Colors.black54,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const <Widget>[
                          signinButton(
                            text: "assets/icons/email_box.svg",
                          ),
                          signinButton(
                            text: "assets/icons/google_box.svg",
                          ),
                          signinButton(
                            text: "assets/icons/apple_box.svg",
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Positioned(
                  left: 0,
                  right: 0,
                  bottom: -18,
                  child: CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.close,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
