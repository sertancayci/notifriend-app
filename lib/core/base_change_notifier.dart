import 'package:flutter/material.dart';
import 'package:notifriend/main.dart';

abstract class BaseChangeNotifier extends ChangeNotifier {
  bool _disposed = false;

  BaseChangeNotifier({
    required BuildContext buildContext,
    DataState? dataState,
    ViewState? viewState,
  }) {
    _dataState = dataState ?? DataState.Empty;
    _viewState = viewState ?? ViewState.Idle;
    context = buildContext;
  }

  late BuildContext context;
  ViewState _viewState = ViewState.Idle;

  ViewState get viewState => _viewState;

  set viewState(ViewState value) {
    _viewState = value;
    notifyListeners();
  }

  DataState _dataState = DataState.Empty;

  DataState get dataState => _dataState;

  set dataState(DataState value) {
    _dataState = value;
    notifyListeners();
  }

  bool get isIdle => _viewState == ViewState.Idle;

  bool get hasData => _dataState == DataState.HasData;

  // Future<void> Function() initData() => () async {
  //   viewState = ViewState.Busy;
  //   // await loadData();
  //   viewState = ViewState.Idle;
  // };

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  set errorMessage(String? message) {
    _errorMessage = message;
    // notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
    _disposed = true;
    logger.i('dispose');
  }

  @override
  void notifyListeners() {
    if (!_disposed) {
      super.notifyListeners();
    }
  }

  void addError(String message) {
    // if message is not null, append with \n
    errorMessage = errorMessage != null ? '$errorMessage\n$message' : message;
    viewState = ViewState.Error;
  }
}

enum ViewState { Idle, Busy, Error }

enum DataState { Empty, HasData }
