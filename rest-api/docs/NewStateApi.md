# ros_rest_api.api.NewStateApi

## Load the API package
```dart
import 'package:ros_rest_api/api.dart';
```

All URIs are relative to *http://localhost:8888*

Method | HTTP request | Description
------------- | ------------- | -------------
[**newState**](NewStateApi.md#newState) | **POST** /state/new | 


# **newState**
> State1 newState(newStateRequest)



### Example 
```dart
import 'package:ros_rest_api/api.dart';
// TODO Configure OAuth2 access token for authorization: oauth2
//ros_rest_api.api.Configuration.accessToken = 'YOUR_ACCESS_TOKEN';

var api_instance = new NewStateApi();
var newStateRequest = new NewStateRequest(); // NewStateRequest | 

try { 
    var result = api_instance.newState(newStateRequest);
    print(result);
} catch (e) {
    print("Exception when calling NewStateApi->newState: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **newStateRequest** | [**NewStateRequest**](NewStateRequest.md)|  | 

### Return type

[**State1**](State1.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

