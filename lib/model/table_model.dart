class TableModel {
  String imageAssets;
  String name;
  int chair;
  int table;

  TableModel({
    required this.chair,
    required this.imageAssets,
    required this.name,
    required this.table,
  });

  static final listTable = [
    TableModel(
      chair: 1,
      imageAssets: 'assets/image/meja_1.jpg',
      name: 'Meja Kerja',
      table: 1,
    ),
    TableModel(
      chair: 2,
      imageAssets: 'assets/image/meja_2.jpg',
      name: 'Meja Tamu',
      table: 1,
    ),
    TableModel(
      chair: 6,
      imageAssets: 'assets/image/meja_3.jpg',
      name: 'Meja Makan Keluarga',
      table: 1,
    ),
    TableModel(
      chair: 4,
      imageAssets: 'assets/image/meja_4.jpg',
      name: 'Meja Cafe',
      table: 1,
    ),
    TableModel(
      chair: 4,
      imageAssets: 'assets/image/meja_5.jpg',
      name: 'Meja Makan Minimalis',
      table: 1,
    ),
  ];
}
