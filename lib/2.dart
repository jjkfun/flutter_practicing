import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practicing_flutter/bloc/todo_bloc.dart';
import '../models/todo_model.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 14, right: 14, top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Today',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        String title = '';
                        String subtitle = '';
                        return AlertDialog(
                          title: const Text('Add Task'),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextField(
                                decoration:
                                    const InputDecoration(labelText: 'Title'),
                                onChanged: (value) => title = value,
                              ),
                              TextField(
                                decoration: const InputDecoration(
                                    labelText: 'Subtitle'),
                                onChanged: (value) => subtitle = value,
                              ),
                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                context.read<TodoBloc>().add(
                                      AddTaskEvent(
                                        newTask: TodoModel(
                                          title: title,
                                          subtitle: subtitle,
                                        ),
                                      ),
                                    );
                                Navigator.pop(context);
                              },
                              child: const Text('Add'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: const Text(
                    'Add task',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
            const Text(
              'Productive Day, Sourav',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: Colors.black26,
              ),
            ),
            const SizedBox(height: 18),
            Expanded(
              child: BlocBuilder<TodoBloc, TodoState>(
                builder: (context, state) {
                  if (state is TodoLoaded) {
                    // return const Center(child: Text('Ошибка состояния')); // раскоментируйте
                    return ListView.builder(
                      itemCount: state.todos.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: const CircleAvatar(
                            backgroundColor: Colors.indigoAccent,
                          ),
                          title: Text(state.todos[index].title),
                          subtitle: Text(
                            state.todos[index].subtitle,
                            style: const TextStyle(fontSize: 13),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      String updatedTitle =
                                          state.todos[index].title;
                                      String updatedSubtitle =
                                          state.todos[index].subtitle;
                                      return AlertDialog(
                                        title: const Text('Update Task'),
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            TextField(
                                              decoration: const InputDecoration(
                                                  labelText: 'Title'),
                                              controller: TextEditingController(
                                                  text: updatedTitle),
                                              onChanged: (value) =>
                                                  updatedTitle = value,
                                            ),
                                            TextField(
                                              decoration: const InputDecoration(
                                                  labelText: 'Subtitle'),
                                              controller: TextEditingController(
                                                  text: updatedSubtitle),
                                              onChanged: (value) =>
                                                  updatedSubtitle = value,
                                            ),
                                          ],
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text('Cancel'),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              context.read<TodoBloc>().add(
                                                    UpdateTaskEvent(
                                                      index: index,
                                                      updatedTask: TodoModel(
                                                        title: updatedTitle,
                                                        subtitle:
                                                            updatedSubtitle,
                                                      ),
                                                    ),
                                                  );
                                              Navigator.pop(context);
                                            },
                                            child: const Text('Update'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                icon: const Icon(Icons.edit),
                              ),
                              IconButton(
                                onPressed: () {
                                  context
                                      .read<TodoBloc>()
                                      .add(DeleteTaskEvent(index: index));
                                },
                                icon: const Icon(Icons.delete),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  } else if (state is TodoInitial) {
                    context.read<TodoBloc>().add(LoadTodosEvent(todos: todos));
                    return const Center(child: CircularProgressIndicator());
                  }
                  return const Center(child: Text('No tasks available.'));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
