import 'package:flutter/src/widgets/page_view.dart';

class PageManager{
  PageManager(this._pageController);
  
  PageController _pageController;

  void setPage(int value){
    _pageController.jumpToPage(value);
  }
}