// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/custom_dialog.dart';
import 'controller/tv_controller.dart';

class ScreenTvDetailsCustom extends StatefulWidget {
  const ScreenTvDetailsCustom({super.key});

  @override
  State<ScreenTvDetailsCustom> createState() => _ScreenTvDetailsCustomState();
}

class _ScreenTvDetailsCustomState extends State<ScreenTvDetailsCustom> {
  List<Item> _data = List<Item>.empty();
  Color caughtColor = Colors.black;
  bool aa = false;
  double top = 0.0;
  double left = 0.0;

  Offset _offset = Offset.zero;
  Offset _posicao = Offset(0, 0);
  Offset _posicao2 = Offset(0, 0);

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
    // final showColor = caughtColor == Colors.black;
    return

        //  Scaffold(
        //     backgroundColor: Colors.white,
        //     appBar: AppBar(
        //       title: const Text(''),
        //     ),
        //     body: Stack(
        //       children: [
        //         FloatingDraggableWidget(
        //             floatingWidget: FloatingActionButton(
        //               onPressed: () {},
        //               child: const Icon(Icons.add, size: 50),
        //             ),
        //             floatingWidgetHeight: 90,
        //             floatingWidgetWidth: 90,
        //             dx: 10,
        //             dy: 10,
        //             deleteWidgetDecoration: const BoxDecoration(
        //               gradient: LinearGradient(
        //                 colors: [Colors.white12, Colors.grey],
        //                 begin: Alignment.topCenter,
        //                 end: Alignment.bottomCenter,
        //                 stops: [.0, 1],
        //               ),
        //               borderRadius: BorderRadius.only(
        //                 topLeft: Radius.circular(50),
        //                 topRight: Radius.circular(50),
        //               ),
        //             ),
        //             deleteWidget: Container(
        //               decoration: BoxDecoration(
        //                 shape: BoxShape.circle,
        //                 border: Border.all(width: 2, color: Colors.black87),
        //               ),
        //               child: const Icon(Icons.close, color: Colors.black87),
        //             ),
        //             mainScreenWidget: SizedBox.shrink()),
        //         FloatingDraggableWidget(
        //             floatingWidget: FloatingActionButton(
        //               onPressed: () {},
        //               child: Stack(
        //                 children: [
        //                   const Icon(Icons.add, size: 50),
        //                   const Icon(Icons.add, size: 50),
        //                 ],
        //               ),
        //             ),
        //             floatingWidgetHeight: 100,
        //             floatingWidgetWidth: 100,
        //             dx: 10,
        //             dy: 10,
        //             onDeleteWidget: () {
        //               debugPrint('Widget deleted');
        //             },
        //             mainScreenWidget: SizedBox.shrink()),
        //       ],
        //     ));

