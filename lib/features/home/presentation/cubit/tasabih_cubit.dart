import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasabih/features/home/domin/use_cases/decrement_use_case.dart';
import 'package:tasabih/features/home/domin/use_cases/increase_use_case.dart';
import 'package:tasabih/main.dart';

part 'tasabih_state.dart';

class TasabihCubit extends Cubit<TasabihState> {
  TasabihCubit({
    required this.decrementUseCase,
    required this.increaseUseCase,
  }) : super(TasabihInitial());

  static final TasabihCubit _tasabihCubit =
      BlocProvider.of(navigatorKey.currentContext!);
  static TasabihCubit get instance => _tasabihCubit;

  final IncreaseUseCase increaseUseCase;
  final DecrementUseCase decrementUseCase;

  int number = 0;
  int index = 0;
  int count = 0;
  int round = 0;
  bool isClick = false;

  void increment() {
    index++;
    emit(ChangeValue(value: index));
    emit(Increase());
  }

  void decrement() {
    index--;
    emit(ChangeValue(value: index));
    emit(Decrement());
  }

  void increaseCount() {
    count++;
    emit(ChangeValue(value: count));
    emit(IncreaseCount());
  }

  void increaseRound() {
    round++;
    emit(ChangeValue(value: round));
    emit(IncreaseRound());
  }

  void reset() {
    if (index != 0 && count != 0 && round != 0) isClick = true;
    index = 0;
    count = 0;
    round = 0;
    emit(ChangeValue(value: index));
    emit(Reset(index: index, count: count, round: round, isClick: isClick));
  }

  Color changeColorTextCount() {
    switch (count) {
      case 0:
        return Colors.white;
      case < 10:
        return Colors.yellow;
      case 10:
        return Colors.pink;
      case < 20:
        return Colors.lightBlueAccent;
      case 20:
        return Colors.pink;
      case < 30:
        return const Color(0xff0000EE);
      case 30:
        return Colors.pink;
      default:
        return Colors.white;
    }
  }

  Color changeColorTextRound() {
    if (round > 0) {
      return Colors.yellow;
    } else {
      return Colors.white;
    }
  }

  List<String> tasbeh = [
    "سُبْحَانَ اللَّهِ",
    "سُبْحَانَ اللَّهِ وَبِحَمْدِهِ",
    "سُبْحَانَ اللَّهِ وَالْحَمْدُ لِلَّهِ",
    "سُبْحَانَ اللهِ العَظِيمِ وَبِحَمْدِهِ",
    "سُبْحَانَ اللَّهِ وَبِحَمْدِهِ ، سُبْحَانَ اللَّهِ الْعَظِيمِ",
    "لَا إلَه إلّا اللهُ وَحْدَهُ لَا شَرِيكَ لَهُ، لَهُ الْمُلْكُ وَلَهُ الْحَمْدُ وَهُوَ عَلَى كُلُّ شَيْءِ قَدِيرِ",
    "لا حَوْلَ وَلا قُوَّةَ إِلا بِاللَّهِ ",
    "الْحَمْدُ للّهِ رَبِّ الْعَالَمِينَ",
    "الْلَّهُم صَلِّ وَسَلِم وَبَارِك عَلَى سَيِّدِنَا مُحَمَّد",
    "أستغفر الله ",
    "سُبْحَانَ الْلَّهِ، وَالْحَمْدُ لِلَّهِ، وَلَا إِلَهَ إِلَّا الْلَّهُ، وَالْلَّهُ أَكْبَرُ",
    "لَا إِلَهَ إِلَّا اللَّهُ",
    "الْلَّهُ أَكْبَرُ",
    "سُبْحَانَ اللَّهِ ، وَالْحَمْدُ لِلَّهِ ، وَلا إِلَهَ إِلا اللَّهُ ، وَاللَّهُ أَكْبَرُ ، اللَّهُمَّ اغْفِرْ لِي ، اللَّهُمَّ ارْحَمْنِي ، اللَّهُمَّ ارْزُقْنِي.",
    "الْحَمْدُ لِلَّهِ حَمْدًا كَثِيرًا طَيِّبًا مُبَارَكًا فِيهِ",
    "اللَّهُ أَكْبَرُ كَبِيرًا ، وَالْحَمْدُ لِلَّهِ كَثِيرًا ، وَسُبْحَانَ اللَّهِ بُكْرَةً وَأَصِيلاً.",
    "اللَّهُمَّ صَلِّ عَلَى مُحَمَّدٍ وَعَلَى آلِ مُحَمَّدٍ كَمَا صَلَّيْتَ عَلَى إِبْرَاهِيمَ , وَعَلَى آلِ إِبْرَاهِيمَ إِنَّكَ حَمِيدٌ مَجِيدٌ , اللَّهُمَّ بَارِكْ عَلَى مُحَمَّدٍ وَعَلَى آلِ مُحَمَّدٍ كَمَا بَارَكْتَ عَلَى إِبْرَاهِيمَ وَعَلَى آلِ إِبْرَاهِيمَ إِنَّكَ حَمِيدٌ مَجِيدٌ.",
  ];
}
