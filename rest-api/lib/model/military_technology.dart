part of ros_rest_api.api;

class MilitaryTechnology {
  /* This is the primary identifier for this object.  */
  int id = null;
  
  String name = null;
  
  int power = null;
  
  State military = null;
  
  List<MilitaryUnit> usedIn = [];
  MilitaryTechnology();

  @override
  String toString() {
    return 'MilitaryTechnology[id=$id, name=$name, power=$power, military=$military, usedIn=$usedIn, ]';
  }

  MilitaryTechnology.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    name = json['name'];
    power = json['power'];
    military = new State.fromJson(json['military']);
    usedIn = MilitaryUnit.listFromJson(json['usedIn']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'power': power,
      'military': military,
      'usedIn': usedIn
    };
  }

  static List<MilitaryTechnology> listFromJson(List<dynamic> json) {
    return json == null ? new List<MilitaryTechnology>() : json.map((value) => new MilitaryTechnology.fromJson(value)).toList();
  }

  static Map<String, MilitaryTechnology> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, MilitaryTechnology>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new MilitaryTechnology.fromJson(value));
    }
    return map;
  }
}

