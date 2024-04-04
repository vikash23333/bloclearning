import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'add_and_edit_event.dart';
part 'add_and_edit_state.dart';

class AddAndEditBloc extends Bloc<AddAndEditEvent, AddAndEditState> {
  AddAndEditBloc() : super(const AddAndEditState()) {
    on<AddAndEditEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
