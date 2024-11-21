import 'package:flutter/material.dart';
import 'package:hayaku_app/widgets/appwidget.dart';
import '../../../config/textstyle/textstyles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class QrHayakuScreen extends StatefulWidget {
  const QrHayakuScreen({super.key});

  @override
  State<QrHayakuScreen> createState() => _QrHayakuScreenState();
}

class _QrHayakuScreenState extends State<QrHayakuScreen> {
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
                  AppLocalizations.of(context)!
                      .no_device_no_problem_share_your_info,
                  context),
              body16(
                  AppLocalizations.of(context)!
                      .instantly_using_your_in_app_qr_code,
                  isCenter: true,
                  context),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
          child: appMainButton(
              context, AppLocalizations.of(context)!.continue_, () {}, false)),
    );
  }
}
