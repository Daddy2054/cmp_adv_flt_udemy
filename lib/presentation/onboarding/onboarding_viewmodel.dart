// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import '/presentation/resources/assetss_manager.dart';
import '/presentation/resources/strings_manager.dart';

import '/domain/model.dart';

import '../base/baseviewmodel.dart';

class OnBoardingViewModel extends BaseViewModel
    with OnBoardingViewModelInputs, OnBoardingViewModelOutputs {
//stream controllers

  final StreamController _streamController =
      StreamController<SlideViewObject>();

  late final List<SliderObject> _list;
  int _currentIndex = 0;

  @override
  void dispose() {
    _streamController.close();
  }

  @override
  void start() {
    _list = _getSliderData();
    // send this slider data to our view
    _postDatatoView();
  }

  @override
  void goNext() {
    int nextIndex = _currentIndex++; // +1
    if (nextIndex >= _list.length) {
      _currentIndex = 0; // infinite loop to go to first item inside the slider
    }
    _postDatatoView();
  }

  @override
  void goPrevious() {
    int previousIndex = _currentIndex--; // -1
    if (previousIndex == -1) {
      _currentIndex =
          _list.length - 1; // infinite loop to go to the length of slider list
    }
        _postDatatoView();
  }

  @override
  void onPageChanged(int index) {
    _currentIndex = index;
    _postDatatoView();
  }

  @override
  Sink get inputSliderViewObject => _streamController.sink;

  // outputs
  @override
  Stream<SlideViewObject> get outputSliderViewObject =>
      _streamController.stream.map(
        (slideViewObject) => slideViewObject,
      );
// privat functions
  List<SliderObject> _getSliderData() => [
        SliderObject(AppStrings.onBoardingTitle1,
            AppStrings.onBoardingSubTitle1, ImageAssets.onboardingLogo1),
        SliderObject(AppStrings.onBoardingTitle2,
            AppStrings.onBoardingSubTitle2, ImageAssets.onboardingLogo2),
        SliderObject(AppStrings.onBoardingTitle3,
            AppStrings.onBoardingSubTitle3, ImageAssets.onboardingLogo3),
        SliderObject(AppStrings.onBoardingTitle4,
            AppStrings.onBoardingSubTitle4, ImageAssets.onboardingLogo4)
      ];

  _postDatatoView() {
    inputSliderViewObject.add(
      SlideViewObject(
        _list[_currentIndex],
        _list.length,
        _currentIndex,
      ),
    );
  }
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
