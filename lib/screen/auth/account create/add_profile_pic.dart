import 'package:flutter/material.dart';
import 'package:hayaku_app/config/app_router.dart';
import 'package:hayaku_app/config/colors.dart';
import 'package:hayaku_app/config/textstyle/textstyles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hayaku_app/widgets/appwidget.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../../config/textstyle/textstyles.dart';

class AddProfilePicScreen extends StatefulWidget {
  const AddProfilePicScreen({super.key});

  @override
  State<AddProfilePicScreen> createState() => _AddProfilePicScreenState();
}

class _AddProfilePicScreenState extends State<AddProfilePicScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                width: double.infinity,
              ),
              title24(
                  AppLocalizations.of(context)!.set_profile_picture, context),
              body16(
                  AppLocalizations.of(context)!.set_profile_picture_description,
                  context),
              20.height,
              const CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage('assets/images/avatar.png'),
              ),
              20.height,
              appMainButton(context, AppLocalizations.of(context)!.add_a_photo,
                  () {}, false),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: appMainButton(
          context,
          AppLocalizations.of(context)!.skip_for_now,
          () {},
          false,
          color: AppColors.activeColor,
          textColor: Colors.white,
        ),
      ),
    );
  }
}
