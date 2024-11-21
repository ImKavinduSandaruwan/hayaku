import 'package:flutter/material.dart';
import 'package:hayaku_app/config/colors.dart';
import 'package:nb_utils/nb_utils.dart';
import '../../config/config.dart';
import '../../config/textstyle/textstyles.dart';
import '../../widgets/appwidget.dart';
import 'package:iconsax/iconsax.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {

    final emailController = TextEditingController();
    final passController = TextEditingController();


    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(
                width: double.infinity,
              ),
              title24('Edit Profile', context),
              body16('Update your profile information', isCenter: true, context),
              20.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  title18('Profile Image', context),
                  TextButton(
                    onPressed: () {
                      // context.push(context.namedLocation('forgetPassword'));
                    },
                    child: title16('Change', context,color: AppColors.secondColor),
                  ),

                ],
              ),
              const CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 70,
                backgroundImage: AssetImage(profilePic),
              ),
              20.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  title18('Personal Information', context),
                  TextButton(
                    onPressed: () {
                      // context.push(context.namedLocation('forgetPassword'));
                    },
                    child: title16('Change', context,color: AppColors.secondColor),
                  ),

                ],
              ),

              appIconTextField(context, Iconsax.user, emailController,
                  'Enter your name'),
              10.height,
              appIconTextField(context, Icons.location_on, passController,
                  'Profession'),
              10.height,
              appIconTextField(context, Iconsax.message, passController,
                  'Enter your email'),
              10.height,
              appIconTextField(context, Iconsax.mobile, passController,
                  'Enter your phone number'),
              20.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  title18('Social links', context),
                  TextButton(
                    onPressed: () {
                      // context.push(context.namedLocation('forgetPassword'));
                    },
                    child: title16('Add', context,color: AppColors.secondColor),
                  ),

                ],
              ),
              5.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  title18('Company information', context),
                  TextButton(
                    onPressed: () {
                      // context.push(context.namedLocation('forgetPassword'));
                    },
                    child: title16('Add', context,color: AppColors.secondColor),
                  ),

                ],
              ),



              10.height,

              appMainButton(
                context,
                'Update',
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
