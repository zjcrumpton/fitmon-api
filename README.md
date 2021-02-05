# Fitmon REST API

## Endpoints

### Auth

**This API uses JWT authentication**

_Include Authorization: Bearer {{jwt_token}} header on all requests except for sign up and login_

**Sign Up**

Method: POST

URL:

```
url/users
```

Body (JSON):

```
{
    "user": {
        "username": "username here", string
        "email": "email@gmail.com", string
        "password": "password here", string
        "goal": "lose_weight", string
        "days_per_week": 6, integer
        "gender": "male", string
        "age": 20, integer
        "weight": 110, integer
        "height": "5'8", string
        "experience": "beginner" string
    }
}
```

Res:

```
{
    "user": {
        id,
        username,
        email,
        goal,
        days_per_week,
        gender,
        age,
        weight,
        height,
        experience,
    },
    "token": token
}
```

**Login**

Method: POST

URL:

```
url/login
```

Body (JSON):

```
{
    {
        "username": "username here", string,
        "password": "password here"
    }
}
```
