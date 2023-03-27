import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TvController extends GetxController {
  List<Widget> components = List<Widget>.empty(growable: true);

  setComponents({required Widget component}) {
    components.add(component);
    update();
  }
}
