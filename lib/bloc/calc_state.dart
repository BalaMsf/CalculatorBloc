// ignore_for_file: must_be_immutable

part of 'calc_bloc.dart';

@immutable
abstract class CalcState {}

class CalcInitial extends CalcState {}

class CalculateUserInputState extends CalcState {
  String userInput;

  CalculateUserInputState(this.userInput);
}

class CalculateResultState extends CalcState {
  String finalResult;

  CalculateResultState(this.finalResult);
}

class CalculateClearState extends CalcState {
  String v1;
  String v2;

  CalculateClearState(this.v1, this.v2);
}
