import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/controller.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Controller controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            const SizedBox(
              height: 50,
            ),
            // Container(
            //   height: 60,
            //   alignment: Alignment.center,
            //   decoration: BoxDecoration(
            //       color: Colors.white,
            //       boxShadow: [
            //         BoxShadow(
            //             color: Colors.grey.withOpacity(0.5),
            //             spreadRadius: 1,
            //             blurRadius: 10,
            //             offset: const Offset(0, 10))
            //       ],
            //       borderRadius: BorderRadius.circular(15),
            //       border: Border.all(
            //           width: 4,
            //           color: const Color.fromARGB(255, 150, 208, 255))),
            //   child: const Text('Tic Tac Toe',
            //       style: TextStyle(
            //         fontSize: 30,
            //         fontWeight: FontWeight.bold,
            //         color: Colors.black,
            //       )),
            // ),
            const Text(
              "Scoreboard",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: Obx(
                () {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 80,
                        width: 150,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: controller.isX.value == false
                                ? Colors.grey[800]
                                : Colors.blue[300],
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 10,
                                  offset: const Offset(0, 10))
                            ],
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                                width: 4,
                                color:
                                    const Color.fromARGB(255, 150, 208, 255))),
                        child: Column(
                          children: [
                            const Text(
                              'Player X',
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Text(
                              controller.scoreX.string,
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Container(
                        height: 80,
                        width: 150,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: controller.isX.value == false
                                ? Colors.blue[300]
                                : Colors.grey[800],
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 10,
                                  offset: const Offset(0, 10))
                            ],
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                                width: 4,
                                color:
                                    const Color.fromARGB(255, 150, 208, 255))),
                        child: Column(
                          children: [
                            const Text('Player O',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                )),
                            Text(
                              controller.scoreO.string,
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            Expanded(
              flex: 4,
              child: GridView.builder(
                  itemCount: 9,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        controller.addvalue(index: index, context: context);
                      },
                      child: Container(
                        margin: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 10,
                                  offset: const Offset(0, 10))
                            ],
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                width: 4,
                                color:
                                    const Color.fromARGB(255, 150, 208, 255))),
                        child: Center(child: Obx(
                          () {
                            return Text(
                              controller.displayElement[index],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                                fontSize: 40,
                              ),
                            );
                          },
                        )),
                      ),
                    );
                  }),
            ),
            InkWell(
                onTap: () {
                  controller.clear();
                },
                child: Container(
                    height: 60,
                    width: 100,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 10,
                              offset: const Offset(0, 10))
                        ],
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                            width: 4,
                            color: const Color.fromARGB(255, 150, 208, 255))),
                    child: const Text(
                      'Clear',
                      style: TextStyle(fontSize: 30),
                    ))),
            // SizedBox(
            //   height: 30,
            // )
          ],
        ),
      ),
    );
  }
}
