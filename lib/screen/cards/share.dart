import 'package:flutter/material.dart';
import 'package:hayaku_app/config/colors.dart';
import 'package:hayaku_app/config/config.dart';
import 'package:hayaku_app/config/textstyle/textstyles.dart';
import 'package:hayaku_app/widgets/appwidget.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'dart:io' show Platform;


shareBottomSheet(context, ) async {
  await showModalBottomSheet(
      //isScrollControlled: true,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.0), topRight: Radius.circular(25.0)),
      ),
      builder: (BuildContext bc) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(width: double.infinity,),
              Row(
                children: [
                  const Spacer(),


                  title18(AppLocalizations.of(context)!.share_profile, context),
                  const Spacer(),
                   Align(
                      alignment: Alignment.topRight,
                      child: InkWell(
                        onTap: (){

                        },
                          child: const Icon(Iconsax.arrow_down_1,size: 30,))),

                ],

              ),
              const Spacer(),
              appMainButton(context, "buttonText", (){}, true,widget: Row(
                children: [
                  const InkWell(child: Icon(Iconsax.copy)),
                  const Spacer(),
                  body12("https;//hayakume.com/ravindu", context),
                  const Spacer(),

                ],
              )),
              10.height,
              appMainButton(context, "", (){}, false,widget: Row(
                children: [
                  const InkWell(child: Icon(Iconsax.share)),
                  const Spacer(),
                  title16("Share Profile", context),
                  const Spacer(),

                ],
              ),color: AppColors.activeColor),
              10.height,
              appMainButton(context, "", (){}, false,widget: Row(


               mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(Platform.isAndroid ?googleWalletIcon :appleWalletIcon,height: 40,width: 40,),
                  10.width,
                  title16(Platform.isAndroid ?"Add to Google Wallet":"Add to Apple Wallet", context),


                ],
              ),color: Colors.black),
              20.height,




            ],
          ),
        );
      });
}