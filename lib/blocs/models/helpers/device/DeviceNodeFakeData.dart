import 'dart:convert';

import 'package:datav8/blocs/models/models.dart';

class DeviceNodeFakeData extends MapObject{
  final DeviceNode _device;
  DeviceNode get device => _device;

  DeviceNodeFakeData() 
    : _device = GraphQLResponse<DeviceNode>(DeviceNode.fromMap, deviceMap).data;
}

Map<String, dynamic> deviceMap = jsonDecode(jsonEncode({
  "id": "RGV2aWNlOjE=",
  "imei": "863226133253169",
  "ch1On": true,
  "ch2On": true,
  "ch3On": true,
  "ch4On": true,
  "ch5On": false,
  "ch1Name": "Temperature 1",
  "ch2Name": "Temperature 2",
  "ch3Name": "Temperature 3",
  "ch4Name": "Temperature 4",
  "ch5Name": "Temperature 5",
  "upperThresholdCh1": 0,
  "upperThresholdCh2": 0,
  "upperThresholdCh3": 0,
  "upperThresholdCh4": 0,
  "upperThresholdCh5": 0,
  "lowerThresholdCh1": 0,
  "lowerThresholdCh2": 0,
  "lowerThresholdCh3": 0,
  "lowerThresholdCh4": 0,
  "lowerThresholdCh5": 0,
  "monitoringActiveCh1": false,
  "monitoringActiveCh2": false,
  "monitoringActiveCh3": false,
  "monitoringActiveCh4": false,
  "monitoringActiveCh5": false,
  "alertStateCh1": false,
  "alertStateCh2": false,
  "alertStateCh3": false,
  "alertStateCh4": false,
  "alertStateCh5": false,
  "eventSet": {
    "edges": [
      {
        "node": {
          "ch1": 15.71097,
          "ch2": 5.71097,
          "ch3": 24.79319,
          "ch4": 0.08547,
          "ch5": 5.27583,
          "deviceTimeDate": "2020-04-07T11:00:55+00:00"
        }
      },
      {
        "node": {
          "ch1": 8.59731,
          "ch2": 8.9776,
          "ch3": 24.70371,
          "ch4": 0.08547,
          "ch5": 5.3613,
          "deviceTimeDate": "2020-04-07T12:57:28+00:00"
        }
      },
      {
        "node": {
          "ch1": 15.97941,
          "ch2": 5.21883,
          "ch3": 25.03926,
          "ch4": 0.1554,
          "ch5": 5.6721,
          "deviceTimeDate": "2020-04-07T13:55:44+00:00"
        }
      },
      {
        "node": {
          "ch1": 14.61484,
          "ch2": 4.77143,
          "ch3": 24.90504,
          "ch4": 0.16317,
          "ch5": 5.37684,
          "deviceTimeDate": "2020-04-07T14:54:00+00:00"
        }
      },
      {
        "node": {
          "ch1": 7.00904,
          "ch2": 1.01388,
          "ch3": 25.15111,
          "ch4": 2.64957,
          "ch5": 5.50893,
          "deviceTimeDate": "2020-04-07T15:52:17+00:00"
        }
      },
      {
        "node": {
          "ch1": 15.73334,
          "ch2": 2.44495,
          "ch3": 25.10637,
          "ch4": 3.19347,
          "ch5": 5.63325,
          "deviceTimeDate": "2020-04-07T16:50:34+00:00"
        }
      },
      {
        "node": {
          "ch1": 2.19949,
          "ch2": -1.87185,
          "ch3": 25.03926,
          "ch4": 2.29215,
          "ch5": 5.42346,
          "deviceTimeDate": "2020-04-07T17:48:50+00:00"
        }
      },
      {
        "node": {
          "ch1": 4.19042,
          "ch2": 1.90868,
          "ch3": 24.92741,
          "ch4": 0.17094,
          "ch5": 5.50116,
          "deviceTimeDate": "2020-04-07T18:47:06+00:00"
        }
      },
      {
        "node": {
          "ch1": 7.4117,
          "ch2": 6.36031,
          "ch3": 25.44192,
          "ch4": 2.50971,
          "ch5": 5.50893,
          "deviceTimeDate": "2020-04-07T19:45:22+00:00"
        }
      },
      {
        "node": {
          "ch1": 12.5568,
          "ch2": 1.59489,
          "ch3": 24.92741,
          "ch4": 0.08547,
          "ch5": 5.29137,
          "deviceTimeDate": "2020-04-07T20:43:39+00:00"
        }
      },
      {
        "node": {
          "ch1": 4.19042,
          "ch2": 0.56648,
          "ch3": 24.90504,
          "ch4": 0.08547,
          "ch5": 5.27583,
          "deviceTimeDate": "2020-04-07T21:41:54+00:00"
        }
      },
      {
        "node": {
          "ch1": 9.55922,
          "ch2": 0.45402,
          "ch3": 25.12874,
          "ch4": 2.39316,
          "ch5": 5.40792,
          "deviceTimeDate": "2020-04-07T22:40:10+00:00"
        }
      }
    ],
    "pageInfo": {
      "hasNextPage": true,
      "hasPreviousPage": false,
      "startCursor": "YXJyYXljb25uZWN0aW9uOjA=",
      "endCursor": "YXJyYXljb25uZWN0aW9uOjEx"
    }
  }
})) as Map<String, dynamic>;
