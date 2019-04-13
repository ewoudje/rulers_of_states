part of ros_rest_api.api;

class MilitaryUnit {
  /* This is the primary identifier for this object.  */
  int id = null;
  
  String name = null;
  
  int trainingQ = null;
  
  int size = null;
  
  State military = null;
  
  State technology = null;
  MilitaryUnit();

  @override
  String toString() {
    return 'MilitaryUnit[id=$id, name=$name, trainingQ=$trainingQ, size=$size, military=$military, technology=$technology, ]';
  }

  MilitaryUnit.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    name = json['name'];
    trainingQ = json['trainingQ'];
    size = json['size'];
    military = new State.fromJson(json['military']);
    technology = new State.fromJson(json['technology']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'trainingQ': trainingQ,
      'size': size,
      'military': military,
      'technology': technology
    };
  }

  static List<MilitaryUnit> listFromJson(List<dynamic> json) {
    return json == null ? new List<MilitaryUnit>() : json.map((value) => new MilitaryUnit.fromJson(value)).toList();
  }

  static Map<String, MilitaryUnit> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, MilitaryUnit>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new MilitaryUnit.fromJson(value));
    }
    return map;
  }
}

