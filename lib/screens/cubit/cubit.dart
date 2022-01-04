import 'dart:math';

import 'package:bmicalculator/screens/cubit/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BMICubit extends Cubit<BMIState> {
  BMICubit() : super(BMIInitialState());

  bool isMale = true;
  int age = 1;
  double result = 0.0;
  int wieght = 1;
  double height = 120.0;
  static BMICubit get(context) => BlocProvider.of(context);

  void addAge() {
    age++;
    emit(AddAgeState());
  }

  void minusAge() {
    age--;
    emit(MinusAgeState());
  }

  void addWieght() {
    wieght++;
    emit(AddWeightState());
  }

  void minusWieght() {
    wieght--;
    emit(MinusWeightState());
  }

  void chageHeightValue(double value) {
    height = value;
    emit(HeightState());
  }

  void isMaleValue(bool _isMale) {
    isMale = _isMale;
    emit(changeGenderState());
  }

  double getResult() {
    result = wieght / pow(height / 100, 2);
    emit(GetResultState());
    return result;
  }
}
