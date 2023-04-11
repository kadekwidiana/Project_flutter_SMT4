import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool valDisplay1 = true;
  bool valDisplay2 = false;
  bool valDisplay3 = false;

  onChangeFunction1(bool newValue1) {
    setState(() {
      valDisplay1 = newValue1;
    });
  }

  onChangeFunction2(bool newValue2) {
    setState(() {
      valDisplay2 = newValue2;
    });
  }

  onChangeFunction3(bool newValue3) {
    setState(() {
      valDisplay3 = newValue3;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      appBar: AppBar(
        title: Text("Pengaturan"),
        backgroundColor: Colors.brown,
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Icon(Icons.person),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Akun',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )
              ],
            ),
            Divider(
              height: 20,
              thickness: 1,
            ),
            SizedBox(
              height: 10,
            ),
            buildAccountOption(context, 'Ganti Password'),
            buildAccountOption(context, 'Pengaturan konten'),
            buildAccountOption(context, 'Sosial'),
            buildAccountOption(context, 'Bahasa'),
            buildAccountOption(context, 'Privasi dan Keamanan'),
            buildAccountOption(context, 'Lokasi'),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Icon(Icons.display_settings_outlined),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Tampilan',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )
              ],
            ),
            Divider(
              height: 20,
              thickness: 1,
            ),
            SizedBox(
              height: 10,
            ),
            buildDisplayOption('Mode malam', valDisplay1, onChangeFunction1),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Icon(Icons.volume_off_outlined),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Notifikasi',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )
              ],
            ),
            Divider(
              height: 20,
              thickness: 1,
            ),
            buildDisplayOption('Notifikasi', valDisplay2, onChangeFunction2),
            buildDisplayOption(
                'Notifikasi lokasi terdekat', valDisplay3, onChangeFunction3),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }

  Padding buildDisplayOption(
      String title, bool value, Function onChangeMethod) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 17, fontWeight: FontWeight.w600, color: Colors.grey),
          ),
          Transform.scale(
            scale: 0.7,
            child: CupertinoSwitch(
              activeColor: Colors.blue,
              trackColor: Colors.grey,
              value: value,
              onChanged: (bool newValue) {
                onChangeMethod(newValue);
              },
            ),
          )
        ],
      ),
    );
  }

  GestureDetector buildAccountOption(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(title),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Pilihan 1'),
                    Text('Pilihan 2'),
                  ],
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Close'))
                ],
              );
            });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[600]),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
            )
          ],
        ),
      ),
    );
  }
}
