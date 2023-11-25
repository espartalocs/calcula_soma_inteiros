import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  TextEditingController numeroController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  RxInt somaTotal = 0.obs;
  RxBool campoVisivel = false.obs;
  RxList<int> valores = <int>[].obs;

  void somar(int numero) {
    campoVisivel.value = true;
    valores.clear();
    int soma = 0;
    for (int i = 0; i < numero; i++) {
      if (i % 3 == 0 || i % 5 == 0) {
        soma = soma + i;
        valores.addIf(i != 0, i);
      }
    }
    somaTotal.value = soma;
  }
}
