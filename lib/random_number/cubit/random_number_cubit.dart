import 'dart:math';

import 'package:bloc/bloc.dart';

class RandomNumberCubit extends Cubit<String> {
  late Random random;
  final int initialNumber;
  final int maxRandomValue;
  List<int> _numbers = [];

  RandomNumberCubit( {required this.initialNumber,required this.maxRandomValue})
      : super(initialNumber.toString()) {
    _numbers.add(initialNumber);
    random = Random();
  }

  void increment() {
    _numbers.add(random.nextInt(maxRandomValue));
    emit(_getStrSumOfNumbers());
  }

  void decrement() {
    _numbers.last = _numbers.last - 1;
    emit(_getStrSumOfNumbers());
  }

  String _getStrSumOfNumbers() {
    String strSumOfNumbers = '';
    _numbers.forEach((element) {
      strSumOfNumbers += element.toString();
    });

    return strSumOfNumbers;
  }
}
