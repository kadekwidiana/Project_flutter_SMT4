import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home_page.dart';

class LoginGooglePage extends StatelessWidget {
  const LoginGooglePage({super.key});

  get child => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              "assets/coffee.jpeg",
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
              alignment: Alignment.center,
            ),
            Positioned(
                top: 30,
                child: Text(
                  "NGOPI YOOKK",
                  style:
                      GoogleFonts.montserrat(color: Colors.white, fontSize: 30),
                )),
            Positioned(
                bottom: 10,
                left: 10,
                right: 10,
                child: Card(
                  color: Colors.black.withOpacity(0.3),
                  elevation: 8.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          "Cari tempat ngopi sekarang !",
                          style: GoogleFonts.montserrat(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 16, right: 16, bottom: 8),
                        child: Text(
                          "Untuk menikmati fitur kami silahkan login terlebih dahulu",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                              fontSize: 12, color: Colors.white),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(
                              left: 16, right: 16, bottom: 32),
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(14),
                              child: ElevatedButton(
                                child: const Text("Login"),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const HomePage()));
                                },
                              ),
                            ),
                          )),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
