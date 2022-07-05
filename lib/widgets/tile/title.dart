
import 'package:flutter/material.dart';

import '../../constants/typography.dart';

Widget titleText(title) => Flexible(
      flex: 1,
      child: Text(title,
          maxLines: 1,
          overflow: TextOverflow.fade,
          softWrap: false,
          style: bodyTextStyle),
    );
