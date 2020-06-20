import 'dart:async';
import 'package:flutter/material.dart';

class Transformer {
  final processJson = StreamTransformer<Map<String, dynamic>,
      Map<String, dynamic>>.fromHandlers(handleData: (jsondata, sink) {
    if (jsondata.isNotEmpty) {
      sink.add(jsondata['data']);
    } else {
      sink.addError('Data is not reachable');
    }
  });

  final procrssSize =
      StreamTransformer<Size, Size>.fromHandlers(handleData: (sizedata, sink) {
    if (sizedata.isEmpty) {
      sink.addError('Traffic');
    } else {
      sink.add(sizedata);
    }
  });
}
