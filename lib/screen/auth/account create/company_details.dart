import 'package:flutter/material.dart';
import 'package:hayaku_app/config/textstyle/textstyles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:iconsax/iconsax.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widgets/appwidget.dart';

class CompneyDetailsScreen extends StatefulWidget {
  const CompneyDetailsScreen({super.key});

  @override
  State<CompneyDetailsScreen> createState() => _CompneyDetailsScreenState();
}

class _CompneyDetailsScreenState extends State<CompneyDetailsScreen> {
  final jobTitleController = TextEditingController();
  final compneyNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      finish(context);
                    },
                    child: Icon(Icons.arrow_back, size: 30.sp).onTap(() {
                      finish(context);
                    }),
                  ),
                  InkWell(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, top: 5, bottom: 5),
                        child: body14('Skip', context),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: double.infinity,
              ),
              title24(
                  AppLocalizations.of(context)!.company_information, context),
              body16(
                  AppLocalizations.of(context)!.company_information_description,
                  context),
              20.height,
              appIconTextField(context, Iconsax.briefcase, jobTitleController,
                  AppLocalizations.of(context)!.enter_job_title),
              10.height,
              appIconTextField(context, Iconsax.buliding, compneyNameController,
                  AppLocalizations.of(context)!.ender_company_name),
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
