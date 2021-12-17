import 'package:challenge/random_number/cubit/random_number_cubit.dart';
import 'package:challenge/random_number/randon_number_screen.dart';
import 'package:challenge/random_number/service_locator/service_locator.dart';
import 'package:flutter/material.dart';

void main() {

  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RandomNumberScreen(
        title: 'Flutter Demo Home Page',
        randomNumberCubit: getIt.get<RandomNumberCubit>(),
      ),
    );
  }
}
