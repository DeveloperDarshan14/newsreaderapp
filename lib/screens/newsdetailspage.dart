import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsreaderapp/Model/articlesModel.dart';
import 'package:newsreaderapp/controller/themeController.dart';
import 'package:get/get.dart';
import 'package:newsreaderapp/constants/colors.dart';

class NewsDetailsPage extends StatefulWidget {
  final Article data;
  NewsDetailsPage(this.data);

  @override
  State<NewsDetailsPage> createState() => _NewsDetailsPageState();
}

class _NewsDetailsPageState extends State<NewsDetailsPage> {
  ThemeController themeController = Get.put(ThemeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
            color: themeController.isDark.value
                ? AppColors.white
                : AppColors.black),
        title: Text(
          'News Details'.tr,
          style: TextStyle(
            fontSize: 20,
            color: themeController.isDark.value
                ? AppColors.white
                : AppColors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: themeController.isDark.value
                        ? AppColors.black
                        : AppColors.white,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 0),
                        blurRadius: 1,
                        spreadRadius: 1,
                        color: Colors.black26,
                      ),
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: CachedNetworkImage(
                        width: MediaQuery.of(context).size.width,
                        height: 350,
                        fit: BoxFit.fill,
                        imageUrl: widget.data.urlToImage,
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) => Container(
                          width: MediaQuery.of(context).size.width,
                          height: 160,
                          color: Colors.grey.shade300,
                        ),
                        errorWidget: (context, url, error) => Container(
                          width: MediaQuery.of(context).size.width,
                          height: 170,
                          child: Image.asset("assets/images/noimagefound.png",
                              fit: BoxFit.fill),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        widget.data.title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: themeController.isDark.value
                                ? AppColors.white
                                : AppColors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        widget.data.description,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: themeController.isDark.value
                              ? AppColors.white
                              : AppColors.black,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
