import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'xx_event.dart';
part 'xx_state.dart';

class XxBloc extends Bloc<XxEvent, XxState> {
  XxBloc() : super(XxInitial()) {
    on<XxEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
