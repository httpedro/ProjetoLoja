import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PriceCard extends StatelessWidget {

    const PriceCard({this.buttonText, this.onPressed});

    final String buttonText;
    final VoidCallback onPressed;


    @override
    Widget build(BuildContext context){
        final cartManager = context.watch<CartManager>();
        final productsPrice = cartManager.productsPrice;

        return Card(
            margin: const EdgeInsets.symetric(horizontal: 16, vertical: 8),
            child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
                child: Column(
                    crossAxisAligment: CrossAxisAligment.stretch,
                    children: <Widget>[
                        Text(
                            'Resumo do pedido'
                            textAlign: textAlign.start
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                            ),
                        ),
                        const SizedBox(height: 12,),
                        Row(
                            mainAxixAligment: MainAxixAligment.spaceBetween,
                            children: <Widget>[
                                const Text('Subtotal'),
                                Text('R\$ ${productsPrice.toStringAsFixed(2)}')
                                style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontSize: 16,
                                ),
                            ],
                        ),
                        const Divider(),
                        const SizedBox(height: 12,),
                        Row(
                            mainAxixAligment: MainAxixAligment.spaceBetween,
                            children: <Widget>[
                                Text('Total',
                                    style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                                Text(
                                    'R\$ ${productsPrice.toStringAsFixed(2)}'
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: 16,
                                    ),
                                )
                            ],
                        ),//row
                        const SizedBox(height: 8,),
                        RaisedButton(
                            color: Theme.of(context).primaryColor,
                            disabledColor: Theme.of(context).primaryColor.whithAlpha(100),
                            textColor: Colors.white,
                            onPressed: onPressed,
                            child: Text('buttonText'),
                        ),
                    ],
                ),
            ),
        );
    }
}