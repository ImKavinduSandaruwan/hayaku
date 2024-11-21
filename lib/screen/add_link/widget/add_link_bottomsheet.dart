import 'package:awesome_toster/awesome_toster.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:hayaku_app/config/colors.dart';
import 'package:hayaku_app/config/textstyle/textstyles.dart';
import 'package:hayaku_app/widgets/appwidget.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../../../models/ItemsModel.dart';
import '../../../models/SocialItems.dart';


AddNewItem(context, String cardID, SocialItemModel data) {
  var controller_ = TextEditingController(text: data.baseUrl);
  showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25.0), topRight: Radius.circular(25.0)),
      ),
      builder: (BuildContext bc) {
        return LinkAddWedget(
            sku: data.sku,
            textController: controller_,
            img: data.iconUrl,
            Title: data.name,
            Textfild_title: FeatherIcons.phone,
            Textfild_hinttext: data.baseUrl,
            press: () async {
              appLoading();

              if (controller_.text.isEmpty) {
                print("EMPLTY DATA");

                AwesomeToster().showOverlay(
                    context: context,
                    msg: "Cannot add empty value",
                    tosterHeight: 50,
                    msgType: MsgType.SUCESS);

              } else {
                print("RUN DATA ADDING");
                print("BaseURL - ${data.baseUrl + controller_.text.trim()} ");
                // await Provider.of<UserDataProvider>(context, listen: false)
                //     .addCardItem(
                //   context,
                //   cardID,
                //   ItemsModel(
                //       id: data.id,
                //       name: data.name,
                //       sku: data.sku,
                //       iconUrl: data.iconUrl,
                //       baseUrl: controller_.text.trim(),
                //       status: true,
                //       createdAt: DateTime.now(),
                //       updatedAt: DateTime.now()),
                // );
              }
              Navigator.pop(context);
            });
      });
}


class LinkAddWedget extends StatefulWidget {
  String img;
  String Title;
  String sku;
  var textController;
  IconData Textfild_title;
  String Textfild_hinttext;
  final GestureTapCallback press;

  LinkAddWedget(
      {super.key,
        required this.img,
        required this.Title,
        required this.textController,
        required this.Textfild_title,
        required this.Textfild_hinttext,
        required this.press,
        required this.sku});

  @override
  _LinkAddWedgetState createState() => _LinkAddWedgetState();
}

class _LinkAddWedgetState extends State<LinkAddWedget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding:
        const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 30),
        child: Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Padding(
            padding:
            const EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                title20(
                  widget.Title,
                  context,
                ),
                appCachedImage(
                  widget.img,
                ),
                20.height,
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.primary,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: TextField(
                      style: const TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                      controller: widget.textController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: const Icon(
                         // skuToData[widget.sku] ?? Icons.link,
                          Icons.link,
                          color: Colors.white,
                          size: 20,
                        ),
                        hintText: widget.Textfild_hinttext,
                        hintStyle: const TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
                20.height,
                appMainButton(context, AppLocalizations.of(context)!.save,
                    widget.press, false,
                    color: AppColors.activeColor, textColor: Colors.white),
              ],
            ),
          ),
        ),
      ),
    );
  }
}