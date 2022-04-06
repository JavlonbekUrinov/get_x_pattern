import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_pattern/models/model.dart';
import 'package:get_x_pattern/services/service.dart';

class UpdateController extends GetxController{


  var titleController = TextEditingController().obs;
  var bodyController = TextEditingController().obs;
  var isLoading = false.obs;

  void updatePost() async{
      isLoading(true);

    String title = titleController.value.text.trim().toString();
    String body = bodyController.value.text.trim().toString();
    Post post = Post(title: title, body: body);
    if(title.isNotEmpty && body.isNotEmpty) {
      await Network.PUT(Network.API_UPDATE, Network.paramsUpdate(post)).then((value){
        getResponse();
      });
    }
  }

  void getResponse() {
      isLoading(false);
  }

}