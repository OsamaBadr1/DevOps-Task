# Accessing Kubernetes API
--------------------------
## A. HTTP Access:
**It is not a best practice to use this method since the connection is HTTP and not secure.**
### 1. Using kubectl to start proxy server on the localhost:
- Start the proxy server on localhost with the standard port (8080):
    -       kubectl proxy --port=8080 &
- Access The Kubernetes API from the localhost using curl:
    -       curl http://localhost:8080/api/
### 2. Using kubectl to start proxy server for Remote access:
- Start proxy server
- Listening on different port (9922)
- Listening on specific IP address (192.168.1.203)
- Accept traffic from specific range (^192.168):
    -       kubectl proxy --port=9922 --address='192.168.1.203' --accept-hosts='^192.168' &
- Using curl, access the Kubernetes API from the 192.168 network range
    -       curl http://192.168.1.203:8080/api/
------------------------------------------------------------------------
## B. HTTPs access:
-------------------
**Access the K8s API without kubectl proxy**<br />
**Since the connection is HTTPS, this method is the best practice**
###  1. Curl from anywhere you have access to the API:
- Kubernetes' newest version requires you to manually create service account tokens:
- The default service account token should be created as follows:
    ```bash
        apiVersion: v1
        kind: Secret
        metadata:
          name: default-token
          annotations:
            kubernetes.io/service-account.name: default
        type: kubernetes.io/service-account-token
    ```
- Using curl, access the Kubernetes API from any network range that have access to the API
    ```bash

       API_URL=$(kubectl config view | grep -i server | awk '{print $2}')
       default_sa_token=$(kubectl get secret default-token -o yaml | grep -i 'token:' | awk '{print $2}' | base64 --decode)
       curl -k -X GET $API_URL/api/ --header "Authorization: Bearer $default_sa_token"
    ```
###  2. K8s API can be accessed directly using kubectl
- Accessing the API via this method is another simple method
    -       kubectl get --raw /api/
### 3. Access the K8s API from a client (Programmatic access such as python, java, ...)
  - Ensure that you have imported the Kubernetes library into your code
  - The Kube config file must be specified in the code
  - An action such as listing some pods from a certain namespace (depending on the role of the service account).
