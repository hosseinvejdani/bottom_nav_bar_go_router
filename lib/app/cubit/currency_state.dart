// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'currency_cubit.dart';

class CurrencyState extends Equatable {
  const CurrencyState(
    this.ctype,
  );

  final CurrencyType ctype;

  @override
  List<Object> get props => [ctype];
}
