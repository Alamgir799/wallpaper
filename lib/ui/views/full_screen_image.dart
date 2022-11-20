import 'package:dark_wallpapers/const/app_colors.dart';
import 'package:dio/dio.dart';
import 'package:downloads_path_provider_28/downloads_path_provider_28.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share_plus/share_plus.dart';
import 'package:simple_speed_dial/simple_speed_dial.dart';

class FullScreenImage extends StatelessWidget {
  FullScreenImage(this.image,this.categoryName);
  var image;
  String categoryName;

  //setWallpaperHomeScreen
  setWallpaperHomeScreen() async {
    String url = image;
    int location = WallpaperManager.HOME_SCREEN;
    var file = await DefaultCacheManager().getSingleFile(url);
    final result =
        await WallpaperManager.setWallpaperFromFile(file.path, location);
  }

//setWallpaperLockScreen
  setWallpaperLockScreen() async {
    String url = image;
    int location = WallpaperManager.LOCK_SCREEN;
    var file = await DefaultCacheManager().getSingleFile(url);
    final result =
        await WallpaperManager.setWallpaperFromFile(file.path, location);
  }

//downloadWallpaper
  downloadWallpaper() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
    ].request();

    if (statuses[Permission.storage]!.isGranted) {
      var dir = await DownloadsPathProvider.downloadsDirectory;
      if (dir != null) {
        var filename = DateTime.now();
        String savename = "${filename}.jpg";
        String savePath = dir.path + "/$savename";

        try {
          await Dio().download(image, savePath,
              onReceiveProgress: (received, total) {
            if (total != -1) {}
          });
          Fluttertoast.showToast(msg: "Ringtone Successfully Downloaded");
        } on DioError catch (e) {
          print(e.message);
        }
      }
    } else {
      print("No permission to read and write.");
    }
  }

//toastMessage
  toastMessage(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: AppColors.redColor,
        textColor: AppColors.whiteColor,
        fontSize: 16.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blackColor,
        title: Text(categoryName),
        centerTitle: true,
        leading: Container(
            color: AppColors.whiteColor,
            child: Center(
                child: IconButton(
                    onPressed: () => Get.back(),
                    icon:const Icon(
                      Icons.arrow_back_ios,
                      color: AppColors.blackColor,
                    )))),
      ),
      body: Hero(tag: image, child: Image.network(image)),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SpeedDial(
          speedDialChildren: [
            //Set Homescreen
            SpeedDialChild(
              child: const Icon(Icons.wallpaper),
              foregroundColor: AppColors.whiteColor,
              backgroundColor: AppColors.redColor,
              label: 'Set Homescreen',
              onPressed: () {
                setWallpaperHomeScreen();
                toastMessage("Set Successfully");
              },
            ),
            //Set Lockscreen
            SpeedDialChild(
              child: const Icon(Icons.lock),
              foregroundColor: AppColors.whiteColor,
              backgroundColor: AppColors.redColor,
              label: 'Set Lockscreen',
              onPressed: () {
                setWallpaperLockScreen();
                toastMessage("Set Successfully");
              },
            ),
            //Download
            SpeedDialChild(
                child: const Icon(Icons.cloud_download),
                foregroundColor: AppColors.whiteColor,
                backgroundColor: AppColors.redColor,
                label: 'Download',
                onPressed: () {
                  downloadWallpaper();
                  toastMessage("Download Successfully");
                }),
            //Share
            SpeedDialChild(
                child: const Icon(Icons.share),
                foregroundColor: AppColors.whiteColor,
                backgroundColor: AppColors.redColor,
                label: 'Share',
                onPressed: () {
                  Share.share(image, subject: 'Great picture');
                }),
          ],
          closedForegroundColor: AppColors.whiteColor,
          openForegroundColor: AppColors.whiteColor,
          closedBackgroundColor: AppColors.redColor,
          openBackgroundColor: AppColors.redColor,
          labelsBackgroundColor: AppColors.orangeColor,
          child: const Icon(
            Icons.add,
            color: AppColors.whiteColor,
          ),
        ),
      ),
    );
  }
}
