part of ros_rest_api.api;

class Economics {
  /* This is the primary identifier for this object.  */
  int id = null;
  
  int turnsAgo = null;
  
  State state = null;
  Economics();

  @override
  String toString() {
    return 'Economics[id=$id, turnsAgo=$turnsAgo, state=$state, ]';
  }

  Economics.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    turnsAgo = json['turnsAgo'];
    state = new State.fromJson(json['state']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'turnsAgo': turnsAgo,
      'state': state
    };
  }

  static List<Economics> listFromJson(List<dynamic> json) {
    return json == null ? new List<Economics>() : json.map((value) => new Economics.fromJson(value)).toList();
  }

  static Map<String, Economics> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, Economics>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new Economics.fromJson(value));
    }
    return map;
  }
}

