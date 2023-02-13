import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class PopupBox extends StatelessWidget {
  const PopupBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /* ------------------------------- Email Part ------------------------------- */

          Text(
            "Email",
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                fontSize: 14,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 8.0,
              bottom: 16,
            ),
            child: TextFormField(
              decoration: InputDecoration(
                hintStyle: const TextStyle(fontSize: 14),
                hintText: "Enter Email",
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: SvgPicture.asset("assets/icons/email.svg"),
                ),
              ),
            ),
          ),

          /* ------------------------------ Password Part ----------------------------- */

          Text(
            "Password",
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                fontSize: 14,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 8.0,
              bottom: 16,
            ),
            child: TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Enter Password",
                hintStyle: const TextStyle(fontSize: 14),
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: SvgPicture.asset("assets/icons/password.svg"),
                ),
              ),
            ),
          ),

          /* ------------------------------ Signin Button ----------------------------- */

          Padding(
            padding: const EdgeInsets.only(
              top: 8.0,
              bottom: 16.0,
            ),
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.arrow_forward),
              label: const Text("Sign In"),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFF77D8E),
                minimumSize: const Size(double.infinity, 56),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(25),
                    bottomLeft: Radius.circular(25),
                    bottomRight: Radius.circular(25),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
