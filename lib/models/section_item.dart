class SectionItem {

    SectionItem({this.image, this.product});

  SectionItem.fromMap(Map<String, dynamic> map){
    image = map['image'] as String;
    product = map['product'] as String;
  }

  String? image;
  String? product;


  SectionItem clone(){
    return SectionItem(
      name: name,
      type: type,
      items: items?.map(e) => e.clone()).toList() ?? [],
    );
  }

  @override
  String toString() {
    return 'Section{name: $name, type: $type, items: $items}';
  }
}