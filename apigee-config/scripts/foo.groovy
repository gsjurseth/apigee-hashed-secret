import static groovyx.net.http.HttpBuilder.configure
import groovy.json.JsonOutput

def uri = project.properties.getProperty('apigee.hosturl') 
def basePath = "/" + project.properties.getProperty('apigee.apiversion') + 
  "/o/" + project.properties.getProperty('apigee.org')

def orgConfigDir = new File(project.properties.getProperty('apigee.config.dir'), 'org')
def exportDir = new File(project.properties.getProperty('apigee.config.exportDir'))
def keysFile = new File(exportDir, 'devAppKeys.json')
def jsonSlurper = new groovy.json.JsonSlurper() 
def keys = jsonSlurper.parseText(keysFile.text)

def daKey = ""
def products = ['hashed-secret-jwt-product']

print "###############################################################\n"
print "###############################################################\n"
print "###############################################################\n"

keys.each {
  if (it.name == "jwtTestApp") {
    daKey = it.credentials.consumerKey[0]
  }
}

print "The app key is: " + daKey
def path = basePath + "/developers/john.doe@acme.com/apps/jwtTestApp"

def user = project.properties.getProperty('apigee.username')
def pass = project.properties.getProperty('apigee.password')

String encodedAuthString = "Basic " + ("$user:$pass".bytes.encodeBase64().toString())

// First we create new credentials
def resCreate = configure {
  request.headers['Authorization'] = encodedAuthString
  request.headers['Accept'] = 'application/json'
  request.uri = uri
}.post {
    request.uri.path = path + "/keys/create"
    request.contentType = "application/json"
    request.body = JsonOutput.toJson(consumerKey: "myPrettyKey", consumerSecret: "")
}

println "and our creation: $resCreate"

def daProducts = ['hashed-secret-jwt-product']
// Now we associate it
def resAssociate = configure {
  request.headers['Authorization'] = encodedAuthString
  request.headers['Accept'] = 'application/json'
  request.uri = uri
}.post {
    request.uri.path = path + "/keys/myPrettyKey"
    request.contentType = "application/json"
    request.body = [apiProducts: daProducts]
}

println "and our associate: $resAssociate"

// Finally we delete the original
def resDelete = configure {
  request.headers['Authorization'] = encodedAuthString
  request.headers['Accept'] = 'application/json'
  request.uri = uri
}.delete {
    request.uri.path = path + "/keys/$daKey"
}

println "and our delete: $resDelete"
