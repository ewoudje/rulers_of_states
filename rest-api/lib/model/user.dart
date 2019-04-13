part of ros_rest_api.api;

class User {
  
  String password = null;
  /* No two objects may have the same value for this field.  */
  String email = null;
  /* This is the primary identifier for this object.  */
  int id = null;
  /* No two objects may have the same value for this field.  */
  String username = null;
  
  State state = null;
  
  State oldState = null;
  
  List<ManagedAuthToken> tokens = [];
  User();

  @override
  String toString() {
    return 'User[password=$password, email=$email, id=$id, username=$username, state=$state, oldState=$oldState, tokens=$tokens, ]';
  }

  User.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    password = json['password'];
    email = json['email'];
    id = json['id'];
    username = json['username'];
    state = new State.fromJson(json['state']);
    oldState = new State.fromJson(json['oldState']);
    tokens = ManagedAuthToken.listFromJson(json['tokens']);
  }

  Map<String, dynamic> toJson() {
    return {
      'password': password,
      'email': email,
      'id': id,
      'username': username,
      'state': state,
      'oldState': oldState,
      'tokens': tokens
    };
  }

  static List<User> listFromJson(List<dynamic> json) {
    return json == null ? new List<User>() : json.map((value) => new User.fromJson(value)).toList();
  }

  static Map<String, User> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, User>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new User.fromJson(value));
    }
    return map;
  }
}

