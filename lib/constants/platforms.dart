import 'package:flutter/foundation.dart';

/// check if the current platform is Windows
final bool isBoxWindows = (defaultTargetPlatform == TargetPlatform.windows);

/// check if the current platform is Windows
final bool isBoxAndroid = (defaultTargetPlatform == TargetPlatform.android);

/// check if the current platform is Windows
final bool isBoxiOs = (defaultTargetPlatform == TargetPlatform.iOS);

/// check if the current platform is Windows or Web
const bool isBoxWeb = (kIsWeb);

/// check if the current platform is Windows or Web
final bool isBoxWebOrWindows = (isBoxWindows || isBoxWeb);

///This variable declares that if we are on phone
///, no mouse region, else we gat a mouse region
final isPhone = (isBoxAndroid || isBoxiOs);
