import 'package:flutter/material.dart';

Widget cardSmallDetail(IconData icon, String titleText, String subTitleText) {
  return SizedBox(
    width: 120,
    height: 90,
    child: Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(icon),
          Text(
            titleText,
            style: const TextStyle(fontSize: 16),
          ),
          Text(
            subTitleText,
            style: const TextStyle(fontSize: 16),
          )
        ],
      ),
    ),
  );
}
