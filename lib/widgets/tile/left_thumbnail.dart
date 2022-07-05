import 'package:flutter/material.dart';

import 'center_thumbnail.dart';

Widget leftThumbnail(String name, Widget image) => Expanded(
      flex: 3,
      child: SizedBox(height: 100, width: 100, child: Hero(tag: name, child: thumbnail(image))),
    );
