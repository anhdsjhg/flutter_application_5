import 'package:flutter/material.dart';
import 'package:flutter_application_5/components/button.dart';
import 'package:flutter_application_5/theme/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(height: 25),
            Text(
              'SUSHI MAN',
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 28,
                color: Colors.white,
              ),
            ),

            SizedBox(height: 25),

            Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 30, left: 90),
              child: Image.asset(
                'lib/images/salmon_eggs.png',
                height: 180,
                width: 180,
              ),
            ),

            SizedBox(height: 25),

            Text(
              'THE TASTE OF JAPANESE FOOD',
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 44,
                color: Colors.white,
              ),
            ),

            SizedBox(height: 10),

            Text(
              'Feel the taste of the most popular Japanese food from anywhere and anytime',
              style: TextStyle(color: Colors.grey[300], height: 2),
            ),

            SizedBox(height: 25),

            MyButton(
              text: 'Get Started',
              onTap: () {
                Navigator.pushNamed(context, '/menupage');
              },
            ),
          ],
        ),
      ),
    );
  }
}
