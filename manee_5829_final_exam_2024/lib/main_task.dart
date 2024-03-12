import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class Task {
  final String title;
  bool isCompleted;

  Task(this.title, this.isCompleted);
}

class TaskListModel extends ChangeNotifier {
  List<Task> _tasks = [];

  List<Task> get tasks => _tasks;

  void addTask(String title) {
    _tasks.add(Task(title, false));
    notifyListeners();
  }

  void toggleTaskCompletion(int index) {
    _tasks[index].isCompleted = !_tasks[index].isCompleted;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task List App',
      home: ChangeNotifierProvider(
        create: (context) => TaskListModel(),
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Task List App'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: 'Enter task title',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (_controller.text.isNotEmpty) {
                Provider.of<TaskListModel>(context).addTask(_controller.text);
                _controller.clear();
              }
            },
            child: Text('Add Task'),
          ),
          Expanded(
            child: Consumer<TaskListModel>(
              builder: (context, taskListModel, child) {
                return ListView.builder(
                  itemCount: taskListModel.tasks.length,
                  itemBuilder: (context, index) {
                    Task task = taskListModel.tasks[index];
                    return ListTile(
                      title: Text(task.title),
                      trailing: Checkbox(
                        value: task.isCompleted,
                        onChanged: (value) {
                          Provider.of<TaskListModel>(
                            context,
                          ).toggleTaskCompletion(index);
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
