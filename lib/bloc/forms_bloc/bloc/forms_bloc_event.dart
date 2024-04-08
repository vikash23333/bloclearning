part of 'forms_bloc_bloc.dart';

abstract class FormsBlocEvent extends Equatable {
  const FormsBlocEvent();

  @override
  List<Object?> get props => [];
}
class SetComment extends FormsBlocEvent {
  final TextEditingController comment;
  const SetComment(this.comment);
  @override
  List<Object> get props => [comment];
}
class SetEmail extends FormsBlocEvent {
  final TextEditingController email;
  const SetEmail(this.email);
  @override
  List<Object> get props => [email];
}
class SetNameModel extends FormsBlocEvent {
  final CommentApiModel? selectedData;
  const SetNameModel(this.selectedData);
  @override
  List<Object?> get props => [selectedData];
}
class FormResetWhileAdding extends FormsBlocEvent{}
class FormSubmitEvent extends FormsBlocEvent{}
