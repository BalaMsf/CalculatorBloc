part of 'calc_bloc.dart';

@immutable
abstract class CalcEvent {}

// ignore: must_be_immutable
class CalcUserInputEvent extends CalcEvent {
  late String userInput;

  CalcUserInputEvent(this.userInput);
}

// ignore: must_be_immutable
class CalculateResultEvent extends CalcEvent {
  String resultValue;

  CalculateResultEvent(this.resultValue);
}

class CalcClearEvent extends CalcEvent {
  String v1;
  String v2;

  CalcClearEvent(this.v1, this.v2);
}
