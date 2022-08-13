import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:getx_statemanagement/controller.dart';

class secondPage extends StatefulWidget {
  int count;
  secondPage({required this.count, Key? key}) : super(key: key);

  @override
  State<secondPage> createState() => _secondPageState();
}

class _secondPageState extends State<secondPage> {
  final countController CountControoler = Get.put(countController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SecondePage'),
      ),
      body: Center(
        child: GetBuilder<countController>(
          builder: (_) => Text(
            '${CountControoler.count}',
            style: TextStyle(fontSize: 40),
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            heroTag: "F1",
            onPressed: () async {
              await CountControoler.decrementCounter();
              // setState(() {
              //   if (count <= 0) {
              //     count = 0;
              //   } else {
              //     count--;
              //   }
              //   print('$count');
              // });
            },
            child: const Icon(Icons.remove),
          ),
          FloatingActionButton(
            heroTag: "F2",
            onPressed: () async {
              await CountControoler.incrementCounter();
              // setState(() {
              //   count++;
              //   print('$count');
              // });
            },
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
