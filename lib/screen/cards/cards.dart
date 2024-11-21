import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hayaku_app/config/colors.dart';
import 'package:hayaku_app/screen/cards/share.dart';
import '../../config/textstyle/textstyles.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardsScreen extends StatefulWidget {
  const CardsScreen({super.key});

  @override
  State<CardsScreen> createState() => _CardsScreenState();
}

class _CardsScreenState extends State<CardsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(children: [
            const SizedBox(
              width: double.infinity,
            ),
            const Icon(
              Iconsax.slider_horizontal,
              size: 65,
            ),
            title24(AppLocalizations.of(context)!.cards, context),
            body14(AppLocalizations.of(context)!.cards_description, context),
            const Spacer(),
            CarouselSlider(
              options: CarouselOptions(height: 500.sp),
              items: [1, 2, 3, 4, 5].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Column(
                      children: [
                        Container(
                            height: 420.sp,
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.only(right: 15.0),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color:
                                        AppColors.activeColor.withOpacity(0.8)),
                                color: AppColors.primaryAsset,
                                borderRadius: BorderRadius.circular(15)),
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      children: [
                                        const CircleAvatar(
                                          radius: 50,
                                          backgroundColor: Colors.white,
                                          child: Icon(Iconsax.user),
                                        ),
                                        SizedBox(
                                          height: 20.sp,
                                        ),
                                        title18(
                                            'Ravinder dhananajaya', context),
                                        body14('UX/UI Designer', context),
                                        10.height,
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(Iconsax.location,
                                                color: AppColors.grey),
                                            5.width,
                                            body14(
                                                'Colombo, Sri Lanka', context),
                                          ],
                                        ),
                                        10.height,
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: 0,
                                  top: 0,
                                  child: Container(
                                    height: 50.sp,
                                    width: 40.sp,
                                    decoration: BoxDecoration(
                                      color: AppColors.primary,
                                      border: Border.all(
                                          color: AppColors.activeColor
                                              .withOpacity(0.8)),
                                      borderRadius: const BorderRadius.only(
                                          topRight: Radius.circular(15),
                                          bottomLeft: Radius.circular(20)),
                                    ),
                                    child: const Icon(Iconsax.user),
                                  ),
                                ),

                              ],
                            )),
                        20.height,
                        Padding(
                          padding:  const EdgeInsets.only(left: 30, right: 30),
                          child: Row(

                            children: [
                              Spacer(),
                              InkWell(
                                onTap: (){
                                  shareBottomSheet(context, );
                                },
                                child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: AppColors.activeColor,
                                      borderRadius: const BorderRadius.only(bottomLeft:Radius.circular(20.0),topLeft: Radius.circular(20.0))),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 15,right: 15,top: 8,bottom:8),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            const Icon(Iconsax.send_2,
                                                size: 25, color: Colors.white),
                                            5.width,
                                            title16('Share', context,
                                                color: Colors.white),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                height: 50,
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(bottomRight:Radius.circular(20.0),topRight: Radius.circular(20.0))),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 15,right: 20,top: 8,bottom:8),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                           Icon(Iconsax.edit,
                                              size: 25, color: AppColors.primary),
                                          5.width,
                                          title16('Edit', context,
                                              color: AppColors.primary),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Spacer(),
                            ],
                          ),
                        )
                      ],
                    );
                  },
                );
              }).toList(),
            ),
          ]),
        ),
      ),
    );
  }
}
