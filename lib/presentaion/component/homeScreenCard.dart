import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../app/app_colors.dart';
import '../screens/person_details.dart';

class  HomeScreenCard extends StatelessWidget {
  String text;
  String name;
  int id;

    HomeScreenCard({super.key,required this.text,required this.id,required this.name});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (builder)=> PersonDetail(id: id, name: name,)));
      },
      child: Container(
        width: double.infinity,
        height: 150,
        decoration: BoxDecoration(color: AppColors.mainColor,
          borderRadius: BorderRadius.circular(15),),
        child:  Center(child: Text(text,style: const TextStyle(color: AppColors.WColor,fontSize: 15),)),
      ),
    );

  }
}
