import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hayaku_app/config/colors.dart';
import 'package:hayaku_app/config/textstyle/textstyles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../config/config.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:iconsax/iconsax.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  width: double.infinity,
                ),
                const Icon(
                  Iconsax.setting,
                  size: 65,
                ),
                title24(AppLocalizations.of(context)!.settings, context),
                body14(AppLocalizations.of(context)!.adjust_settings_info,
                    context),
                20.height,
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        profileCard(
                            AppLocalizations.of(context)!.active_hayaku,
                            AppLocalizations.of(context)!
                                .active_hayaku_description,
                            Iconsax.scan,
                            () {},
                            false,
                            context),
                        profileCard(
                            AppLocalizations.of(context)!.public_profile_mode,
                            AppLocalizations.of(context)!
                                .hide_profile_description,
                            Iconsax.global,
                            () {},
                            true,
                            context),
                      ],
                    ),
                  ),
                ),
                20.height,
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        profileCard(
                            AppLocalizations.of(context)!.shop,
                            AppLocalizations.of(context)!.shop_description,
                            Iconsax.shop,
                            () {},
                            false,
                            context),
                        profileCard(
                            AppLocalizations.of(context)!.leave_us_feedback,
                            AppLocalizations.of(context)!
                                .leave_us_feedback_description,
                            Iconsax.message_text,
                            () {},
                            true,
                            context),
                      ],
                    ),
                  ),
                ),
                20.height,
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        profileCard(
                            AppLocalizations.of(context)!.change_language,
                            AppLocalizations.of(context)!
                                .change_language_description,
                            Iconsax.global_edit,
                            () {},
                            false,
                            context),
                        profileCard(
                            AppLocalizations.of(context)!.edit_profile,
                            AppLocalizations.of(context)!
                                .edit_profile_description,
                            Iconsax.user_edit,
                            () {},
                            false,
                            context),
                        profileCard(
                            AppLocalizations.of(context)!.logout,
                            AppLocalizations.of(context)!.logout_description,
                            Iconsax.logout,
                            () {},
                            true,
                            context),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget profileCard(String title, String subtitle, IconData icon, Function onTab,
    bool isEndLine, BuildContext context) {
  return InkWell(
    onTap: onTab(),
    child: Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.only(left: 10, right: 10),
          leading: Icon(
            icon,
            size: 30,
            color: AppColors.primary,
          ),
          title: title16(title, context, color: AppColors.primary),
          subtitle: body14(subtitle, context,
              color: AppColors.primaryAsset.withOpacity(0.8)),
          trailing: Icon(Iconsax.arrow_right_1, color: AppColors.primary),
        ),
        isEndLine
            ? Container()
            : Divider(
                height: 0,
                color: AppColors.primaryAsset.withOpacity(0.4),
                thickness: 0.5,
              ),
        5.height,
      ],
    ),
  );
}
