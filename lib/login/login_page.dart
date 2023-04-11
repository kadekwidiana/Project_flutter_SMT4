import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
import 'package:myproject/beranda/home_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    // ignore: unused_local_variable
    String _username, _password;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/coffee.jpeg'), fit: BoxFit.cover)),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 200.0,
                  ),
                  TextFormField(
                    validator: (value) =>
                        value!.isEmpty ? "Username can t" : null,
                    onSaved: (value) => _username = value!,
                    decoration: InputDecoration(
                        labelText: "Username", border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    obscureText: true,
                    validator: (value) =>
                        value!.isEmpty ? "Password cant be emty" : null,
                    onSaved: (value) => _password = value!,
                    decoration: InputDecoration(
                        labelText: "Password", border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    child: Text("Login"),
                    style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.brown,
                        padding: EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 28.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        textStyle: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold)),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
