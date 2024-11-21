import 'package:flutter/material.dart';
import 'package:hayaku_app/config/colors.dart';
import 'package:hayaku_app/config/textstyle/responsivetext.dart';
import 'package:hayaku_app/config/textstyle/textstyles.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:iconsax/iconsax.dart';

import '../../config/config.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                title24("Hi Ravindu 👋", context),
                10.height,
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              title16("Edit Profile", context),
                              const Spacer(),
                              const Icon(Iconsax.user_edit,color: Colors.white,size: 50,),
                            ],
                          ),
                        ) ,
                      ),
                    ),
                    10.width,
                    Expanded(
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                          color: AppColors.activeColor,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              title20("Share", context),
                              const Spacer(),
                              const Icon(Iconsax.send_2,color: Colors.white,size: 60,),
                            ],
                          ),
                        ) ,
                      ),
                    ),
                  ],
                ),
                10.height,
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                             const Icon(Iconsax.scan,color: Colors.white,size: 30,),
                              10.height,
                              title14('Scan\n Biz card', context,isCenter: true),
                      
                             
                            ],
                          ),
                        ) ,
                      ),
                    ),
                    10.width,
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Iconsax.arrow_swap,color: Colors.white,size: 30,),
                              10.height,
                              title14('Active\n Hayaku', context,isCenter: true),
                      
                      
                            ],
                          ),
                        ) ,
                      ),
                    ),
                    10.width,
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Iconsax.user,color: Colors.white,size: 30,),
                              10.height,
                              title14('Create\n contact', context,isCenter: true),
                      
                      
                            ],
                          ),
                        ) ,
                      ),
                    ),
                    10.width,
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Iconsax.shop,color: Colors.white,size: 30,),
                              10.height,
                              title14('Buy\n Hayaku', context,isCenter: true),
                      
                      
                            ],
                          ),
                        ) ,
                      ),
                    ),
                  ],
                ),
                20.height,
                Row(
                  
                  children: [
                    title18('Next Step', context),
                    const Spacer(),
                    body14("1 of 4 steps complete", context,color: Colors.grey),
                  ],
                ),
                20.height,
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: AppColors.activeColor),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        title16('Completed your hayaku profile', context),
                        Divider(
                          color: AppColors.activeColor,
                        ),
                        10.height,
                        Row(
                          children: [
                            Checkbox(value: false, onChanged: (value) {}),
                            5.height,
                            title16('Add profile pic', context),
                          ],
                        ),
                        Row(
                          children: [
                            Checkbox(value: false, onChanged: (value) {}),
                            5.height,
                            title16('Add cover image', context),
                          ],
                        ),
                        Row(
                          children: [
                            Checkbox(value: false, onChanged: (value) {}),
                            5.height,
                            title16('Add Social Media', context),
                          ],
                        ),
                        Row(
                          children: [
                            Checkbox(value: false, onChanged: (value) {}),
                            5.height,
                            title16('Active Hayaku', context),
                          ],
                        ),
                        10.height,
        
                      ],
                    ),
                  ),
                ),
                20.height,
                Align(
                  alignment: Alignment.topLeft,
                    child: title18('Meet Hayaku', context)),
                10.height,
                Container(
                  height: 350,
                  child:
                  ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4, itemBuilder: (context, index){
                    return Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Image.asset("assets/test/IMG_7242.jpg"),
                    );
                  }),
                ),


        
        
        
              ],
            ),
          ),
        ),
      ),
    );
  }
}
