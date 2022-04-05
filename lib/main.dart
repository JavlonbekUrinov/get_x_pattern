import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_x_pattern/pages/add_page.dart';
import 'package:get_x_pattern/pages/home_page.dart';
import 'package:get_x_pattern/pages/update_page.dart';


void main(){

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,

      ),
      home: HomePage(),
      routes: {
        HomePage.id: (context) => const HomePage(),
        AddPostPage.id: (context) => const AddPostPage(),
        UpdatePostPage.id: (context) =>  UpdatePostPage(),
      },
    );
  }
}
