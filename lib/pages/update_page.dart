import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_pattern/controller/update_controller.dart';
import 'package:get_x_pattern/models/model.dart';
class UpdatePostPage extends StatefulWidget {
  UpdatePostPage({Key? key, this.post}) : super(key: key);
  static const String id = '/update_post_page';
  Post? post;

  @override
  State<UpdatePostPage> createState() => _UpdatePostPageState();
}

class _UpdatePostPageState extends State<UpdatePostPage> {

  final controller = Get.put(UpdateController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.post != null) {
      controller.titleController = TextEditingController(text: widget.post!.title!).obs;
      controller.bodyController = TextEditingController(text: widget.post!.body!).obs;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
        () => Scaffold(
          body: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: widget.post != null ? Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    ////////////////////////title
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

                   ////////////////////////content
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        controller: controller.bodyController.value,
                        decoration: const InputDecoration(
                          hintText: 'Content',
                          hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
                        ),
                      ),
                    ),

                    const SizedBox(height: 30,),

                    ////////////////////////update button
                    MaterialButton(
                      color: Colors.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                      ),
                      minWidth: MediaQuery.of(context).size.width - 100,
                      height: 45,
                      onPressed: (){
                        controller.updatePost();
                        Get.back();
                      },
                      child: const Text('Update Post', style: TextStyle(color: Colors.white, fontSize: 17),),
                    ),

                  ],
                ),
                controller.isLoading() ? const Center(child: CircularProgressIndicator(),) : const SizedBox.shrink(),
              ],
            ) : const Center(child: CircularProgressIndicator(),),
          ),
        ),
    );
  }
}