import 'package:dark_wallpapers/business_logic/helper.dart';
import 'package:dark_wallpapers/const/app_colors.dart';
import 'package:flutter/material.dart';

class Recent extends StatefulWidget {
  const Recent({Key? key}) : super(key: key);

  @override
  State<Recent> createState() => _RecentState();
}

class _RecentState extends State<Recent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: SafeArea(child: fetchData("Recent")));
  }
}
