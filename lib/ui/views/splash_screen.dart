// ignore_for_file: prefer_const_constructors

import 'package:dark_wallpapers/route/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  initState() {
    Future.delayed(const Duration(seconds: 3), ()=>Get.toNamed(tabBar));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:  Center(child: Text("Darkify\n4k wallpapers",textAlign: TextAlign.center,style:GoogleFonts.rockSalt(fontSize:30.sp,fontWeight:FontWeight.bold),)),
        //body:Column(
          //mainAxisAlignment:MainAxisAlignment.center,
          //children:[
            // Center(
            //   child: CircleAvatar(
            //     radius: 100.r,
            //     backgroundImage:AssetImage("assets/images/Afran_sir.jpg"),
            //   ),
            // ),
            // SizedBox(height:20.h,),
           // Text("Darkify\n4k wallpapers",style:TextStyle(fontSize:20.sp,fontWeight:FontWeight.normal),),
         // ],
       // ),
      ),
    );
  }
}
