import 'dart:async';
import 'package:aqueduct/aqueduct.dart';   

class Migration5 extends Migration { 
  @override
  Future upgrade() async {
   		database.addColumn("_Military", SchemaColumn("turnsAgo", ManagedPropertyType.integer, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: false, isUnique: false), unencodedInitialValue: "0");
		database.alterColumn("_Military", "state", (c) {c.isUnique = false;});
		database.addColumn("_State", SchemaColumn("description", ManagedPropertyType.string, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: true, isUnique: false));
		database.addColumn("_Economics", SchemaColumn("turnsAgo", ManagedPropertyType.integer, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: false, isUnique: false), unencodedInitialValue: "0");
		database.alterColumn("_Economics", "state", (c) {c.isUnique = false;});
		database.addColumn("_People", SchemaColumn("turnsAgo", ManagedPropertyType.integer, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: false, isUnique: false), unencodedInitialValue: "0");
		database.alterColumn("_People", "state", (c) {c.isUnique = false;});
  }
  
  @override
  Future downgrade() async {}
  
  @override
  Future seed() async {}
}
    