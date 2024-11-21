import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// --------------------------------------------Title--------------------------------------------

Text title14(String text, BuildContext context,
    {bool isCenter = false, Color? color, double? fontSize = 14}) {
  bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;
  return Text(
    text,
    style: TextStyle(
        fontSize: fontSize?.sp,
        fontWeight: FontWeight.bold,
        color: color ?? (isDarkTheme ? Colors.white : Colors.black)),
    textAlign: isCenter ? TextAlign.center : TextAlign.start,
  );
}

Text title16(String text, BuildContext context,
    {bool isCenter = false, Color? color, double? fontSize = 16}) {
  bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;
  return Text(
    text,
    style: TextStyle(
        fontSize: fontSize?.sp,
        fontWeight: FontWeight.bold,
        color: color ?? (isDarkTheme ? Colors.white : Colors.black)),
    textAlign: isCenter ? TextAlign.center : TextAlign.start,
  );
}

Text title18(text, BuildContext context,
    {bool isCenter = false, Color? color, double? fontSize = 18}) {
  bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;
  return Text(
    text,
    style: TextStyle(
        fontSize: fontSize?.sp,
        fontWeight: FontWeight.bold,
        color: color ?? (isDarkTheme ? Colors.white : Colors.black)),
    textAlign: isCenter ? TextAlign.center : TextAlign.start,
  );
}

Text title20(text, BuildContext context,
    {bool isCenter = false, Color? color, double? fontSize = 20}) {
  bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;
  return Text(
    text,
    style: TextStyle(
        fontSize: fontSize?.sp,
        fontWeight: FontWeight.bold,
        color: color ?? (isDarkTheme ? Colors.white : Colors.black)),
    textAlign: isCenter ? TextAlign.center : TextAlign.start,
  );
}

Text title24(text, BuildContext context,
    {bool isCenter = false, Color? color, double? fontSize = 24}) {
  bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;
  return Text(
    text,
    style: TextStyle(
        fontSize: fontSize?.sp,
        fontWeight: FontWeight.bold,
        color: color ?? (isDarkTheme ? Colors.white : Colors.black)),
    textAlign: isCenter ? TextAlign.center : TextAlign.start,
  );
}

Text title42(text, BuildContext context,
    {bool isCenter = false, Color? color, double? fontSize = 60}) {
  bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;
  return Text(
    text,
    style: TextStyle(
        fontSize: fontSize?.sp,
        fontWeight: FontWeight.bold,
        color: color ?? (isDarkTheme ? Colors.white : Colors.black)),
    textAlign: isCenter ? TextAlign.center : TextAlign.start,
  );
}

/// --------------------------------------------body--------------------------------------------
Text body12(text, BuildContext context,
    {bool isCenter = false, Color? color, double? fontSize = 12}) {
  bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;
  return Text(
    text,
    style: TextStyle(
        fontSize: fontSize?.sp,
        fontWeight: FontWeight.w300,
        color: color ?? (isDarkTheme ? Colors.white : Colors.black)),
    textAlign: isCenter ? TextAlign.center : TextAlign.start,
  );
}

Text body14(text, BuildContext context,
    {bool isCenter = false, Color? color, double? fontSize = 14}) {
  bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;
  return Text(
    text,
    style: TextStyle(
        fontSize: fontSize?.sp,
        fontWeight: FontWeight.w400,
        color: color ?? (isDarkTheme ? Colors.white : Colors.black)),
    textAlign: isCenter ? TextAlign.center : TextAlign.start,
  );
}

Text body16(
  text,
  BuildContext context, {
  bool isCenter = false,
  Color? color,
  double? fontSize = 16,
}) {
  bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;
  return Text(
    text,
    style: TextStyle(
        fontSize: fontSize?.sp,
        fontWeight: FontWeight.w400,
        color: color ?? (isDarkTheme ? Colors.white : Colors.black)),
    textAlign: isCenter ? TextAlign.center : TextAlign.start,
  );
}

Text body18(text, BuildContext context,
    {bool isCenter = false, Color? color, double? fontSize = 18}) {
  bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;
  return Text(
    text,
    style: TextStyle(
        fontSize: fontSize?.sp,
        fontWeight: FontWeight.w400,
        color: color ?? (isDarkTheme ? Colors.white : Colors.black)),
    textAlign: isCenter ? TextAlign.center : TextAlign.start,
  );
}
