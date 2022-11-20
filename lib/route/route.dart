// ignore_for_file: prefer_const_constructors

import 'package:dark_wallpapers/ui/views/full_screen_image.dart';
import 'package:dark_wallpapers/ui/views/splash_screen.dart';
import 'package:dark_wallpapers/ui/views/tab_controller.dart';
import 'package:get/get.dart';

const String splash = '/splash-screen';
const String tabBar = '/tabBar-screen';
const String fullScreenImage = '/full-screen-image';

List<GetPage> getpages = [
  GetPage(
    name: splash,
    page: () => SplashScreen(),
  ),
  GetPage(
    name: tabBar,
    page: () => TabBarScreen(),
  ),
  GetPage(
    name: fullScreenImage,
    page: () {
      FullScreenImage _fullScreenImage = Get.arguments;
      return _fullScreenImage;
    },
  ),
];
