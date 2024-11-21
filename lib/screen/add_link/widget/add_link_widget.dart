import 'package:flutter/material.dart';
import 'package:hayaku_app/config/colors.dart';

import '../../../config/textstyle/textstyles.dart';
import '../../../widgets/appwidget.dart';

class LinkButtonWidget extends StatefulWidget {
  String img;
  String title;
  bool isActive;
  final GestureTapCallback press;

  LinkButtonWidget({
    super.key,
    required this.img,
    required this.title,
    required this.press,
    this.isActive = false,
  });

  @override
  _LinkButtonWidgetState createState() => _LinkButtonWidgetState();
}

class _LinkButtonWidgetState extends State<LinkButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: const Color(0xff343353),
        ),
        child: InkWell(
          onTap: widget.press,
          splashColor: AppColors.secondColor.withOpacity(0.4),
          child: Padding(
            padding:
                const EdgeInsets.only(top: 10, bottom: 10, left: 5, right: 5),
            child: Column(
              children: [
                appCachedImage(
                  widget.img,
                  height: 75,
                  width: 75,
                ),
                title16(
                  widget.title,
                  context,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
