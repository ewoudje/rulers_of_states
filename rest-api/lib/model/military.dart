part of ros_rest_api.api;

class Military {
  /* This is the primary identifier for this object.  */
  int id = null;
  
  State state = null;
  
  List<MilitaryUnit> units = [];
  
  List<MilitaryTechnology> technologies = [];
  Military();

  @override
  String toString() {
    return 'Military[id=$id, state=$state, units=$units, technologies=$technologies, ]';
  }

  Military.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    state = new State.fromJson(json['state']);
    units = MilitaryUnit.listFromJson(json['units']);
    technologies = MilitaryTechnology.listFromJson(json['technologies']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'state': state,
      'units': units,
      'technologies': technologies
    };
  }

  static List<Military> listFromJson(List<dynamic> json) {
    return json == null ? new List<Military>() : json.map((value) => new Military.fromJson(value)).toList();
  }

  static Map<String, Military> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, Military>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new Military.fromJson(value));
    }
    return map;
  }
}

