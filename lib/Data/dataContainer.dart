import 'package:hive_flutter/hive_flutter.dart';

abstract class DataContainer {
  String get myName;
  List _dataList = [];

  final _dataBox = Hive.box('dataBox');

  void initData() {
    if (_dataBox.containsKey(myName)) {
      _dataList = _dataBox.get(myName);
    } else {
      createData();
    }
  }

  void createData();

  int get length {
    return _dataList.length;
  }

  void add(data) {
    _dataList.add(data);
    _dataBox.put(myName, _dataList);
  }

  void remove(int index) {
    _dataList.removeAt(index);
    _dataBox.put(myName, _dataList);
  }

  dynamic getData(int index) {
    return _dataList[index];
  }

  void updateData(){
    _dataBox.put(myName, _dataList);
  }
}
