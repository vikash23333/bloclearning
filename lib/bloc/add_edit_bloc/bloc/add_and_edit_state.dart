part of 'add_and_edit_bloc.dart';

class AddAndEditState extends Equatable {

  final String comment;
  final String email;
  final CommentApiModel? selectedData;
  final List<CommentApiModel> allAddedData;
  const AddAndEditState({this.comment='', this.email='', this.selectedData, this.allAddedData=const [] });


  AddAndEditState copyWith({String? cmt,String? eml,CommentApiModel? selectedModel, List<CommentApiModel>? data, bool isReset=false}){
    return AddAndEditState( 
      comment: cmt??comment,
      email: eml??email,
      selectedData:isReset?null: selectedModel??selectedData,
      allAddedData:data??allAddedData
    );
  }
  @override
  List<Object?> get props => [comment, email,selectedData, allAddedData];
} 