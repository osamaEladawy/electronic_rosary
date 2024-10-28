import 'package:tasabih/features/home/domin/repository/home_repository.dart';

class DecrementUseCase {
  final HomeRepository homeRepository;

  DecrementUseCase({required this.homeRepository});
  
  int call(int number)  {
    return homeRepository.decrement(number);
  }
}