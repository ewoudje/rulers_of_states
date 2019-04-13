# ros_rest_api.model.ManagedAuthToken

## Load the model package
```dart
import 'package:ros_rest_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **int** | This is the primary identifier for this object.  | [optional] [default to null]
**code** | **String** | No two objects may have the same value for this field.  | [optional] [default to null]
**accessToken** | **String** | No two objects may have the same value for this field.  | [optional] [default to null]
**refreshToken** | **String** | No two objects may have the same value for this field.  | [optional] [default to null]
**scope** | **String** |  | [optional] [default to null]
**issueDate** | [**DateTime**](DateTime.md) |  | [optional] [default to null]
**expirationDate** | [**DateTime**](DateTime.md) |  | [optional] [default to null]
**type** | **String** |  | [optional] [default to null]
**resourceOwner** | [**State**](State.md) |  | [optional] [default to null]
**client** | [**Client**](Client.md) |  | [optional] [default to null]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


