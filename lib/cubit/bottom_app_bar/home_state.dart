import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  final int tab;
  const HomeState({this.tab = 1});

  @override
  List<Object?> get props => [tab];
}
