import 'package:bloc/bloc.dart';
import 'package:bloclearning/services/api_services.dart';
import 'package:bloclearning/utils/enums.dart';
import 'package:equatable/equatable.dart';

import '../../../model/api_integration_model.dart';

part 'api_integration_event.dart';
part 'api_integration_state.dart';

class ApiIntegrationBloc extends Bloc<ApiIntegrationEvent, ApiIntegrationState> {
  PostReposiotry apicall =PostReposiotry();
  ApiIntegrationBloc() : super(const ApiIntegrationState()) {
    on<PostFetchEvent>(_fetchData);
  }
  void _fetchData(PostFetchEvent event,Emitter<ApiIntegrationState> emit)async{
    emit(state.copyWith(status: ApiLoadingStatus.loading));
    await apicall.fetchComment().then((value) {
      emit(state.copyWith(status: ApiLoadingStatus.success, list: value, msg: 'Success'));
    }).onError((error, stackTrace) {
      emit(state.copyWith(status: ApiLoadingStatus.error, msg: error.toString()));
    });
  }
}
    