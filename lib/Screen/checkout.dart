import 'package:electronic/providers/Cart.dart';
import 'package:electronic/widget/Header.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Checkout extends StatefulWidget {
  const Checkout({Key? key}) : super(key: key);

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appbarBoot(context),
        body: Consumer<Cart>(builder: ((context, cart, child) {
          return ListView.builder(
              itemCount: cart.basketitem.length,
              itemBuilder: ((context, index) {
                return ListTile(
                  title: Text(cart.basketitem[index].name),
                  trailing: IconButton(
                    onPressed: () {
                      cart.remove(cart.basketitem[index]);
                    },
                    icon: const Icon(Icons.remove),
                  ),
                );
              }));
        })));
  }
}
