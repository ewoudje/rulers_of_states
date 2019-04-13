part of ros_rest_api.api;

class MilitaryUnit1 {
  /* This is the primary identifier for this object.  */
  int id = null;
  
  String name = null;
  
  int trainingQ = null;
  
  int size = null;
  
  State military = null;
  
  State technology = null;
  MilitaryUnit1();

  @override
  String toString() {
    return 'MilitaryUnit1[id=$id, name=$name, trainingQ=$trainingQ, size=$size, military=$military, technology=$technology, ]';
  }

  MilitaryUnit1.fromJson(Map<String, dynamic> json) {
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

  static List<MilitaryUnit1> listFromJson(List<dynamic> json) {
    return json == null ? new List<MilitaryUnit1>() : json.map((value) => new MilitaryUnit1.fromJson(value)).toList();
  }

  static Map<String, MilitaryUnit1> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, MilitaryUnit1>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new MilitaryUnit1.fromJson(value));
    }
    return map;
  }
}

