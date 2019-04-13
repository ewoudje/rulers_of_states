part of ros_rest_api.api;

class State {
  
  int id = null;
  State();

  @override
  String toString() {
    return 'State[id=$id, ]';
  }

  State.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id
    };
  }

  static List<State> listFromJson(List<dynamic> json) {
    return json == null ? new List<State>() : json.map((value) => new State.fromJson(value)).toList();
  }

  static Map<String, State> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, State>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new State.fromJson(value));
    }
    return map;
  }
}

