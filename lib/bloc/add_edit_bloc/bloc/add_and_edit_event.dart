part of 'add_and_edit_bloc.dart';

abstract class AddAndEditEvent extends Equatable {
  const AddAndEditEvent();
  @override
  List<Object?> get props => [];
}

class SetComment extends AddAndEditEvent {
  final String comment;
  const SetComment(this.comment);
  @override
  List<Object?> get props => [comment];
}

class EmailChanged extends AddAndEditEvent {
  final String email;
  const EmailChanged(this.email);
  @override
  List<Object?> get props => [email];
}

class NameModelSelected extends AddAndEditEvent {
  final CommentApiModel? selectedData;
  const NameModelSelected(this.selectedData);
  @override
  List<Object?> get props => [selectedData];
}

class FormSubmitted extends AddAndEditEvent {}
class ResetEventWhileAdding extends AddAndEditEvent {}