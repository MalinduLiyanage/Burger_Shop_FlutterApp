import 'package:burgershop/components/cartModel.dart';
import 'package:flutter/material.dart';
import 'package:burgershop/db/itemDB.dart';
import 'package:provider/provider.dart';
import 'package:toastification/toastification.dart';

class cartCard extends StatelessWidget {
  final int number;
  cartCard({super.key, required this.number});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartModel>(context, listen: false);
    return Container(
      height: 100,
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary),
      child: Row(
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: NetworkImage(itemImg[number]))),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                  child: Text(
                    "${itemName[number]}",
                    maxLines: 1,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'ComicNeue',
                        fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                  child: Text(
                    "Rs. " + "${itemPrice[number]}",
                    maxLines: 1,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'ComicNeue',
                        fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              cart.deleteItem(number);
              toastification.show(
                backgroundColor: Colors.red.shade800,
                icon: Icon(Icons.done_all_rounded),
                context: context,
                title: Text(
                  "Item Removed!",
                  style: TextStyle(
                    fontFamily: 'ComicNeue',
                  ),
                ),
                autoCloseDuration: const Duration(seconds: 3),
              );
            },
            child: Container(
              height: 100,
              width: 100,
              color: Colors.red,
              child: Icon(Icons.delete),
            ),
          )
        ],
      ),
    );
  }
}
