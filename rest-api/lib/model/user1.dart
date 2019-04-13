part of ros_rest_api.api;

class User1 {
  
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
  User1();

  @override
  String toString() {
    return 'User1[password=$password, email=$email, id=$id, username=$username, state=$state, oldState=$oldState, tokens=$tokens, ]';
  }

  User1.fromJson(Map<String, dynamic> json) {
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

  static List<User1> listFromJson(List<dynamic> json) {
    return json == null ? new List<User1>() : json.map((value) => new User1.fromJson(value)).toList();
  }

  static Map<String, User1> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, User1>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new User1.fromJson(value));
    }
    return map;
  }
}

