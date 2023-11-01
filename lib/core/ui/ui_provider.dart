import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UIProvider extends ChangeNotifier {
  BuildContext buildContext;

  UIProvider({required this.buildContext});

  bool _isLocalAbsorbing = false;

  bool get isLocalAbsorbing => _isLocalAbsorbing;

  set isLocalAbsorbing(bool value) {
    _isLocalAbsorbing = value;
    notifyListeners();
  }

  bool _isGlobalAbsorbing = false;

  bool get isGlobalAbsorbing => _isGlobalAbsorbing;

  set isGlobalAbsorbing(bool value) {
    _isGlobalAbsorbing = value;
    notifyListeners();
  }

  void updateAbsorbing(bool absorbing, {bool isGlobal = false}) {
    if (isGlobal) {
      isGlobalAbsorbing = absorbing;
    } else {
      isLocalAbsorbing = absorbing;
    }
  }
}

