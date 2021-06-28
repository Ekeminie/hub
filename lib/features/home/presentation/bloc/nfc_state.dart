part of 'nfc_bloc.dart';

@immutable
abstract class NfcState {}

class NfcInitial extends NfcState {}


class NfcNotSupportedState extends NfcState{

}


class Loading extends NfcState{

}
class NfcSuccessState extends NfcState{
  final String nfcData;
  NfcSuccessState({this.nfcData});

}
