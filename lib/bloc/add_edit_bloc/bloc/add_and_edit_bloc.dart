import 'package:bloc/bloc.dart';
import 'package:bloclearning/model/api_integration_model.dart';
import 'package:equatable/equatable.dart';
part 'add_and_edit_event.dart';
part 'add_and_edit_state.dart';

class AddAndEditBloc extends Bloc<AddAndEditEvent, AddAndEditState> {
  List<CommentApiModel> dataStored=[];
  AddAndEditBloc() : super(const AddAndEditState()) {
    on<SetComment>(_setComment);
    on<EmailChanged>(_emailChanged);
    on<NameModelSelected>(_setNameModel);
    on<ResetEventWhileAdding>(_resetEvent);
    on<FormSubmitted>(_addItem);
  }
  void _setComment(SetComment event, Emitter<AddAndEditState> emit){
    emit(state.copyWith(cmt: event.comment));
  }
  void _emailChanged(EmailChanged event, Emitter<AddAndEditState> emit){
    emit(state.copyWith(eml: event.email));
  }
  void _setNameModel(NameModelSelected event, Emitter<AddAndEditState> emit){
    emit(state.copyWith(selectedModel: event.selectedData));
  }
  void _resetEvent(ResetEventWhileAdding event, Emitter<AddAndEditState> emit){
    emit(state.copyWith(selectedModel: null, cmt: '',eml: '', isReset: true));
  }
  void _addItem(FormSubmitted event, Emitter<AddAndEditState> emit){
    CommentApiModel item =CommentApiModel(
      email: state.email,
      name: state.selectedData?.name,
      id:state.selectedData?.id,
      body: state.comment
    );
    dataStored.add(item);
    emit(state.copyWith(selectedModel: null, cmt: '',eml: '',data: dataStored,isReset: true));
  }
}
