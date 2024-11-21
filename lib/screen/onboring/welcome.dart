import 'package:flutter/material.dart';
import 'package:hayaku_app/config/colors.dart';
import 'package:hayaku_app/config/textstyle/textstyles.dart';
import 'package:hayaku_app/widgets/appwidget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  title24('Welcome to ', context),
                  title24('Hayaku', context, color: AppColors.activeColor),
                ],
              ),
              const Spacer(),
              title42('This is', context),
              title42('your', context),
              title42('digital', context),
              title42('business', context),
              title42('card.', context),
              const Spacer(),
              title20('Connect.share.custimize ', context,
                  color: AppColors.activeColor),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: appMainButton(
            context, AppLocalizations.of(context)!.get_started, () {}, false),
      ),
    );
  }
}
