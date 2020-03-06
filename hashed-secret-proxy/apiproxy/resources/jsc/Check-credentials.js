// get username and password from basic auth header
var username = context.getVariable("credentials.username");
var password = context.getVariable("credentials.password");

var username = context.getVariable("credentials.username");
var password = context.getVariable("credentials.password");

// if these are null, then header was not present, so check payload
if(username === null && password === null) {
    // get username and password from payload
    
    
    // TODO: check how to parse payload for username and password
    context.setVariable("credentials.username",payload.username);
    context.setVariable("credentials.password",payload.password);
}

