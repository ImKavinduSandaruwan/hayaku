import 'package:flutter/material.dart';

import '../../config/textstyle/textstyles.dart';
import '../../widgets/appwidget.dart';

class NfcActiveHayakuScreen extends StatefulWidget {
  const NfcActiveHayakuScreen({super.key});

  @override
  State<NfcActiveHayakuScreen> createState() => _NfcActiveHayakuScreenState();
}

class _NfcActiveHayakuScreenState extends State<NfcActiveHayakuScreen> {
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
              title24('Active your Hayaku Account', context),
              body16(
                  'Instantly using your in app NFC', isCenter: true, context),
            ],
          ),
        ),
      ),
      bottomNavigationBar:
          SafeArea(child: appMainButton(context, 'Continue', () {}, false)),
    );
  }
}
