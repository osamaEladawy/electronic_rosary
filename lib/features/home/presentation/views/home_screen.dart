import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasabih/features/home/presentation/cubit/tasabih_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TasabihCubit, TasabihState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: const Color(0xff936FD3),
          appBar: AppBar(
            backgroundColor: const Color(0xff936FD3),
            title: Container(
              height: 100.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "${TasabihCubit.instance.count} ",
                        style: TextStyle(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.bold,
                          color: TasabihCubit.instance.changeColorTextCount(),
                        ),
                      ),
                      Text(
                        "/ 32",
                        style: TextStyle(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.bold,
                          color: TasabihCubit.instance.changeColorTextCount(),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Round /",
                        style: TextStyle(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.bold,
                          color: TasabihCubit.instance.changeColorTextRound(),
                        ),
                      ),
                      Text(
                        " ${TasabihCubit.instance.round}",
                        style: TextStyle(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.bold,
                          color: TasabihCubit.instance.changeColorTextRound(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          body: SafeArea(
            child: Stack(
              children: [
                Image.asset("assets/images/pic2.jpg"),
                Container(
                  height: 200.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        highlightColor: const Color(0xff936FD3),
                        onPressed: () {
                          if (TasabihCubit.instance.index > 0) {
                            TasabihCubit.instance.decrement();
                          } else {
                            TasabihCubit.instance.index = 0;
                          }
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios_new_sharp,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          TasabihCubit
                              .instance.tasbeh[TasabihCubit.instance.index],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 17.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      IconButton(
                        highlightColor: const Color(0xff936FD3),
                        onPressed: () {
                          if (TasabihCubit.instance.index <
                              TasabihCubit.instance.tasbeh.length - 1) {
                            TasabihCubit.instance.increment();
                          } else {
                            TasabihCubit.instance.index = 0;
                          }
                        },
                        icon: const Icon(
                          Icons.arrow_forward_ios,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 25.h),
                Positioned(
                  left: 20.w,
                  bottom: 0.h,
                  child: InkWell(
                    highlightColor: const Color(0xff936FD3),
                    onTap: () {
                      TasabihCubit.instance.reset();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 120.h,
                      width: 120.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(60.r),
                        border: Border.all(
                          color: Colors.blue.shade600,
                          width: 8,
                        ),
                      ),
                      child: TasabihCubit.instance.isClick == false
                          ? Text(
                              "Reset",
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          : Icon(
                              Icons.check,
                              color: Colors.green,
                              size: 35.sp,
                            ),
                    ),
                  ),
                ),
                SizedBox(height: 50.h),
                Positioned(
                  right: 20.w,
                  bottom: 0.h,
                  child: InkWell(
                    onTap: () {
                      TasabihCubit.instance.isClick = false;
                      if (TasabihCubit.instance.count < 32) {
                        TasabihCubit.instance.increaseCount();
                      } else if (TasabihCubit.instance.count == 32) {
                        TasabihCubit.instance.count = 0;
                        TasabihCubit.instance.increaseRound();
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 120.h,
                      width: 120.w,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(60.r),
                          border: Border.all(
                            color: Colors.blue.shade600,
                            width: 8.w,
                          )),
                      child: Text(
                        "سبح",
                        style: TextStyle(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
