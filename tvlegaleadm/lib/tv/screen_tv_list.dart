import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class ScreenTvList extends StatefulWidget {
  const ScreenTvList({super.key});

  @override
  State<ScreenTvList> createState() => _ScreenTvListState();
}

class _ScreenTvListState extends State<ScreenTvList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          surfaceTintColor: Colors.transparent,
          shadowColor: Colors.transparent,
          elevation: 0.0,
          child: ListView(
            children: <Widget>[
              const DrawerHeader(
                child: Text('Menu'),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              ListTile(
                title: Text('Option 1'),
                onTap: () {
                  // Implementar ação para a opção 1
                },
              ),
              ListTile(
                title: Text('Option 2'),
                onTap: () {
                  // Implementar ação para a opção 2
                },
              ),
            ],
          ),
        ),
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          title: const Text(''),
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(right: Get.width * 0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Get.dialog(LayoutBuilder(builder:
                          (BuildContext ctx, BoxConstraints constraints) {
                        return const FormularioTitle();
                      }), barrierDismissible: false);
                    },
                    child: Container(
                      width: 120,
                      height: 30,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                        child: Row(
                          children: const [
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.note_add_outlined,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text('Nova Tv',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.width * 0.122),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Descrição',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('Status', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('Ações', style: TextStyle(fontWeight: FontWeight.bold))
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 50,
                      ),
                      child: Scrollbar(
                        child: ListView.builder(
                          padding: EdgeInsets.all(50),
                          itemCount: 10,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 80),
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text('Tv Legale'),
                                      const Icon(
                                        Icons.check_circle,
                                        color: Colors.green,
                                      ),
                                      Row(
                                        children: const [
                                          Icon(
                                            Icons.edit,
                                            color: Colors.green,
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Icon(
                                            Icons.delete_forever,
                                            color: Colors.red,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  Divider(
                                    color: Colors.grey[300],
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  )),
            )
          ],
        ));
  }
}

class FormularioTitle extends StatefulWidget {
  const FormularioTitle({
    super.key,
  });

  @override
  State<FormularioTitle> createState() => _FormularioTitleState();
}

class _FormularioTitleState extends State<FormularioTitle> {
  late final _items;
  @override
  void initState() {
    List<String> selected = [];
    _items = _animals
        .map((animal) => MultiSelectItem<Animal>(animal, animal.name))
        .toList();

    super.initState();
  }

  static List<Animal> _animals = [
    Animal(id: 1, name: "Lion"),
    Animal(id: 2, name: "Flamingo"),
    Animal(id: 3, name: "Hippo"),
    Animal(id: 4, name: "Horse"),
    Animal(id: 5, name: "Tiger"),
    Animal(id: 6, name: "Penguin"),
    Animal(id: 7, name: "Spider"),
    Animal(id: 8, name: "Snake"),
    Animal(id: 9, name: "Bear"),
    Animal(id: 10, name: "Beaver"),
    Animal(id: 11, name: "Cat"),
    Animal(id: 12, name: "Fish"),
    Animal(id: 13, name: "Rabbit"),
    Animal(id: 14, name: "Mouse"),
    Animal(id: 15, name: "Dog"),
    Animal(id: 16, name: "Zebra"),
    Animal(id: 17, name: "Cow"),
    Animal(id: 18, name: "Frog"),
    Animal(id: 19, name: "Blue Jay"),
    Animal(id: 20, name: "Moose"),
    Animal(id: 21, name: "Gecko"),
    Animal(id: 22, name: "Kangaroo"),
    Animal(id: 23, name: "Shark"),
    Animal(id: 24, name: "Crocodile"),
    Animal(id: 25, name: "Owl"),
    Animal(id: 26, name: "Dragonfly"),
    Animal(id: 27, name: "Dolphin"),
  ];

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12))),
        title: SizedBox(
          width: Get.width * 0.50,
          height: Get.height * 0.80,
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const Text('Titulo  do formulario'),
                GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: const Icon(Icons.highlight_remove_rounded,
                        color: Colors.black)),
              ]),
              const SizedBox(
                height: 50,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [Text('Titulo  do formulario')]),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [Text('Descricao')]),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [Text('Url')]),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 20,
              ),
              MultiSelectDialogField(
                chipDisplay: MultiSelectChipDisplay<Animal>.none(
                  disabled: false,
                  items: _items,
                  scrollBar: HorizontalScrollBar(isAlwaysShown: true),
                  scroll: false,
                  icon: Icon(Icons.person),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  height: 100,
                ),
                separateSelectedItems: true,
                isDismissible: false,
                listType: MultiSelectListType.LIST,
                searchable: true,
                searchIcon: const Icon(Icons.search),
                onConfirm: (_) {},
                items: _items,
                buttonText: Text('Usuario'),
                title: const Text("Usuario"),
                selectedColor: Colors.blue,
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.1),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  border: Border.all(
                    color: Colors.blue,
                    width: 0,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              MultiSelectDialogField(
                chipDisplay: MultiSelectChipDisplay<Animal>.none(
                  disabled: false,
                  items: _items,
                  scrollBar: HorizontalScrollBar(isAlwaysShown: true),
                  scroll: false,
                  icon: Icon(Icons.person),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  height: 100,
                ),
                separateSelectedItems: true,
                isDismissible: false,
                listType: MultiSelectListType.LIST,
                searchable: true,
                searchIcon: const Icon(Icons.search),
                onConfirm: (_) {},
                items: _items,
                buttonText: Text('Grupos'),
                title: const Text("Usuario"),
                selectedColor: Colors.blue,
                decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(0.1),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  border: Border.all(
                    color: Colors.blue,
                    width: 0,
                  ),
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      height: 50,
                      width: 130,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.blue),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(Icons.highlight_remove_rounded,
                              color: Colors.blue),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Cancelar',
                            style: TextStyle(color: Colors.blue),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    onTap: () {
                      Get.back();
                      Get.toNamed('/TvCustomDetails');
                    },
                    child: Container(
                      height: 50,
                      width: 130,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blue),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.check_circle_outline,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Salvar',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}

class Animal {
  final int id;
  final String name;

  Animal({
    required this.id,
    required this.name,
  });
}
