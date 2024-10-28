part of 'tasabih_cubit.dart';

sealed class TasabihState extends Equatable {
  const TasabihState();

  @override
  List<Object> get props => [];
}

final class TasabihInitial extends TasabihState {}

final class ChangeValue extends TasabihState {
  final int value;

  ChangeValue({required this.value});
}

final class Increase extends TasabihState {}

final class Decrement extends TasabihState {}

final class Reset extends TasabihState {
  final int index;
  final int count;
  final int round;
  final bool isClick;

  Reset(
      {required this.index,
      required this.count,
      required this.round,
      required this.isClick});
}

final class IncreaseCount extends TasabihState {}

final class IncreaseRound extends TasabihState {}
