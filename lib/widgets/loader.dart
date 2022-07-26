import 'package:flutter/material.dart';
import 'package:tracker/constants/colors.dart';

import '../constants/sizes.dart';

Widget Spinkit([color = Colors.transparent]) => Center(
      child: Container(
          color: color,
          padding: const EdgeInsets.all(10),
          alignment: Alignment.topCenter,
          child: const DecoratedBox(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(kAppMargin)),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(offset: Offset(0, 2), blurRadius: 20, color: Colors.black26)
                  ]),
              child: Padding(
                  padding: EdgeInsets.all(10),
                  child: SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        color: kPrimary,
                      ))))),
    );
