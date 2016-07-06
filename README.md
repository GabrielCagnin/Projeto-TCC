# net.map HTTP Server API

This API-only rails app serves as data storage and user login service for net.map services.

## Login 
To request a login, aim a POST request at:
`/users/sign_in`

Header MUST have:
`Content-Type: application/json`

JSON Content:
```json
{
    "user":{
        "email":"test@net.map",
        "password":"12345678"
    }
}
```
  
**Response** will be like this:
```json
{
    "_id":{"$oid":"xxxxxxxxxxxxxxxxxxxxxxxx"},
    "authentication_token":"xxxxxxxxxxxxxxxxxxxxxxxx",
    "created_at":"2016-06-25T21:36:58.070Z",
    "email":"test@net.map",
    "updated_at":"2016-07-06T18:48:40.560Z"
}
```

You will need to save the email and the authentication token to perform a request.

## Making requests

In every request, your header must be like this:
```
Content-Type: application/json
X-User-Email: test@net.map
X-User-Token: xxxxxxxxxxxxxxxxxxxx
```