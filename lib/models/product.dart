import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:libelulas/models/item_size.dart';

class Product extends ChangeNotifier{
  Product.fromDocument(DocumentSnapshot document){
    id = document.id;
    name = document.get('name') as String;
    description = document.get('description') as String;
    images = List<String>.from(document.get('images') as List<dynamic>);
    sizes = (document.get('sizes') as List<dynamic>? ?? []).map((s) => ItemSize.fromMap(s as Map<String, dynamic>)).toList();

    print(sizes);
  }

  String? id;
  String? name;
  String? description;
  List<String>? images;
  List<ItemSize>? sizes;

  ItemSize? _selectedSize;

  ItemSize get selectedSize => _selectedSize!;

  set selectedSize(ItemSize value){
    _selectedSize = value;
    print(value);
    notifyListeners();
  }
}