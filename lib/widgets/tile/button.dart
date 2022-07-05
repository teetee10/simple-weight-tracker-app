import 'package:flutter/material.dart';

Widget button() => Expanded(
      flex: 1,
      child: Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
          children: const [
            // IncentiveBtn(incentiveTypes: widget.incentiveType, buttonSize: 'small'),
            // RedeemedBtn(pin: widget.incentiveData.pin),
          ]),
    );
