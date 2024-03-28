import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'switch_example_event.dart';
part 'switch_example_state.dart';

class SwitchExampleBloc extends Bloc<SwitchExampleEvent, SwitchExampleState> {
  SwitchExampleBloc() : super(const SwitchExampleState()) {
    on<EnableAndDisableNotification>(_enableAndDisableNotification);
    on<SliderEvent>(_slider);
  }
  void _enableAndDisableNotification(EnableAndDisableNotification event,Emitter<SwitchExampleState> emit){
    emit(state.copyWith(isSwitch: !state.notificationVal));
  }
  void _slider(SliderEvent event,Emitter<SwitchExampleState> emit){
    emit(state.copyWith(slider: event.slider));
  }
}
