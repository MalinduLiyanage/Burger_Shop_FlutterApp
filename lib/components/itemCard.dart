import 'package:burgershop/db/itemDB.dart';
import 'package:burgershop/pages/itemDesc.dart';
import 'package:flutter/material.dart';

class itemCard extends StatelessWidget {
  final int number;

  itemCard({super.key, required this.number});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            itemImg[number],
                          ))),
                ),
                Container(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.star),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("${itemRating[number]}/5"),
                        )
                      ]),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
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
            padding: const EdgeInsets.fromLTRB(
              8.0,
              0,
              8,
              8,
            ),
            child: Text(
              "${itemDesc[number]}",
              maxLines: 2,
              style: TextStyle(
                fontFamily: 'ComicNeue',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(
              16,
              8,
              16,
              8,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Rs. ",
                      style: TextStyle(
                          color: Colors.amber,
                          fontSize: 24,
                          fontFamily: 'ComicNeue',
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                      child: Text(
                        "${itemPrice[number]}/=",
                        style: TextStyle(
                            fontFamily: 'ComicNeue',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Container(
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(15)),
                    child: IconButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => itemDescWidget(
                                itemNumber: number,
                              ),
                            ),
                          );
                        },
                        icon: Icon(Icons.shopping_cart)))
              ],
            ),
          )
        ],
      ),
    );
  }
}
