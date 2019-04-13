import '../ros_server.dart';

import 'state.dart';

class Military extends ManagedObject<_Military> implements _Military {}

class _Military {
  @primaryKey
  int id;

  @Relate(#military, onDelete: DeleteRule.cascade)
  State state;

  ManagedSet<MilitaryUnit> units;
  ManagedSet<MilitaryTechnology> technologies;
}

class MilitaryUnit extends ManagedObject<_MilitaryUnit> implements _MilitaryUnit {}

class _MilitaryUnit {
  @primaryKey
  int id;

  @Relate(#units, onDelete: DeleteRule.cascade)
  Military military;

  String name;

  int trainingQ;

  int size;

  @Relate(#usedIn, onDelete: DeleteRule.cascade)
  MilitaryTechnology technology;
}

class MilitaryTechnology extends ManagedObject<_MilitaryTechnology> implements _MilitaryTechnology {}

enum MilitaryTechnologyType {
  INFANTRY,
  FAST_INFANTRY,
  MECHANIZED,
  FAST_MECHANIZED,
  AIRBORNE,
  FAST_AIRBORNE
}

class _MilitaryTechnology {
  @primaryKey
  int id;

  @Relate(#technologies, onDelete: DeleteRule.cascade)
  Military military;

  String name;

  int power;

  MilitaryTechnologyType type;

  ManagedSet<MilitaryUnit> usedIn;
}