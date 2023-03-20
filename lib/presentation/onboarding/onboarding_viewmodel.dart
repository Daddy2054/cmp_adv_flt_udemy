import '../base/baseviewmodel.dart';

class OnBoardingViewMode extends BaseViewModel
    with OnBoardingViewModelInputs, OnBoardingViewModelOutputs {
//stream controllers


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
}

// inputs mean the orders that our view model will receive from our view
abstract class OnBoardingViewModelInputs {
  void goNext(); //when user clicks on right arrow
  void goPrevious(); //when user clicks on left arrow
  void onPageChanged(int index);
}

// outputs mean data or results taht will be sent from out view model to our view
abstract class OnBoardingViewModelOutputs {
  //will be implement it later
}
