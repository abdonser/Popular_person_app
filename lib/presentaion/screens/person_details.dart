import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popular1/Data/cubit/popular_info_cubit.dart';
import 'package:popular1/app/app_colors.dart';
import 'package:popular1/app/app_constant.dart';
import 'package:popular1/app/app_words.dart';

import '../../Data/cubit/popular_cubit.dart';
import 'image_review.dart';

class PersonDetail extends StatefulWidget {
  int id;
  String name;
   PersonDetail({super.key,required this.id,required this.name});

  @override
  State<PersonDetail> createState() => _PersonDetailState();
}

class _PersonDetailState extends State<PersonDetail> {
  @override
  void initState() {
    PopularInfoCubit.get(context).getPopularInfo(id: widget.id);
    PopularInfoCubit.get(context).getPopularImage(id: widget.id);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(
          AppWords.detailsAbout,
          style: const TextStyle(color: AppColors.WColor),
        ),
        centerTitle: true,
        backgroundColor: AppColors.mainColor,
        iconTheme: const IconThemeData(color: AppColors.WColor),
      ),
      body: BlocConsumer<PopularInfoCubit, PopularInfoState>(
        listener: (context, state) {
         state is PopularInfoError? debugPrint("an errorr"):null;
          // TODO: implement listener
        },
        builder: (context, state) {
          return state is PopularInfoLoading||state is PopularImagesLoading
              ? const Center(
                  child: CircularProgressIndicator(
                  color: AppColors.mainColor,
                ))
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height / 2 - 40,
                          decoration: const BoxDecoration(
                              color: AppColors.mainColor,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(15),
                                  bottomRight: Radius.circular(15))),
                          child:  Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("${PopularInfoCubit.get(context).popularInfoModel.placeOfBirth}"
                           ,
                                style: const TextStyle(
                                    fontSize: 18, color: AppColors.WColor),
                              ),
                               Text(
                                "${PopularInfoCubit.get(context).popularInfoModel.birthday}",
                                style: const TextStyle(
                                    fontSize: 18, color: AppColors.WColor),
                              ),
                              Text(
                                "${PopularInfoCubit.get(context).popularInfoModel.knownForDepartment}",
                                style: const TextStyle(
                                    fontSize: 18, color: AppColors.WColor),
                              ),
                              Text(
                                "${PopularInfoCubit.get(context).popularInfoModel.alsoKnownAs?.first}",
                                style: const TextStyle(
                                    fontSize: 18, color: AppColors.WColor),
                              ),
                              Text(
                                "${PopularInfoCubit.get(context).popularInfoModel.popularity}",
                                style: const TextStyle(
                                    fontSize: 18, color: AppColors.WColor),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 2 - 40,
                          child: ListView.separated(
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, i) {
                                return InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (builder) =>
                                                   ImageReview(path: PopularInfoCubit.get(context).popularImages.profiles![i].filePath!,)));
                                    },
                                    child: Image.network(AppConstant.imageBseUrl+PopularInfoCubit.get(context).popularImages.profiles![i].filePath!
                                ),
                                );
                              },
                              separatorBuilder: (context, i) {
                                return const SizedBox(
                                  height: 15,
                                );
                              },
                              itemCount: PopularInfoCubit.get(context).popularImages.profiles!.length),
                        )
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }
}
//popular list// 'https://api.themoviedb.org/3/person/popular?api_key=2dfe23358236069710a379edd4c65a6b'
// images// 'https://api.themoviedb.org/3/person/$id/images?api_key=2dfe23358236069710a379edd4c65a6b'
// details info// 'https://api.themoviedb.org/3/person/$id?api_key=2dfe23358236069710a379edd4c65a6b'
