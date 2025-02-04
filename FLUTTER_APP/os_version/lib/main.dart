import 'package:flutter/material.dart';
import 'dart:io';

void main() {
  runApp(DeviceInfoApp());
}

class DeviceInfoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Device Info',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: DeviceInfoScreen(),
    );
  }
}

class DeviceInfoScreen extends StatefulWidget {
  @override
  _DeviceInfoScreenState createState() => _DeviceInfoScreenState();
}

class _DeviceInfoScreenState extends State<DeviceInfoScreen> {
  String deviceInfo = "Loading device info...";

  @override
  void initState() {
    super.initState();
    fetchDeviceInfo();
  }

  void fetchDeviceInfo() {
    try {
      String osName = Platform.operatingSystem; // e.g., "windows"
      String osVersion = Platform.operatingSystemVersion; // OS version details

      setState(() {
        deviceInfo = "OS: $osName\nVersion: $osVersion";
      });
    } catch (e) {
      setState(() {
        deviceInfo = "Failed to get device info: $e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Device Info")),
      body: Center(
        child: Text(
          deviceInfo,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
