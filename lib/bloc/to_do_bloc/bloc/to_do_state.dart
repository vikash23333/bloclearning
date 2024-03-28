part of 'to_do_bloc.dart';

class ToDoState extends Equatable {
  final List<String> toDoList;
  const ToDoState({this.toDoList=const []});
  
  ToDoState copyWith({List<String>? list}){
    return ToDoState(
      toDoList: list??toDoList
    );
  }

  @override
  List<Object> get props => [toDoList];
}