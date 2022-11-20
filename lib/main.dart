import 'package:dark_wallpapers/route/route.dart';
import 'package:dark_wallpapers/ui/views/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize:const Size(375,812),
      builder: (context , child){
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme:ThemeData(
          ),
          darkTheme:ThemeData.dark(),
          initialRoute: splash,
          getPages:getpages,
          home: const SplashScreen(),
        );
      }
    );
  }
}
