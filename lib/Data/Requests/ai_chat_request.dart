import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../Core/App_Apis/app_apis.dart';

class AiChatRequest {
  final List<Map<String, dynamic>> _history = [];

  Future<String> sendMessage(String message) async {
    final url = Uri.parse(
      'https://generativelanguage.googleapis.com/v1beta/models/gemini-3.6-flash:generateContent?key=${AppApis.geminiApiKey}',
    );

    _history.add({
      'role': 'user',
      'parts': [
        {'text': message}
      ]
    });


    final recentHistory = _history.length > 6
        ? _history.sublist(_history.length - 6)
        : _history;

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'systemInstruction': {
            'parts': [
              {'text': 'You are a helpful and concise assistant. Answer directly and avoid unnecessary introductory filler.'}
            ]
          },
          'contents': recentHistory,
        }),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final reply = data['candidates']?[0]?['content']?['parts']?[0]?['text'];

        if (reply != null) {
          _history.add({
            'role': 'model',
            'parts': [
              {'text': reply}
            ]
          });
          return reply;
        }
        return 'No response text found.';
      } else {
        final errorData = json.decode(response.body);
        final errorMessage = errorData['error']?['message'] ?? response.body;
        throw Exception(errorMessage);
      }
    } catch (e) {
      if (_history.isNotEmpty && _history.last['role'] == 'user') {
        _history.removeLast();
      }
      throw Exception(e.toString().replaceAll('Exception: ', ''));
    }
  }
}