part of ros_rest_api.api;

class InlineObject {
  
  String username = null;
  
  String password = null;
  
  String refreshToken = null;
  
  String code = null;
  
  String grantType = null;
  
  String scope = null;
  InlineObject();

  @override
  String toString() {
    return 'InlineObject[username=$username, password=$password, refreshToken=$refreshToken, code=$code, grantType=$grantType, scope=$scope, ]';
  }

  InlineObject.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    username = json['username'];
    password = json['password'];
    refreshToken = json['refresh_token'];
    code = json['code'];
    grantType = json['grant_type'];
    scope = json['scope'];
  }

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
      'refresh_token': refreshToken,
      'code': code,
      'grant_type': grantType,
      'scope': scope
    };
  }

  static List<InlineObject> listFromJson(List<dynamic> json) {
    return json == null ? new List<InlineObject>() : json.map((value) => new InlineObject.fromJson(value)).toList();
  }

  static Map<String, InlineObject> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, InlineObject>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new InlineObject.fromJson(value));
    }
    return map;
  }
}

