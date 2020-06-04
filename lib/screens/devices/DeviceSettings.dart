import 'package:datav8/blocs/models/models.dart';
import 'package:flutter/material.dart';

class DeviceSettings extends StatefulWidget {
  final DeviceNode device;
  const DeviceSettings({Key key, this.device}) : super(key: key);
  _DeviceSettingsState createState() => _DeviceSettingsState();
}

class _DeviceSettingsState extends State<DeviceSettings> {
  TextEditingController _unitNameController;
  TextEditingController _unitAdminNameController;
  TextEditingController _unitAdminPhoneNumberController;
  TextEditingController _channel1NameController;
  TextEditingController _channel2NameController;
  TextEditingController _channel3NameController;
  TextEditingController _channel4NameController;
  TextEditingController _channel5NameController;

  @override
  initState(){
    _unitNameController = TextEditingController()..text = widget.device.unitName;
    _unitAdminNameController = TextEditingController()..text = widget.device.unitAdminName;
    _unitAdminPhoneNumberController = TextEditingController()..text = widget.device.unitAdminPhoneNumber;
    _channel1NameController = TextEditingController()..text = widget.device.ch1Name;
    _channel2NameController = TextEditingController()..text = widget.device.ch2Name;
    _channel3NameController = TextEditingController()..text = widget.device.ch3Name;
    _channel4NameController = TextEditingController()..text = widget.device.ch4Name;
    _channel5NameController = TextEditingController()..text = widget.device.ch5Name;

    super.initState();
  }

  @override
  void dispose() {
    _unitNameController.dispose();
    _unitAdminNameController.dispose();
    _unitAdminPhoneNumberController.dispose();
    _channel1NameController.dispose();
    _channel2NameController.dispose();
    _channel3NameController.dispose();
    _channel4NameController.dispose();
    _channel5NameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xFF141C35),
        brightness: Brightness.dark,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      backgroundColor: Color(0xFF141C35),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 10.0, left: 20.0, right: 10.0),

              ///
              /// Header image with title 
              ///
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Image.asset("assets/image/logo_kl.png", height: 40),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              widget.device.unitName,
                              style: TextStyle(
                                  fontFamily: "Popins",
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 1.5,
                                  fontSize: 17.0),
                            ),
                            Text(
                              widget.device.imei,
                              style: TextStyle(
                                  fontFamily: "Sans",
                                  fontWeight: FontWeight.w300,
                                  letterSpacing: 1.5,
                                  fontSize: 13.0,
                                  color: Colors.white24),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            ///
            /// text editing
            ///
            _line(),

            _textEditing("UNIT NAME"),
            _textEditing("UNIT ADMIN NAME"),
            _textEditing("UNIT ADMIN PHONE NUMBER"),

            
            _textEditing("CHANNEL 1 NAME"),
            _textEditing("CHANNEL 2 NAME"),
            _textEditing("CHANNEL 3 NAME"),
            _textEditing("CHANNEL 4 NAME"),
            _textEditing("CHANNEL 5 NAME"),

            ///
            /// Button in bottom
            ///
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
              child: Container(
                height: 50.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50.0)),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFF15EDED),  Color(0xFF029CF5)]
                  )
                ),
                child: Center(
                  child: Text("Done", style: TextStyle(fontSize: 18.5, letterSpacing: 1.5)),
                ),
              ),
            ),
          ]
        )
      )
    );
  }

  Widget _line() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
      child: Container(
        height: 1.0,
        width: double.infinity,
        color: Colors.white10,
      ),
    );
  }

  /// 
  ///  TextEditing widget
  /// 
  Widget _textEditing(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Container(
        height: 57.0,
        width: double.infinity,
        decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(50.0)), border: Border.all(color: Colors.white24)),
        child: Theme(
          data: ThemeData(hintColor: Colors.transparent),
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, bottom: 0.0),
            child: TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                border: InputBorder.none,
                labelText: title,
                labelStyle: TextStyle(color: Colors.white24, fontSize: 15.0)
              ),
            ),
          ),
        ),
      ),
    );
  }
}