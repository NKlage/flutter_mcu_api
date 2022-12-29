import 'dart:io';

class ApiResponses {
  static const String _jsonRootFolder = 'test/api_responses';
  static const String characterList = '$_jsonRootFolder/character-list.json';
  static const String comicList = '$_jsonRootFolder/comic-list.json';
  static const String creatorList = '$_jsonRootFolder/creator-list.json';
  static const String eventList = '$_jsonRootFolder/event-list.json';

  static Future<String> jsonResponse(String responseFile) async {
    final file = File(responseFile);
    return await file.readAsString();
  }
}
