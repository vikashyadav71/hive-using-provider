import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
class CountPro with ChangeNotifier{

  int _count=0;
  int get count=>_count;
  void fun(int val)async{
    var boxes= await Hive.openBox('vikas');
    _count=boxes.get('count');
    notifyListeners();
  }

}