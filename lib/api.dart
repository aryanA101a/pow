import 'dart:developer';

import 'package:pow/constants.dart';
import 'package:pow/kmlCode.dart';
import 'package:pow/models.dart';

var apiDataDump = [
  {
    "Message": {
      "StandardClassBPositionReport": {
        "AssignedMode": false,
        "ClassBBand": false,
        "ClassBDisplay": true,
        "ClassBDsc": true,
        "ClassBMsg22": false,
        "ClassBUnit": true,
        "Cog": 324.7,
        "CommunicationState": 393222,
        "CommunicationStateIsItdma": true,
        "Latitude": 8.031521666666666,
        "Longitude": 77.38078,
        "MessageID": 18,
        "PositionAccuracy": true,
        "Raim": false,
        "RepeatIndicator": 0,
        "Sog": 9.4,
        "Spare1": 0,
        "Spare2": 0,
        "Timestamp": 49,
        "TrueHeading": 511,
        "UserID": 419823454,
        "Valid": true
      }
    },
    "MessageType": "StandardClassBPositionReport",
    "MetaData": {
      "MMSI": 419823454,
      "ShipName": "",
      "latitude": 8.031521666666666,
      "longitude": 77.38078,
      "time_utc": "2023-04-03 22:33:50.891303135 +0000 UTC"
    }
  },
  {
    "Message": {
      "DataLinkManagementMessage": {
        "Data": {
          "0": {
            "Increment": 750,
            "Offset": 749,
            "TimeOut": 7,
            "Valid": false,
            "integerOfSlots": 2
          },
          "1": {
            "Increment": 0,
            "Offset": 0,
            "TimeOut": 0,
            "Valid": false,
            "integerOfSlots": 0
          },
          "2": {
            "Increment": 0,
            "Offset": 0,
            "TimeOut": 0,
            "Valid": false,
            "integerOfSlots": 0
          },
          "3": {
            "Increment": 0,
            "Offset": 0,
            "TimeOut": 0,
            "Valid": false,
            "integerOfSlots": 0
          }
        },
        "MessageID": 20,
        "RepeatIndicator": 3,
        "Spare": 0,
        "UserID": 4192248,
        "Valid": true
      }
    },
    "MessageType": "DataLinkManagementMessage",
    "MetaData": {
      "MMSI": 4192248,
      "ShipName": "",
      "latitude": 8.081308333333332,
      "longitude": 77.54694833333333,
      "time_utc": "2023-04-03 22:33:50.895252687 +0000 UTC"
    }
  },
  {
    "Message": {
      "PositionReport": {
        "Cog": 90.4,
        "CommunicationState": 59916,
        "Latitude": 8.017685,
        "Longitude": 77.44895,
        "MessageID": 1,
        "NavigationalStatus": 8,
        "PositionAccuracy": true,
        "Raim": true,
        "RateOfTurn": -128,
        "RepeatIndicator": 0,
        "Sog": 6.4,
        "Spare": 0,
        "SpecialManoeuvreIndicator": 0,
        "Timestamp": 49,
        "TrueHeading": 511,
        "UserID": 419801882,
        "Valid": true
      }
    },
    "MessageType": "PositionReport",
    "MetaData": {
      "MMSI": 419801882,
      "ShipName": "MSV SNOW TTN-261    ",
      "latitude": 8.017685,
      "longitude": 77.44895,
      "time_utc": "2023-04-03 22:33:51.090407076 +0000 UTC"
    }
  },
  {
    "Message": {
      "PositionReport": {
        "Cog": 132.2,
        "CommunicationState": 59916,
        "Latitude": 7.7873850000000004,
        "Longitude": 76.92652166666667,
        "MessageID": 1,
        "NavigationalStatus": 0,
        "PositionAccuracy": false,
        "Raim": false,
        "RateOfTurn": 0,
        "RepeatIndicator": 0,
        "Sog": 18.9,
        "Spare": 0,
        "SpecialManoeuvreIndicator": 0,
        "Timestamp": 51,
        "TrueHeading": 131,
        "UserID": 431912000,
        "Valid": true
      }
    },
    "MessageType": "PositionReport",
    "MetaData": {
      "MMSI": 431912000,
      "ShipName": "SAGITTARIUS LEADER  ",
      "latitude": 7.7873850000000004,
      "longitude": 76.92652166666667,
      "time_utc": "2023-04-03 22:33:51.225933895 +0000 UTC"
    }
  },
  {
    "Message": {
      "PositionReport": {
        "Cog": 123.7,
        "CommunicationState": 59916,
        "Latitude": 8.028566666666666,
        "Longitude": 76.86544333333333,
        "MessageID": 1,
        "NavigationalStatus": 0,
        "PositionAccuracy": true,
        "Raim": false,
        "RateOfTurn": 0,
        "RepeatIndicator": 0,
        "Sog": 12.9,
        "Spare": 0,
        "SpecialManoeuvreIndicator": 0,
        "Timestamp": 53,
        "TrueHeading": 121,
        "UserID": 374280000,
        "Valid": true
      }
    },
    "MessageType": "PositionReport",
    "MetaData": {
      "MMSI": 374280000,
      "ShipName": "ARGO WIND           ",
      "latitude": 8.028566666666666,
      "longitude": 76.86544333333333,
      "time_utc": "2023-04-03 22:33:54.841829846 +0000 UTC"
    }
  },
  {
    "Message": {
      "DataLinkManagementMessage": {
        "Data": {
          "0": {
            "Increment": 750,
            "Offset": 749,
            "TimeOut": 7,
            "Valid": false,
            "integerOfSlots": 2
          },
          "1": {
            "Increment": 0,
            "Offset": 0,
            "TimeOut": 0,
            "Valid": false,
            "integerOfSlots": 0
          },
          "2": {
            "Increment": 0,
            "Offset": 0,
            "TimeOut": 0,
            "Valid": false,
            "integerOfSlots": 0
          },
          "3": {
            "Increment": 0,
            "Offset": 0,
            "TimeOut": 0,
            "Valid": false,
            "integerOfSlots": 0
          }
        },
        "MessageID": 20,
        "RepeatIndicator": 3,
        "Spare": 0,
        "UserID": 4192248,
        "Valid": true
      }
    },
    "MessageType": "DataLinkManagementMessage",
    "MetaData": {
      "MMSI": 4192248,
      "ShipName": "",
      "latitude": 8.081308333333332,
      "longitude": 77.54694833333333,
      "time_utc": "2023-04-03 22:34:01.061826657 +0000 UTC"
    }
  },
  {
    "Message": {
      "PositionReport": {
        "Cog": 97.7,
        "CommunicationState": 59916,
        "Latitude": 7.85557,
        "Longitude": 77.34770833333333,
        "MessageID": 1,
        "NavigationalStatus": 0,
        "PositionAccuracy": false,
        "Raim": false,
        "RateOfTurn": -4,
        "RepeatIndicator": 0,
        "Sog": 11.2,
        "Spare": 0,
        "SpecialManoeuvreIndicator": 0,
        "Timestamp": 3,
        "TrueHeading": 98,
        "UserID": 477244100,
        "Valid": true
      }
    },
    "MessageType": "PositionReport",
    "MetaData": {
      "MMSI": 477244100,
      "ShipName": "XIN HAI TONG 22     ",
      "latitude": 7.85557,
      "longitude": 77.34770833333333,
      "time_utc": "2023-04-03 22:34:02.856764524 +0000 UTC"
    }
  },
  {
    "Message": {
      "PositionReport": {
        "Cog": 114,
        "CommunicationState": 59916,
        "Latitude": 7.713416666666666,
        "Longitude": 77.90401666666666,
        "MessageID": 1,
        "NavigationalStatus": 0,
        "PositionAccuracy": true,
        "Raim": false,
        "RateOfTurn": 0,
        "RepeatIndicator": 0,
        "Sog": 9.9,
        "Spare": 0,
        "SpecialManoeuvreIndicator": 0,
        "Timestamp": 3,
        "TrueHeading": 112,
        "UserID": 477655700,
        "Valid": true
      }
    },
    "MessageType": "PositionReport",
    "MetaData": {
      "MMSI": 477655700,
      "ShipName": "OOCL LE HAVRE       ",
      "latitude": 7.713416666666666,
      "longitude": 77.90401666666666,
      "time_utc": "2023-04-03 22:34:03.2860998 +0000 UTC"
    }
  },
  {
    "Message": {
      "PositionReport": {
        "Cog": 305.2,
        "CommunicationState": 59916,
        "Latitude": 7.974693333333334,
        "Longitude": 77.16914666666666,
        "MessageID": 1,
        "NavigationalStatus": 0,
        "PositionAccuracy": true,
        "Raim": false,
        "RateOfTurn": 0,
        "RepeatIndicator": 0,
        "Sog": 16.5,
        "Spare": 0,
        "SpecialManoeuvreIndicator": 0,
        "Timestamp": 9,
        "TrueHeading": 307,
        "UserID": 419001574,
        "Valid": true
      }
    },
    "MessageType": "PositionReport",
    "MetaData": {
      "MMSI": 419001574,
      "ShipName": "",
      "latitude": 7.974693333333334,
      "longitude": 77.16914666666666,
      "time_utc": "2023-04-03 22:34:10.476188849 +0000 UTC"
    }
  },
  {
    "Message": {
      "DataLinkManagementMessage": {
        "Data": {
          "0": {
            "Increment": 750,
            "Offset": 2249,
            "TimeOut": 7,
            "Valid": false,
            "integerOfSlots": 2
          },
          "1": {
            "Increment": 0,
            "Offset": 0,
            "TimeOut": 0,
            "Valid": false,
            "integerOfSlots": 0
          },
          "2": {
            "Increment": 0,
            "Offset": 0,
            "TimeOut": 0,
            "Valid": false,
            "integerOfSlots": 0
          },
          "3": {
            "Increment": 0,
            "Offset": 0,
            "TimeOut": 0,
            "Valid": false,
            "integerOfSlots": 0
          }
        },
        "MessageID": 20,
        "RepeatIndicator": 3,
        "Spare": 0,
        "UserID": 4192248,
        "Valid": true
      }
    },
    "MessageType": "DataLinkManagementMessage",
    "MetaData": {
      "MMSI": 4192248,
      "ShipName": "",
      "latitude": 8.081308333333332,
      "longitude": 77.54694833333333,
      "time_utc": "2023-04-03 22:34:10.876600083 +0000 UTC"
    }
  },
  {
    "Message": {
      "BaseStationReport": {
        "CommunicationState": 81929,
        "FixType": 1,
        "Latitude": 8.081308333333332,
        "LongRangeEnable": false,
        "Longitude": 77.54694833333333,
        "MessageID": 4,
        "PositionAccuracy": true,
        "Raim": true,
        "RepeatIndicator": 3,
        "Spare": 0,
        "UserID": 4192248,
        "UtcDay": 3,
        "UtcHour": 22,
        "UtcMinute": 34,
        "UtcMonth": 4,
        "UtcSecond": 19,
        "UtcYear": 2023,
        "Valid": true
      }
    },
    "MessageType": "BaseStationReport",
    "MetaData": {
      "MMSI": 4192248,
      "ShipName": "",
      "latitude": 8.081308333333332,
      "longitude": 77.54694833333333,
      "time_utc": "2023-04-03 22:34:20.944956249 +0000 UTC"
    }
  },
  {
    "Message": {
      "DataLinkManagementMessage": {
        "Data": {
          "0": {
            "Increment": 750,
            "Offset": 2249,
            "TimeOut": 7,
            "Valid": false,
            "integerOfSlots": 2
          },
          "1": {
            "Increment": 0,
            "Offset": 0,
            "TimeOut": 0,
            "Valid": false,
            "integerOfSlots": 0
          },
          "2": {
            "Increment": 0,
            "Offset": 0,
            "TimeOut": 0,
            "Valid": false,
            "integerOfSlots": 0
          },
          "3": {
            "Increment": 0,
            "Offset": 0,
            "TimeOut": 0,
            "Valid": false,
            "integerOfSlots": 0
          }
        },
        "MessageID": 20,
        "RepeatIndicator": 3,
        "Spare": 0,
        "UserID": 4192248,
        "Valid": true
      }
    },
    "MessageType": "DataLinkManagementMessage",
    "MetaData": {
      "MMSI": 4192248,
      "ShipName": "",
      "latitude": 8.081308333333332,
      "longitude": 77.54694833333333,
      "time_utc": "2023-04-03 22:34:20.945765053 +0000 UTC"
    }
  },
  {
    "Message": {
      "PositionReport": {
        "Cog": 314.7,
        "CommunicationState": 59916,
        "Latitude": 8.087963333333333,
        "Longitude": 77.071535,
        "MessageID": 1,
        "NavigationalStatus": 0,
        "PositionAccuracy": true,
        "Raim": false,
        "RateOfTurn": 0,
        "RepeatIndicator": 0,
        "Sog": 11.9,
        "Spare": 0,
        "SpecialManoeuvreIndicator": 0,
        "Timestamp": 40,
        "TrueHeading": 315,
        "UserID": 620999086,
        "Valid": true
      }
    },
    "MessageType": "PositionReport",
    "MetaData": {
      "MMSI": 620999086,
      "ShipName": "LEONARD             ",
      "latitude": 8.087963333333333,
      "longitude": 77.071535,
      "time_utc": "2023-04-03 22:34:40.877438388 +0000 UTC"
    }
  },
  {
    "Message": {
      "DataLinkManagementMessage": {
        "Data": {
          "0": {
            "Increment": 750,
            "Offset": 1499,
            "TimeOut": 7,
            "Valid": false,
            "integerOfSlots": 2
          },
          "1": {
            "Increment": 0,
            "Offset": 0,
            "TimeOut": 0,
            "Valid": false,
            "integerOfSlots": 0
          },
          "2": {
            "Increment": 0,
            "Offset": 0,
            "TimeOut": 0,
            "Valid": false,
            "integerOfSlots": 0
          },
          "3": {
            "Increment": 0,
            "Offset": 0,
            "TimeOut": 0,
            "Valid": false,
            "integerOfSlots": 0
          }
        },
        "MessageID": 20,
        "RepeatIndicator": 3,
        "Spare": 0,
        "UserID": 4192248,
        "Valid": true
      }
    },
    "MessageType": "DataLinkManagementMessage",
    "MetaData": {
      "MMSI": 4192248,
      "ShipName": "",
      "latitude": 8.081308333333332,
      "longitude": 77.54694833333333,
      "time_utc": "2023-04-03 22:34:40.982438726 +0000 UTC"
    }
  },
  {
    "Message": {
      "DataLinkManagementMessage": {
        "Data": {
          "0": {
            "Increment": 750,
            "Offset": 1499,
            "TimeOut": 7,
            "Valid": false,
            "integerOfSlots": 2
          },
          "1": {
            "Increment": 0,
            "Offset": 0,
            "TimeOut": 0,
            "Valid": false,
            "integerOfSlots": 0
          },
          "2": {
            "Increment": 0,
            "Offset": 0,
            "TimeOut": 0,
            "Valid": false,
            "integerOfSlots": 0
          },
          "3": {
            "Increment": 0,
            "Offset": 0,
            "TimeOut": 0,
            "Valid": false,
            "integerOfSlots": 0
          }
        },
        "MessageID": 20,
        "RepeatIndicator": 3,
        "Spare": 0,
        "UserID": 4194415,
        "Valid": true
      }
    },
    "MessageType": "DataLinkManagementMessage",
    "MetaData": {
      "MMSI": 4194415,
      "ShipName": "",
      "latitude": 8.372873333333335,
      "longitude": 78.06564666666667,
      "time_utc": "2023-04-03 22:34:41.241635944 +0000 UTC"
    }
  },
  {
    "Message": {
      "PositionReport": {
        "Cog": 302.2,
        "CommunicationState": 59916,
        "Latitude": 7.410446666666667,
        "Longitude": 77.34691500000001,
        "MessageID": 1,
        "NavigationalStatus": 0,
        "PositionAccuracy": true,
        "Raim": false,
        "RateOfTurn": 4,
        "RepeatIndicator": 0,
        "Sog": 12.6,
        "Spare": 0,
        "SpecialManoeuvreIndicator": 0,
        "Timestamp": 42,
        "TrueHeading": 306,
        "UserID": 374345000,
        "Valid": true
      }
    },
    "MessageType": "PositionReport",
    "MetaData": {
      "MMSI": 374345000,
      "ShipName": "GAS STELLA          ",
      "latitude": 7.410446666666667,
      "longitude": 77.34691500000001,
      "time_utc": "2023-04-03 22:34:48.538497008 +0000 UTC"
    }
  }
];
createMarkersFromApi() {
  String markers = "";
  for (Map message in apiDataDump) {
    if (message["MessageType"] == "PositionReport") {
      String name = message["MetaData"]["ShipName"].toString();
      LngLat coordinates = LngLat(
        message["MetaData"]["longitude"],
        message["MetaData"]["latitude"],
      );
      num cog = message["Message"]["PositionReport"]["Cog"];
      markers += createMarker(
          iconUrl: redVesselIcon,
          name: name,
          coordinates: coordinates,
          direction: cog,
          scale: 0.8);
    }
  }
  return markers;
}
