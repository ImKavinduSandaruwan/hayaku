import 'package:flutter/material.dart';
import 'package:hayaku_app/config/colors.dart';
import 'package:hayaku_app/config/config.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hayaku_app/config/textstyle/textstyles.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hayaku_app/screen/add_link/add_link.dart';
import 'package:hayaku_app/widgets/appwidget.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:iconsax/iconsax.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  bool isLoading = false;
  String? errorMessage;

  // Firebase instance
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  Future<void> loginUser() async {
    if (emailController.text.isEmpty || passController.text.isEmpty) {
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
      // Sign in with Firebase Auth
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passController.text,
      );

      // Update last login timestamp in Firestore
      await _firestore.collection('users').doc(userCredential.user!.uid).update({
        'lastLogin': FieldValue.serverTimestamp(),
      });

      if (mounted) {
        // Navigate to home screen
        Navigator.push(context, MaterialPageRoute(builder: (context) => const AddLinkScreen()));
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
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  String getFirebaseErrorMessage(String code) {
    switch (code) {
      case 'user-not-found':
        return 'No user found with this email.';
      case 'wrong-password':
        return 'Wrong password provided.';
      case 'invalid-email':
        return 'The email address is invalid.';
      case 'user-disabled':
        return 'This user account has been disabled.';
      case 'too-many-requests':
        return 'Too many attempts. Please try again later.';
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  width: double.infinity,
                ),
                Image.asset(logo, height: 80.sp),
                SizedBox(
                  height: 20.h,
                ),
                title24(AppLocalizations.of(context)!.login, context),
                5.height,
                body18(AppLocalizations.of(context)!.login_description, context,
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
                appIconTextField(context, Iconsax.sms, emailController,
                    AppLocalizations.of(context)!.enter_email),
                10.height,
                appIconTextField(context, Iconsax.lock, passController,
                    AppLocalizations.of(context)!.enter_password),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {
                          context.push(context.namedLocation('forgetPassword'));
                        },
                        child: body14(
                            AppLocalizations.of(context)!.forgot_password,
                            context)),
                  ],
                ),
                10.height,
                appMainButton(
                  context,
                  isLoading
                      ? 'Please wait...'
                      : AppLocalizations.of(context)!.login,
                  loginUser,
                  isLoading,
                ),
                20.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    title16(AppLocalizations.of(context)!.do_you_have_account,
                        context),
                    5.width,
                    InkWell(
                      onTap: () {
                        context.push(context.namedLocation('register'));
                      },
                      child: title16(
                          AppLocalizations.of(context)!.register, context,
                          color: AppColors.secondColor),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }
}