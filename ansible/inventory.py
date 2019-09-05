#!/usr/bin/env python2.7

"""
BEFORE RUNNING:
---------------
1. If not already done, enable the Compute Engine API
   and check the quota for your project at
   https://console.developers.google.com/apis/api/compute
2. This sample uses Application Default Credentials for authentication.
   If not already done, install the gcloud CLI from
   https://cloud.google.com/sdk and run
   `gcloud beta auth application-default login`.
   For more information, see
   https://developers.google.com/identity/protocols/application-default-credentials
3. Install the Python client library for Google APIs by running
   `pip install --upgrade google-api-python-client`
"""

from pprint import pprint
import json
import argparse

from googleapiclient import discovery
from oauth2client.client import GoogleCredentials

credentials = GoogleCredentials.get_application_default()

service = discovery.build('compute', 'v1', credentials=credentials)

# Project ID for this request.
project = 'infra-244914'  # TODO: Update placeholder value.
result = {}

request = service.instances().aggregatedList(project=project)
while request is not None:
    response = request.execute()

    for name, instances_scoped_list in response['items'].items():
        # TODO: Change code below to process each (name, instances_scoped_list) item:
        if u'instances' in instances_scoped_list:
            for instance in instances_scoped_list[u'instances']:
                main_tag = instance['tags']['items'][0]
                if main_tag not in result:
                    result[main_tag] = []
                result[main_tag].append(instance['networkInterfaces'][0]['accessConfigs'][0]['natIP'])

    request = service.instances().aggregatedList_next(previous_request=request, previous_response=response)

parser = argparse.ArgumentParser()
parser.add_argument('--list', action='store_true')
args = parser.parse_args()

if args.list:
    print json.dumps(result)
else:
    print json.dumps({'_meta': {'hostvars': {}}})
