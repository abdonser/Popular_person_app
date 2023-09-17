

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:popular1/Data/request/popularListRequest.dart';
import 'package:popular1/Domain/model/Popular%20info%20model.dart';
import 'package:popular1/Domain/model/PopularImages.dart';

part 'popular_info_state.dart';

class PopularInfoCubit extends Cubit<PopularInfoState> {
  PopularInfoCubit() : super(PopularInfoInitial());
  static PopularInfoCubit get(context)=>BlocProvider.of(context);
  PopularInfoModel popularInfoModel=PopularInfoModel();
  PopularImages popularImages=PopularImages();
  getPopularInfo({required int id}){
    PopularRequest.getPopularInfo(id: id, onSuccess: (res){
      emit(PopularInfoLoading());
      popularInfoModel=res!;
      emit(PopularInfoDone());




    }, onError: (statusCode){
      emit(PopularInfoError());
    });




  }
  getPopularImage({required int id}){
    PopularRequest.getPopularImage(id: id, onSuccess: (res){
      emit(PopularImagesLoading());
      popularImages=res!;
      emit(PopularImagesDone());




    }, onError: (statusCode){
      emit(PopularImagesError());
    });




  }
}
