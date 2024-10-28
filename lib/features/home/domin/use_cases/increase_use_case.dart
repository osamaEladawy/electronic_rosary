import 'package:tasabih/features/home/domin/repository/home_repository.dart';

class IncreaseUseCase {
  final HomeRepository homeRepository;

  IncreaseUseCase({required this.homeRepository});

  int call(int number){
    return homeRepository.increase(number);
   }
}