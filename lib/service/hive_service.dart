import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:sfframework/constant/config.dart';

class HiveService {
  var localDataBox = Hive.box(localData);

  setData(String key, String value) {
    localDataBox.put(key, value);
  }

  getData(String key) {
    return json.decode(localDataBox.get(key));
  }

  isExist(String key) {
    bool s = localDataBox.containsKey(key);
    return s;
  }

  void clearData() {
    localDataBox.clear();
  }

  closelocalDataBox() {
    localDataBox.close();
  }
}
