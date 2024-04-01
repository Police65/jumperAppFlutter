import 'package:supabase_flutter/supabase_flutter.dart';

class HighScores {
  static Future<void> saveNewScore(int score) async {
    final supabaseClient = Supabase.instance.client;

    final response =
        await supabaseClient.from('puntaje').insert({'score': score}).execute();

    if (response.error != null) {
      print(
          'Error al guardar el puntaje en Supabase: ${response.error!.message}');
    } else {
      print('Puntaje guardado exitosamente en Supabase');
    }
  }
}
