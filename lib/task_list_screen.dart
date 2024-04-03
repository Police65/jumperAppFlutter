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
        backgroundColor: Color(0xFF2c2f33),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: _buildTaskList(context),
            ),
          ),
          Container(
            color: Color(0xFF23272a),
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Ingrese una nueva tarea',
                      filled: true,
                      fillColor: Color(0xFF99aab5),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onSubmitted: (value) {
                      _addTask(value);
                    },
                  ),
                ),
                SizedBox(width: 8.0),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Agregar'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

//OK parece que
//El método execute() no se aplica directamente al PostgrestFilterBuilder
//En su lugar, debo usarlo en el resultado de la consulta
//después de aplicar el filtro
//hubiera sido bueno saber eso la semana pasada
  Widget _buildTaskList(BuildContext context) {
    return StreamBuilder<List<Map<String, dynamic>>>(
      stream: supabase.from('tasks').select().execute(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        final tasks = snapshot.data ?? [];

        if (tasks.isEmpty) {
          return Center(child: Text('No hay tareas'));
        }

        return ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            final task = tasks[index];
            return ListTile(
              title: Text(task['name'] ?? ''),
            );
          },
        );
      },
    );
  }

  Future<void> _addTask(String taskName) async {
    await supabase.from('tasks').insert({'name': taskName});
  }
}
