import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum ErrorCode {
  PROBLEMS(1000);

  final int value;
  const ErrorCode(this.value);
}

class SharedContext extends ChangeNotifier {
  String? _jwttoken;
  int? _errorCode;

  bool get isAuthenticated => jwttoken != null;

  String? get jwttoken => _jwttoken;

  int? get errorCode => _errorCode;

  void setToken(String jwttoken) {
    _jwttoken = jwttoken;
    notifyListeners();
  }

  void setErrorCode(ErrorCode errorCode) {
    _errorCode = errorCode.value;
    notifyListeners();
  }
}

void handleError(context, ErrorCode errorCode) {
  final sharedContext = Provider.of<SharedContext>(context, listen: false);
  sharedContext.setErrorCode(errorCode);
}
