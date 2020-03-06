const {Before, Given, When, Then} = require('cucumber');
module.exports = require('apickli/apickli-gherkin');


Given(/^I perform a client_credentials grant to (.*) with clientid (.*) and secret (.*)$/, function(url, clientid, secret, callback) {
    this.apickli.addHttpBasicAuthorizationHeader(clientid, secret);
    this.apickli.post(url, function(error, response) {
        if (error) {
            callback(new Error(error));
        }
        callback();
    });
});
