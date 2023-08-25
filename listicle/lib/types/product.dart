class Product {
  final String _image;
  final String _name;
  final double _price;
  final String _description = "";

  Product(this._image, this._name, this._price);

  String get image {
    return _image;
  }

  String get name {
    return _name;
  }

  double get price {
    return _price;
  }
}
