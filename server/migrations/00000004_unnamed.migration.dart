import 'dart:async';
import 'package:aqueduct/aqueduct.dart';   

class Migration4 extends Migration { 
  @override
  Future upgrade() async {
   		database.deleteColumn("_MilitaryTechnology", "type");
  }
  
  @override
  Future downgrade() async {}
  
  @override
  Future seed() async {}
}
    