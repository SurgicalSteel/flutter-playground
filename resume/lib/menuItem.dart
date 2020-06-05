import 'package:flutter/foundation.dart';

class MenuItem{
  String title;
  String icon;
  Function onTappedFunction;
  MenuItem(this.title, this.icon, this.onTappedFunction);
}