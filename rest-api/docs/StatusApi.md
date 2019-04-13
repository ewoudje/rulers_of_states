# ros_rest_api.api.StatusApi

## Load the API package
```dart
import 'package:ros_rest_api/api.dart';
```

All URIs are relative to *http://localhost:8888*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getSelfStatus**](StatusApi.md#getSelfStatus) | **GET** /status | 
[**getStatus**](StatusApi.md#getStatus) | **GET** /{state}/status | 


# **getSelfStatus**
> State1 getSelfStatus()



### Example 
```dart
import 'package:ros_rest_api/api.dart';
// TODO Configure OAuth2 access token for authorization: oauth2
//ros_rest_api.api.Configuration.accessToken = 'YOUR_ACCESS_TOKEN';

var api_instance = new StatusApi();

try { 
    var result = api_instance.getSelfStatus();
    print(result);
} catch (e) {
    print("Exception when calling StatusApi->getSelfStatus: $e\n");
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**State1**](State1.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getStatus**
> State1 getStatus(state)



### Example 
```dart
import 'package:ros_rest_api/api.dart';
// TODO Configure OAuth2 access token for authorization: oauth2
//ros_rest_api.api.Configuration.accessToken = 'YOUR_ACCESS_TOKEN';

var api_instance = new StatusApi();
var state = 56; // int | 

try { 
    var result = api_instance.getStatus(state);
    print(result);
} catch (e) {
    print("Exception when calling StatusApi->getStatus: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **state** | **int**|  | [default to null]

### Return type

[**State1**](State1.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

