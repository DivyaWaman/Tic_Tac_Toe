import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class Controller extends GetxController {
  var displayElement = ['', '', '', '', '', '', '', '', ''].obs;
  var isX = false.obs;
  var click = 0.obs;
  var scoreX = 0.obs;
  var scoreO = 0.obs;

  addvalue({required int index, required BuildContext context}) {
    if (displayElement[index] == "") {
      if (isX.value) {
        displayElement[index] = "X";
        isX.value = !isX.value;
      } else {
        displayElement[index] = "O";
        isX.value = !isX.value;
      }
      click++;
      checkWinner(context: context);
    } else {
      print("ERROR.......");
    }
  }

  clear() {
    if (click <= 9) {
      displayElement.value = ['', '', '', '', '', '', '', '', ''];
      click.value = 0;
    }
  }

  checkWinner({required BuildContext context}) {
    // Checking rows
    if (displayElement[0] == displayElement[1] &&
        displayElement[0] == displayElement[2] &&
        displayElement[0] != '') {
      showWinner(displayElement[0], context);
    } else if (displayElement[3] == displayElement[4] &&
        displayElement[3] == displayElement[5] &&
        displayElement[3] != '') {
      showWinner(displayElement[3], context);
    } else if (displayElement[6] == displayElement[7] &&
        displayElement[6] == displayElement[8] &&
        displayElement[6] != '') {
      showWinner(displayElement[6], context);
    }

    // Checking Column
    else if (displayElement[0] == displayElement[3] &&
        displayElement[0] == displayElement[6] &&
        displayElement[0] != '') {
      showWinner(displayElement[0], context);
    } else if (displayElement[1] == displayElement[4] &&
        displayElement[1] == displayElement[7] &&
        displayElement[1] != '') {
      showWinner(displayElement[1], context);
    } else if (displayElement[2] == displayElement[5] &&
        displayElement[2] == displayElement[8] &&
        displayElement[2] != '') {
      showWinner(displayElement[2], context);
    }

    // Checking Diagonal
    else if (displayElement[0] == displayElement[4] &&
        displayElement[0] == displayElement[8] &&
        displayElement[0] != '') {
      showWinner(displayElement[0], context);
    } else if (displayElement[2] == displayElement[4] &&
        displayElement[2] == displayElement[6] &&
        displayElement[2] != '') {
      showWinner(displayElement[2], context);
    } else {
      if (click == 9) {
        showDialog(
            context: context,
            builder: (BuildContext builder) {
              return SimpleDialog(
                //title: Text('Game Over'),
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        'Game Over',
                        style: TextStyle(fontSize: 25),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            clear();
                            Navigator.of(context).pop();
                          },
                          child: const Text("OK"))
                    ],
                  )
                ],
              );
            });
      }
    }
  }

  showWinner(String winner, BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            //alignment: Alignment.center,
            title: Center(child: const Text("🥇...Winner...🥇")),
            actions: [
              Center(
                child: Column(
                  children: [
                    const Icon(Icons.workspace_premium),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text("$winner is Winner!!🥇"),
                    ),
                    ElevatedButton(
                      // style: ButtonStyle(
                      //     backgroundColor:
                      //         WidgetStateProperty.all(Colors.grey[800]),
                      //     shadowColor: WidgetStateProperty.all(Colors.blue),),
                      child: const Text("Play Again"),
                      onPressed: () {
                       // clear();
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                ),
              ),
            ],
          );
        });
    if (winner == "X") {
      scoreX++;
    }
    // else if (winner == "O") {
    //   scoreO++;
    // }
    else {
      scoreO++;
    }
  }
}

