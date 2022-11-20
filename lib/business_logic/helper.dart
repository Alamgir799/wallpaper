import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dark_wallpapers/route/route.dart';
import 'package:dark_wallpapers/ui/views/full_screen_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget fetchData(String collectionName) {
  return StreamBuilder(
    stream: FirebaseFirestore.instance.collection(collectionName).snapshots(),
    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      if (snapshot.hasError) {
        return const Center(
          child: Text("Something is wrong"),
        );
      } else if (!snapshot.hasData) {
        return const Center(child: CircularProgressIndicator());
      }

      return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 0.7),
          itemCount: snapshot.data == null ? 0 : snapshot.data!.docs.length,
          itemBuilder: (_, index) {
            DocumentSnapshot documentSnapshot = snapshot.data!.docs[index];

            return InkWell(
              onTap: () {
                Get.toNamed(fullScreenImage,
                    arguments: FullScreenImage(documentSnapshot['url'],collectionName));
              },
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(15)),
                    child: Hero(
                        tag: documentSnapshot['url'],
                        child: Image.network(documentSnapshot['url']))),
              ),
            );
          });
    },
  );
}
