import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';

class StoredPage extends StatefulWidget {
  const StoredPage({super.key});

  @override
  State<StoredPage> createState() => _StoredPageState();
}

class _StoredPageState extends State<StoredPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tersimpan'),
        backgroundColor: Colors.brown,
      ),
      body: Center(
        child: Text('Halaman Tersimpan'),
      ),
    );
  }
}
