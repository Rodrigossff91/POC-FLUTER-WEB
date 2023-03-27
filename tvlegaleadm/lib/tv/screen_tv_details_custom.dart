// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tvlegaleadm/tv/controller/tv_controller.dart';

class ScreenTvDetailsCustom extends StatefulWidget {
  const ScreenTvDetailsCustom({super.key});

  @override
  State<ScreenTvDetailsCustom> createState() => _ScreenTvDetailsCustomState();
}

class _ScreenTvDetailsCustomState extends State<ScreenTvDetailsCustom> {
  List<Item> _data = List<Item>.empty();
  Color caughtColor = Colors.black;
  bool aa = false;

  @override
  void initState() {
    _data = [
      Item(
          header: 'WIDGETS LEGALE',
          body:
              'Liof é um alimento fresco e seco para cães, que contém ingredientes liofilizados. Liof possui qualidades da comida fresca, porém com a praticidade da comida seca.'),
      Item(
          header: 'WIDEGTS CUSTOM',
          body:
              'Liof vem de “liofilizado”. A liofilização, é um processo nobre da desidratação, por ser o que existe de mais tecnológico neste procedimento.'),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final showColor = caughtColor == Colors.black;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(''),
        ),
        body: GetBuilder<TvController>(builder: (TvController tvController) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Row(
                        children: [
                          Container(
                              height: Get.height,
                              width: Get.width * 0.20,
                              color: Colors.white,
                              child: Column(
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: 50,
                                    color: Colors.blue,
                                  ),
                                  SingleChildScrollView(
                                      child: Container(
                                          padding: const EdgeInsets.all(16),
                                          child: ExpansionPanelList(
                                              elevation: 0,
                                              dividerColor: Colors.white,
                                              expandedHeaderPadding:
                                                  const EdgeInsets.only(
                                                      top: 10),
                                              expansionCallback:
                                                  (int index, bool isExpanded) {
                                                setState(() {
                                                  _data[index].isExpanded =
                                                      !isExpanded;
                                                });
                                              },
                                              children: _data
                                                  .map<ExpansionPanel>(
                                                      (Item item) {
                                                return ExpansionPanel(
                                                  backgroundColor: Colors.white,
                                                  headerBuilder:
                                                      (BuildContext context,
                                                          bool isExpanded) {
                                                    return ListTile(
                                                      title: Text(
                                                        item.header,
                                                      ),
                                                    );
                                                  },
                                                  body: Row(
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () {
                                                          Get.find<
                                                                  TvController>()
                                                              .setComponents(
                                                            component:
                                                                Container(
                                                              color: Colors.red,
                                                              width: 50,
                                                              height: 50,
                                                            ),
                                                          );
                                                        },
                                                        child: Container(
                                                          color: Colors.red,
                                                          width: 50,
                                                          height: 50,
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 20,
                                                      ),
                                                      GestureDetector(
                                                        onTap: () {
                                                          Get.find<
                                                                  TvController>()
                                                              .setComponents(
                                                            component:
                                                                Container(
                                                              color:
                                                                  Colors.green,
                                                              width: 50,
                                                              height: 50,
                                                            ),
                                                          );
                                                        },
                                                        child: Container(
                                                          color: Colors.green,
                                                          width: 50,
                                                          height: 50,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  isExpanded: item.isExpanded,
                                                );
                                              }).toList()))),
                                ],
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        height: Get.height * 0.50,
                        color: Colors.white,
                        alignment: Alignment.topCenter,
                        child: Row(
                          children: [
                            const SizedBox(
                              height: 5,
                            ),
                            Expanded(
                              child: ListView.builder(
                                itemCount: tvController.components.length,
                                scrollDirection: Axis.horizontal,
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return Center(
                                      child: tvController.components[index]);
                                },
                              ),
                            )

                            // ListView.builder(
                            //   scrollDirection: Axis.horizontal,
                            //   physics: NeverScrollableScrollPhysics(),
                            //   shrinkWrap: true,
                            //   children: [
                            //     Visibility(
                            //       visible: aa == true,
                            //       child: Center(
                            //         child: Draggable(
                            //           feedback: Container(
                            //             height: 50,
                            //             width: 50,
                            //             color: Colors.red,
                            //           ),
                            //           child: Container(
                            //             height: 50,
                            //             width: 50,
                            //             color: Colors.red,
                            //           ),
                            //         ),
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            ,
                            const SizedBox(
                              height: 10,
                            ),
                            // IgnorePointer(
                            //     ignoring: !showColor,
                            //     child: Opacity(
                            //       opacity: showColor ? 1 : 0,
                            //       child: Draggable<Color>(
                            //         data: Colors.green,
                            //         child: Container(
                            //           width: 200,
                            //           height: 200,
                            //           color: Colors.green,
                            //         ),
                            //         feedback: Container(
                            //           width: 200,
                            //           height: 200,
                            //           color: Colors.orange,
                            //         ),
                            //         childWhenDragging: Container(
                            //           width: 200,
                            //           height: 200,
                            //           color: Colors.transparent,
                            //         ),
                            //       ),
                            //     )),
                            // const SizedBox(
                            //   height: 100,
                            // ),
                            // DragTarget<Color>(
                            //   onWillAccept: (data) {
                            //     return true;
                            //   },
                            //   onAccept: (data) {
                            //     // if (data != Colors.white) {
                            //     // } else {
                            //     setState(() {
                            //       caughtColor = data;
                            //     });
                            //     // }

                            //     print(data.toString());
                            //   },
                            //   builder: (context, candidateData, rejectedData) {
                            //     return Draggable(
                            //       feedback: Container(
                            //         height: 200,
                            //         width: 200,
                            //         color: caughtColor,
                            //       ),
                            //       child: Container(
                            //         height: 200,
                            //         width: 200,
                            //         color: caughtColor,
                            //       ),
                            //     );
                            //   },
                            // )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        height: Get.height,
                        color: Colors.white,
                        alignment: Alignment.bottomCenter,
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
        }));
  }
}

class Item {
  String header;
  String body;
  bool isExpanded;

  Item({
    required this.header,
    required this.body,
    this.isExpanded = true,
  });
}

class Item2 {
  String header;
  String body;
  Color color;
  Item2({
    required this.header,
    required this.body,
    required this.color,
  });
}
