import 'dart:js';

import 'package:cmp_adv_flt_udemy/presentation/resources/color_manager.dart';
import 'package:cmp_adv_flt_udemy/presentation/resources/font_manager.dart';
import 'package:cmp_adv_flt_udemy/presentation/resources/styles_manager.dart';
import 'package:cmp_adv_flt_udemy/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

import '/data/mapper/mapper.dart';
import '/data/network/failure.dart';
import '/presentation/resources/strings_manager.dart';

enum StateRendererType {
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
  StateRendererType stateRendererType;
  Failure failure;
  String message;
  String title;

  Function? retryActionFunction;

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
    return _getStateWidget(context);
  }

  Widget _getStateWidget(BuildContext context) {
    switch (stateRendererType) {
      case StateRendererType.POPUP_LOADING_STATE:
        return _getPopUpDialog(context);
        break;
      case StateRendererType.POPUP_ERROR_STATE:
        // TODO: Handle this case.
        break;
      case StateRendererType.FULL_SCREEN_LOADING_STATE:
        return _getItemsInColumn([_getAnimatedImage(),_getMessage(message)]);
      case StateRendererType.FULL_SCREEN_ERROR_STATE:
        return _getItemsInColumn([_getAnimatedImage(),_getMessage(failure.message,),_getRetryButton(AppStrings.retry_again,context),],);
      case StateRendererType.CONTENT_SCREEN_STATE:
        // TODO: Handle this case.
        break;
      case StateRendererType.EMPTY_SCREEN_STATE:
                return _getItemsInColumn([_getAnimatedImage(),_getMessage(message)]);
      default:
        Container();
    }
  }

Widget _getPopUpDialog(BuildContext context) {
  return Dialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppSize.s14,)
    ),
    elevation: AppSize.s1_5,
    backgroundColor: Colors.transparent,
    child: Container(
      decoration: BoxDecoration(
        color: ColorManager.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(AppSize.s14,),
        boxShadow: [BoxShadow(color: Colors.black26,blurRadius: AppSize.s12,offset: Offset(AppSize.s0,AppSize.s12,),),],
      ),
      child:  _getDialogContent(context),
    ),
  );
}

Widget _getDialogContent(BuildContext context) {

}

Widget _getAnimatedImage(){
  return SizedBox(
    height:  AppSize.s100,
    width: AppSize.s100,
    child: ,          //json image,
  );
}


Widget _getMessage(String message){
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(AppPadding.p18),
      child: Text(message,style: getMediumStyle(color: ColorManager.black,fontSize: FontSize.s16,),),
    ),
  );
}


Widget _getRetryButton(String buttonTitle, BuildContext context){
  return Padding(
    padding: const EdgeInsets.all(AppPadding.p18),
    child: SizedBox(width: AppSize.s180,
      child: ElevatedButton(onPressed: (){
        if(stateRendererType == StateRendererType.FULL_SCREEN_ERROR_STATE) {
          retryActionFunction?.call(); // to call the API function again to retry
        } else {
          Navigator.of(context).pop();  // popup state error so we need to dissmiss th dialog 
        }
      }, child: Text(buttonTitle)),
    ),
  );
}

  Widget _getItemsInColumn(List<Widget> children) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }
}
