import 'package:burgershop/components/itemCard.dart';
import 'package:burgershop/db/itemDB.dart';
import 'package:flutter/material.dart';

class vegList extends StatelessWidget {
  vegList({super.key});

  final List<int> filteredVegIndexes = [];

  @override
  Widget build(BuildContext context) {
    filterVeggies();
    return GridView.count(
      crossAxisCount: getItemCountPerRow(context),
      shrinkWrap: true,
      children: List.generate(filteredVegIndexes.length, (index) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: itemCard(
            number: filteredVegIndexes[index],
          ),
        );
      }),
    );
  }

  int getItemCountPerRow(BuildContext context) {
    double minTileWidth = 250;
    double availableWidth = MediaQuery.of(context).size.width;
    return (availableWidth ~/ minTileWidth).clamp(1, 4);
  }

  void filterVeggies() {
    filteredVegIndexes.clear();

    for (int i = 0; i < itemCat.length; i++) {
      if (itemCat[i] == "Veg") {
        filteredVegIndexes.add(i);
      }
    }
  }
}
