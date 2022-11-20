import 'package:dark_wallpapers/const/app_colors.dart';
import 'package:dark_wallpapers/ui/views/tabbar_pages/mixed.dart';
import 'package:dark_wallpapers/ui/views/tabbar_pages/recent.dart';
import 'package:dark_wallpapers/ui/views/tabbar_pages/top.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TabBarScreen extends StatelessWidget {
  const TabBarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.blackColor,
          title: Text(
            "Darkify 4k wallpapers",
            style: TextStyle(
                fontSize: 22.sp,
               // color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          bottom: TabBar(
           // indicatorColor: Colors.white,
            indicatorWeight: 4.0.w,
            isScrollable: true,
            labelStyle: TextStyle(fontSize: 18.sp),
            indicatorPadding:const EdgeInsets.only(bottom: 8),
            tabs: const [
              Tab(
                text: "Recent",
              ),
              Tab(
                text: "Top",
              ),
              Tab(
                text: "Mixed",
              ),
            ],
          ),
        ),
        body:const TabBarView(
          children: [
            Recent(),
            Top(),
            Mixed(),
          ],
        ),
      ),
    );
  }
}
