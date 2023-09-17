import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:popular1/Data/request/popularListRequest.dart';

import '../../Domain/model/PopularList.dart';

part 'popular_state.dart';

class PopularCubit extends Cubit<PopularState> {
  static PopularCubit get(context)=>BlocProvider.of(context);
  PopularCubit() : super(PopularInitial());
  List<Result>popularList=[];
  getPopular(){
    emit(PopularLoading());
    PopularRequest.getPopular(onSuccess: (res){
      popularList=res!;
      emit(PopularDone());
    },
        onError: (statusCode){
      emit(PopularError());
        }
    );



  }

}
