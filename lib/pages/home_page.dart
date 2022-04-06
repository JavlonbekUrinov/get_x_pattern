import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get_x_pattern/controller/home_page_controller.dart';
import 'package:get_x_pattern/models/model.dart';
import 'package:get_x_pattern/pages/add_page.dart';
import 'package:get_x_pattern/pages/update_page.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const String id = "/home_page";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final controller = Get.put(HomeController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.apiPostList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Pattern - GetX"),
      ),
      body: Obx(
          () => Stack(
            children: [
              ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: controller.items.length,
                itemBuilder: (ctx, index) {
                  return itemOfPost(controller.items[index]);
                },
              ),
              controller.isLoading()
                  ? Center(
                child: CircularProgressIndicator(),
              )
                  : SizedBox.shrink(),
            ],
          ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        onPressed: () {
          Navigator.pushNamed(context, AddPostPage.id).then(
                (value) {
              if (value == 'done') {
                controller.apiPostList();
              }
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget itemOfPost(Post post) {
    return Slidable(
      child: Container(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              post.title!.toUpperCase(),
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(post.body!),
            const SizedBox(
              height: 5,
            ),
            Divider(height: 3,color: Colors.black),
          ],
        ),
      ),

      //////////////////////////////////////slidable start point
      startActionPane: ActionPane(
        extentRatio: 0.3,
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            label: 'Update',
            backgroundColor: Colors.indigo,
            icon: Icons.edit,
            onPressed: (_) {
             Get.to(UpdatePostPage(post: post,));
            },
          ),
        ],
      ),

      //////////////////////////////////////slidable end point
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        extentRatio: 0.3,
        children: [
          SlidableAction(
            label: 'Delete',
            backgroundColor: Colors.red,
            icon: Icons.delete,
            onPressed: (_) {
              controller.apiPostDelete(post);
            },
          ),
        ],
      ),
    );
  }
}












/////////////////////////////////////////////////////////