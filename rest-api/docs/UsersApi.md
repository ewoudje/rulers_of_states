# ros_rest_api.api.UsersApi

## Load the API package
```dart
import 'package:ros_rest_api/api.dart';
```

All URIs are relative to *http://localhost:8888*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getUser**](UsersApi.md#getUser) | **GET** /users | 
[**getUserAdmin**](UsersApi.md#getUserAdmin) | **GET** /users/{user} | 


# **getUser**
> User1 getUser()



### Example 
```dart
import 'package:ros_rest_api/api.dart';
// TODO Configure OAuth2 access token for authorization: oauth2
//ros_rest_api.api.Configuration.accessToken = 'YOUR_ACCESS_TOKEN';

var api_instance = new UsersApi();

try { 
    var result = api_instance.getUser();
    print(result);
} catch (e) {
    print("Exception when calling UsersApi->getUser: $e\n");
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**User1**](User1.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getUserAdmin**
> User1 getUserAdmin(user)



### Example 
```dart
import 'package:ros_rest_api/api.dart';
// TODO Configure OAuth2 access token for authorization: oauth2
//ros_rest_api.api.Configuration.accessToken = 'YOUR_ACCESS_TOKEN';

var api_instance = new UsersApi();
var user = 56; // int | 

try { 
    var result = api_instance.getUserAdmin(user);
    print(result);
} catch (e) {
    print("Exception when calling UsersApi->getUserAdmin: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **user** | **int**|  | [default to null]

### Return type

[**User1**](User1.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

