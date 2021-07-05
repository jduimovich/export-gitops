
@echo off

set NS=gitops-export

oc whoami --show-token >openshift.login.token
set /P LOGINQ=< openshift.login.token
del openshift.login.token
Set LOGIN=%LOGINQ:"=%

oc whoami --show-server >openshift.server
set /P SERVERQ=< openshift.server
del openshift.server
Set SERVER=%SERVERQ:"=%
 
echo  The server is /%SERVER%/ 
echo  The server is /%NS%/ 
rem   The token is  "secret"
 
gh secret set OPENSHIFT_SERVER -b %SERVER%
gh secret set OPENSHIFT_TOKEN -b %LOGIN%
gh secret set OPENSHIFT_NAMESPACE -b %NS%

:end