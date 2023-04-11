import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myproject/detail/detail_page.dart';

class CoffeeShop extends StatelessWidget {
  final String imagePath;
  final String nameShop;
  final String rating;
  final String jamBuka;
  const CoffeeShop(
      {super.key,
      required this.imagePath,
      required this.nameShop,
      required this.rating,
      required this.jamBuka});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 240,
      child: Stack(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 15, right: 15, bottom: 5, top: 5),
            child: Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              elevation: 10,
              child: Column(
                children: <Widget>[
                  GestureDetector(
                    child: Container(
                      child: SizedBox(
                        width: double.infinity,
                        height: 150,
                        child: Image.asset(
                          imagePath,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailPage()));
                    },
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 10,
            child: SizedBox(
              height: 70,
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(nameShop,
                        style: GoogleFonts.montserrat(
                            fontSize: 17, fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber),
                        SizedBox(
                          width: 5,
                        ),
                        Text(rating,
                            style: GoogleFonts.montserrat(fontSize: 12)),
                        SizedBox(
                          width: 20,
                        ),
                        Icon(
                          Icons.access_time,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          jamBuka,
                          style: GoogleFonts.montserrat(
                            fontSize: 12,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
