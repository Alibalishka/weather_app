// ignore_for_file: non_constant_identifier_names

part of 'load_bloc.dart';

@immutable
abstract class LoadState {}

class LoadInitial extends LoadState {}

class LoadLoaded extends LoadState{
  final double? temp_c;
  final String? status;
  final String? image;

  LoadLoaded({
    required this.temp_c,
    required this.status,
    required this.image,
  });
}

class LoadLoading extends LoadState{}

class LoadFailed extends LoadState{
  final String? message;

  LoadFailed({
    required this.message,
  });
}