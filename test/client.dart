/**
 * Tests for the Dart HipChat API client.
 * 
 * Before you can run these tests, you'll need to copy the 
 * test_config.dart.example file to test_config.dart and edit the API_KEY
 * constant.
 */
library hipchattest;

import 'package:unittest/unittest.dart';
import 'package:hipchat/hipchat.dart';

part 'test_config.dart';

main() {
 test('Tests room listing', () {
   var client = new HipChatClient(API_KEY);
   client.getRooms()
     .then((rooms) {
       print("ROOMS");
       print(rooms);
     });
 });
}