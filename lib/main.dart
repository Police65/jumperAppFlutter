import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'task_list_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://vhbuculgldxtegtmzbrr.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZoYnVjdWxnbGR4dGVndG16YnJyIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTIxMTQzNjIsImV4cCI6MjAyNzY5MDM2Mn0.Xs1WXosE9TeO0QcmcjvxKP9shj0png4McdddDu3TP5I',
  );

  final supabase = Supabase.instance.client;

  runApp(MyApp(supabase: supabase));
}

class MyApp extends StatelessWidget {
  final SupabaseClient supabase;

  MyApp({required this.supabase});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Tareas en Tiempo Real',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TaskListScreen(supabase: supabase),
    );
  }
}
