import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:new_super_jumper/assets.dart';
import 'package:new_super_jumper/high_scores.dart';
import 'package:new_super_jumper/my_game.dart';
import 'package:new_super_jumper/navigation/routes.dart';
import 'package:new_super_jumper/ui/game_over_menu.dart';
import 'package:new_super_jumper/ui/pause_menu.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.device.fullScreen();

  const supabaseUrl = 'https://nrhxsernwxaoudoezkgh.supabase.co';
  const supabaseKey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im5yaHhzZXJud3hhb3Vkb2V6a2doIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTE4NTgwNzMsImV4cCI6MjAyNzQzNDA3M30.tp6tC88PsPxInGhLF6dz2Rt4N_bLEDAnp1Jm3a1E254';
  await Supabase.initialize(url: supabaseUrl, anonKey: supabaseKey);

  await HighScores.load();
  await Assets.load();
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: Routes.routes,
    ),
  );
}

class MyGameWidget extends StatelessWidget {
  const MyGameWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GameWidget(
      game: MyGame(),
      overlayBuilderMap: {
        'GameOverMenu': (context, MyGame game) {
          return GameOverMenu(game: game);
        },
        'PauseMenu': (context, MyGame game) {
          return PauseMenu(game: game);
        }
      },
    );
  }
}
