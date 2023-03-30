import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

List<Widget> widgets = const [
  Icon(
    Icons.home,
    color: Colors.red,
    size: 100,
  ),
  Icon(
    Icons.settings,
    color: Colors.red,
    size: 100,
  ),
  Icon(
    Icons.person,
    color: Colors.red,
    size: 100,
  ),
];

class Page01 extends StatefulWidget {
  const Page01({Key? key}) : super(key: key);

  @override
  State<Page01> createState() => _Page01();
}

class _Page01 extends State<Page01> with SingleTickerProviderStateMixin {
  late final TabController controller;
  int _index = 0;

  @override
  void initState() {
    super.initState();
    controller = TabController(
      length: widgets.length,
      initialIndex: _index,
      vsync: this,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Stack(
        alignment: Alignment.center,
        children: [
          TabBarView(
            controller: controller,
            children: widgets,
          ),
          Positioned(
            bottom: 40,
            child: TabPageSelector(
              controller: controller,
              color: Colors.black38,
              selectedColor: Colors.red,
            ),
          ),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.3,
            child: FloatingActionButton.extended(
              backgroundColor: Colors.red,
              onPressed: () {
                (_index != widgets.length - 1) ? _index++ : _index = 0;
                controller.animateTo(_index);
              },
              label: const Text('Back'),
              icon: const Icon(Icons.navigate_before),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.3,
            child: FloatingActionButton.extended(
              backgroundColor: Colors.red,
              onPressed: () {
                (_index != widgets.length - 1) ? _index++ : _index = 0;
                controller.animateTo(_index);
              },
              label: const Text('Next'),
              icon: const Icon(Icons.navigate_next),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,

      // floatingActionButton: ButtonBar(
      //   children: [
      //     FloatingActionButton.small(
      //       backgroundColor: Colors.red,
      //       onPressed: () {
      //         (_index != 0) ? _index-- : _index = widgets.length - 1;
      //         controller.animateTo(_index);
      //       },
      //       child: const Icon(Icons.navigate_before),
      //       hoverElevation: 0,
      //       elevation: 0,
      //     ),
      //     FloatingActionButton.small(
      //       backgroundColor: Colors.red,
      //       onPressed: () {
      //         (_index != widgets.length - 1) ? _index++ : _index = 0;
      //         controller.animateTo(_index);
      //       },
      //       child: const Icon(Icons.navigate_next),
      //       hoverElevation: 0,
      //       elevation: 0,
      //     ),
      //   ],
      // ),
    );
  }
}
