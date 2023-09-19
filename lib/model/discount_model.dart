class DiscountModel {
  int discount;

  DiscountModel({
    required this.discount,
  });

  static List<DiscountModel> listDiscount = [
    DiscountModel(
      discount: 70,
    ),
    DiscountModel(
      discount: 65,
    ),
    DiscountModel(
      discount: 50,
    ),
    DiscountModel(
      discount: 30,
    ),
    DiscountModel(
      discount: 25,
    ),
  ];
}
