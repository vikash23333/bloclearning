import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'to_do_event.dart';
part 'to_do_state.dart';

class ToDoBloc extends Bloc<ToDoEvent, ToDoState> {
  List<String> tList =[];
  ToDoBloc() : super(const ToDoState()) {
    on<AddToDoEvent>(_addToDo);
    on<DeleteToDoEvent>(_deleteToDo);
  }
  void _addToDo(AddToDoEvent event, Emitter<ToDoState> emit){
    tList.add(event.task); 
    emit(state.copyWith(list: List.from(tList)));
  }
  void _deleteToDo(DeleteToDoEvent event, Emitter<ToDoState> emit){
    tList.remove(event.obj);
    emit(state.copyWith(list: List.from(tList)));
  }
}
