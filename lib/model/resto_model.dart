class RestoModel {
  final String name;
  final String location;
  final int price;
  final double rating;
  final String imageAsset;
  final List<Food> listFood;
  final List<Drink> listDrink;

  RestoModel({
    required this.name,
    required this.location,
    required this.price,
    required this.rating,
    required this.imageAsset,
    required this.listDrink,
    required this.listFood,
  });

  static final listResto = [
    RestoModel(
      name: 'Surakarta Resto',
      location: 'Surakarta',
      price: 500000,
      rating: 4.7,
      imageAsset: 'assets/image/Intersect.png',
      listDrink: [
        Drink(
          imageAssets: 'assets/image/drink_3.jpg',
          isLike: 54,
          name: 'Es Good Day',
          price: 5000,
          totalBuy: 756,
        ),
        Drink(
          imageAssets: 'assets/image/drink_4.jpg',
          isLike: 13,
          name: 'Es Susu Coklat',
          price: 4000,
          totalBuy: 354,
        ),
        Drink(
          imageAssets: 'assets/image/drink_5.jpg',
          isLike: 12,
          name: 'Es Susu Putih',
          price: 4000,
          totalBuy: 332,
        ),
        Drink(
          imageAssets: 'assets/image/drink_1.jpg',
          isLike: 99,
          name: 'Es Teh',
          price: 3000,
          totalBuy: 1450,
        ),
        Drink(
          imageAssets: 'assets/image/drink_2.jpg',
          isLike: 102,
          name: 'Es Jeruk',
          price: 4000,
          totalBuy: 1350,
        ),
        Drink(
          imageAssets: 'assets/image/drink_6.png',
          isLike: 120,
          name: 'Es Beng Beng',
          price: 5000,
          totalBuy: 678,
        ),
        Drink(
          imageAssets: 'assets/image/drink_7.jpg',
          isLike: 78,
          name: 'Es Pop Ice',
          price: 3500,
          totalBuy: 155,
        ),
      ],
      listFood: [
        Food(
          imageAssets: 'assets/image/food_3.png',
          isLike: 8,
          name: 'Ayam Koloke',
          price: 18000,
          totalBuy: 15,
        ),
        Food(
          imageAssets: 'assets/image/food_1.jpg',
          isLike: 16,
          name: 'Nasi Goreng',
          price: 12000,
          totalBuy: 36,
        ),
        Food(
          imageAssets: 'assets/image/food_2.png',
          isLike: 32,
          name: 'Bakso',
          price: 20000,
          totalBuy: 76,
        ),
        Food(
          imageAssets: 'assets/image/food_4.png',
          isLike: 46,
          name: 'Burger',
          price: 15000,
          totalBuy: 80,
        ),
        Food(
          imageAssets: 'assets/image/menu_small.png',
          isLike: 99,
          name: 'Mie Goreng',
          price: 8000,
          totalBuy: 1670,
        ),
        Food(
          imageAssets: 'assets/image/food_5.png',
          isLike: 21,
          name: 'Bakso Pedas',
          price: 10000,
          totalBuy: 55,
        ),
      ],
    ),
    RestoModel(
      name: 'Malang Resto',
      location: 'Malang',
      price: 750000,
      rating: 4.9,
      imageAsset: 'assets/image/Intersect_2.png',
      listDrink: [
        Drink(
          imageAssets: 'assets/image/drink_1.jpg',
          isLike: 99,
          name: 'Es Teh',
          price: 3000,
          totalBuy: 1450,
        ),
        Drink(
          imageAssets: 'assets/image/drink_2.jpg',
          isLike: 102,
          name: 'Es Jeruk',
          price: 4000,
          totalBuy: 1350,
        ),
        Drink(
          imageAssets: 'assets/image/drink_3.jpg',
          isLike: 54,
          name: 'Es Good Day',
          price: 5000,
          totalBuy: 756,
        ),
        Drink(
          imageAssets: 'assets/image/drink_4.jpg',
          isLike: 13,
          name: 'Es Susu Coklat',
          price: 4000,
          totalBuy: 354,
        ),
        Drink(
          imageAssets: 'assets/image/drink_5.jpg',
          isLike: 12,
          name: 'Es Susu Putih',
          price: 4000,
          totalBuy: 332,
        ),
        Drink(
          imageAssets: 'assets/image/drink_6.png',
          isLike: 120,
          name: 'Es Beng Beng',
          price: 5000,
          totalBuy: 678,
        ),
        Drink(
          imageAssets: 'assets/image/drink_7.jpg',
          isLike: 78,
          name: 'Es Pop Ice',
          price: 3500,
          totalBuy: 155,
        ),
      ],
      listFood: [
        Food(
          imageAssets: 'assets/image/food_2.png',
          isLike: 32,
          name: 'Bakso',
          price: 20000,
          totalBuy: 76,
        ),
        Food(
          imageAssets: 'assets/image/food_4.png',
          isLike: 46,
          name: 'Burger',
          price: 15000,
          totalBuy: 80,
        ),
        Food(
          imageAssets: 'assets/image/food_1.jpg',
          isLike: 16,
          name: 'Nasi Goreng',
          price: 12000,
          totalBuy: 36,
        ),
        Food(
          imageAssets: 'assets/image/food_5.png',
          isLike: 21,
          name: 'Bakso Pedas',
          price: 10000,
          totalBuy: 55,
        ),
        Food(
          imageAssets: 'assets/image/menu_small.png',
          isLike: 99,
          name: 'Mie Goreng',
          price: 8000,
          totalBuy: 1670,
        ),
        Food(
          imageAssets: 'assets/image/food_3.png',
          isLike: 8,
          name: 'Ayam Koloke',
          price: 18000,
          totalBuy: 15,
        ),
      ],
    ),
    RestoModel(
      name: 'Surabaya Resto',
      location: 'Surabaya',
      price: 800000,
      rating: 4.5,
      imageAsset: 'assets/image/intersect_3.png',
      listDrink: [
        Drink(
          imageAssets: 'assets/image/drink_2.jpg',
          isLike: 102,
          name: 'Es Jeruk',
          price: 4000,
          totalBuy: 1350,
        ),
        Drink(
          imageAssets: 'assets/image/drink_3.jpg',
          isLike: 54,
          name: 'Es Good Day',
          price: 5000,
          totalBuy: 756,
        ),
        Drink(
          imageAssets: 'assets/image/drink_1.jpg',
          isLike: 99,
          name: 'Es Teh',
          price: 3000,
          totalBuy: 1450,
        ),
        Drink(
          imageAssets: 'assets/image/drink_4.jpg',
          isLike: 13,
          name: 'Es Susu Coklat',
          price: 4000,
          totalBuy: 354,
        ),
        Drink(
          imageAssets: 'assets/image/drink_6.png',
          isLike: 120,
          name: 'Es Beng Beng',
          price: 5000,
          totalBuy: 678,
        ),
        Drink(
          imageAssets: 'assets/image/drink_7.jpg',
          isLike: 78,
          name: 'Es Pop Ice',
          price: 3500,
          totalBuy: 155,
        ),
        Drink(
          imageAssets: 'assets/image/drink_5.jpg',
          isLike: 12,
          name: 'Es Susu Putih',
          price: 4000,
          totalBuy: 332,
        ),
      ],
      listFood: [
        Food(
          imageAssets: 'assets/image/food_1.jpg',
          isLike: 16,
          name: 'Nasi Goreng',
          price: 12000,
          totalBuy: 36,
        ),
        Food(
          imageAssets: 'assets/image/food_3.png',
          isLike: 8,
          name: 'Ayam Koloke',
          price: 18000,
          totalBuy: 15,
        ),
        Food(
          imageAssets: 'assets/image/food_2.png',
          isLike: 32,
          name: 'Bakso',
          price: 20000,
          totalBuy: 76,
        ),
        Food(
          imageAssets: 'assets/image/food_5.png',
          isLike: 21,
          name: 'Bakso Pedas',
          price: 10000,
          totalBuy: 55,
        ),
        Food(
          imageAssets: 'assets/image/menu_small.png',
          isLike: 99,
          name: 'Mie Goreng',
          price: 8000,
          totalBuy: 1670,
        ),
        Food(
          imageAssets: 'assets/image/food_4.png',
          isLike: 46,
          name: 'Burger',
          price: 15000,
          totalBuy: 80,
        ),
      ],
    ),
    RestoModel(
      name: 'Jakarta Resto',
      location: 'Jakarta Selatan',
      price: 1200000,
      rating: 5.0,
      imageAsset: 'assets/image/intersect_4.jpg',
      listDrink: [
        Drink(
          imageAssets: 'assets/image/drink_1.jpg',
          isLike: 99,
          name: 'Es Teh',
          price: 3000,
          totalBuy: 1450,
        ),
        Drink(
          imageAssets: 'assets/image/drink_2.jpg',
          isLike: 102,
          name: 'Es Jeruk',
          price: 4000,
          totalBuy: 1350,
        ),
        Drink(
          imageAssets: 'assets/image/drink_3.jpg',
          isLike: 54,
          name: 'Es Good Day',
          price: 5000,
          totalBuy: 756,
        ),
        Drink(
          imageAssets: 'assets/image/drink_4.jpg',
          isLike: 13,
          name: 'Es Susu Coklat',
          price: 4000,
          totalBuy: 354,
        ),
        Drink(
          imageAssets: 'assets/image/drink_5.jpg',
          isLike: 12,
          name: 'Es Susu Putih',
          price: 4000,
          totalBuy: 332,
        ),
        Drink(
          imageAssets: 'assets/image/drink_6.png',
          isLike: 120,
          name: 'Es Beng Beng',
          price: 5000,
          totalBuy: 678,
        ),
        Drink(
          imageAssets: 'assets/image/drink_7.jpg',
          isLike: 78,
          name: 'Es Pop Ice',
          price: 3500,
          totalBuy: 155,
        ),
      ],
      listFood: [
        Food(
          imageAssets: 'assets/image/food_3.png',
          isLike: 8,
          name: 'Ayam Koloke',
          price: 18000,
          totalBuy: 15,
        ),
        Food(
          imageAssets: 'assets/image/food_4.png',
          isLike: 46,
          name: 'Burger',
          price: 15000,
          totalBuy: 80,
        ),
        Food(
          imageAssets: 'assets/image/food_5.png',
          isLike: 21,
          name: 'Bakso Pedas',
          price: 10000,
          totalBuy: 55,
        ),
        Food(
          imageAssets: 'assets/image/menu_small.png',
          isLike: 99,
          name: 'Mie Goreng',
          price: 8000,
          totalBuy: 1670,
        ),
        Food(
          imageAssets: 'assets/image/food_1.jpg',
          isLike: 16,
          name: 'Nasi Goreng',
          price: 12000,
          totalBuy: 36,
        ),
        Food(
          imageAssets: 'assets/image/food_2.png',
          isLike: 32,
          name: 'Bakso',
          price: 20000,
          totalBuy: 76,
        ),
      ],
    ),
    RestoModel(
      name: 'Bogor Resto',
      location: 'Bogor',
      price: 850000,
      rating: 4.3,
      imageAsset: 'assets/image/intersect_5.png',
      listDrink: [
        Drink(
          imageAssets: 'assets/image/drink_3.jpg',
          isLike: 54,
          name: 'Es Good Day',
          price: 5000,
          totalBuy: 756,
        ),
        Drink(
          imageAssets: 'assets/image/drink_1.jpg',
          isLike: 99,
          name: 'Es Teh',
          price: 3000,
          totalBuy: 1450,
        ),
        Drink(
          imageAssets: 'assets/image/drink_2.jpg',
          isLike: 102,
          name: 'Es Jeruk',
          price: 4000,
          totalBuy: 1350,
        ),
        Drink(
          imageAssets: 'assets/image/drink_4.jpg',
          isLike: 13,
          name: 'Es Susu Coklat',
          price: 4000,
          totalBuy: 354,
        ),
        Drink(
          imageAssets: 'assets/image/drink_6.png',
          isLike: 120,
          name: 'Es Beng Beng',
          price: 5000,
          totalBuy: 678,
        ),
        Drink(
          imageAssets: 'assets/image/drink_7.jpg',
          isLike: 78,
          name: 'Es Pop Ice',
          price: 3500,
          totalBuy: 155,
        ),
      ],
      listFood: [
        Food(
          imageAssets: 'assets/image/food_3.png',
          isLike: 8,
          name: 'Ayam Koloke',
          price: 18000,
          totalBuy: 15,
        ),
        Food(
          imageAssets: 'assets/image/food_4.png',
          isLike: 46,
          name: 'Burger',
          price: 15000,
          totalBuy: 80,
        ),
        Food(
          imageAssets: 'assets/image/food_5.png',
          isLike: 21,
          name: 'Bakso Pedas',
          price: 10000,
          totalBuy: 55,
        ),
        Food(
          imageAssets: 'assets/image/food_1.jpg',
          isLike: 16,
          name: 'Nasi Goreng',
          price: 12000,
          totalBuy: 36,
        ),
        Food(
          imageAssets: 'assets/image/food_2.png',
          isLike: 32,
          name: 'Bakso',
          price: 20000,
          totalBuy: 76,
        ),
        Food(
          imageAssets: 'assets/image/menu_small.png',
          isLike: 99,
          name: 'Mie Goreng',
          price: 8000,
          totalBuy: 1670,
        ),
      ],
    ),
    RestoModel(
      name: 'Mojokerto Resto',
      location: 'Mojokerto',
      price: 780000,
      rating: 4.8,
      imageAsset: 'assets/image/intersect_6.jpg',
      listDrink: [
        Drink(
          imageAssets: 'assets/image/drink_6.png',
          isLike: 120,
          name: 'Es Beng Beng',
          price: 5000,
          totalBuy: 678,
        ),
        Drink(
          imageAssets: 'assets/image/drink_7.jpg',
          isLike: 78,
          name: 'Es Pop Ice',
          price: 3500,
          totalBuy: 155,
        ),
        Drink(
          imageAssets: 'assets/image/drink_1.jpg',
          isLike: 99,
          name: 'Es Teh',
          price: 3000,
          totalBuy: 1450,
        ),
        Drink(
          imageAssets: 'assets/image/drink_2.jpg',
          isLike: 102,
          name: 'Es Jeruk',
          price: 4000,
          totalBuy: 1350,
        ),
        Drink(
          imageAssets: 'assets/image/drink_3.jpg',
          isLike: 54,
          name: 'Es Good Day',
          price: 5000,
          totalBuy: 756,
        ),
        Drink(
          imageAssets: 'assets/image/drink_4.jpg',
          isLike: 13,
          name: 'Es Susu Coklat',
          price: 4000,
          totalBuy: 354,
        ),
      ],
      listFood: [
        Food(
          imageAssets: 'assets/image/food_4.png',
          isLike: 46,
          name: 'Burger',
          price: 15000,
          totalBuy: 80,
        ),
        Food(
          imageAssets: 'assets/image/food_2.png',
          isLike: 32,
          name: 'Bakso',
          price: 20000,
          totalBuy: 76,
        ),
        Food(
          imageAssets: 'assets/image/food_5.png',
          isLike: 21,
          name: 'Bakso Pedas',
          price: 10000,
          totalBuy: 55,
        ),
        Food(
          imageAssets: 'assets/image/food_1.jpg',
          isLike: 16,
          name: 'Nasi Goreng',
          price: 12000,
          totalBuy: 36,
        ),
        Food(
          imageAssets: 'assets/image/food_3.png',
          isLike: 8,
          name: 'Ayam Koloke',
          price: 18000,
          totalBuy: 15,
        ),
        Food(
          imageAssets: 'assets/image/menu_small.png',
          isLike: 99,
          name: 'Mie Goreng',
          price: 8000,
          totalBuy: 1670,
        ),
      ],
    ),
  ];
}

class Food {
  String imageAssets;
  String name;
  int totalBuy;
  int isLike;
  int price;

  Food({
    required this.imageAssets,
    required this.isLike,
    required this.name,
    required this.price,
    required this.totalBuy,
  });
}

class Drink {
  String imageAssets;
  String name;
  int totalBuy;
  int isLike;
  int price;

  Drink({
    required this.imageAssets,
    required this.isLike,
    required this.name,
    required this.price,
    required this.totalBuy,
  });
}
