import 'package:flutter_driver/flutter_driver.dart';

import 'package:test/test.dart';

void main() {

  late FlutterDriver flutterDriver;

  setUpAll(() async{
    flutterDriver = await FlutterDriver.connect();
  });

  tearDownAll((){
    flutterDriver.close();
  });
  
  test('multiplying 2 by 2 should display 4', () async{
    await flutterDriver.tap(find.byValueKey('myTextFieldKey1'));
    await flutterDriver.enterText('2');

    await flutterDriver.tap(find.byValueKey('myTextFieldKey2'));
    await flutterDriver.enterText('2');

    await flutterDriver.waitFor(find.text('4'));

    /// run by ( flutter driver --target=test_driver/test_driver_app.dart --driver=test_driver/test_driver_act.dart
  });
}