# ros_rest_api.api.RegisterApi

## Load the API package
```dart
import 'package:ros_rest_api/api.dart';
```

All URIs are relative to *http://localhost:8888*

Method | HTTP request | Description
------------- | ------------- | -------------
[**register**](RegisterApi.md#register) | **POST** /register | 


# **register**
> User1 register(user)



### Example 
```dart
import 'package:ros_rest_api/api.dart';

var api_instance = new RegisterApi();
var user = new User(); // User | 

try { 
    var result = api_instance.register(user);
    print(result);
} catch (e) {
    print("Exception when calling RegisterApi->register: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **user** | [**User**](User.md)|  | 

### Return type

[**User1**](User1.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

