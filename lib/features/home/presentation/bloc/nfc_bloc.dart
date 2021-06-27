import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:pedantic/pedantic.dart';

part 'nfc_event.dart';
part 'nfc_state.dart';

class NfcBloc extends Bloc<NfcEvent, NfcState> {


  @override
  NfcState get initialState => NfcInitial();


  @override
  Stream<NfcState> mapEventToState(
    NfcEvent event,
  ) async* {


    if(event is StartNFCEvent){
      yield  Loading();
      print('start NFC');
      var isAvailable = await NfcManager.instance.isAvailable();

      if(!isAvailable){
        yield NfcNotSupportedState();
      }
      else{

      unawaited(NfcManager.instance.startSession(
        onDiscovered: (NfcTag tag) async {
          var ndef = Ndef.from(tag);
          var record = ndef.cachedMessage.records.first;
          var decodedPayload = ascii.decode(record.payload);

          add(AddNfcTagEvent(decodedPayload: decodedPayload));
        },
      ));
    }
    }


    if(event is AddNfcTagEvent){
      yield NfcSuccessState(nfcData: event.decodedPayload);
    }
  }


}
