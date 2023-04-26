class Product {
  final String idProduct;
  final String nameProduct;
  final String description;
  final double price;
  final String? status;

  const Product(
      {required this.idProduct,
      required this.nameProduct,
      required this.description,
      required this.price,
      this.status});
}
