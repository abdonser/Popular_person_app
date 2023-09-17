import 'package:flutter/material.dart';

import '../../app/app_colors.dart';
import '../../app/app_words.dart';

class ImageReview extends StatelessWidget {
  const ImageReview({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(

        centerTitle: true,
        backgroundColor: AppColors.mainColor,
        iconTheme: const IconThemeData(color: AppColors.WColor),
        actions: [IconButton(onPressed: (){}, icon: const Icon(Icons.download))],
      ),

    );
  }
}
