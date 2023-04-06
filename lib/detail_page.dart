import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    // double widht = MediaQuery.of(context).size.width;
    return Scaffold(
      // backgroundColor: Colors.grey,
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
              //Stack Foto dan container
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    height: height * 0.3,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/coffee1.jpg"))),
                  ),
                  Positioned(
                    top: 16,
                    left: 16,
                    child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                        )),
                  ),
                  Positioned(
                    top: 16,
                    right: 16,
                    child: Container(
                      child: Icon(
                        Icons.assistant_direction,
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        "Kedai Kopi Kenangan",
                        style: GoogleFonts.montserrat(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    height: height * .09,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                  )
                ],
              ),

              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "4.6 (32 riview)",
                          style: GoogleFonts.montserrat(fontSize: 12),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.access_time,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "09:00 - 22:30",
                          style: GoogleFonts.montserrat(fontSize: 12),
                        )
                      ],
                    )
                  ],
                ),
              ),

              // Card Promo
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: Colors.amber[100],
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              "Ada promo untuk kamu",
                              style: GoogleFonts.montserrat(fontSize: 12),
                            ),
                            Text(
                              "Dapatkan diskon 50 ribu",
                              style: GoogleFonts.montserrat(fontSize: 11),
                            ),
                          ],
                        ),
                        ElevatedButton(onPressed: () {}, child: Text("Tukar"))
                      ],
                    ),
                  ),
                ),
              ),

              //Alamat
              TitleDetail(
                title: "Alamat :",
                detail: "Jalan Ahmad Yani No. 10 \nSingaraja, Bali",
              ),

              //Deskripsi
              TitleDetail(
                  title: "Deskripsi :",
                  detail:
                      "Kopi adalah minuman hasil seduhan biji kopi yang telah disangrai dan dihaluskan menjadi bubuk. Kopi merupakan salah satu komoditas di dunia yang dibudidayakan lebih dari 50 negara. Dua spesies pohon kopi yang dikenal secara umum yaitu Kopi Robusta (Coffea canephora) dan Kopi Arabika (Coffea arabica)."),

              // Title Ulasan
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  "Ulasan :",
                  style: GoogleFonts.montserrat(
                      fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ),

              // Widget Ulasan
              Comment(
                  image:
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRsDk8zs7Ssxa3I--LGT223HBG8UICIIxjcVA&usqp=CAU',
                  username: 'Ayikkk',
                  coment:
                      'Hanya secangkir kopi yang menyajikan rasa manis, bukan janji janji dari bibir yang terlihat manis.'),

              Comment(
                image:
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRsDk8zs7Ssxa3I--LGT223HBG8UICIIxjcVA&usqp=CAU',
                username: 'Natasya',
                coment:
                    'Hidup dapat diibaratkan seperti secangkir kopi hitam. Dimana rasa manis dan pahit akan bertemu di dalam sebuah kehangatan.',
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Comment extends StatelessWidget {
  final String image;
  final String username;
  final String coment;
  const Comment(
      {Key? key,
      required this.image,
      required this.username,
      required this.coment})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: [
              Image.network(
                image,
                width: 40,
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(username),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            coment,
            style: GoogleFonts.montserrat(fontSize: 12),
          )
        ],
      ),
    );
  }
}

class TitleDetail extends StatelessWidget {
  final String title;
  final String detail;
  const TitleDetail({Key? key, required this.title, required this.detail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.montserrat(
                fontSize: 12, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            detail,
            style: GoogleFonts.montserrat(fontSize: 12),
          )
        ],
      ),
    );
  }
}
