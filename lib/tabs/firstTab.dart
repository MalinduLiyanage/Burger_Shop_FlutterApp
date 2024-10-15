import 'package:burgershop/components/itemCard.dart';
import 'package:burgershop/db/itemDB.dart';
import 'package:flutter/material.dart';

class firstList extends StatelessWidget {
  const firstList({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: getItemCountPerRow(context),
      shrinkWrap: true,
      children: List.generate(itemImg.length, (index) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: itemCard(
            number: index,
          ),
        );
      }),
    );
  }

  int getItemCountPerRow(BuildContext context) {
    double minTileWidth = 250;
    double availableWidth = MediaQuery.of(context).size.width;

    int i = availableWidth ~/ minTileWidth;
    return i;
  }
}
