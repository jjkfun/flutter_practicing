part of 'todo_bloc.dart';

abstract class TodoEvent {
  const TodoEvent();
}

class EditButtonTappedEvent extends TodoEvent {}

class LoadTodosEvent extends TodoEvent {
  final List<TodoModel> todos;

  const LoadTodosEvent({required this.todos});

  @override
  List<Object?> get props => [todos];
}

class AddTaskEvent extends TodoEvent {
  final TodoModel newTask;

  const AddTaskEvent({required this.newTask});

  @override
  List<Object?> get props => [newTask];
}

class UpdateTaskEvent extends TodoEvent {
  final int index;
  final TodoModel updatedTask;

  UpdateTaskEvent({required this.index, required this.updatedTask});

  @override
  List<Object?> get props => [index, updatedTask];
}

class DeleteTaskEvent extends TodoEvent {
  final int index;

  const DeleteTaskEvent({required this.index});

  @override
  List<Object?> get props => [index];
}
