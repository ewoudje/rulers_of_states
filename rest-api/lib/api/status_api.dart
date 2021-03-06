part of ros_rest_api.api;



class StatusApi {
  final ApiClient apiClient;

  StatusApi([ApiClient apiClient]) : apiClient = apiClient ?? defaultApiClient;

  /// 
  ///
  /// 
  Future<State1> getSelfStatus({ int turnsAgo }) async {
    Object postBody;

    // verify required params are set

    // create path and map variables
    String path = "/status".replaceAll("{format}","json");

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};
    if(turnsAgo != null) {
      queryParams.addAll(_convertParametersForCollectionFormat("", "turns-ago", turnsAgo));
    }

    List<String> contentTypes = [];

    String contentType = contentTypes.length > 0 ? contentTypes[0] : "application/json";
    List<String> authNames = ["oauth2"];

    if(contentType.startsWith("multipart/form-data")) {
      bool hasFields = false;
      MultipartRequest mp = new MultipartRequest(null, null);
      if(hasFields)
        postBody = mp;
    }
    else {
    }

    var response = await apiClient.invokeAPI(path,
                                             'GET',
                                             queryParams,
                                             postBody,
                                             headerParams,
                                             formParams,
                                             contentType,
                                             authNames);

    if(response.statusCode >= 400) {
      throw new ApiException(response.statusCode, response.body);
    } else if(response.body != null) {
      return apiClient.deserialize(response.body, 'State1') as State1;
    } else {
      return null;
    }
  }
  /// 
  ///
  /// 
  Future<State1> getStatus(int state, { int turnsAgo }) async {
    Object postBody;

    // verify required params are set
    if(state == null) {
     throw new ApiException(400, "Missing required param: state");
    }

    // create path and map variables
    String path = "/{state}/status".replaceAll("{format}","json").replaceAll("{" + "state" + "}", state.toString());

    // query params
    List<QueryParam> queryParams = [];
    Map<String, String> headerParams = {};
    Map<String, String> formParams = {};
    if(turnsAgo != null) {
      queryParams.addAll(_convertParametersForCollectionFormat("", "turns-ago", turnsAgo));
    }

    List<String> contentTypes = [];

    String contentType = contentTypes.length > 0 ? contentTypes[0] : "application/json";
    List<String> authNames = ["oauth2"];

    if(contentType.startsWith("multipart/form-data")) {
      bool hasFields = false;
      MultipartRequest mp = new MultipartRequest(null, null);
      if(hasFields)
        postBody = mp;
    }
    else {
    }

    var response = await apiClient.invokeAPI(path,
                                             'GET',
                                             queryParams,
                                             postBody,
                                             headerParams,
                                             formParams,
                                             contentType,
                                             authNames);

    if(response.statusCode >= 400) {
      throw new ApiException(response.statusCode, response.body);
    } else if(response.body != null) {
      return apiClient.deserialize(response.body, 'State1') as State1;
    } else {
      return null;
    }
  }
}
