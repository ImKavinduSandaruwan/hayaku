import 'package:flutter/material.dart';
import '../../config/config.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hayaku_app/config/colors.dart';
import '../../config/config.dart';
import '../../config/textstyle/textstyles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hayaku_app/widgets/appwidget.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:iconsax/iconsax.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: InkWell(
                  onTap: () {
                    finish(context);
                  },
                  child: Icon(Icons.arrow_back, size: 30.sp).onTap(() {
                    finish(context);
                  }),
                ),
              ),
              const SizedBox(
                width: double.infinity,
              ),
              Align(
                  alignment: Alignment.center,
                  child: Image.asset(logo, height: 80.sp)),
              10.height,
              title24(AppLocalizations.of(context)!.forgot_password, context),
              body16(AppLocalizations.of(context)!.forgot_password_description,
                  context,
                  isCenter: true, color: Colors.grey),
              20.height,
              appIconTextField(context, Iconsax.sms, TextEditingController(),
                  AppLocalizations.of(context)!.enter_email),
              20.height,
              appMainButton(context,
                  AppLocalizations.of(context)!.forgot_password, () {}, false),
            ],
          ),
        ),
      ),
    );
  }
}
