part of 'api_integration_bloc.dart';
class ApiIntegrationState extends Equatable {//CommentApiModel
  final ApiLoadingStatus apiStatus;
  final List<CommentApiModel> commentList;
  final String message;
  const ApiIntegrationState({this.apiStatus=ApiLoadingStatus.success, this.commentList=const [], this.message =''});

  ApiIntegrationState copyWith({ApiLoadingStatus? status, List<CommentApiModel>? list, String? msg}){
    return ApiIntegrationState(
      apiStatus: status??apiStatus,
      commentList: list??commentList,
      message:msg??message
    );
  }

  
  @override
  List<Object> get props => [apiStatus, commentList];
} 