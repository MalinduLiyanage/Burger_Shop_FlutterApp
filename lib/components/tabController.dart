import 'package:burgershop/tabs/nonVeggieTab.dart';
import 'package:burgershop/tabs/veggieTab.dart';
import 'package:flutter/material.dart';
import 'package:dynamic_tabbar/dynamic_tabbar.dart';
import 'package:burgershop/tabs/firstTab.dart';

List<TabData> tabs = [
  TabData(
    index: 1,
    title: const Tab(
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 8, 0),
            child: Icon(Icons.local_fire_department),
          ),
          Text(
            "What's Hot",
            style:
                TextStyle(fontFamily: 'ComicNeue', fontWeight: FontWeight.w600),
          )
        ],
      ),
    ),
    content: firstList(),
  ),
  TabData(
    index: 2,
    title: const Tab(
      child: Text(
        'Non - Veggie',
        style: TextStyle(fontFamily: 'ComicNeue', fontWeight: FontWeight.w600),
      ),
    ),
    content: NonVegList(),
  ),
  TabData(
      index: 3,
      title: const Tab(
        child: Text(
          'Veggie',
          style:
              TextStyle(fontFamily: 'ComicNeue', fontWeight: FontWeight.w600),
        ),
      ),
      content: vegList()),
  // Add more tabs as needed
];
