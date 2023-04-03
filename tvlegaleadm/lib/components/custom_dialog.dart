import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../tv/controller/tv_controller.dart';

class CustomDialog extends StatefulWidget {
  const CustomDialog({super.key});

  @override
  State<CustomDialog> createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  PageController _pageController = PageController();
  int _currentIndex = 0;

  List<Widget> _imageUrls = [
    Container(
      width: 100,
      height: 100,
      color: Colors.red,
    ),
    Container(
      width: 350,
      height: 350,
      color: Colors.green,
    ),
    Container(
      width: 200,
      height: 200,
      color: Colors.blue,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        width: MediaQuery.of(context).size.width * 0.3,
        height: MediaQuery.of(context).size.height * 0.5,
        child: PageView.builder(
          controller: _pageController,
          itemCount: _imageUrls.length,
          itemBuilder: (context, index) {
            return GestureDetector(
                onTap: () {
                  Get.find<TvController>().setComponents(
                      componentt: _imageUrls[index],
                      positionX: 100,
                      positionY: 100);
                  Get.back();
                },
                child: Center(child: _imageUrls[index]));
          },
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
