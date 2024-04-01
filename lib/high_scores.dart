import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:supabase/supabase.dart';

class HighScores {
  static late final SharedPreferences prefs;
  static final highScores = List.filled(5, 0, growable: false);

  static const String SUPABASE_CLIENT_ANON_KEY =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im5yaHhzZXJud3hhb3Vkb2V6a2doIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTE4NTgwNzMsImV4cCI6MjAyNzQzNDA3M30.tp6tC88PsPxInGhLF6dz2Rt4N_bLEDAnp1Jm3a1E254';
  static const String SUPABASE_URL =
      'https://nrhxsernwxaoudoezkgh.supabase.co/rest/v1/puntaje';

  static Future<void> load() async {
    prefs = await SharedPreferences.getInstance();
    for (int i = 0; i < 5; i++) {
      int score = prefs.getInt('score$i') ?? 0;
      highScores[i] = score;
    }
  }

  static Future<void> saveNewScore(int score) async {
    for (int i = 0; i < 5; i++) {
      if (highScores[i] < score) {
        for (int j = 4; j > i; j--) {
          highScores[j] = highScores[j - 1];
        }
        highScores[i] = score;
        break;
      }
    }

    for (int i = 0; i < 5; i++) {
      await prefs.setInt('score$i', highScores[i]);
    }

    // Envía los puntajes a Supabase
    await sendScoresToSupabase(highScores);
  }

  static Future<void> sendScoresToSupabase(List<int> scores) async {
    final headers = {
      'apikey': SUPABASE_CLIENT_ANON_KEY,
      'Authorization': 'Bearer $SUPABASE_CLIENT_ANON_KEY',
      'Content-Type': 'application/json',
    };

    final jsonData = scores.map((score) => {'score': score}).toList();
    final response = await http.post(
      SUPABASE_URL,
      headers: headers,
      body: jsonData,
    );

    if (response.statusCode == 200) {
      print('Puntajes enviados exitosamente a Supabase');
    } else {
      print('Error al enviar los puntajes a Supabase: ${response.statusCode}');
    }
  }
}
