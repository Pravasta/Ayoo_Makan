class FoodModel {
  String imageAssets;
  String name;
  double rating;
  int price;

  FoodModel({
    required this.imageAssets,
    required this.name,
    required this.price,
    required this.rating,
  });

  static final listFood = [
    FoodModel(
      imageAssets: 'assets/image/menu_small.png',
      name: 'Mie Goreng',
      price: 12000,
      rating: 4.9,
    ),
    FoodModel(
      imageAssets: 'assets/image/food_1.jpg',
      name: 'Nasi Goreng',
      price: 15000,
      rating: 4.9,
    ),
    FoodModel(
      imageAssets: 'assets/image/food_2.png',
      name: 'Bakso Sapi',
      price: 20000,
      rating: 5.0,
    ),
    FoodModel(
      imageAssets: 'assets/image/food_3.png',
      name: 'Ayam Koloke',
      price: 18000,
      rating: 4.8,
    ),
    FoodModel(
      imageAssets: 'assets/image/food_4.png',
      name: 'Burger Ayam',
      price: 24000,
      rating: 4.7,
    ),
    FoodModel(
      imageAssets: 'assets/image/food_5.png',
      name: 'Bakso Pedas',
      price: 10000,
      rating: 4.5,
    ),
  ];
}
