import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResponsiveText extends StatelessWidget {
  final String text;
  final bool isCenter;
  final Color? color;
  final double? fontSize;
  final FontWeight fontWeight;

  const ResponsiveText({
    super.key,
    required this.text,
    this.isCenter = false,
    this.color,
    this.fontSize,
    this.fontWeight = FontWeight.normal,
  });

  @override
  Widget build(BuildContext context) {
    // Determine if the theme is dark or light
    final bool isDarkTheme = Theme.of(context).brightness == Brightness.dark;

    // Default text color based on theme
    final Color defaultColor = isDarkTheme ? Colors.white : Colors.black;

    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize?.sp, // Use scale pixel for responsive font size
        fontWeight: fontWeight,
        color: color ??
            defaultColor, // Use provided color or default to theme-based color
      ),
      textAlign: isCenter ? TextAlign.center : TextAlign.start,
    );
  }
}
