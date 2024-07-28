import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsreaderapp/Model/articlesModel.dart';
import 'package:newsreaderapp/controller/newsController.dart';
import 'package:newsreaderapp/controller/themeController.dart';
import 'package:newsreaderapp/screens/newsdetailspage.dart';

import '../utils/colors.dart';
import 'bottomsheet.dart';
import 'components.dart';
import 'customtext.dart';

class NewsContainer extends StatefulWidget {
  final article;
  final String imageurl, title, time, description, url;
  const NewsContainer(
      {Key? key,
      required this.article,
      required this.imageurl,
      required this.title,
      required this.time,
      required this.description,
      required this.url})
      : super(key: key);

  @override
  State<NewsContainer> createState() => _NewsContainerState();
}

class _NewsContainerState extends State<NewsContainer> {
  NewsController newsController = Get.put(NewsController());
  ThemeController themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Obx(
      () => Column(
        children: [
          InkWell(
            onTap: () {
              Get.to(NewsDetailsPage(widget.article));
            },
            child: Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(left: 5, right: 5, top: 5),
              decoration: BoxDecoration(
                  color: themeController.isDark.value
                      ? AppColors.black
                      : AppColors.lightwhite,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                  BoxShadow(
                  offset: Offset(0, 0),
              blurRadius: 1,
              spreadRadius: 1,
              color: Colors.black26,
            ),
        ]
              ),
              width: w,
              child: Row(
                children: [
                  CachedNetworkImage(
                    imageUrl: widget.imageurl,
                    imageBuilder: (context, imageProvider) => Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: imageProvider, fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.yellow),
                    ),
                    placeholder: (context, url) =>
                        CircularProgressIndicator(color: AppColors.primary),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                            color:themeController.isDark.value
                                ? AppColors.white
                                : AppColors.black,
                            size: 16,
                            text: widget.title),
                        SizedBox(height: 5),
                        CustomText(
                            color:themeController.isDark.value
                                ? AppColors.white
                                : AppColors.black,
                            size: 12,
                            text: widget.time),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 3),
          DividerWidget(),
          SizedBox(height: 3),
        ],
      ),
    );
  }
}
