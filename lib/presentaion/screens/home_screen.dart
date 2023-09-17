import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:popular1/Data/cubit/popular_cubit.dart';
import 'package:popular1/app/app_colors.dart';
import 'package:popular1/app/app_words.dart';

import '../component/homeScreenCard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    PopularCubit.get(context).getPopular();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          AppWords.popularList,
          style: TextStyle(color: AppColors.WColor),
        ),
        backgroundColor: AppColors.mainColor,
        centerTitle: true,
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
                  padding: const EdgeInsets.all(10.0),
                  child: ListView.separated(
                      itemBuilder: (context, i) {
                        return HomeScreenCard(
                          text:PopularCubit.get(context).popularList[i].name, id: PopularCubit.get(context).popularList[i].id, name: PopularCubit.get(context).popularList[i].name,                        );
                      },
                      separatorBuilder: (context, i) {
                        return const SizedBox(
                          height: 15,
                        );
                      },
                      itemCount: PopularCubit.get(context).popularList.length),
                );
        },
      ),
    );
  }
}
