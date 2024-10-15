import 'package:burgershop/components/cartCard.dart';
import 'package:burgershop/components/cartModel.dart';
import 'package:burgershop/db/itemDB.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class cartList extends StatelessWidget {
  const cartList({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartModel>(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0x00000000),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total Bill Rs. ${cartSum()}.00/=",
                  style: TextStyle(
                      color: Colors.amber,
                      fontSize: 24,
                      fontFamily: 'ComicNeue',
                      fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () {},
                  child: SizedBox(
                    child: Container(
                        color: Colors.green.shade800,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            "Checkout",
                            style: TextStyle(
                              fontFamily: 'ComicNeue',
                            ),
                          ),
                        )),
                  ),
                )
              ],
            ),
          ),
        ),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Your Burger Cart",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      height: 1,
                      fontSize: 32,
                      fontFamily: 'ComicNeue',
                      fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: shoppingCart.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                      child: cartCard(
                        number: shoppingCart[index],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  double cartSum() {
    double total = 0;
    for (int i = 0; i < shoppingCart.length; i++) {
      total += itemPrice[shoppingCart[i]];
    }
    return total;
  }
}
