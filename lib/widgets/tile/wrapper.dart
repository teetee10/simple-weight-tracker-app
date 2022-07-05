import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:tracker/constants/typography.dart';

import 'index.dart';

Widget Wrapper () => Transform.scale(
    scale: 1,
    origin: const Offset(0, 0),
    child: Bounce(
        duration: Duration(milliseconds: 120),
        onPressed: () {  },
        child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
                height: 100,
                color: Colors.white,
                child: Row(
                  children: [
                    leftThumbnail('name', Image.asset('assets/images/profile.png')),
                    centerTile(),
                    lowerRight('')
                  ],
                )))));
