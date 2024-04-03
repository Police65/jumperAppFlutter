import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class TaskListScreen extends StatefulWidget {
  final SupabaseClient supabase;

  TaskListScreen({required this.supabase});

  @override
  _TaskListScreenState createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  final TextEditingController _taskController = TextEditingController();

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
                    controller: _taskController,
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
                  onPressed: () {
                    _addTask(_taskController.text);
                  },
                  child: Text('Agregar'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

//APRENDI A PENSAR y le eche una ojeada al codigo del ANEXO III ya arregle el peo y retiro lo dicho en el anterior commit
//No tenia que complicarme tanto cuando simplemente requeria de una primary key
//para poder utilizar stream
  Widget _buildTaskList(BuildContext context) {
    return StreamBuilder<List<Map<String, dynamic>>>(
      stream: widget.supabase.from('tasks').stream(primaryKey: ['id']),
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
    await widget.supabase.from('tasks').insert({'name': taskName});
    _taskController.clear();
  }
}
