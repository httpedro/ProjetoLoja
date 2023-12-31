import 'package:flutter/material.dart';
import 'package:libelulas/common/custom_drawer/custom_icon_button.dart';
import 'package:libelulas/models/cart_product.dart';
import 'package:provider/provider.dart';

class CartTitle extends StatelessWidget {
  const CartTitle(this.cartProduct);

  final CartProduct cartProduct;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
        value: cartProduct,
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: <Widget>[
                SizedBox(
                  height: 80,
                  width: 80,
                  child: Image.network(cartProduct.product!.images!.first),
                ), //SizedBox
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Column(
                      children: <Widget>[
                        Text(
                          cartProduct.product!.name as String,
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
                        Consumer<CartProduct>(
                          builder: (_, cartProduct, __) {
                            if (cartProduct.hasStock)
                              return Text(
                                'R\$ ${cartProduct.unitPrice.toStringAsFixed(2)}',
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold), //textstyle
                              ); //text
                            else
                              return Text(
                                'Sem estoque suficiente',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 12,
                                ),
                              );
                          },
                        )
                      ], //<Widget> []
                    ), //Column
                  ), //Padding
                ), //Expanded
                Consumer<CartProduct>(
                  builder: (_, CartProduct, __) {
                    return Column(
                      children: <Widget>[
                        CustomIconButton(
                          iconData: Icons.add,
                          color: Theme.of(context).primaryColor,
                          onTap: cartProduct.increment,
                        ), //customIcontButton
                        Text(
                          '${cartProduct.quantity}',
                          style: const TextStyle(fontSize: 20),
                        ), //text
                        CustomIconButton(
                          iconData: Icons.remove,
                          color: cartProduct.quantity! > 1
                              ? Theme.of(context).primaryColor
                              : Colors.red,
                          onTap: cartProduct.decrement,
                        ), //customIconButton
                      ], //<widget>
                    ); //Column
                  },
                )
              ],
            ), //Row
          ),
        ) //Padding
        ); //Card
  }
}
