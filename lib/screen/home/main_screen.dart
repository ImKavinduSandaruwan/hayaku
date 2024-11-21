import 'package:flutter/material.dart';
import 'package:hayaku_app/screen/cards/cards.dart';
import 'package:hayaku_app/screen/home/home.dart';
import 'package:hayaku_app/screen/setting/setting.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:iconsax/iconsax.dart';
import '../../config/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final tabs = [];
  final int _pageIndex = 0;
  bool selectedPage = true;
  bool unSelectedPage = true;
  int _pagePosition = 0;
  ShapeBorder? bottomBarShape = const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
    topLeft: Radius.circular(30),
    topRight: Radius.circular(30),
  ));

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  Widget getSelectedWidget({required int index}) {
    late Widget widget;
    switch (index) {
      case 0:
        widget = const HomeScreen();
        break;
      case 1:
        widget = const CardsScreen();
        break;
      case 2:
        widget = const SettingScreen();
        break;
    }
    return widget;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,
      extendBody: true,
      body: getSelectedWidget(index: _pagePosition),
      bottomNavigationBar: SnakeNavigationBar.color(
        height: 60,
        behaviour: SnakeBarBehaviour.pinned,
        snakeShape: SnakeShape.circle,
        shape: bottomBarShape,
        padding: const EdgeInsets.all(5),
        backgroundColor: Colors.white,
        snakeViewColor: AppColors.activeColor,
        unselectedItemColor: AppColors.primary,
        selectedItemColor: Colors.white,
        showUnselectedLabels: unSelectedPage,
        showSelectedLabels: selectedPage,
        currentIndex: _pagePosition,



        onTap: (index) => setState(() => _pagePosition = index),
        items: [
           BottomNavigationBarItem(icon: const Icon(Iconsax.home4), label: AppLocalizations.of(context)!.home,),
          BottomNavigationBarItem(
              icon: const Icon(Iconsax.slider_horizontal), label: AppLocalizations.of(context)!.cards),
           BottomNavigationBarItem(
              icon: const Icon(Iconsax.setting), label: AppLocalizations.of(context)!.settings),
        ],
        selectedLabelStyle: const TextStyle(fontSize: 14),
        unselectedLabelStyle: const TextStyle(fontSize: 10),
      ),
    );
  }
}
