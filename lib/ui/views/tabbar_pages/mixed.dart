

import 'package:dark_wallpapers/business_logic/helper.dart';
import 'package:dark_wallpapers/const/app_colors.dart';
import 'package:flutter/material.dart';

class Mixed extends StatefulWidget {
  const Mixed({Key? key}) : super(key: key);

  @override
  State<Mixed> createState() => _MixedState();
}

class _MixedState extends State<Mixed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: SafeArea(child: fetchData("Mixed")));
  }
}
