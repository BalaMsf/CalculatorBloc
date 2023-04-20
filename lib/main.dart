import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task5_calc/bloc/calc_bloc.dart';

import 'button.dart';

void main() {
  runApp(const CalcApp());
}

class CalcApp extends StatelessWidget {
  const CalcApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CalcBloc(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    ); // MaterialApp
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var inputValue = '';
  var answer = '';

// Array of button
  final List<String> buttons = [
    'C',
    '.',
    '%',
    'DEL',
    '7',
    '8',
    '9',
    '/',
    '4',
    '5',
    '6',
    'x',
    '1',
    '2',
    '3',
    '-',
    '00',
    '0',
    '=',
    '+',
  ];

  @override
  Widget build(BuildContext context) {
    final CalcBloc calcBloc = BlocProvider.of<CalcBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculator"),
      ), //AppBar
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Expanded(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(20),
                    alignment: Alignment.centerRight,
                    child: BlocBuilder(
                        bloc: calcBloc,
                        builder: (context, state) {
                          inputValue = (state is CalculateUserInputState)
                              ? state.userInput
                              : inputValue;
                          return Text(
                            inputValue,
                            style: const TextStyle(
                                fontSize: 24,
                                color: Colors.black,
                                fontWeight: FontWeight.normal),
                          );
                        }),
                  ),
                  Container(
                    padding: const EdgeInsets.all(15),
                    alignment: Alignment.centerRight,
                    child: BlocBuilder(
                        bloc: calcBloc,
                        builder: (context, state) {
                          if (state is CalculateResultState) {
                            answer = state.finalResult;
                          }
                          return Text(
                            answer,
                            style: const TextStyle(
                                fontSize: 44,
                                color: Colors.black,
                                fontWeight: FontWeight.normal),
                          );
                        }),
                  )
                ]),
          ),
          Expanded(
            flex: 3,
            child: GridView.builder(
                itemCount: buttons.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemBuilder: (BuildContext context, int index) {
                  // Clear Button
                  if (index == 0) {
                    return MyCalcBtn(
                      btnClick: () {
                        calcBloc
                            .add(CalcClearEvent(inputValue = '', answer = '0'));
                      },
                      buttonText: buttons[index],
                    );
                  } else if (index == 2) {
                    return MyCalcBtn(
                      btnClick: () {
                        calcBloc.add(
                            CalcUserInputEvent(inputValue += buttons[index]));
                      },
                      buttonText: buttons[index],
                    );
                  }
                  // Delete Button
                  else if (index == 3) {
                    return MyCalcBtn(
                      btnClick: () {
                        calcBloc.add(DeleteEvent(inputValue));
                      },
                      buttonText: buttons[index],
                    );
                  } else if (index == 18) {
                    return MyCalcBtn(
                      btnClick: () {
                        calcBloc.add(CalculateResultEvent(inputValue));
                      },
                      buttonText: buttons[index],
                    );
                  }

                  // other buttons
                  else {
                    return MyCalcBtn(
                      btnClick: () {
                        calcBloc.add(
                            CalcUserInputEvent(inputValue += buttons[index]));
                      },
                      buttonText: buttons[index],
                    );
                  }
                }),
          ),
        ],
      ),
    );
  }
}
