part of 'to_do_bloc.dart';

abstract class ToDoEvent extends Equatable {
  const ToDoEvent(); 
}
class AddToDoEvent extends ToDoEvent{
  final String task;
  const AddToDoEvent({required this.task});
  @override
  List<Object> get props => [task];
}
class DeleteToDoEvent extends ToDoEvent{
  final Object obj;
  const DeleteToDoEvent({required this.obj});
  @override
  List<Object> get props => [obj];
}