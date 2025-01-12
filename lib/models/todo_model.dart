import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class TodoModel extends Equatable {
  final String title;
  final String subtitle;
  final IconData? data1;
  final IconData? data2;

  const TodoModel({
    required this.title,
    required this.subtitle,
    this.data1 = Icons.edit,
    this.data2 = Icons.delete,
  });

  @override
  List<Object?> get props => [title, subtitle, data1, data2];
}

List<TodoModel> todos = [
  const TodoModel(title: 'Project Research', subtitle: 'idk'),
  const TodoModel(
      title: 'Work on Medical App',
      subtitle: 'щас разберём дом и заново построим'),
  const TodoModel(
      title: 'Make tasks for new tasks', subtitle: 'вообще хз что тут писать'),
  const TodoModel(title: 'сигна для Навии', subtitle: 'всего 42 крутки'),
  const TodoModel(
      title: 'купить колбасу', subtitle: 'что делать когда тебя все обижают'),
  const TodoModel(
      title: 'а тут сами придумывайте', subtitle: 'HELPPPPPPPPPPPPPPP'),
];
