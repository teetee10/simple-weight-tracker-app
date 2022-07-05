import 'package:flutter/material.dart';

import 'colors.dart';
 

const String fontFamily = "Google Sans";

// Simple
const TextStyle headlineTextStyle = TextStyle(
    fontSize: 44, color: kTextPrimary, height: 1.2, fontFamily: fontFamily);

const TextStyle headlineSecondaryTextStyle = TextStyle(
    fontSize: 28, color: kTextPrimary, height: 1.2, fontFamily: fontFamily);

const TextStyle bodyTextStyle = TextStyle(
    fontSize: 16, color: kTextPrimary, height: 1.5, fontFamily: fontFamily);

TextStyle bodyLinkTextStyle = bodyTextStyle.copyWith(color: kPrimary);

const TextStyle buttonTextStyle = TextStyle(
    fontSize: 18, color: Colors.white, height: 1, fontFamily: fontFamily);

// Carousel
const TextStyle carouselBlueTextStyle = TextStyle(
    fontSize: 100,
    color: Color(0xFF008AFE),
    fontFamily: fontFamily,
    shadows: [
      Shadow(
        color: Color(0x40000000),
        offset: Offset(1, 1),
        blurRadius: 2,
      )
    ]);

const TextStyle carouselWhiteTextStyle = TextStyle(
    fontSize: 100,
    color: Colors.white,
    fontFamily: fontFamily,
    shadows: [
      Shadow(
        color: Color(0x40000000),
        offset: Offset(1, 1),
        blurRadius: 2,
      )
    ]);
