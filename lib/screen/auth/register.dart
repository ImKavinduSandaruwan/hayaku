import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hayaku_app/config/colors.dart';
import '../../config/config.dart';
import '../../config/textstyle/textstyles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hayaku_app/widgets/appwidget.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:iconsax/iconsax.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../add_link/add_link.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final confirmPassController = TextEditingController();

  bool isLoading = false;

  // Firebase instances
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  // Error handling
  String? errorMessage;

  Future<void> registerUser() async {
    if (passController.text != confirmPassController.text) {
      setState(() {
        errorMessage = 'Passwords do not match';
      });
      return;
    }

    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passController.text.isEmpty) {
      setState(() {
        errorMessage = 'Please fill in all fields';
      });
      return;
    }

    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    try {
      // Create user in Firebase Auth
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passController.text,
      );

      // Store additional user data in Firestore
      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'name': nameController.text,
        'email': emailController.text.trim(),
        'createdAt': FieldValue.serverTimestamp(),
        'updatedAt': FieldValue.serverTimestamp(),
      });

      // Navigate to home screen or show success message
      if (mounted) {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return const AddLinkScreen();
        }));
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = getFirebaseErrorMessage(e.code);
      });
    } catch (e) {
      setState(() {
        errorMessage = 'An error occurred. Please try again.';
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  String getFirebaseErrorMessage(String code) {
    switch (code) {
      case 'weak-password':
        return 'The password provided is too weak.';
      case 'email-already-in-use':
        return 'An account already exists for this email.';
      case 'invalid-email':
        return 'The email address is invalid.';
      default:
        return 'An error occurred. Please try again.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  width: double.infinity,
                ),
                Image.asset(logo, height: 80.sp),
                SizedBox(
                  height: 20.h,
                ),
                title24(AppLocalizations.of(context)!.register, context),
                5.height,
                body18(
                    AppLocalizations.of(context)!.register_description, context,
                    color: Colors.grey),
                20.height,
                if (errorMessage != null)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Text(
                      errorMessage!,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
                appIconTextField(context, Iconsax.user, nameController,
                    AppLocalizations.of(context)!.enter_name),
                10.height,
                appIconTextField(context, Iconsax.sms, emailController,
                    AppLocalizations.of(context)!.enter_email),
                10.height,
                appIconTextField(context, Iconsax.lock, passController,
                    AppLocalizations.of(context)!.enter_password),
                10.height,
                appIconTextField(context, Iconsax.lock, confirmPassController,
                    AppLocalizations.of(context)!.enter_confirm_password),
                20.height,
                appMainButton(
                    context,
                    isLoading ? 'Please wait...' : AppLocalizations.of(context)!.register,
                    registerUser,
                    isLoading
                ),
                10.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    title16(AppLocalizations.of(context)!.do_you_have_account,
                        context),
                    TextButton(
                        onPressed: () {
                          context.push(context.namedLocation('forgetPassword'));
                        },
                        child: title16(
                            AppLocalizations.of(context)!.login, context,
                            color: AppColors.secondColor)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}