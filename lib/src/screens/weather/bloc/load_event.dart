part of 'load_bloc.dart';

@immutable
abstract class LoadEvent {}

class LoadPressed extends LoadEvent{
  final String? city;

  LoadPressed({
    required this.city,
  });
}
