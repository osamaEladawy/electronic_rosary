import 'package:tasabih/features/home/domin/repository/home_repository.dart';

class HomeRepositoryImp extends HomeRepository {
  @override
  int decrement(int number) {
    return number++;
  }

  @override
  int increase(int number) {
    return number--;
  }
}
