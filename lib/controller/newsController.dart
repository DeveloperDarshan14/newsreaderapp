import 'dart:convert';

import 'package:get/get.dart';
import 'package:newsreaderapp/constants/colors.dart';
import '../Model/articlesModel.dart';
import 'package:http/http.dart' as http;

import '../utils/apiendpoints.dart';

class NewsController extends GetxController {
  var isLoading = true.obs;
  var articlesList = <Article>[].obs;

  @override
  void onInit() {
    super.onInit();
    // getData();
  }

  getData() async {
    try {
      isLoading(true);
      var datas = await getNewsData();
      if (datas != null) {
        articlesList.value = datas.articles;
      }
    } finally {
      isLoading(false);
    }
  }
}

Future<ArticlesModel> getNewsData() async {
  final response = await http.get(
    Uri.parse(ApiEndPoints.baseUrl),
  );

  if (response.statusCode == 200) {
    final jsonData = json.decode(response.body);
    print("responsedata" + jsonData.toString());
    return ArticlesModel.fromJson(jsonDecode(response.body));
  } else {
    Get.snackbar("Exception", response.reasonPhrase.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.white,
        colorText: AppColors.darkgrey);
    throw Exception('Failed to load data${response.statusCode}');
  }
}
