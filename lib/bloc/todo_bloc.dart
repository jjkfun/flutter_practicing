import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:practicing_flutter/models/todo_model.dart';

part 'todo_event.dart';

part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoInitial()) {
    on<LoadTodosEvent>((event, emit) {
      emit(TodoLoaded(todos: event.todos));
    });

    on<AddTaskEvent>((event, emit) {
      if (state is TodoLoaded) {
        final currentState = state as TodoLoaded;
        emit(TodoLoaded(
            todos: List.from(currentState.todos)..add(event.newTask)));
      }
    });

    on<UpdateTaskEvent>((event, emit) {
      if (state is TodoLoaded) {
        final currentState = state as TodoLoaded;
        final updatedTodos = List<TodoModel>.from(currentState.todos);
        updatedTodos[event.index] = event.updatedTask;
        emit(TodoLoaded(todos: updatedTodos));
      }
    });

    on<DeleteTaskEvent>((event, emit) {
      if (state is TodoLoaded) {
        final currentState = state as TodoLoaded;
        final updatedTodos = List<TodoModel>.from(currentState.todos)
          ..removeAt(event.index);
        emit(TodoLoaded(todos: updatedTodos));
      }
    });
  }
}
