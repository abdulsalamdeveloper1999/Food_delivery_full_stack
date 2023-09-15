class CartModel {
  int? id;
  String? name;
  int? price;
  String? img;
  int? quantity;
  bool? isExisted;
  String? time;

  CartModel(
      {this.id,
      this.name,
      this.price,
      this.img,
      this.quantity,
      this.isExisted,
      this.time});

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'name': this.name,
      'price': this.price,
      'img': this.img,
      'quantity': this.quantity,
      'isExisted': this.isExisted,
      'time': this.time,
    };
  }

  factory CartModel.fromMap(Map<String, dynamic> map) {
    return CartModel(
      id: map['id'] as int,
      name: map['name'] as String,
      price: map['price'] as int,
      img: map['img'] as String,
      quantity: map['quantity'] as int,
      isExisted: map['isExisted'] as bool,
      time: map['time'] as String,
    );
  }
}
