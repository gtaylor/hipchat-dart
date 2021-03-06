library hipchat;

import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

part 'src/room.dart';
part 'src/endpoints/rooms.dart';

/**
 * A class that abstracts access to the HipChat web API v2.
 */
class HipChatClient {
  static const String API_URL = 'https://api.hipchat.com/v2';
  // The user's API key.
  String apiKey;
  
  HipChatClient(this.apiKey);
  
  /**
   * Returns a standard Map of headers for use with the HipChat API.
   */
  Map _getHeaders() {
    return {
      'Authorization': 'Bearer ${this.apiKey}',
      'content-type': 'application/json',
    };
  }
  
  /**
   * Retrieves a list (via a Future) of [HipChatRoom] instances 
   * representing all of the account's rooms.
   */
  Future<List> getRooms() {
    return RoomEndpoint.getRooms(this);
  }
  
  /**
   * Sends a notification to an existing room.
   */
  Future sendRoomNotification(roomNameOrIdOrInstance, message,
                              {String color: 'yellow', bool notify: false, 
                               String message_format: 'html'}) {
    return RoomEndpoint.sendRoomNotification(this, roomNameOrIdOrInstance,
        message, color, notify, message_format);
  }

}

