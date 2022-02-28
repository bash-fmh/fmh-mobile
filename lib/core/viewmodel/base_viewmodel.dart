import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fmh_mobile/core/constant/enum.dart';
import 'package:fmh_mobile/core/constant/strings_constant.dart';
import 'package:fmh_mobile/core/exception/failure.dart';
import 'package:fmh_mobile/core/exception/unauthorized.dart';
import 'package:fmh_mobile/core/model/viewstate_error.dart';
import 'package:fmh_mobile/core/service/flavor_manager.dart';
import 'package:flutter/scheduler.dart';
import 'package:fmh_mobile/core/service/localization/get_localization.dart';

abstract class BaseViewModel with ChangeNotifier {
  bool _disposed = false;

  ViewState _viewState;

  ViewStateError? _viewStateError;

  ViewStateError? get viewStateError => _viewStateError;

  BaseViewModel({ViewState? viewState})
      : _viewState = viewState ?? ViewState.idle;

  ViewState get viewState => _viewState;

  bool get isBusy => _viewState == ViewState.busy;

  bool get isIdle => _viewState == ViewState.idle;

  bool get isEmpty => _viewState == ViewState.empty;

  bool get isError => _viewState == ViewState.error;

  set viewState(ViewState viewState) {
    if (_viewState != viewState) {
      _viewState = viewState;
      SchedulerBinding.instance?.schedulerPhase ==
              SchedulerPhase.persistentCallbacks
          ? SchedulerBinding.instance?.addPostFrameCallback((_) {
              notifyListeners();
            })
          : notifyListeners();
    }
  }

  void setIdle() {
    viewState = ViewState.idle;
  }

  void setEmpty() {
    viewState = ViewState.empty;
  }

  void setBusy() {
    viewState = ViewState.busy;
  }

  void setError(dynamic e, dynamic stackTrace, {String? title}) {
    ViewStateErrorType errorType = ViewStateErrorType.defaultError;
    String? message;
    int? errorCode;

    if (e is DioError) {
      if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.sendTimeout ||
          e.type == DioErrorType.receiveTimeout) {
        errorType = ViewStateErrorType.networkError;
        message = e.error;
      } else if (e.type == DioErrorType.response) {
        message = e.error;
      } else if (e.type == DioErrorType.cancel) {
        message = e.error;
      } else if (e.error is SocketException) {
        errorType = ViewStateErrorType.networkError;
        message = getLocalization.noInternet;
      } else if (e.error is UnAuthorizedException) {
        errorType = ViewStateErrorType.unauthorizedError;
        message = e.error.toString();
        //maybe logout user
      } else {
        message = e.error.toString();
      }
    } else if (e is FailureException) {
      message = e.toString();
      errorCode = e.error.code;
    } else {
      message = e.toString();
    }
    _viewStateError = ViewStateError(errorType,
        message: message ?? '', title: title, errorCode: errorCode);
    viewState = ViewState.error;
    if (FlavorManager.instance.isDev) {
      print('$e $stackTrace');
    }
    onError(viewStateError);
  }

  void onError(ViewStateError? viewStateError) {}

  @override
  void notifyListeners() {
    if (!_disposed) {
      super.notifyListeners();
    }
  }

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }
}
