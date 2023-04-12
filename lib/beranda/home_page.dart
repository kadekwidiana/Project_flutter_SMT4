import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myproject/login/login_google_page.dart';
import 'package:myproject/login/login_page.dart';
import 'package:myproject/profil/profil_page.dart';
import 'package:myproject/settingf/setting_page.dart';
import 'package:myproject/widget/category.dart';
import 'package:myproject/widget/coffee_shop.dart';

// import 'login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hallo Widi, Selamat datang",
            style: GoogleFonts.montserrat(color: Colors.white)),
        titleTextStyle: TextStyle(fontSize: 14),
        backgroundColor: Colors.brown,
        iconTheme: IconThemeData(color: Colors.white, size: 25),
        elevation: 0,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: IconButton(
              icon: Icon(
                Icons.notifications_active,
                color: Colors.white,
                size: 25,
              ),
              onPressed: () {},
            ),
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.brown),
              accountName: Text('Kadek Widiana'),
              accountEmail: Text('kadekwidiana296@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/widi.png'),
              ),
            ),
            ListTile(
              title: Text('Detail Profil'),
              leading: Icon(Icons.person),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyProfil()));
              },
            ),
            Divider(),
            ListTile(
              title: Text('Pengaturan'),
              leading: Icon(Icons.settings),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SettingPage()));
              },
            ),
            Divider(),
            ListTile(
              title: Text('LogOut'),
              leading: Icon(Icons.exit_to_app),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
            )
          ],
        ),
      ),
      backgroundColor: Colors.white,
      // bottomNavigationBar: BottomNavigationBar(items: [
      //   BottomNavigationBarItem(
      //       icon: Icon(
      //         Icons.home,
      //         color: Colors.brown,
      //       ),
      //       label: "Home"),
      //   BottomNavigationBarItem(
      //       icon: Icon(
      //         Icons.bookmark,
      //         color: Colors.brown,
      //       ),
      //       label: "Tersimpan"),
      //   BottomNavigationBarItem(
      //       icon: Icon(
      //         Icons.person,
      //         color: Colors.brown,
      //       ),
      //       label: "Profil"),
      // ]),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 70,
                  width: double.infinity,
                  color: Colors.brown,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
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
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Category(
                        imagePath: "assets/coffee-cup.png", title: "Tubruk"),
                    Category(imagePath: "assets/coffee.png", title: "Latte"),
                    Category(imagePath: "assets/mesin.png", title: "Espresso"),
                    Category(imagePath: "assets/biji.png", title: "Biji"),
                    Category(imagePath: "assets/biji.png", title: "Good"),
                  ],
                ),
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
              imagePath: "assets/coffee2.jpg",
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
