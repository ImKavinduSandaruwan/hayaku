import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:shimmer/shimmer.dart';
import '../config/colors.dart';
import '../config/textstyle/textstyles.dart';

Widget appMainButton(context, buttonText, onPressed, bool isOutlined,
    {bool isGift = false,
    Color color = Colors.white,
    Color? textColor,
    bool isWidth = false,
    double height = 60,
    double? width,
    Widget? widget}) {
  return Container(
    margin: isGift ? null : const EdgeInsets.only(left: 15, right: 15),
    width: isWidth ? (width) : MediaQuery.of(context).size.width,
    height: height,
    child: MaterialButton(
      onPressed: onPressed,
      color: isOutlined ? null : color,
      shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.white,
            width: isOutlined ? 1 : 0,
            style: isOutlined ? BorderStyle.solid : BorderStyle.none,
          ),
          borderRadius: BorderRadius.circular(15)),
      child: widget ??
          title20(
            buttonText,
            context,
            color: textColor ?? AppColors.primary,
          ),
    ),
  );
}

Widget appMainIconButton(context, buttonText, onPressed, bool isOutlined,
    {Color color = Colors.white,
      Color? textColor,
      bool isWidth = false,
      double height = 60,
      double? width,
      Widget? widget}) {
  return Container(

    width: isWidth ? (width) : MediaQuery.of(context).size.width,
    height: height,
    child: MaterialButton(
      onPressed: onPressed,
      color: isOutlined ? null : color,
      shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.white,
            width: isOutlined ? 1 : 0,
            style: isOutlined ? BorderStyle.solid : BorderStyle.none,
          ),
          borderRadius: BorderRadius.circular(15)),
      child: widget ??
          title20(
            buttonText,
            context,
            color: textColor ?? AppColors.primary,
          ),
    ),
  );
}

Widget appIconTextField(
  context,
  IconData icon,
  controller,
  hintText,
) {
  return Container(
    //width: context.width(),
    decoration: BoxDecoration(
      color: AppColors.primaryLight,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Icon(
            icon,
            color: Colors.white.withOpacity(0.5),
          ),
        ),
        Expanded(
          child: AppTextField(
            textFieldType: TextFieldType.NAME,
            controller: controller,
            cursorColor: Colors.white,
            textStyle: const TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
                color: Colors.white),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.white.withOpacity(0.5)),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget appCachedImage(
    String img, {
      double? height,
      double? width,
      BoxFit? fit,
    }) {

  return CachedNetworkImage(
    imageUrl: img,
    height: height,
    width: width,
    fit: fit,

    placeholder: (context, url) => SizedBox(
      height: height,
      width: width,
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Container(),
      ),
    ),

    //DEFIND ERROR MSG DESIGN HERE
    errorWidget: (context, url, error) => const Icon(Icons.error),
  );
}

Widget appLoading() {
  return const Scaffold(
    body: Center(
        child: CircularProgressIndicator(
          color: Colors.white,
        )),
  );
}
