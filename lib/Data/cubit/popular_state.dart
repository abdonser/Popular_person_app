part of 'popular_cubit.dart';

@immutable
abstract class PopularState {}

class PopularInitial extends PopularState {}
class PopularLoading extends PopularState {}
class PopularError extends PopularState {}
class PopularDone extends PopularState {}
