# net.map HTTP Server API

This API-only rails app serves as data storage and user login service for net.map services.
Also is responsible for running the Machine Learning R scripts on demand.

## Login 
To request a login, aim a POST request at:
```
/users/sign_in
```

Header MUST have:
```
Content-Type: application/json
```

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

---
## Making requests for new resources

In every request, your header must be like this:
```
Content-Type: application/json
X-User-Email: test@net.map
X-User-Token: xxxxxxxxxxxxxxxxxxxx
```

### Create new Facility
POST to `/create_facility`

Use the following body as example:
```json
{
  "facility": {
    "name": "New Facility"
  }
}
```

You don't have to send your user_id, because it is implicit from the information
given on the headers.

### Create new Zone
POST to `/create_zone`

Use the following body as example:
```json
{
  "zone": {
    "name": "New Zone",
    "facility_id": "xxxxxxxxxxxxxx"
  }
}
```

### Create new Acquisition Set / Acquisition / Access Points

It is only possible to create an Access Point together with an Acquisition.
It is also only possible to create an Acquisition together with an Acquisition Set.

POST to `/create_acquisition_set`

Use the following body as example:
```json
{
  "acquisition_set": {
    "zone_id": "xxxxxxxxxxxxxx",
    "normalization_algorithm": "Kalman Filter",
    "time_interval": 0.5,
    "measures_per_point": 3,
    "acquisitions": [
      {
        "access_points": [
          {
            "BSSID":"00:11:22:33:44:55",
            "RSSI": -30
          },

          {
            "BSSID":"AA:11:22:33:44:55",
            "RSSI": -37
          },

          {
            "BSSID":"BB:11:22:33:44:55",
            "RSSI": -49
          }
        ]
      },

      {
        "access_points": [
          {
            "BSSID":"00:11:22:33:44:55",
            "RSSI": -39
          },

          {
            "BSSID":"AA:11:22:33:44:55",
            "RSSI": -48
          },

          {
            "BSSID":"BB:11:22:33:44:55",
            "RSSI": -33
          }
        ]
      },

      {
        "access_points": [
          {
            "BSSID":"00:11:22:33:44:55",
            "RSSI": -90
          },

          {
            "BSSID":"AA:11:22:33:44:55",
            "RSSI": -32
          },

          {
            "BSSID":"BB:11:22:33:44:55",
            "RSSI": -64
          }
        ]
      }
    ]
  }
}
```
The acquisitions vector may contain 0-n acquisitions.
The access_points vector may contain 0-n access_points.

---

## Getting data from the server

### All facilities from an user

GET to `/facilities`

No extra parameters are required.

Response format:
```
[
  {
    "_id": {
      "$oid":"xxxxxxxxxxxxxxxxxxxxxxxxxxx"
    },
    "created_at":"2016-08-15T15:17:13.488Z",
    "name":"Shopping Center",
    "updated_at":"2016-08-15T15:17:13.488Z",
    "user_id":"yyyyyyyyyyyyyyyyyyyyyyyyy"
  },
  {
    ...
  },
  ...
]
```

### All zones from a facility

GET to `/zones`, parameter: `facility_id`

Example: `/zones?facility_id=xxxxxxxxxxxxxxxxxxxxxx`

Response format:
```
[
  {
    "_id": {
      "$oid": "yyyyyyyyyyyyyyyyyyyyyyyy"
    },
    "created_at": "2016-08-15T15:17:45.663Z",
    "facility_id": "xxxxxxxxxxxxxxxxxxxxxxxxx",
    "name": "Main Lobby",
    "updated_at": "2016-08-15T15:17:45.663Z"
  },
  {
    ...
  },
  ...
]
```

### All acquisitions from a zone or acquisition set

GET to `/acquisitions`, parameter: `zone_id` OR `acquisition_set_id`


Example: `/acquisitions?zone_id=xxxxxxxxxxxxxxxxxxxxxx`

Response format:
```
[
  {
    "_id": {
      "$oid": "zzzzzzzzzzzzzzzz"
    },
    "acquisition_set_id": "yyyyyyyyyyyyyyyyy",
    "created_at": "2016-08-15T15:18:26.161Z",
    "updated_at": "2016-08-15T15:18:26.161Z",
    "zone_id": "xxxxxxxxxxxxxx"
  },
  ...
]
```

Don't put both parameters at same request, or else you will get this:

`The request should not have zone_id and acquisition_id simultaneously`

### All access points from a zone or acquisition

GET to `/access_points`, parameter: `zone_id` OR `acquisition_id`


Example: `/access_points?zone_id=xxxxxxxxxxxxxxxxxxxxxx`

Response format:
```
[
  {
    "BSSID": "00:11:22:33:44:55",
    "RSSI": -30,
    "_id": {
      "$oid": "zzzzzzzzzzzzzzzzzzzzzz"
    },
    "acquisition_id": "yyyyyyyyyyyyyyyyyyyyyyy",
    "zone_id": "xxxxxxxxxxxxxxxxxxxxxx"
  },
  ...
]
```

Don't put both parameters at same request, or else you will get this:

`The request should not have zone_id and acquisition_id simultaneously`




