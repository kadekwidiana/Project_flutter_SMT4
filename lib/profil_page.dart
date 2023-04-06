import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';

class MyProfil extends StatelessWidget {
  const MyProfil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: "Tersimpan"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profil"),
      ]),
      appBar: AppBar(
        title: Text("Profil Page"),
      ),
      body: Center(
        child: Text("Ini Adalah halaman profil"),
      ),
    );
  }
}
