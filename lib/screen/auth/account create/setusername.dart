import 'package:flutter/material.dart';
import 'package:hayaku_app/config/textstyle/textstyles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:iconsax/iconsax.dart';

import '../../../widgets/appwidget.dart';

class SetUsernameScreen extends StatefulWidget {
  const SetUsernameScreen({super.key});

  @override
  State<SetUsernameScreen> createState() => _SetUsernameScreenState();
}

class _SetUsernameScreenState extends State<SetUsernameScreen> {
  final usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                width: double.infinity,
              ),
              title24(AppLocalizations.of(context)!.lets_get_started, context),
              body16(
                  AppLocalizations.of(context)!.first_off_what_is_your_username,
                  context),
              20.height,
              appIconTextField(context, Iconsax.user, usernameController,
                  AppLocalizations.of(context)!.enter_username),
              20.height,
              appMainButton(
                context,
                AppLocalizations.of(context)!.continue_,
                () {
                  // context.push(context.namedLocation('forgetPassword'));
                },
                false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
