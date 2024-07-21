import 'package:flutter/material.dart';
import 'package:tasabih/data/list_of_data.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int index = 0;
  int count = 0;
  int round = 0;
  bool isClick = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff936FD3),
      appBar: AppBar(
        backgroundColor: const Color(0xff936FD3),
        title: Container(
          height: 100,
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
                    "$count ",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: count == 0
                            ? Colors.white
                            : count < 10
                                ? Colors.yellow
                                : count == 10
                                    ? Colors.pink
                                    : count < 20
                                        ? Colors.lightBlueAccent
                                        : count == 20
                                            ? Colors.pink
                                            : count < 30
                                                ? const Color(0xff0000EE)
                                                : count == 30
                                                    ? Colors.pink
                                                    : Colors.white),
                  ),
                  Text(
                    "/ 32",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: count == 0
                            ? Colors.white
                            : count < 10
                                ? Colors.yellow
                                : count == 10
                                    ? Colors.pink
                                    : count < 20
                                        ? Colors.lightBlueAccent
                                        : count == 20
                                            ? Colors.pink
                                            : count < 30
                                                ? const Color(0xff0000EE)
                                                : count == 30
                                                    ? Colors.pink
                                                    : Colors.white),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Round /",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: round > 0 ? Colors.yellow : Colors.white),
                  ),
                  Text(
                    " $round",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: round > 0 ? Colors.yellow : Colors.white),
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
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    highlightColor: const Color(0xff936FD3),
                    onPressed: () {
                      setState(() {
                        if (index > 0) {
                          index--;
                        } else {
                          index = 0;
                        }
                      });
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_new_sharp,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      tasbeh[index],
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                  ),
                  IconButton(
                    highlightColor: const Color(0xff936FD3),
                    onPressed: () {
                      setState(() {
                        if (index < tasbeh.length - 1) {
                          index++;
                        } else {
                          index = 0;
                        }
                      });
                    },
                    icon: const Icon(
                      Icons.arrow_forward_ios,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 25),
            Positioned(
              left: 20,
              bottom: 0,
              child: InkWell(
                highlightColor: const Color(0xff936FD3),
                onTap: () {
                  setState(() {
                    // if (index != 0 && count != 0 && round != 0)
                    isClick = true;

                    index = 0;
                    count = 0;
                    round = 0;
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(60),
                    border: Border.all(
                      color: Colors.blue.shade600,
                      width: 8,
                    ),
                  ),
                  child: isClick == false
                      ? const Text(
                          "Reset",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      : const Icon(
                          Icons.check,
                          color: Colors.green,
                          size: 35,
                        ),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Positioned(
              right: 20,
              bottom: 0,
              child: InkWell(
                onTap: () {
                  isClick = false;
                  if (count < 32) {
                    count++;
                  } else if (count == 32) {
                    count = 0;
                    round++;
                  }
                  setState(() {});
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(60),
                      border: Border.all(
                        color: Colors.blue.shade600,
                        width: 8,
                      )),
                  child: const Text(
                    "سبح",
                    style: TextStyle(
                      fontSize: 22,
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
  }
}
