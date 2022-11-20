
import 'package:dark_wallpapers/business_logic/helper.dart';
import 'package:dark_wallpapers/const/app_colors.dart';
import 'package:flutter/material.dart';


class Top extends StatefulWidget {
  const Top({Key? key}) : super(key: key);

  @override
  State<Top> createState() => _TopState();
}

class _TopState extends State<Top> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: SafeArea(child: fetchData("Top")));
  }
}
