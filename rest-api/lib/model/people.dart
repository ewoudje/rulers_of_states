part of ros_rest_api.api;

class People {
  /* This is the primary identifier for this object.  */
  int id = null;
  
  int turnsAgo = null;
  
  int happiness = null;
  
  int quantity = null;
  
  State state = null;
  People();

  @override
  String toString() {
    return 'People[id=$id, turnsAgo=$turnsAgo, happiness=$happiness, quantity=$quantity, state=$state, ]';
  }

  People.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    turnsAgo = json['turnsAgo'];
    happiness = json['happiness'];
    quantity = json['quantity'];
    state = new State.fromJson(json['state']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'turnsAgo': turnsAgo,
      'happiness': happiness,
      'quantity': quantity,
      'state': state
    };
  }

  static List<People> listFromJson(List<dynamic> json) {
    return json == null ? new List<People>() : json.map((value) => new People.fromJson(value)).toList();
  }

  static Map<String, People> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, People>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new People.fromJson(value));
    }
    return map;
  }
}

