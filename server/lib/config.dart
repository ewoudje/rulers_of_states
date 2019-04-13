import 'dart:io';

import 'ros_server.dart';

class Config extends Configuration {

  Config(String path): super.fromFile(File(path));

  DatabaseConfiguration database;
}