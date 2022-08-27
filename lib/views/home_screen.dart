import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int counter = 0;

  void increase() {
    counter++;
    setState(() {});
  }

  void reset() {
    counter = 0;
    setState(() {});
  }

  void decrease() {
    counter--;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    const fontZise30 = TextStyle(fontSize: 30);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bienvenido'),
        elevation: 2,
      ),
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
            const Text('Numero de Clicks', style: fontZise30),
            Text('$counter', style: fontZise30),
          ])),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterFloat,
      floatingActionButton: CustomFloatingActions(
          increaseFn: increase, resetFn: reset, decreaseFn: decrease),
    );
  }
}

class CustomFloatingActions extends StatelessWidget {
  final Function increaseFn;
  final Function resetFn;
  final Function decreaseFn;

  const CustomFloatingActions(
      {Key? key,
      required this.increaseFn,
      required this.resetFn,
      required this.decreaseFn})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FloatingActionButton(
            child: const Icon(Icons.exposure_neg_1_outlined),
            onPressed: () => decreaseFn()),
        FloatingActionButton(
            child: const Icon(Icons.restart_alt), onPressed: () => resetFn()),
        FloatingActionButton(
            child: const Icon(Icons.add), onPressed: () => increaseFn())
      ],
    );
  }
}
