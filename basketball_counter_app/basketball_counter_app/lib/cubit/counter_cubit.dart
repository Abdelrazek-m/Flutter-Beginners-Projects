import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitial());

  int teamAPoint=0;
  int teamBPoint=0;

  void teamIncrement({required String team, required int buttonNumber}){
    if(team=='A'){
      teamAPoint+=buttonNumber;
      emit(CounterAIncrementState());
    }else{
      teamBPoint+=buttonNumber;
      emit(CounterBIncrementState());
    }
  }

  void resutCounter(){
    teamAPoint=teamBPoint=0;
    emit(CounterResuttState());
  }
}
