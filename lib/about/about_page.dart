import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tentang Aplikasi'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Image.asset(
                  'assets/logo.png',
                  height: 170,
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                'Tentang Aplikasi',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                '',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 20.0),
              Text(
                'Fitur Utama',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Card(
                child: ListTile(
                  leading: Icon(Icons.image_search_sharp),
                  title: Text('Pencarian tempat ngopi'),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.menu_book_rounded),
                  title: Text('Pilihan menu'),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.location_on_outlined),
                  title: Text('Lokasi kopi terdekat'),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.stars),
                  title: Text('Riview tempat'),
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                'Developer',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                children: <Widget>[
                  _buildTeamMember('assets/widi.png', 'Dek Widi'),
                ],
              ),
              SizedBox(height: 20.0),
              Text(
                'Kontak dan Informasi Tambahan',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10.0),
              Text(
                'Alamat: Jl. Sambangan No. 123, Singaraja\n'
                'Telepon: 083-120-743-647\n'
                'Email: kopiku@gmail.com\n'
                'Media Sosial: @kopiku',
                style: TextStyle(fontSize: 16.0),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTeamMember(String image, String name) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          CircleAvatar(
            backgroundImage: AssetImage(image),
            radius: 40.0,
          ),
          SizedBox(height: 10.0),
          Text(
            name,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
