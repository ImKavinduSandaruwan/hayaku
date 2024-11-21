import 'package:flutter/material.dart';
import 'package:hayaku_app/config/config.dart';
import '../../../config/colors.dart';
import '../../../config/textstyle/textstyles.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HaveHayakuScreen extends StatefulWidget {
  const HaveHayakuScreen({super.key});

  @override
  State<HaveHayakuScreen> createState() => _HaveHayakuScreenState();
}

class _HaveHayakuScreenState extends State<HaveHayakuScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primaryAsset,
        image: const DecorationImage(
          image: AssetImage(haveHayakuBg),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
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
                    AppLocalizations.of(context)!.do_you_have_account, context),
                body16(
                    AppLocalizations.of(context)!
                        .do_you_have_a_a_hayaku_device_description,
                    context),
              ],
            ),
          ),
        ),
        bottomNavigationBar: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              selectCard(context, qrCode,
                  AppLocalizations.of(context)!.no_i_don_t, () {}),
              selectCard(context, tag, AppLocalizations.of(context)!.yes_i_have,
                  () {}),
            ],
          ),
        ),
      ),
    );
  }
}

Widget selectCard(
  context,
  String image,
  String title,
  Function onPressed,
) {
  return InkWell(
    child: Container(
      height: 120,
      width: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: AppColors.activeColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            width: 50,
            height: 50,
          ),
          10.height,
          body16(title, context),
        ],
      ),
    ),
    onTap: () {
      context.go(context.namedLocation('nohayaku'));
    },
  );
}
