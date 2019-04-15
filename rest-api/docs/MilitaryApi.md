# ros_rest_api.api.MilitaryApi

## Load the API package
```dart
import 'package:ros_rest_api/api.dart';
```

All URIs are relative to *http://localhost:8888*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getUnit**](MilitaryApi.md#getUnit) | **GET** /{state}/military/units/{unit} | 
[**getUnits**](MilitaryApi.md#getUnits) | **GET** /{state}/military/units | 


# **getUnit**
> MilitaryUnit1 getUnit(state, unit, turnsAgo)



### Example 
```dart
import 'package:ros_rest_api/api.dart';
// TODO Configure OAuth2 access token for authorization: oauth2
//ros_rest_api.api.Configuration.accessToken = 'YOUR_ACCESS_TOKEN';

var api_instance = new MilitaryApi();
var state = 56; // int | 
var unit = 56; // int | 
var turnsAgo = 56; // int | 

try { 
    var result = api_instance.getUnit(state, unit, turnsAgo);
    print(result);
} catch (e) {
    print("Exception when calling MilitaryApi->getUnit: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **state** | **int**|  | [default to null]
 **unit** | **int**|  | [default to null]
 **turnsAgo** | **int**|  | [optional] [default to null]

### Return type

[**MilitaryUnit1**](MilitaryUnit1.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getUnits**
> List<MilitaryUnit1> getUnits(state, turnsAgo)



### Example 
```dart
import 'package:ros_rest_api/api.dart';
// TODO Configure OAuth2 access token for authorization: oauth2
//ros_rest_api.api.Configuration.accessToken = 'YOUR_ACCESS_TOKEN';

var api_instance = new MilitaryApi();
var state = 56; // int | 
var turnsAgo = 56; // int | 

try { 
    var result = api_instance.getUnits(state, turnsAgo);
    print(result);
} catch (e) {
    print("Exception when calling MilitaryApi->getUnits: $e\n");
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **state** | **int**|  | [default to null]
 **turnsAgo** | **int**|  | [optional] [default to null]

### Return type

[**List<MilitaryUnit1>**](MilitaryUnit1.md)

### Authorization

[oauth2](../README.md#oauth2)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

