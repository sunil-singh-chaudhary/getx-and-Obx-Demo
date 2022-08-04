import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:getx_demos/controller/data_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    //important for calling conrtoller methods and variables
    //below can be access on other classes using get.find() it will get the below object
    final data_controller controller = Get.put(data_controller());

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnotherWidget(),
            const Text(
              'You have pushed the button this many times:',
            ),

            //obx use controller defined in class
            // final data_controller controller = Get.put(data_controller());
            // Obx(() {
            //   return Text("${controller.increment.value}");
            // }),

            //SECOND METHOD TO DO THE SAME
            //use this   data_controller second_controller = Get.find();
            GetX<data_controller>(
                init: data_controller(),
                builder: (val) {
                  return Text('${val.increment.value}');
                }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.getincreementValue();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class AnotherWidget extends StatelessWidget {
  const AnotherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final data_controller ctroller = Get.find();
    return Container(
      child: Obx(() {
        return Center(child: Text("${ctroller.increment.value}"));
      }),
    );
  }
}
