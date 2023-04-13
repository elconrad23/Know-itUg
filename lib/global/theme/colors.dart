import 'package:flutter/material.dart';

import 'dart:math' as math;

// knowIt Color
const knowItColor = Color(0xFF095AD2);

// background color
const knowItBackgroundColor = Color(0xFFE3EEFE);

// know it teal
const knowItTeal = Color(0xFF19B687);

// know it white
const knowItWhite = Color(0xFFFFFFFF);

// know it transparent
const knowItTransparent = Colors.transparent;

// black
const knowItBlack = Color(0xFF000000);

// orange
const Color knowItOrange = Color(0xFFFBAA00);

// random color
Color get knowItRandomColor =>
    Color((math.Random().nextDouble() * 0xFFE3EEFE).toInt()).withOpacity(1.0);


