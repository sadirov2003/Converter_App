import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exchange_rates_app/keyboard/bloc/keyboard_event.dart';

class KeyboardBloc extends Bloc<KeyboardEvent, String> {
  KeyboardBloc() : super('0') {
    on<KeyboardEvent>(_onButtonPressed);
  }

  _onButtonPressed(KeyboardEvent event, Emitter<String> emit) {
    if (event.buttonText == 'C') {
      emit('0');
    } else if (event.buttonText == '×') {
      emit(state.substring(0, state.length - 1));
      if (state == '') {
        emit('0');
      }
    } else {
      if (state == '0') {
        emit(event.buttonText);
      } else {
        emit(state + event.buttonText);
      }
    }
  }
}
