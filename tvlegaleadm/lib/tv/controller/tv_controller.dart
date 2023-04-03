import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tvlegaleadm/tv/controller/components.dart';
import 'package:uuid/uuid.dart';

class TvController extends GetxController {
  List<Components> components = List<Components>.empty(growable: true);

  setComponents(
      {required Widget componentt, double? positionX, double? positionY}) {
    var uid = Uuid().v1();
    final Components component = Components(
        id: uid,
        positionX: positionX,
        positionY: positionY,
        component: componentt);
    components.add(component);
    update();
  }

  atualizar({required String id, required double x, required double y}) {
    components.firstWhere((element) => element.id == id).positionX = x;
    components.firstWhere((element) => element.id == id).positionY = y;
    update();
  }
}
