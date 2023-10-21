import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'currency_state.dart';

enum CurrencyType { aa, bb, cc }

class UserCubit extends Cubit<CurrencyState> {
  UserCubit() : super(const CurrencyState(CurrencyType.aa));

  changeCurrency(CurrencyType ctype) {
    emit(CurrencyState(ctype));
  }
}
