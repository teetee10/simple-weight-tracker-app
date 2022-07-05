import 'package:flutter/material.dart';

import '../constants/typography.dart';
import 'Tile/title.dart';


Widget titleDescription (title, description) => Wrap(direction: Axis.vertical, children: [
      titleText(title),
      SizedBox(
          width: 100,
          child: Text(description,
              maxLines: 1,
              overflow: TextOverflow.fade,
              softWrap: false,
              style: bodyTextStyle)),
    ]);
