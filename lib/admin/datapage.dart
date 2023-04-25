import 'package:flutter/material.dart';
import 'package:myproject/admin/database_helper.dart';

class DataPage extends StatefulWidget {
  const DataPage({Key? key}) : super(key: key);

  @override
  _DataPageState createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  // All data
  List<Map<String, dynamic>> myData = [];
  final formKey = GlobalKey<FormState>();

  bool _isLoading = true;
  // function fetch semua data dari database
  void _refreshData() async {
    final data = await DatabaseHelper.getItems();
    setState(() {
      myData = data;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _refreshData(); // Loading app
  }

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();
  final TextEditingController _ratingController = TextEditingController();
  final TextEditingController _jamBukaController = TextEditingController();

  // showForm untuk menampilkan dari bawah, Create&Update
  void showMyForm(int? id) async {
    if (id != null) {
      final existingData = myData.firstWhere((element) => element['id'] == id);
      _titleController.text = existingData['title'];
      _descriptionController.text = existingData['description'];
      _imageController.text = existingData['image'];
      _ratingController.text = existingData['rating'];
      _jamBukaController.text = existingData['jamBuka'];
    } else {
      _titleController.text = "";
      _descriptionController.text = "";
      _imageController.text = "";
      _ratingController.text = "";
      _jamBukaController.text = "";
    }

    showModalBottomSheet(
        context: context,
        elevation: 5,
        isDismissible: false,
        isScrollControlled: true,
        builder: (_) => Container(
            padding: EdgeInsets.only(
              top: 15,
              left: 15,
              right: 15,
              // prevent keyboard text fields
              bottom: MediaQuery.of(context).viewInsets.bottom + 120,
            ),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextFormField(
                    controller: _titleController,
                    validator: formValidator,
                    decoration: const InputDecoration(hintText: 'Title'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    validator: formValidator,
                    controller: _imageController,
                    decoration: const InputDecoration(hintText: 'Image'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    validator: formValidator,
                    controller: _ratingController,
                    decoration: const InputDecoration(hintText: 'Rating'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    validator: formValidator,
                    controller: _jamBukaController,
                    decoration: const InputDecoration(hintText: 'Jam Buka'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: formValidator,
                    controller: _descriptionController,
                    decoration: const InputDecoration(hintText: 'Description'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("Kembali")),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green),
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            if (id == null) {
                              await addItem();
                            }

                            if (id != null) {
                              await updateItem(id);
                            }

                            // Clear text fields
                            setState(() {
                              _titleController.text = '';
                              _descriptionController.text = '';
                              _imageController.text = '';
                              _ratingController.text = '';
                              _jamBukaController.text = '';
                            });

                            // Close bottom
                            Navigator.pop(context);
                          }
                          // Simpan data baru
                        },
                        child: Text(id == null ? 'Simpan' : 'Update'),
                      ),
                    ],
                  )
                ],
              ),
            )));
  }

  String? formValidator(String? value) {
    if (value!.isEmpty) return 'Field is Required';
    return null;
  }

// Insert data baru ke db
  Future<void> addItem() async {
    await DatabaseHelper.createItem(
        _titleController.text,
        _descriptionController.text,
        _imageController.text,
        _ratingController.text,
        _jamBukaController.text);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Data Post berhasil di buat.'),
        backgroundColor: Colors.green));
    _refreshData();
  }

  // Update data where id
  Future<void> updateItem(int id) async {
    await DatabaseHelper.updateItem(
        id,
        _titleController.text,
        _descriptionController.text,
        _imageController.text,
        _ratingController.text,
        _jamBukaController.text);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Data Berhasil di update.'),
        backgroundColor: Colors.green));
    _refreshData();
  }

  // Delete data whr id
  void deleteItem(int id) async {
    await DatabaseHelper.deleteItem(id);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Data Berhasil di hapus.'),
        backgroundColor: Colors.green));
    _refreshData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Posts'),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : myData.isEmpty
              ? const Center(child: Text("Data Post belum ada!!"))
              : ListView.builder(
                  itemCount: myData.length,
                  itemBuilder: (context, index) => Card(
                    color: index % 2 == 0
                        ? Color.fromARGB(255, 210, 210, 210)
                        : Color.fromARGB(255, 184, 193, 184),
                    margin: const EdgeInsets.all(15),
                    child: ListTile(
                        title: Text(
                          myData[index]['title'] +
                              '   ⭐' +
                              myData[index]['rating'],
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(myData[index]['description']),
                        trailing: SizedBox(
                          width: 100,
                          child: Row(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.edit),
                                onPressed: () =>
                                    showMyForm(myData[index]['id']),
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () {
                                  AlertDialog delete = AlertDialog(
                                    title: Text("Konfirmasi"),
                                    content: Container(
                                      height: 70,
                                      child: Column(
                                        children: [
                                          Text("Yakin ingin Menghapus Data ")
                                        ],
                                      ),
                                    ),
                                    //terdapat 2 button.
                                    //jika ya maka jalankan delete () dan tutup dialog
                                    //jika tidak maka tutup dialog
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            deleteItem(myData[index]['id']);
                                            Navigator.pop(context);
                                          },
                                          child: Text("Ya")),
                                      TextButton(
                                        child: Text('Tidak'),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ],
                                  );
                                  showDialog(
                                      context: context,
                                      builder: (context) => delete);
                                },
                              ),
                            ],
                          ),
                        )),
                  ),
                ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => showMyForm(null),
      ),
    );
  }
}
