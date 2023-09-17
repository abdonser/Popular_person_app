import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popular1/app/app_colors.dart';
import 'package:popular1/app/app_words.dart';

import '../../Data/cubit/popular_cubit.dart';
import 'image_review.dart';

class PersonDetail extends StatefulWidget {
  const PersonDetail({super.key});

  @override
  State<PersonDetail> createState() => _PersonDetailState();
}

class _PersonDetailState extends State<PersonDetail> {
  @override

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          AppWords.detailsAbout,
          style: TextStyle(color: AppColors.WColor),
        ),
        centerTitle: true,
        backgroundColor: AppColors.mainColor,
        iconTheme: const IconThemeData(color: AppColors.WColor),
      ),
      body: BlocConsumer<PopularCubit, PopularState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return state is PopularLoading
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
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                               "",
                                style: TextStyle(
                                    fontSize: 18, color: AppColors.WColor),
                              ),
                              Text(
                                "data",
                                style: TextStyle(
                                    fontSize: 18, color: AppColors.WColor),
                              ),
                              Text(
                                "data",
                                style: TextStyle(
                                    fontSize: 18, color: AppColors.WColor),
                              ),
                              Text(
                                "data",
                                style: TextStyle(
                                    fontSize: 18, color: AppColors.WColor),
                              ),
                              Text(
                                "data",
                                style: TextStyle(
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
                                                  const ImageReview()));
                                    },
                                    child: Image.network(""
                                ),
                                );
                              },
                              separatorBuilder: (context, i) {
                                return const SizedBox(
                                  height: 15,
                                );
                              },
                              itemCount: 20),
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
