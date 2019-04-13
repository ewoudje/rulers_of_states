part of ros_rest_api.api;

class ManagedAuthToken {
  /* This is the primary identifier for this object.  */
  int id = null;
  /* No two objects may have the same value for this field.  */
  String code = null;
  /* No two objects may have the same value for this field.  */
  String accessToken = null;
  /* No two objects may have the same value for this field.  */
  String refreshToken = null;
  
  String scope = null;
  
  DateTime issueDate = null;
  
  DateTime expirationDate = null;
  
  String type = null;
  
  State resourceOwner = null;
  
  Client client = null;
  ManagedAuthToken();

  @override
  String toString() {
    return 'ManagedAuthToken[id=$id, code=$code, accessToken=$accessToken, refreshToken=$refreshToken, scope=$scope, issueDate=$issueDate, expirationDate=$expirationDate, type=$type, resourceOwner=$resourceOwner, client=$client, ]';
  }

  ManagedAuthToken.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    code = json['code'];
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
    scope = json['scope'];
    issueDate = json['issueDate'] == null ? null : DateTime.parse(json['issueDate']);
    expirationDate = json['expirationDate'] == null ? null : DateTime.parse(json['expirationDate']);
    type = json['type'];
    resourceOwner = new State.fromJson(json['resourceOwner']);
    client = new Client.fromJson(json['client']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'code': code,
      'accessToken': accessToken,
      'refreshToken': refreshToken,
      'scope': scope,
      'issueDate': issueDate == null ? '' : issueDate.toUtc().toIso8601String(),
      'expirationDate': expirationDate == null ? '' : expirationDate.toUtc().toIso8601String(),
      'type': type,
      'resourceOwner': resourceOwner,
      'client': client
    };
  }

  static List<ManagedAuthToken> listFromJson(List<dynamic> json) {
    return json == null ? new List<ManagedAuthToken>() : json.map((value) => new ManagedAuthToken.fromJson(value)).toList();
  }

  static Map<String, ManagedAuthToken> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, ManagedAuthToken>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new ManagedAuthToken.fromJson(value));
    }
    return map;
  }
}

