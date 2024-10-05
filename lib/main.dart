import 'package:flutter/material.dart';

import 'navigation_test/navigation_test_screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Demo'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const CustomWidgetForTesting(text: 'number one'),
              MyTextFieldWidget(
                textFieldKey: const Key("myTextFieldKey1"),
                controller: controller1,
              ),
              const CustomWidgetForTesting(text: 'number two'),
              MyTextFieldWidget(
                textFieldKey: const Key("myTextFieldKey2"),
                controller: controller2,
              ),
              const CustomWidgetForTesting(text: 'text three'),
              if (controller1.text.isNotEmpty && controller2.text.isNotEmpty)
                Text(getCalc()),
            ],
          ),
        ),
      ),
    );
  }

  String getCalc() {
    final num1 = double.parse(controller1.text);
    final num2 = double.parse(controller2.text);

    return (num1 + num2).toString();
  }
}

class CustomWidgetForTesting extends StatefulWidget {
  final String text;

  const CustomWidgetForTesting({super.key, required this.text});

  @override
  State<CustomWidgetForTesting> createState() => _CustomWidgetForTestingState();
}

class _CustomWidgetForTestingState extends State<CustomWidgetForTesting> {
  @override
  Widget build(BuildContext context) {
    return Text(widget.text);
  }
}

class MyTextFieldWidget extends StatefulWidget {
  final Key textFieldKey;
  final TextEditingController controller;

  const MyTextFieldWidget(
      {super.key, required this.textFieldKey, required this.controller});

  @override
  State<MyTextFieldWidget> createState() => _MyTextFieldWidgetState();
}

class _MyTextFieldWidgetState extends State<MyTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        key: widget.textFieldKey,
        controller: widget.controller,
        onChanged: (val){
          widget.controller.text = val;
        },
        decoration: const InputDecoration(
          labelText: "Enter text",
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
