import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:myproject/login/login_google_page.dart';
import 'package:myproject/login/login_page.dart';
import 'package:myproject/profil/profil_page.dart';
import 'package:myproject/settingf/setting_page.dart';
import 'package:myproject/widget/category.dart';

// import '../ProdukPage/products.dart';
import '../admin/DataPage.dart';
import '../admin/newpage.dart';
import '../detail/detail_page.dart';
import '../sqllite/ProdukPage/products.dart';
import 'package:myproject/admin/database_helper.dart';

class HomePage extends StatefulWidget {
  // final List<Cafe> dataCafe;
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // All data
  List<Map<String, dynamic>> myData = [];
  final formKey = GlobalKey<FormState>();

  // This function is used to fetch all data from the database
  void _refreshData() async {
    final data = await DatabaseHelper.getItems();
    setState(() {
      myData = data;
    });
  }

  @override
  void initState() {
    super.initState();
    _refreshData(); // Loading the data when the app starts
  }

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
              title: Text('Halaman Produk'),
              leading: Icon(Icons.production_quantity_limits),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProductPage()));
              },
            ),
            Divider(),
            ListTile(
              title: Text('Data Posts'),
              leading: Icon(Icons.post_add),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DataPage()));
              },
            ),
            Divider(),
            ListTile(
              title: Text('View post'),
              leading: Icon(Icons.point_of_sale_outlined),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => NewPage()));
              },
            ),
            Divider(),
            ListTile(
              title: Text('Log-Out'),
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
            SizedBox(
                width: double.infinity,
                height: 360,
                child: ListView.builder(
                  itemCount: myData.length,
                  itemBuilder: (context, index) => SizedBox(
                    width: double.infinity,
                    height: 240,
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, bottom: 5, top: 5),
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
                                        myData[index]['image'],
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                DetailPage()));
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
                              padding:
                                  const EdgeInsets.only(left: 15, right: 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(myData[index]['title'],
                                      style: GoogleFonts.montserrat(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.star, color: Colors.amber),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(myData[index]['rating'],
                                          style: GoogleFonts.montserrat(
                                              fontSize: 12)),
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
                                        myData[index]['jamBuka'],
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
                  ),
                )),
          ],
        )),
      ),
    );
  }
}
