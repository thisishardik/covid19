import 'dart:async';

import 'package:covid19tracker/bloc/transformer.dart';
import 'package:flutter/cupertino.dart';

class Bloc extends Transformer {
  final responseRoot = StreamController<Map<String, dynamic>>.broadcast();

  Stream<Map<String, dynamic>> get responses =>
      responseRoot.stream.transform(processJson);

  Function(Map<String, dynamic>) get addResponse => responseRoot.sink.add;

  dispose() {
    responseRoot.close();
  }
}

final bloc = Bloc();
