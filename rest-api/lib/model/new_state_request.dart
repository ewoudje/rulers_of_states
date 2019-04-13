part of ros_rest_api.api;

class NewStateRequest {
  
  String name = null;
  NewStateRequest();

  @override
  String toString() {
    return 'NewStateRequest[name=$name, ]';
  }

  NewStateRequest.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name
    };
  }

  static List<NewStateRequest> listFromJson(List<dynamic> json) {
    return json == null ? new List<NewStateRequest>() : json.map((value) => new NewStateRequest.fromJson(value)).toList();
  }

  static Map<String, NewStateRequest> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, NewStateRequest>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new NewStateRequest.fromJson(value));
    }
    return map;
  }
}

