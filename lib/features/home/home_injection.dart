import 'package:tasabih/app_injection.dart';
import 'package:tasabih/features/home/data/repository/home_repository_imp.dart';
import 'package:tasabih/features/home/domin/repository/home_repository.dart';
import 'package:tasabih/features/home/domin/use_cases/decrement_use_case.dart';
import 'package:tasabih/features/home/domin/use_cases/increase_use_case.dart';
import 'package:tasabih/features/home/presentation/cubit/tasabih_cubit.dart';

void homeInjection() {
  getIt.registerFactory<TasabihCubit>(
    () => TasabihCubit(
      decrementUseCase: getIt.call(),
      increaseUseCase: getIt.call(),
    ),
  );

  getIt.registerFactory<IncreaseUseCase>(
    () => IncreaseUseCase(
      homeRepository: getIt.call(),
    ),
  );
  getIt.registerFactory<DecrementUseCase>(
    () => DecrementUseCase(
      homeRepository: getIt.call(),
    ),
  );

  getIt.registerFactory<HomeRepository>(
    () => HomeRepositoryImp(),
  );
}
