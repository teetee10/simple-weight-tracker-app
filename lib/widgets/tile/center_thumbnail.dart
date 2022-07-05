import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

Widget thumbnail (image) => Padding(
    padding: const EdgeInsets.only(right: 5.0),
    child: CachedNetworkImage(
        height: 100,
        width: 100,
        imageUrl: image,
        placeholder: (context, url) => Image.asset('assets/images/placeholder.png'),
        errorWidget: (context, url, error) => Image.asset('assets/images/placeholder.png')));


