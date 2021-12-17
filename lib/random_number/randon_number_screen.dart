import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/random_number_cubit.dart';

class RandomNumberScreen extends StatefulWidget {
  final String title;
  final RandomNumberCubit randomNumberCubit;

  RandomNumberScreen(
      {Key? key, required this.title, required this.randomNumberCubit})
      : super(key: key);

  @override
  State<RandomNumberScreen> createState() => _RandomNumberScreenState();
}

class _RandomNumberScreenState extends State<RandomNumberScreen> {
  RandomNumberCubit get cubit => widget.randomNumberCubit;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: BlocBuilder<RandomNumberCubit, String>(
            bloc: cubit,
            builder: (context, strSumNumbers) {
              return SingleChildScrollView(
                child: Text(
                  "Sum of the numbers are:" + strSumNumbers,
                ),
              );
            },
          ),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                FloatingActionButton(
                  onPressed: cubit.decrement,
                  tooltip: 'Decrement',
                  child: Icon(Icons.remove),
                ),
               const SizedBox(width: 8,),
                FloatingActionButton(
                  onPressed: cubit.increment,
                  tooltip: 'Increment',
                  child: Icon(Icons.add),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
