
import 'package:get/get.dart';
import 'package:get_x_pattern/models/model.dart';
import 'package:get_x_pattern/services/service.dart';

class HomeController extends GetxController{

  var isLoading = false.obs;
  var items = [].obs;

  void apiPostList() async {

      isLoading(true);

    var response = await Network.GET(Network.API_LIST, Network.paramsEmpty());

      if (response != null) {
        items.value = Network.parsePostList(response);
      } else {
        items.value = [];
      }
      isLoading(false);

  }

  Future apiPostDelete(Post post) async {
    isLoading(true);


    var response = await Network.GET(
        Network.API_DELETE + post.id.toString(), Network.paramsEmpty());

      isLoading(false);
    return response != null;
  }
}