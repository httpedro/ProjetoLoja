class ItemSize{

  ItemSize.fromMap(Map<String, dynamic> map){
    name = map['name'] as String;
    price = map['price'] as num;
    stock = map['stock'] as int;
  }

  String? name;
  num? price;
  int? stock;

  bool get hasStock => stock! > 0;

  @override
  String toString(){
    return 'ItemSize{name: $name, price: $price, stock: $stock}';
  }

  // Método estático para criar uma instância vazia de ItemSize
  static ItemSize empty() {
    return ItemSize.fromMap({'name': '', 'price': 0, 'stock': 0});
  }

}