part of 'switch_example_bloc.dart';

class SwitchExampleState extends Equatable {
  final bool notificationVal;
  final double sliderVal;
  const SwitchExampleState({ this.notificationVal=true, this.sliderVal=0.1});
  
  SwitchExampleState copyWith({bool? isSwitch, double? slider}){
    return SwitchExampleState(notificationVal:isSwitch??notificationVal, sliderVal:slider??sliderVal);
  }

  @override
  List<Object> get props => [notificationVal, sliderVal];
}
 