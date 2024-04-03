import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class TaskListScreen extends StatelessWidget {
  final SupabaseClient supabase;

  TaskListScreen({required this.supabase});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Tareas'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                // Agregar tarea
                await _addTask('Nueva tarea');
              },
              child: Text('Agregar Tarea'),
            ),
            ElevatedButton(
              onPressed: () async {
                // Eliminar tarea
                await _deleteTask(1); // Poner el ID de la tarea a eliminar
              },
              child: Text('Eliminar Tarea'),
            ),
          ],
        ),
      ),
    );
  }

  // Función para agregar una tarea
  Future<void> _addTask(String taskName) async {
    final response = await supabase.from('tasks').insert({'name': taskName});
    if (response.error == null) {
      // Tarea agregada exitosamente
    } else {
      // Manejar error
    }
  }

  // Función para eliminar una tarea
  Future<void> _deleteTask(int taskId) async {
    final response =
        await supabase.from('tasks').delete().match({'id': taskId});
    if (response.error == null) {
      // Tarea eliminada exitosamente
    } else {
      // Manejar error
    }
  }
}
