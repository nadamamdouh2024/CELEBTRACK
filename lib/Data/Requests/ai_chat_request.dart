import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../Core/App_Apis/app_apis.dart';

class AiChatRequest {
  final List<Map<String, dynamic>> _history = [];

  Future<String> sendMessage(String message) async {

    final url = Uri.parse(
      'https://generativelanguage.googleapis.com/v1beta/models/gemini-3.6-flash:generateContent',
    );
    final currentDate = DateTime.now().toIso8601String().split('T').first;

    _history.add({
      'role': 'user',
      'parts': [
        {'text': message}
      ]
    });

    final recentHistory = _history.length > 3
        ? _history.sublist(_history.length - 3)
        : _history;

    try {
      final response = await http.post(
        url,

        headers: {
          'Content-Type': 'application/json',
          'x-goog-api-key': AppApis.geminiApiKey.trim(),
        },
        body: json.encode({
          'systemInstruction': {
            'parts': [
              {
                'text': 'You are a helpful and concise assistant. Today\'s date is $currentDate. Answer directly, accurately, and avoid unnecessary filler.'
              }
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