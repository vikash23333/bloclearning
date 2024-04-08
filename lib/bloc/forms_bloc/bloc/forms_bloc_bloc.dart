import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../model/api_integration_model.dart';
part 'forms_bloc_event.dart';
part 'forms_bloc_state.dart';

class FormsBlocBloc extends Bloc<FormsBlocEvent, FormsBlocState> {
  List<CommentApiModel> dataStored=[];
  FormsBlocBloc() : super(FormsBlocInitial()) {
    on<SetComment>(_setComment);
    on<SetEmail>(_setEmail);
    on<SetNameModel>(_setModelName);
    on<FormResetWhileAdding>(_resetEvent);
    on<FormSubmitEvent>(_addItem);
    
    
  }
  void _setComment(SetComment event, Emitter<FormsBlocState> emit){
    emit(state.copyWith(cmtCtlr: event.comment));
  }
  void _setEmail(SetEmail event, Emitter<FormsBlocState> emit){
    emit(state.copyWith(emailCtlr: event.email));
  }
  void _setModelName(SetNameModel event, Emitter<FormsBlocState> emit){
    emit(state.copyWith(model: event.selectedData));
  }
  void _resetEvent(FormResetWhileAdding event, Emitter<FormsBlocState> emit){
      emit(state.copyWith(cmtCtlr:null, isReset: true, emailCtlr: null, model: null)); 
  }
  void _addItem(FormSubmitEvent event, Emitter<FormsBlocState> emit){
    log("state.email.text:- ${state.email.text}");
    log("state.comment.text:- ${state.comment.text}");
    CommentApiModel item =CommentApiModel(
      email: state.email.text,
      name: state.selectedData?.name,
      id:state.selectedData?.id,
      body: state.comment.text
    );
    dataStored.add(item);
    emit(state.copyWith(data: dataStored));
  }
}
