part of ros_rest_api.api;

class ManagedAuthClient {
  /* This is the primary identifier for this object.  */
  String id = null;
  
  String hashedSecret = null;
  
  String salt = null;
  
  String redirectURI = null;
  
  String allowedScope = null;
  
  List<ManagedAuthToken> tokens = [];
  ManagedAuthClient();

  @override
  String toString() {
    return 'ManagedAuthClient[id=$id, hashedSecret=$hashedSecret, salt=$salt, redirectURI=$redirectURI, allowedScope=$allowedScope, tokens=$tokens, ]';
  }

  ManagedAuthClient.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    hashedSecret = json['hashedSecret'];
    salt = json['salt'];
    redirectURI = json['redirectURI'];
    allowedScope = json['allowedScope'];
    tokens = ManagedAuthToken.listFromJson(json['tokens']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'hashedSecret': hashedSecret,
      'salt': salt,
      'redirectURI': redirectURI,
      'allowedScope': allowedScope,
      'tokens': tokens
    };
  }

  static List<ManagedAuthClient> listFromJson(List<dynamic> json) {
    return json == null ? new List<ManagedAuthClient>() : json.map((value) => new ManagedAuthClient.fromJson(value)).toList();
  }

  static Map<String, ManagedAuthClient> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, ManagedAuthClient>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new ManagedAuthClient.fromJson(value));
    }
    return map;
  }
}

