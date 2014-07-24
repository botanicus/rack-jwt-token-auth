# About

# Installation

```
cd rack-jwt-token-auth
bundle
```

# Usage

```
use Rack::JWTAuthMiddleware do |token|
  data = JWT.decode(token, ExpensesTracker::JWT_SECRET)[0]
  ExpensesTracker::User.with(:username, data['username'])
end
```
