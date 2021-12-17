import 'package:challenge/random_number/cubit/random_number_cubit.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.I;

void setupServiceLocator() {
  getIt.registerFactory<RandomNumberCubit>(
      () => RandomNumberCubit(initialNumber: 0,maxRandomValue: 100));
}
