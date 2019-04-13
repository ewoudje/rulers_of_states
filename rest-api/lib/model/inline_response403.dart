part of ros_rest_api.api;

class InlineResponse403 {
  
  String error = null;
  /* The required scope for this operation. */
  String scope = null;
  InlineResponse403();

  @override
  String toString() {
    return 'InlineResponse403[error=$error, scope=$scope, ]';
  }

  InlineResponse403.fromJson(Map<String, dynamic> json) {
    if (json == null) return;
    error = json['error'];
    scope = json['scope'];
  }

  Map<String, dynamic> toJson() {
    return {
      'error': error,
      'scope': scope
    };
  }

  static List<InlineResponse403> listFromJson(List<dynamic> json) {
    return json == null ? new List<InlineResponse403>() : json.map((value) => new InlineResponse403.fromJson(value)).toList();
  }

  static Map<String, InlineResponse403> mapFromJson(Map<String, dynamic> json) {
    var map = new Map<String, InlineResponse403>();
    if (json != null && json.length > 0) {
      json.forEach((String key, dynamic value) => map[key] = new InlineResponse403.fromJson(value));
    }
    return map;
  }
}

