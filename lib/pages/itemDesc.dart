import 'package:burgershop/components/cartModel.dart';
import 'package:burgershop/db/itemDB.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toastification/toastification.dart';

class itemDescWidget extends StatelessWidget {
  final int itemNumber;

  const itemDescWidget({super.key, required this.itemNumber});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartModel>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Color(0x00000000),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(itemImg[itemNumber]),
                        fit: BoxFit.cover)),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "${itemName[itemNumber]}",
                        style: TextStyle(
                            height: 1,
                            fontSize: 32,
                            fontFamily: 'ComicNeue',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "${itemCat[itemNumber]}",
                        style: TextStyle(
                          height: 1,
                          fontSize: 22,
                          fontFamily: 'ComicNeue',
                        ),
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "${itemDesc[itemNumber]}",
                        style: TextStyle(
                          height: 1,
                          fontSize: 16,
                          fontFamily: 'ComicNeue',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Rs. " + "${itemPrice[itemNumber]}/=",
                    style: TextStyle(
                        color: Colors.amber,
                        fontSize: 24,
                        fontFamily: 'ComicNeue',
                        fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      cart.addItem(itemNumber);
                      print(shoppingCart);
                      toastification.show(
                        backgroundColor: Colors.green.shade800,
                        icon: Icon(Icons.done_all_rounded),
                        context: context,
                        title: Text(
                          "${itemName[itemNumber]} added!",
                          style: TextStyle(
                            fontFamily: 'ComicNeue',
                          ),
                        ),
                        autoCloseDuration: const Duration(seconds: 3),
                      );
                    },
                    child: SizedBox(
                      child: Container(
                          color: Colors.red,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              "ADD TO CART",
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
        ),
      ),
    );
  }

  void setData() {}
}
