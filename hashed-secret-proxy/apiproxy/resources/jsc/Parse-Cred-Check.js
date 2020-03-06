// get custom variables from the app
// var authResult = context.getVariable("bcrypt_result");
var quota = context.getVariable("verifyapikey.Verify-username.quota");
var paths = JSON.parse(context.getVariable("verifyapikey.Verify-username.paths"));

// do path check
var pathsuffix = context.getVariable("proxy.pathsuffix");
var pathResult = false;

for(var i=0;i<paths.length;i++) {
    if(paths[i] == pathsuffix) pathResult = true;
}

context.setVariable("bquota", quota);
context.setVariable("bpathresult", pathResult);
// context.setVariable("bauthresult", authResult);