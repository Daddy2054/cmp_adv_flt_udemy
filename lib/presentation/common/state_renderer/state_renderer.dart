import 'package:cmp_adv_flt_udemy/data/mapper/mapper.dart';
import 'package:cmp_adv_flt_udemy/data/network/failure.dart';
import 'package:cmp_adv_flt_udemy/presentation/resources/strings_manager.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

enum StateRenderType {
  //POPUP SATATES
  POPUP_LOADING_STATE,
  POPUP_ERROR_STATE,
  //FULL SCREEN STATES
  FULL_SCREEN_LOADING_STATE,
  FULL_SCREEN_ERROR_STATE,

  CONTENT_SCREEN_STATE, //the ui of the screen
  EMPTY_SCREEN_STATE //empty view when we receive no data from API side for LIST SCREEN
}

class StateRenderer extends StatelessWidget {
  StateRenderer stateRendererType;
  Failure failure;
  String message;
  String title;

  Function retryActionFunction;

  StateRenderer(
      {Key? key,
      required this.stateRendererType,
      Failure? failure,
      String? message,
      String? title,
      required this.retryActionFunction})
      : message = message ?? AppStrings.loading,
        title = title ?? EMPTY,
        failure = failure ?? DefaultFailure(),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
