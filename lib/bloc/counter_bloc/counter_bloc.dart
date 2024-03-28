import 'package:bloc/bloc.dart';

import 'counter_event.dart';
import 'counter_state.dart';

class CounterBlock extends Bloc<CounterEvent,CounterState>{
  CounterBlock(): super(const CounterState()){
    // on((event, emit) => null)
    on<IncrementCounter>(_increment);
    on<DecrimentCounter>(_decriment);
  }
  void _increment(IncrementCounter event, Emitter<CounterState> emit){
    emit(state.copyWith(counter:state.counter+1));
  }
  void _decriment(DecrimentCounter event, Emitter<CounterState> emit){
    if (state.counter>0) {
      emit(state.copyWith(counter:state.counter-1));
    } 
  }

  
}