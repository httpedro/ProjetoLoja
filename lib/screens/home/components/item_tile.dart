import 'dart:io';

import 'package:flutter/material.dart';
import 'package:libelulas/models/home.manager.dart';
import 'package:libelulas/models/product.dart';
import 'package:libelulas/models/product_manager.dart';
import 'package:libelulas/models/section.dart';
import 'package:libelulas/models/section_item.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

class ItemTile extends StatelessWidget {
  const ItemTile(this.item);

  final SectionItem? item;

  @override
  Widget build(BuildContext context) {
    final homeManager = context.watch<HomeManager>();
    return GestureDetector(
      onTap: () {
        if (item!.product != null) {
          final product = context
              .read<ProductManager>()
              .findProductById(item!.product as String);
          if (product != null) {
            Navigator.of(context).pushNamed('/product', arguments: product);
          }
        }
      },
      onLongPress: homeManager.editing ? (){
        showDialog(
          context: context,
          builder: (_){
            final product = context.read<ProductManager>()
                .findProductById(item!.product ?? '');
            return AlertDialog(
              title: const Text('Editar Item'),
              content: product != null
                ? ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Image.network(product.images!.first),
                    title: Text(product.name as String),
                    subtitle: Text('R\$ ${product.basePrice!.toStringAsFixed(2)}'),
                )
                : null,
              actions: <Widget>[
                ElevatedButton(
                  onPressed: (){
                    context.read<Section>().removeItem(item!);
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.red
                  ),
                  child: const Text('Excluir'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    if(product != null){
                      item!.product = null;
                    } else {
                      final Product? product = await Navigator.of(context)
                          .pushNamed('/select_product') as Product;
                      item!.product = product?.id;
                    }
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    product != null
                      ? 'Desvincular'
                      : 'Vincular'
                  ),
                ),
              ],
            );
          }
        );
      } : null,
      child: AspectRatio(
        aspectRatio: 1,
        child: item!.image is String 
            ? FadeInImage.memoryNetwork(
                placeholder: kTransparentImage,
                image: item!.image,
                fit: BoxFit.cover,
              )
            : Image.file(
                item!.image as File,
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}
