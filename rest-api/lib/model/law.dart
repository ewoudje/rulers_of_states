part of ros_rest_api.api;

class Law {
  /* This is the primary identifier for this object.  */
  int id = null;
  
  Map<String, Object> data = {};
  
  State state = null;
  Law();

  @override
  String toString() {
    return 'Law[id=$id, data=$data, state=$state, ]';
  }

  Law.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    data = Object.mapFromJson(json['data']);
    state = new State.fromJson(json['state']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'data': data,
      'state': state
    };
  }

  static List<Law> listFromJson(List<dynamic> json) {
    return json == null ? new List<Law>() : json.map((value) => new Law.fromJson(value)).toList();
  }

  static Map<String, Law> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, Law>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new Law.fromJson(value));
    }
    return map;
  }
}

