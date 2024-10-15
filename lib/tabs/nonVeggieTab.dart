import 'package:burgershop/components/itemCard.dart';
import 'package:burgershop/db/itemDB.dart';
import 'package:flutter/material.dart';

class NonVegList extends StatelessWidget {
  NonVegList({super.key});

  final List<int> filteredNonVegIndexes = [];

  @override
  Widget build(BuildContext context) {
    filterNonVeggies();
    return GridView.count(
      crossAxisCount: getItemCountPerRow(context),
      shrinkWrap: true,
      children: List.generate(filteredNonVegIndexes.length, (index) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: itemCard(
            number: filteredNonVegIndexes[index],
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

  void filterNonVeggies() {
    filteredNonVegIndexes.clear();

    for (int i = 0; i < itemCat.length; i++) {
      if (itemCat[i] == "Non-Veg") {
        filteredNonVegIndexes.add(i);
      }
    }
  }
}
