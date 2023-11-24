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
        body: Center(
          child: Obx(
            () => Column(
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
                    onPressed: () => controller.somar(int.parse(controller.numeroController.text)),
                    child: const Text("Calcular"),
                  ),
                ),
                Visibility(
                    visible: controller.campoVisivel.value,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        "O Soma dos valores ${controller.valores} é de ${controller.somaTotal}",
                        style: const TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ))
              ],
            ),
          ),
        ));
  }
}
