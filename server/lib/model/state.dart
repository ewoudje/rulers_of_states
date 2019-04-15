import '../ros_server.dart';

import 'economics.dart';
import 'law.dart';
import 'military.dart';
import 'people.dart';
import 'user.dart';

class State extends ManagedObject<_State> implements _State {
  static Future<State> newState(ManagedContext context, String name, User user) async {
    return await context.transaction((transaction) async {
      var state = await (Query<State>(transaction)
        ..values.size = 2
        ..values.name = name
      ).insert();

      final people = (Query<People>(transaction)
        ..values.happiness = 10
        ..values.quantity = 100
        ..values.state = state
      ).insert();

      final economics = (Query<Economics>(transaction)
        ..values.state = state
      ).insert();

      final military = await(Query<Military>(transaction)
          ..values.state = state
      ).insert();

      var tech = await (Query<MilitaryTechnology>(transaction)
        ..values.name = "Rocks"
        ..values.power = 1
        //..values.type = MilitaryTechnologyType.INFANTRY
        ..values.military = military
      ).insert();

      await (Query<MilitaryUnit>(transaction)
        ..values.name = "${tech.name} Warriors Unit. 1"
        ..values.size = 100
        ..values.technology = tech
        ..values.trainingQ = 100
        ..values.military = military
      ).insert();

      await (Query<User>(transaction)
        ..where((t) => t.id).equalTo(user.id)
        ..values.state = state
      ).updateOne();

      await people;
      await economics;

      final query = Query<State>(transaction)
        ..where((t) => t.id).equalTo(state.id)
        ..join(set: (t) => t.people)
        ..join(set: (t) => t.economics);

      query.join(set: (t) => t.military)
        ..join(set: (t) => t.technologies)
        ..join(set: (t) => t.units)
      ;

      return await query.fetchOne();
    });
  }
}

class _State {
  @primaryKey
  int id;

  @Column(unique: true)
  String name;

  @Column(nullable: true)
  String description;

  User user;
  User ouser;

  @Column()
  int size;

  ManagedSet<People> people;
  ManagedSet<Military> military;
  ManagedSet<Economics> economics;

  ManagedSet<Law> laws;
}