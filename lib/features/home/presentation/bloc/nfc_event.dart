part of 'nfc_bloc.dart';

@immutable
abstract class NfcEvent {}


class StartNFCEvent extends NfcEvent{

}

class AddNfcTagEvent extends NfcEvent{
  final String decodedPayload;
  AddNfcTagEvent({this.decodedPayload});
}
