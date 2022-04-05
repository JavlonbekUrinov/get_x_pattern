import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_pattern/controller/add_controller.dart';
import 'package:get_x_pattern/pages/home_page.dart';
class AddPostPage extends StatefulWidget {
  const AddPostPage({Key? key}) : super(key: key);
  static const String id = '/add_post_page';

  @override
  State<AddPostPage> createState() => _AddPostPageState();
}

class _AddPostPageState extends State<AddPostPage> {

  final controller = Get.put(AddController());



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Colors.white,
        foregroundColor: Colors.black,
        elevation: 2,
        title: const Text('Add Post'),
        centerTitle: true,
      ),
      body: Obx(
          () => Stack(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        controller: controller.titleController.value,
                        decoration: const InputDecoration(
                          hintText: 'Title',
                          hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20,),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        controller: controller.bodyController.value,
                        decoration: const InputDecoration(
                          hintText: 'Body',
                          hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
                        ),
                      ),
                    ),

                    const SizedBox(height: 30,),

                    MaterialButton(
                      color: Colors.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                      minWidth: MediaQuery.of(context).size.width - 100,
                      height: 45,
                      onPressed: (){
                        controller.createPost();
                       Get.back();
                      },
                      child: const Text('Save', style: TextStyle(color: Colors.white, fontSize: 17),),
                    ),

                  ],
                ),
              ),
              controller.isLoading() ? SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: const Center(child: CircularProgressIndicator(),),
              ) : const SizedBox.shrink(),
            ],
          ),
      ),
    );
  }
}