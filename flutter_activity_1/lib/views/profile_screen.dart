import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:flutter_activity_1/widgets/profile_info_row.dart';
import 'package:flutter_activity_1/widgets/ph_dropdown.dart';
import 'package:go_router/go_router.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? _selectedImage; // For Mobile
  Uint8List? _selectedImageBytes; // For Web
  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image == null) return;

    if (kIsWeb) {
      final bytes = await image.readAsBytes();
      setState(() {
        _selectedImageBytes = bytes;
      });
    } else {
      setState(() {
        _selectedImage = File(image.path);
      });
    }
  }

  Future<void> pickImageWeb() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image == null) return;

    final bytes = await image.readAsBytes();
    setState(() {
      _selectedImageBytes = bytes; // store bytes for MemoryImage
    });
  }

  Future<void> requestPermissions() async {
    if (kIsWeb) {
      // Web
      pickImageWeb(); 
      return;
    }

    // Mobile
    final statuses = await [Permission.photos, Permission.camera].request();
    final galleryStatus = statuses[Permission.photos];
    final cameraStatus = statuses[Permission.camera];

    if (galleryStatus!.isGranted && cameraStatus!.isGranted) {
      pickImage();
    } else if (galleryStatus.isPermanentlyDenied || cameraStatus!.isPermanentlyDenied) {
      showPermissionDialog();
    } else {

      await Permission.photos.request();
      await Permission.camera.request();
    }
  }
  void showPermissionDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Permission Required"),
        content: const Text(
          "Camera and Gallery permissions are permanently denied. "
          "Please enable them in app settings."
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () => openAppSettings(),
            child: const Text("Open Settings"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title:
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () => context.go('/for-you'),
                    child: const HugeIcon(
                      icon: HugeIcons.strokeRoundedArrowLeft02,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                ),
                
                Text("Your Profile", style: TextStyle(color: Colors.white),),
                SizedBox(width: 30),
              ],
            ),
          ),
      ),
      
     
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 12,
            children: [
              SizedBox(height: 50,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: 
                    GestureDetector(
                      onTap: () => requestPermissions(),
                      child: 
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.white,
                          backgroundImage: kIsWeb
                              ? (_selectedImageBytes != null ? MemoryImage(_selectedImageBytes!) : null)
                              : (_selectedImage != null ? FileImage(_selectedImage!) : null) as ImageProvider?,
                          child: (_selectedImage == null && _selectedImageBytes == null)
                              ? const HugeIcon(
                                  icon: HugeIcons.strokeRoundedUserEdit01,
                                  color: Colors.black,
                                  size: 40,
                                )
                              : null,
                        ),
                    )
                      
                  ),
                  
                  SizedBox(width: 20,),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
      
                    children: [
                      Text("Buwie Santos", 
                        style: TextStyle(color: Colors.white, fontSize: 24), 
                      ),
                      Text("buwie@gmail.com", 
                          style: TextStyle(color: Colors.white),
                          
                      ),

                    ],
                  ),
                ]
              ) ,
              
              const SizedBox(height: 20),


              PhDropdown(),
              
              const SizedBox(height: 30),

                Padding(
                  padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
                  child: Column(
                    spacing: 30,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      
                      ProfileInfoRow(
                        rowText: "Notifications", 
                        rowIcon: HugeIcon(icon: HugeIcons.strokeRoundedNotification01, color: Colors.white,),
                      ),
                      ProfileInfoRow(
                        rowText: "Settings", 
                        rowIcon: HugeIcon(icon: HugeIcons.strokeRoundedSettings01, color: Colors.white,),
                      ),
                      ProfileInfoRow(
                        rowOnTap: () => context.go('/access'),
                        rowText: "Log out", 
                        rowIcon: HugeIcon(icon: HugeIcons.strokeRoundedLogout01, color: Colors.white,),
                      ),

                      
            
                    ],
                  ),
                ),

                const SizedBox(height: 30),
            
            ],
          ),
          
        ),
        
      ),
      
    );
    
  }
}