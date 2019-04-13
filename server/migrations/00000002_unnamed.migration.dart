import 'dart:async';
import 'package:aqueduct/aqueduct.dart';   

class Migration2 extends Migration { 
  @override
  Future upgrade() async {
   		database.createTable(SchemaTable("_Law", [SchemaColumn("id", ManagedPropertyType.bigInteger, isPrimaryKey: true, autoincrement: true, isIndexed: false, isNullable: false, isUnique: false),SchemaColumn("data", ManagedPropertyType.document, isPrimaryKey: false, autoincrement: false, isIndexed: false, isNullable: false, isUnique: false)]));
		database.addColumn("_Law", SchemaColumn.relationship("state", ManagedPropertyType.bigInteger, relatedTableName: "_State", relatedColumnName: "id", rule: DeleteRule.cascade, isNullable: true, isUnique: false));
		database.alterColumn("_MilitaryUnit", "military", (c) {c.isUnique = false;});
		database.alterColumn("_MilitaryUnit", "technology", (c) {c.isUnique = false;});
		database.alterColumn("_MilitaryTechnology", "military", (c) {c.isUnique = false;});
  }
  
  @override
  Future downgrade() async {}
  
  @override
  Future seed() async {}
}
    