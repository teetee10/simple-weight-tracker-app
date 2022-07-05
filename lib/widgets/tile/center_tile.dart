import 'package:flutter/material.dart';

import '../title_description.dart';
import 'button.dart';
import 'center_thumbnail.dart';
import 'title.dart';

Widget centerTile() => Expanded(
      flex: 6,
      child: Padding(
        padding: const EdgeInsets.only(right: 10, top: 10, left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FittedBox(
              child: Wrap(
                children: [thumbnail(''), titleDescription('name', 'description')],
              ),
            ),
            titleText('title'),
            button()
          ],
        ),
      ),
    );
