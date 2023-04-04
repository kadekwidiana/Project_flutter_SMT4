import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Category extends StatelessWidget {
  final String imagePath;
  final String title;
  const Category({super.key, required this.imagePath, required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          width: 50,
          height: 60,
          child: Column(
            children: [
              Image.asset(
                imagePath,
                width: 30,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                title,
                style: GoogleFonts.montserrat(fontSize: 10),
              )
            ],
          ),
        ),
      ),
    );
  }
}
