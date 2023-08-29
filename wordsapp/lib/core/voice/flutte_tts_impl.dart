import 'package:flutter_tts/flutter_tts.dart';
import 'package:wordsapp/core/voice/flutter_tts_interface.dart';

class FlutterTtsImpl implements FlutterTtsInterface {
  late FlutterTts _flutterTts;

  FlutterTtsImpl._internal() {
    _flutterTts = FlutterTts();
  }

  static final FlutterTtsImpl _singleton = FlutterTtsImpl._internal();

  static FlutterTtsImpl get instance => _singleton;

  @override
  Future<dynamic> speak(String text) async {
    return _flutterTts.speak(text);
  }
}
