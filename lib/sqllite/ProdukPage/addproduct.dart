import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_sqlite/models/product.dart';
// import 'package:flutter_sqlite/pages/products.dart';
// import 'package:flutter_sqlite/services/databasehelper.dart';

import '../models/product.dart';
import '../services/databasehelper.dart';

class ProductAdd extends StatefulWidget {
  final Product _product;
  ProductAdd(this._product);

  @override
  State<ProductAdd> createState() => _ProductAddState(this._product);
}

class _ProductAddState extends State<ProductAdd> {
  final Product _product;
  _ProductAddState(this._product);
  late final nameController = TextEditingController();
  final imageController = TextEditingController();
  final codeController = TextEditingController();
  final descriptionController = TextEditingController();
  bool isEditing = false;
  DatabaseHelper dbHelper = DatabaseHelper();
  Future<void> addOrEditUser() async {
    String desc = descriptionController.text;
    String title = nameController.text;
    String image = imageController.text;
    String rating = codeController.text;

    if (!isEditing) {
      Product product = new Product(
          title: title, image: image, rating: rating, description: desc, category: '');
      //await addProduct(product);
      await dbHelper.insertProduct(product);
    } else {
      _product.description = desc;
      _product.rating = rating;
      _product.title = title;
      _product.image = image;
      _product.category = '';
      //await updateProduct(_product);
      await dbHelper.updateProduct(_product);
    }
    // ignore: use_build_context_synchronously
    Navigator.pop(context, true);

    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
    //   return ProductPage();
    // }));
    resetData();
    setState(() {});
  }

  // Future<int?> addProduct(Product product) async {
  //   return await dbHelper.insertProduct(product);
  // }

  // Future<int?> updateProduct(Product product) async {
  //   return await dbHelper.updateProduct(product);
  // }

  void resetData() {
    nameController.clear();
    descriptionController.clear();
    codeController.clear();
    isEditing = false;
  }

  Widget build(BuildContext context) {
    nameController.text = widget._product.title;
    nameController.text = widget._product.image;
    codeController.text = widget._product.rating;
    descriptionController.text = widget._product.description;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("Product Page"),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
                child: new Column(
              children: [
                Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Form(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                          TextFormField(
                            controller: nameController,
                            decoration: const InputDecoration(
                                hintText: 'Enter Product title',
                                labelText: 'Title'),
                          ),
                          TextFormField(
                            controller: imageController,
                            decoration: const InputDecoration(
                                hintText: 'Masukan alamat gambar',
                                labelText: 'Image'),
                          ),
                          TextFormField(
                            controller: codeController,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9]')),
                            ],
                            decoration: const InputDecoration(
                                hintText: 'Enter Product Code',
                                labelText: 'Rating'),
                          ),
                          TextFormField(
                            controller: descriptionController,
                            decoration: const InputDecoration(
                                hintText: 'Enter Product Description',
                                labelText: 'Description'),
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                new Container(
                                    margin:
                                        new EdgeInsets.symmetric(vertical: 10),
                                    child: new ElevatedButton(
                                      child: const Text('Submit'),
                                      onPressed: addOrEditUser,
                                    )),
                              ])
                        ])))
              ],
            )),
          ],
        ));
  }
}
