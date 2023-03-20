// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import '/domain/model.dart';

import '../base/baseviewmodel.dart';

class OnBoardingViewModel extends BaseViewModel
    with OnBoardingViewModelInputs, OnBoardingViewModelOutputs {
//stream controllers

  final StreamController _streamController =
      StreamController<SlideViewObject>();
  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  void start() {
    // TODO: implement start
  }

  @override
  void goNext() {
    // TODO: implement goNext
  }

  @override
  void goPrevious() {
    // TODO: implement goPrevious
  }

  @override
  void onPageChanged(int index) {
    // TODO: implement onPageChanged
  }
  
  @override
  // TODO: implement inputSliderViewObject
  Sink get inputSliderViewObject => throw UnimplementedError();
  
  @override
  // TODO: implement outputSliderViewObject
  Stream<SlideViewObject> get outputSliderViewObject => throw UnimplementedError();
}

// inputs mean the orders that our view model will receive from our view
abstract class OnBoardingViewModelInputs {
  void goNext(); //when user clicks on right arrow
  void goPrevious(); //when user clicks on left arrow
  void onPageChanged(int index);

  Sink
      get inputSliderViewObject; //this is the way to add data to the stream ..stream input
}

// outputs mean data or results taht will be sent from out view model to our view
abstract class OnBoardingViewModelOutputs {
  Stream<SlideViewObject> get outputSliderViewObject;
}

class SlideViewObject {
  SliderObject sliderObject;
  int numOfSlides;
  int currentIndex;
  SlideViewObject(
    this.sliderObject,
    this.numOfSlides,
    this.currentIndex,
  );
}
