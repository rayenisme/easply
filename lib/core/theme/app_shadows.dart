import 'package:flutter/material.dart';

class AppShadows {
  static const soft = BoxShadow(
    blurRadius: 10,
    offset: Offset(0, 4),
    color: Color(0x1A000000),
  );

  static const medium = BoxShadow(
    blurRadius: 20,
    offset: Offset(0, 10),
    color: Color(0x1A000000),
  );
}
