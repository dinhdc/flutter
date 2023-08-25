import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:listicle/utils/style.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 120,
          ),
          const Image(
            image: AssetImage("assets/images/splash.png"),
          ),
          const SizedBox(
            height: 40,
          ),
          Text("You'll find",
              style: GoogleFonts.dmSans(
                fontWeight: FontWeight.bold,
                fontSize: 40,
              )),
          Text("All you need",
              style: GoogleFonts.dmSans(
                fontWeight: FontWeight.bold,
                fontSize: 40,
                color: const Color.fromRGBO(252, 163, 77, 1),
                decoration: TextDecoration.underline,
                decorationColor: const Color.fromRGBO(252, 163, 77, 1),
              )),
          Text("Here!",
              style: GoogleFonts.dmSans(
                fontWeight: FontWeight.bold,
                fontSize: 40,
              )),
          const SizedBox(
            height: 40,
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, "/signUp");
            },
            style: TextButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 120),
                backgroundColor: primaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8))),
            child: Text(
              'Sign Up',
              style: GoogleFonts.montserrat(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, "/signIn");
            },
            child: Text(
              'Sign In',
              style: GoogleFonts.montserrat(
                color: primaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
