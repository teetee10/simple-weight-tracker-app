import 'package:flutter/material.dart';
import 'package:tracker/widgets/Tile/title.dart';

Widget lowerRight(String name) => Expanded(
      flex: 2,
      child: Align(
        alignment: Alignment.topRight,
        child: Container(
          margin: const EdgeInsets.only(top: 10, right: 5),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.only(right: 3),
                child: titleText(name),
              ),
            ],
          ),
        ),
      ),
    );
