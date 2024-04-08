part of 'forms_bloc_bloc.dart';

class FormsBlocState extends Equatable {
  final TextEditingController comment; 
  final TextEditingController email; 
  final CommentApiModel? selectedData;
  final List<CommentApiModel> allAddedData;
  const FormsBlocState({required this.comment, required this.email,this.selectedData, this.allAddedData=const [] }); 
  FormsBlocState copyWith({TextEditingController? cmtCtlr,TextEditingController? emailCtlr,CommentApiModel? model, bool isReset=false,List<CommentApiModel>? data  }){ 
    log("cmtCtlrcmtCtlr:- ${cmtCtlr?.text}");
    return FormsBlocState(
      comment:cmtCtlr ?? TextEditingController(),
      email:emailCtlr ?? TextEditingController(),
      selectedData:isReset?null:model??selectedData,
      allAddedData:data??allAddedData
      );
  }
  
  @override
  List<Object?> get props => [comment, email,selectedData,allAddedData];
}

final class FormsBlocInitial extends FormsBlocState {
  FormsBlocInitial():super(
    comment: TextEditingController(),email :TextEditingController(),
    );
}
