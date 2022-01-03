import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_calculator/controller/button_controller.dart';
import 'package:simple_calculator/models/button_model.dart';
import 'package:simple_calculator/models/keylist_model.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              context.watch<ButtonController>().userInput,
                              textAlign: TextAlign.end,
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 25),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10,),
                      SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              context.watch<ButtonController>().answer,
                              textAlign: TextAlign.end,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 40,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 65),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                color: Colors.grey,
              ),
            ),
            Expanded(
              flex: 2,
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: GridView.builder(
                    itemCount: ButtonModel().buttons.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4),
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return CustomButton(
                          isEqual: false,
                          text: ButtonModel().buttons[index],
                          buttonColor: ButtonController()
                                  .isColor(ButtonModel().buttons[index])
                              ? Colors.deepOrange
                              : Colors.white10,
                          textColor: Colors.white,
                          onTap: () =>
                              context.read<ButtonController>().allClear(),
                        );
                      }
                      if (index == 1) {
                        return CustomButton(
                          isEqual: false,
                          text: ButtonModel().buttons[index],
                          buttonColor: ButtonController()
                                  .isColor(ButtonModel().buttons[index])
                              ? Colors.deepOrange
                              : Colors.white10,
                          textColor: Colors.white,
                          onTap: () =>
                              context.read<ButtonController>().clearInput(),
                        );
                      }
                      if (index == 16 || index == 17 || index == 18) {
                        return CustomButton(
                          isEqual: false,
                          text: ButtonModel().buttons[index],
                          buttonColor: ButtonController()
                                  .isColor(ButtonModel().buttons[index])
                              ? Colors.deepOrange
                              : Colors.white10,
                          textColor: Colors.white,
                          onTap: () =>
                              context.read<ButtonController>().isZero(index),
                        );
                      }

                      if (index == 19) {
                        return CustomButton(
                          isEqual: true,
                          text: ButtonModel().buttons[index],
                          buttonColor: ButtonController()
                                  .isColor(ButtonModel().buttons[index])
                              ? Colors.deepOrange
                              : Colors.white10,
                          textColor: Colors.white,
                          onTap: () {
                            try {
                              if (ButtonController().userInput.isEmpty) {
                                context.read<ButtonController>().isEmpty();
                              }
                              context
                                  .read<ButtonController>()
                                  .onTappedEqualButton();
                            } on Exception catch (e) {
                              throw Exception(e);
                            }
                          },
                        );
                      } else {
                        return CustomButton(
                          text: ButtonModel().buttons[index],
                          buttonColor: ButtonController()
                                  .isColor(ButtonModel().buttons[index])
                              ? Colors.deepOrange
                              : Colors.white10,
                          textColor: Colors.white,
                          onTap: () => context
                              .read<ButtonController>()
                              .changeData(index),
                          isEqual: false,
                        );
                      }
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
