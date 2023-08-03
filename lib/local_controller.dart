import 'package:flutter/cupertino.dart';

class LocalController extends ChangeNotifier{
  late Locale local;

  changeLocale(Locale newLocal){
    local = newLocal;
    notifyListeners();
  }

  LocalController({
    required this.local,
  });
}