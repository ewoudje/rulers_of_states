part of ros_rest_api.api;

class InlineResponse4001 {
  
  String error = null;
  
  int code = null;
  InlineResponse4001();

  @override
  String toString() {
    return 'InlineResponse4001[error=$error, code=$code, ]';
  }

  InlineResponse4001.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    error = json['error'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    return {
      'error': error,
      'code': code
    };
  }

  static List<InlineResponse4001> listFromJson(List<dynamic> json) {
    return json == null ? new List<InlineResponse4001>() : json.map((value) => new InlineResponse4001.fromJson(value)).toList();
  }

  static Map<String, InlineResponse4001> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, InlineResponse4001>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new InlineResponse4001.fromJson(value));
    }
    return map;
  }
}

