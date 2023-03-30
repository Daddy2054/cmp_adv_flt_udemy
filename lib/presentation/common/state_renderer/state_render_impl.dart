import 'package:cmp_adv_flt_udemy/data/mapper/mapper.dart';
import 'package:flutter/material.dart';

import '/presentation/common/state_renderer/state_renderer.dart';
import '/presentation/resources/strings_manager.dart';

abstract class FlowState {
  StateRendererType getStateRendererType();

  String getMessage();
}

// Loading State (POPUP, FULL SCREEN)

class LoadingState extends FlowState {
  StateRendererType stateRendererType;
  String message;

  LoadingState({required this.stateRendererType, String? message})
      : message = message ?? AppStrings.loading;

  @override
  String getMessage() => message;

  @override
  StateRendererType getStateRendererType() => stateRendererType;
}

//error state (popup,full loading)
class ErrorState extends FlowState {
  StateRendererType stateRendererType;
  String message;

  ErrorState(this.stateRendererType, this.message);

  @override
  String getMessage() => message;

  @override
  StateRendererType getStateRendererType() => stateRendererType;
}

// CONTENT STATE
class ContentState extends FlowState {
  ContentState();

  @override
  String getMessage() => EMPTY;

  @override
  StateRendererType getStateRendererType() =>
      StateRendererType.CONTENT_SCREEN_STATE;
}

// EMPTY STATE
class EmptyState extends FlowState {
  String message;

  EmptyState(this.message);

  @override
  String getMessage() => message;

  @override
  StateRendererType getStateRendererType() =>
      StateRendererType.EMPTY_SCREEN_STATE;
}

extension FlowStateExtension on FlowState {
  Widget getScreenWidget(
    BuildContext context,
    Widget contentScreenWidget,
    Function retryActionFunction,
  ) {
    switch (runtimeType) {
      case LoadingState:
        {
          break;
        }
      case ErrorState:
        {
          break;
        }
      case ContentState:
        {
          break;
        }
      case EmptyState:
        {
          break;
        }

      default:
    }
  }
}
