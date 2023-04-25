class cafe {
  String judul;
  double rating;
  String jamBuka;
  String gambar;

  cafe({
    required this.judul,
    required this.rating,
    required this.jamBuka,
    required this.gambar,
  });
}

List<cafe> dataCafe = [
  cafe(
      judul: 'Kopiku',
      rating: 4.5,
      jamBuka: '10:10',
      gambar: 'assets/motor.jpg'),
  cafe(
      judul: 'Kopiku',
      rating: 4.5,
      jamBuka: '10:10',
      gambar: 'assets/motor.jpg')
];
