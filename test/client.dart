library hipchattest;

import 'package:unittest/unittest.dart';
import 'package:hipchat/hipchat.dart';

part 'test_config.dart';

main() {
 test('An empty test', () {
   // a test with expectations and matchers
   var client = new HipChatClient(API_KEY);
   client.getRooms()
     .then((rooms) {
       print("ROOMS");
       print(rooms);
     });
 });
}