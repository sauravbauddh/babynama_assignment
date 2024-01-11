import 'package:babynama_assignment/theme/pallete.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlanCard extends StatelessWidget {
  const PlanCard({Key? key, required this.onTap, required this.text})
      : super(key: key);

  final VoidCallback onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Palette.blueColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              child: Image.asset(
                "assets/images/child.png",
                height: 60,
                width: 60,
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: onTap,
                child: Container(
                  padding: const EdgeInsets.all(24),
                  child: Text(
                    text,
                    textAlign: TextAlign.left,
                    style: GoogleFonts.openSans(
                      fontSize: 16,
                      color: Palette.whiteColor,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
