import 'package:flutter/material.dart';
import 'package:popular1/app/app_constant.dart';

import '../../app/app_colors.dart';
import '../../app/app_words.dart';

class ImageReview extends StatelessWidget {
  String path;
   ImageReview({super.key,required this.path});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(

        centerTitle: true,
        backgroundColor: AppColors.mainColor,
        iconTheme: const IconThemeData(color: AppColors.WColor),
        actions: [IconButton(onPressed: (){}, icon: const Icon(Icons.download))],
      ),
      body:ListView(
        children: [
      Image.network(AppConstant.imageBseUrl+path)
        ],
      )
    );
  }
}
