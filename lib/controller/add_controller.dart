import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_pattern/models/model.dart';
import 'package:get_x_pattern/services/service.dart';

class AddController extends GetxController{


  var isLoading = false.obs;

  var titleController = TextEditingController().obs;
  var bodyController = TextEditingController().obs;

  void createPost() async{

      isLoading(true);
    String title = titleController.value.text.trim().toString();
    String body = bodyController.value.text.trim().toString();
    Post post = Post(title: title, body: body);
    if(title.isNotEmpty && body.isNotEmpty) {
      await Network.POST(Network.API_CREATE, Network.paramsCreate(post)).then((value) {
        getResponse();
      });
    } else {
        isLoading(false);
    }
  }

  void getResponse() {
      isLoading(false);
  }


}