        GetBuilder<TvController>(builder: (TvController tvController) {
      return Stack(
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
                                  const EdgeInsets.only(top: 10),
                              expansionCallback: (int index, bool isExpanded) {
                                setState(() {
                                  _data[index].isExpanded = !isExpanded;
                                });
                              },
                              children: _data.map<ExpansionPanel>((Item item) {
                                return ExpansionPanel(
                                  backgroundColor: Colors.white,
                                  headerBuilder:
                                      (BuildContext context, bool isExpanded) {
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
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return CustomDialog();
                                            },
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
                                          Get.find<TvController>()
                                              .setComponents(
                                            positionX: 100,
                                            positionY: 100,
                                            componentt: Container(
                                              color: Colors.green,
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
          Positioned(
              right: 300,
              top: 40,
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: Get.height * 0.80,
                  width: Get.width * 0.60,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey[300]!)),
                  child: Stack(
                    children: [
                      GestureDetector(
                        onPanUpdate: (details) {
                          setState(() {
                            //     print(e);
                            _offset = details.delta;
                            _posicao = _posicao + _offset;
                            // tvController.atualizar(
                            //     id: e.id!, x: _posicao.dx, y: _posicao.dy);
                          });
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: _posicao.dy.isNegative ? 10 : _posicao.dy,
                              left: _posicao.dx.isNegative ? 10 : _posicao.dx),
                          child: Container(
                            width: 800,
                            height: 300,
                            color: Colors.red,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onPanUpdate: (details) {
                          setState(() {
                            //     print(e);
                            _offset = details.delta;
                            _posicao2 = _posicao2 + _offset;
                            // tvController.atualizar(
                            //     id: e.id!, x: _posicao.dx, y: _posicao.dy);
                            print(_posicao2.dx);
                          });
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: _posicao2.dy.isNegative ? 10 : _posicao2.dy,
                              left:
                                  _posicao2.dx.isNegative ? 10 : _posicao2.dx),
                          child: Container(
                            width: 100,
                            height: 700,
                            color: Colors.blue,
                          ),
                        ),
                      )

                      // Wrap(
                      //   children: tvController.components.map((e) {
                      //     return GestureDetector(
                      //       onPanUpdate: (details) {
                      //         setState(() {
                      //           //     print(e);
                      //           _offset = details.delta;
                      //           _posicao = _posicao + _offset;
                      //           tvController.atualizar(
                      //               id: e.id!, x: _posicao.dx, y: _posicao.dy);
                      //         });
                      //       },
                      //       child: Padding(
                      //         padding: EdgeInsets.only(
                      //             top: tvController.components
                      //                     .firstWhere(
                      //                         (element) => element.id == e.id)
                      //                     .positionY!
                      //                     .isNegative
                      //                 ? 100
                      //                 : tvController.components
                      //                     .firstWhere(
                      //                         (element) => element.id == e.id)
                      //                     .positionY!,
                      //             left: tvController.components
                      //                     .firstWhere(
                      //                         (element) => element.id == e.id)
                      //                     .positionX!
                      //                     .isNegative
                      //                 ? 100
                      //                 : tvController.components
                      //                     .firstWhere(
                      //                         (element) => element.id == e.id)
                      //                     .positionX!),
                      //         child: e.component,
                      //       ),
                      //     );
                      //   }).toList(),
                      // ),
                    ],
                  ),

                  //  Expanded(
                  //   child: ListView.builder(
                  //     itemCount: tvController.components.length,
                  //     scrollDirection: Axis.horizontal,
                  //     physics: NeverScrollableScrollPhysics(),
                  //     shrinkWrap: true,
                  //     itemBuilder: (context, index) {
                  //       return Row(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           tvController.components[index],
                  //         ],
                  //       );
                  //     },
                  //   ),
                  // ),
                ),
              ))
        ],
      );

      // Stack(
      //   children: [
      //     Container(
      //       height: 400,
      //       width: double.infinity,
      //       color: Colors.black,
      //     )
      //   ],
      // ),
      // Expanded(
      //   child: Column(
      //     mainAxisSize: MainAxisSize.max,
      //     children: [
      //       Expanded(
      //         child: Container(
      //           height: 400,
      //           width: double.infinity,
      //           color: Colors.black,
      //           alignment: Alignment.topCenter,
      //           child: Row(
      //             children: [
      //               const SizedBox(
      //                 height: 5,
      //               ),
      //               Expanded(
      //                 child: ListView.builder(
      //                   itemCount: tvController.components.length,
      //                   scrollDirection: Axis.horizontal,
      //                   physics: NeverScrollableScrollPhysics(),
      //                   shrinkWrap: true,
      //                   itemBuilder: (context, index) {
      //                     return Center(
      //                         child: tvController.components[index]);
      //                   },
      //                 ),
      //               )

      //               // ListView.builder(
      //               //   scrollDirection: Axis.horizontal,
      //               //   physics: NeverScrollableScrollPhysics(),
      //               //   shrinkWrap: true,
      //               //   children: [
      //               //     Visibility(
      //               //       visible: aa == true,
      //               //       child: Center(
      //               //         child: Draggable(
      //               //           feedback: Container(
      //               //             height: 50,
      //               //             width: 50,
      //               //             color: Colors.red,
      //               //           ),
      //               //           child: Container(
      //               //             height: 50,
      //               //             width: 50,
      //               //             color: Colors.red,
      //               //           ),
      //               //         ),
      //               //       ),
      //               //     ),
      //               //   ],
      //               // ),
      //               ,
      //               const SizedBox(
      //                 height: 10,
      //               ),
      //               // IgnorePointer(
      //               //     ignoring: !showColor,
      //               //     child: Opacity(
      //               //       opacity: showColor ? 1 : 0,
      //               //       child: Draggable<Color>(
      //               //         data: Colors.green,
      //               //         child: Container(
      //               //           width: 200,
      //               //           height: 200,
      //               //           color: Colors.green,
      //               //         ),
      //               //         feedback: Container(
      //               //           width: 200,
      //               //           height: 200,
      //               //           color: Colors.orange,
      //               //         ),
      //               //         childWhenDragging: Container(
      //               //           width: 200,
      //               //           height: 200,
      //               //           color: Colors.transparent,
      //               //         ),
      //               //       ),
      //               //     )),
      //               // const SizedBox(
      //               //   height: 100,
      //               // ),
      //               // DragTarget<Color>(
      //               //   onWillAccept: (data) {
      //               //     return true;
      //               //   },
      //               //   onAccept: (data) {
      //               //     // if (data != Colors.white) {
      //               //     // } else {
      //               //     setState(() {
      //               //       caughtColor = data;
      //               //     });
      //               //     // }

      //               //     print(data.toString());
      //               //   },
      //               //   builder: (context, candidateData, rejectedData) {
      //               //     return Draggable(
      //               //       feedback: Container(
      //               //         height: 200,
      //               //         width: 200,
      //               //         color: caughtColor,
      //               //       ),
      //               //       child: Container(
      //               //         height: 200,
      //               //         width: 200,
      //               //         color: caughtColor,
      //               //       ),
      //               //     );
      //               //   },
      //               // )
      //             ],
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
      // Expanded(
      //   child: Column(
      //     children: [
      //       Expanded(
      //         child: Container(
      //           height: Get.height,
      //           color: Colors.white,
      //           alignment: Alignment.bottomCenter,
      //         ),
      //       ),
      //     ],
      //   ),
      // )
    });
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
