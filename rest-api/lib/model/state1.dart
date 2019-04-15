part of ros_rest_api.api;

class State1 {
  /* This is the primary identifier for this object.  */
  int id = null;
  /* No two objects may have the same value for this field.  */
  String name = null;
  
  String description = null;
  
  int size = null;
  
  User user = null;
  
  User ouser = null;
  
  List<People> people = [];
  
  List<Military> military = [];
  
  List<Economics> economics = [];
  
  List<Law> laws = [];
  State1();

  @override
  String toString() {
    return 'State1[id=$id, name=$name, description=$description, size=$size, user=$user, ouser=$ouser, people=$people, military=$military, economics=$economics, laws=$laws, ]';
  }

  State1.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    id = json['id'];
    name = json['name'];
    description = json['description'];
    size = json['size'];
    user = new User.fromJson(json['user']);
    ouser = new User.fromJson(json['ouser']);
    people = People.listFromJson(json['people']);
    military = Military.listFromJson(json['military']);
    economics = Economics.listFromJson(json['economics']);
    laws = Law.listFromJson(json['laws']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'size': size,
      'user': user,
      'ouser': ouser,
      'people': people,
      'military': military,
      'economics': economics,
      'laws': laws
    };
  }

  static List<State1> listFromJson(List<dynamic> json) {
    return json == null ? new List<State1>() : json.map((value) => new State1.fromJson(value)).toList();
  }

  static Map<String, State1> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, State1>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new State1.fromJson(value));
    }
    return map;
  }
}

