import 'package:flutter/src/widgets/page_view.dart';

class PageManager{
  PageManager(this._pageController);
  
  PageController _pageController;

  int page =0;

  void setPage(int value){
    if(value == page) return;
    page = value;
    _pageController.jumpToPage(value);
  }
}