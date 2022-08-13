import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:getx_statemanagement/controller.dart';
import 'package:getx_statemanagement/secondepage.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // int count = 0;
  final countController CountControoler = Get.put(countController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Getx')),
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
          FloatingActionButton(
            heroTag: "F3",
            onPressed: () {
              Get.to(() => secondPage(count: CountControoler.count));
            },
            child: const Text('Next'),
          ),
        ],
      ),
    );
  }
}
