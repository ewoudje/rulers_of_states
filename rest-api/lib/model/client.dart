part of ros_rest_api.api;

class Client {
  
  String id = null;
  Client();

  @override
  String toString() {
    return 'Client[id=$id, ]';
  }

  Client.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id
    };
  }

  static List<Client> listFromJson(List<dynamic> json) {
    return json == null ? new List<Client>() : json.map((value) => new Client.fromJson(value)).toList();
  }

  static Map<String, Client> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, Client>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new Client.fromJson(value));
    }
    return map;
  }
}

