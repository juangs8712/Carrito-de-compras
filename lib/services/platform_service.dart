
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;

// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
class CustomPlatform{
  // -----------------------------------------------------
  static bool get isMovil => ( ! kIsWeb && ( Platform.isAndroid || Platform.isIOS ) );
  // -----------------------------------------------------
}
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~