part of 'api_integration_bloc.dart';

abstract class ApiIntegrationEvent extends Equatable {
  const ApiIntegrationEvent();

  @override
  List<Object> get props => [];
}

class PostFetchEvent  extends ApiIntegrationEvent{}