import 'package:flutter/material.dart';
import 'package:libelulas/common/custom_drawer/custom_icon_button.dart';
import 'package:libelulas/models/cart_product.dart';

class CartTitle extends StatelessWidget{

  const CartTitle(this.cartProduct);

  final CartProduct cartProduct;

  @override
  Widget build(BuildContext context){
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: <Widget>[
            SizedBox(
              height: 80,
              width: 80,
              child: Image.network(cartProduct.product.images.first),
            ), //SizedBox
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Column(
                  children: <Widget>[
                    Text(
                      cartProduct.product.name,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 17.0,
                      ), //TextStyle
                    ), //Text
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        'Tamanho: ${cartProduct.size}',
                        style: TextStyle(fontWeight: FontWeight.w300),
                      ), //text
                    ), //Padding
                    Text(
                      'R\$ ${cartProduct.unitPrice.toStringAsFixed(2)}',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold
                      ),
                    )
                  ]
                  ),
                ),
            ),
            Column(
              children: <Widget>[
                CustomIconButton(
                  iconData: Icons.add,
                  color: Theme.of(context).primaryColor,
                  onTap: () {
                    
                  },
                ),
                Text(
                  '${cartProduct.quantity}',
                  style: const TextStyle(fontSize: 20),
              ),
              CustomIconButton(
                iconData: Icons.remove,
                color: Theme.of(context).primaryColor,
                onTap: () {
                  
                },
              ),
          ],
          )
          ],
        ), //Row
      ), //Padding
    ); //Card
  }
}