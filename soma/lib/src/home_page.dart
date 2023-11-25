import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:soma/src/home_controller.dart';
import 'package:soma/src/localwidget/custom_input_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Calcula Número Inteiro'),
        ),
        body: Obx(
          () => Padding(
            padding: const EdgeInsets.all(40.0),
            child: Form(
              key: controller.formkey,
              child: Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                        width: 400,
                        child: CustomTextField(
                          controller: controller.numeroController,
                          label: "Número",
                          inputFormater: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                        )),
                    SizedBox(
                      height: 50,
                      width: 400,
                      child: ElevatedButton(
                        onPressed: () {
                          if (controller.formkey.currentState!.validate()) {
                            controller.somar(int.parse(controller.numeroController.text));
                          }
                        },
                        child: const Text("Calcular"),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Visibility(
                      visible: controller.campoVisivel.value,
                      child: const Text(
                        "Números inteiros que são divididos por 3 ou 5",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Visibility(
                      visible: controller.campoVisivel.value,
                      child: Container(
                        height: 150,
                        width: 400,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: const BorderRadius.all(Radius.circular(12)),
                        ),
                        padding: const EdgeInsets.all(20),
                        child: SingleChildScrollView(
                          child: Wrap(
                            children: [
                              Text(controller.valores.toString().replaceAll("[", "").replaceAll("]", "")),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: controller.campoVisivel.value,
                      child: Text(
                        "Soma: ${controller.somaTotal}",
                        style: const TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
