import 'package:bloc/bloc.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:meta/meta.dart';

part 'calc_event.dart';
part 'calc_state.dart';

class CalcBloc extends Bloc<CalcEvent, CalcState> {
  CalcBloc() : super(CalcInitial()) {
    on<CalcEvent>((event, emit) {
      // TODO: implement event handler
      if (event is CalcUserInputEvent) {
        emit(CalculateUserInputState(event.userInput));
      }
      if (event is DeleteEvent) {
        String input = '===>InputValue' + event.inputVal;
        print(input);
        if (event.inputVal.isNotEmpty) {
          String inputCalc =
              event.inputVal.substring(0, event.inputVal.length - 1);
          String input = '===>deletedinput' + inputCalc;
          print(input);
          emit(CalculateUserInputState(inputCalc));
        } else {
          emit(CalculateUserInputState(''));
        }
      }

      if (event is CalculateResultEvent) {
        String userinput = event.resultValue.replaceAll('x', '*');
        Expression expression = Parser().parse(userinput);
        double evaluate =
            expression.evaluate(EvaluationType.REAL, ContextModel());
        emit(CalculateResultState(
          evaluate.toString(),
        ));
      }
      if (event is CalcClearEvent) {
        emit(CalculateClearState(event.v1, event.v2));
      }
    });
  }
}
