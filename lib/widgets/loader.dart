import 'package:flutter/material.dart';

Widget Spinkit([color = Colors.transparent]) => Center(
      child: Container(
          color: color,
          padding: const EdgeInsets.all(10),
          alignment: Alignment.topCenter,
          child: const DecoratedBox(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(offset: Offset(0, 2), blurRadius: 20, color: Colors.black26)
                  ]),
              child: Padding(
                  padding: EdgeInsets.all(10),
                  child: SizedBox(
                      width: 25, height: 25, child: CircularProgressIndicator())))),
    );
