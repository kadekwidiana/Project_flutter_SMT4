import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myproject/widget/category.dart';
import 'package:myproject/widget/coffee_shop.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: "Tersimpan"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil"),
      ]),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 140,
                  width: double.infinity,
                  color: Colors.brown,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                alignment: Alignment.topLeft,
                                height: 45,
                                width: 45,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            "https://www.pngkey.com/png/full/157-1579943_no-profile-picture-round.png")),
                                    borderRadius: BorderRadius.circular(25),
                                    border: Border.all(
                                        color: Colors.white,
                                        style: BorderStyle.solid,
                                        width: 2)),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Hallo Widi, Selamat Datang !",
                                style:
                                    GoogleFonts.montserrat(color: Colors.white),
                              )
                            ],
                          ),
                          Container(
                              alignment: Alignment.topRight,
                              child: Icon(
                                Icons.notifications_active,
                                color: Colors.white,
                                size: 30,
                              )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Container(
                        height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Color(0xFFF5F5F7),
                            borderRadius: BorderRadius.circular(30)),
                        child: TextField(
                          cursorHeight: 20,
                          autofocus: false,
                          decoration: InputDecoration(
                              hintText: "Cari Tempat Favoritmu !",
                              prefixIcon: Icon(Icons.search),
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey, width: 2),
                                  borderRadius: BorderRadius.circular(30))),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  Category(imagePath: "assets/coffee-cup.png", title: "Tubruk"),
                  Category(imagePath: "assets/coffee.png", title: "Latte"),
                  Category(imagePath: "assets/mesin.png", title: "Espresso"),
                  Category(imagePath: "assets/biji.png", title: "Biji"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                "Tempat Favorit ☕️",
                style: GoogleFonts.montserrat(
                    fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            CoffeeShop(
              imagePath: "assets/coffee1.jpg",
              nameShop: "Kedai Kopi Kenangan",
              rating: "4.9",
              jamBuka: "09:00 - 23:00",
            ),
            CoffeeShop(
              imagePath: "assets/coffee2.jpg",
              nameShop: "Kopi Banyuatis",
              rating: "4.5",
              jamBuka: "10:30 - 24:00",
            ),
            CoffeeShop(
              imagePath: "assets/coffee3.jpg",
              nameShop: "Ellago Coffee",
              rating: "4.8",
              jamBuka: "09:30 - 20:00",
            ),
            CoffeeShop(
              imagePath: "assets/motor.jpg",
              nameShop: "Coffee Senja",
              rating: "4.3",
              jamBuka: "15:00 - 21:30",
            ),
          ],
        )),
      ),
    );
  }
}
