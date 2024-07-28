import 'package:flutter/material.dart';
import 'package:newsreaderapp/controller/languageController.dart';
import 'package:newsreaderapp/controller/themeController.dart';
import 'package:newsreaderapp/utils/networkconnection.dart';
import 'package:newsreaderapp/widgets/appbar.dart';
import 'package:overlay_loader_with_app_icon/overlay_loader_with_app_icon.dart';
import '../constants/constants.dart';
import '../controller/newsController.dart';
import '../constants/colors.dart';
import 'package:get/get.dart';
import '../widgets/newscontainer.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  NewsController newscontroller = Get.put(NewsController());
  ThemeController themeController = Get.put(ThemeController());
  LanguageController languageController = Get.put(LanguageController());
  ConnectionManagerController connectionManagerController =
      Get.put(ConnectionManagerController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    newscontroller.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => OverlayLoaderWithAppIcon(
        isLoading: newscontroller.isLoading.value,
        overlayBackgroundColor: Colors.black,
        circularProgressColor: Color(0xff323261),
        appIcon: Padding(
          padding: EdgeInsets.all(8.0),
          child: Image.asset('assets/images/newslogo.jpg'),
        ),
        child: RefreshIndicator(
          onRefresh: () async {
            await newscontroller.getData();
          },
          child: Scaffold(
            backgroundColor: themeController.isDark.value
                ? AppColors.black
                : AppColors.white,
            appBar: TopAppBar(),
            body: Column(
              children: [
                Expanded(
                  child: Obx(
                    () {
                      if (connectionManagerController.connectionType.value ==
                          0) {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/images/no_data_found.gif",
                                height: 200,
                                width: 200,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 8.0, right: 8.0),
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Internet connection not found.".tr,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: themeController.isDark.value
                                          ? AppColors.white
                                          : AppColors.black,
                                      fontSize: 18,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      } else {
                        return newscontroller.articlesList.length == 0 &&
                                !newscontroller.isLoading.value
                            ? Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      "assets/images/no_data_found.gif",
                                      height: 200,
                                      width: 200,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0, right: 8.0),
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "No data found".tr,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: themeController.isDark.value
                                                ? AppColors.white
                                                : AppColors.black,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : ListView.builder(
                                shrinkWrap: true,
                                itemCount: newscontroller.articlesList.length,
                                physics: BouncingScrollPhysics(),
                                itemBuilder: (BuildContext context, index) {
                                  final article =
                                      newscontroller.articlesList[index];
                                  final imageUrl =
                                      (article.urlToImage != null &&
                                              article.urlToImage.isNotEmpty)
                                          ? article.urlToImage
                                          : Constants.imageurl;
                                  return NewsContainer(
                                    url: article.url,
                                    imageurl: imageUrl,
                                    title: article.title,
                                    time: article.publishedAt.toString(),
                                    description: article.description.toString(),
                                    article: article,
                                  );
                                },
                              );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
