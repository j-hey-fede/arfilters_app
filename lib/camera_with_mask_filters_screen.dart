import 'package:avatar_view/avatar_view.dart';
import 'package:flutter/material.dart';
import 'package:camera_deep_ar/camera_deep_ar.dart';
import 'dart:io' as Platform;

class CameraWithMaskFiltersScreen extends StatefulWidget {
  @override
  _CameraWithMaskFiltersScreenState createState() =>
      _CameraWithMaskFiltersScreenState();
}

class _CameraWithMaskFiltersScreenState
    extends State<CameraWithMaskFiltersScreen> {
  CameraDeepArController cameraDeepArController;
  String platformVersion = "Unknown";
  int currentPage = 0;
  final vp = PageController(viewportFraction: 0.24);
  Effects currentEffects = Effects.none;
  Filters currentFilters = Filters.none;
  Masks currentMasks = Masks.none;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            // Deep AR camera
            CameraDeepAr(
              onCameraReady: (isReady) {
                platformVersion = "Camera Status $isReady";
                print(platformVersion);
                setState(() {});
              },
              androidLicenceKey:
                  "e40607cdfaaa4c9f740fe2b938a1b1f47fe803f9eed684c8d6cf2651fce585927450cad29772c588",
              cameraDeepArCallback: (c) async {
                cameraDeepArController = c;
                setState(() {});
              },
              onImageCaptured: (String path) {
                platformVersion = "Image Save at $path";
                print(platformVersion);
                setState(() {});
              },
              onVideoRecorded: (String path) {},
              iosLicenceKey:
                  "cb3e77c21cd8154e230f425267d30518956c59c1ca77af7ce0cc8fbf09c67079b1e19bb4fad2679d",
            ),
            // Face Mask Filters - Image buttons
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 28.0, right: 28.0),
                      child: Expanded(
                        child: IconButton(
                          icon: Icon(
                            Icons.camera_enhance,
                            color: Colors.white54,
                            size: 36,
                          ),
                          onPressed: () {
                            if (null == cameraDeepArController) {
                              return;
                            }
                            cameraDeepArController.snapPhoto();
                          },
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                          children: List.generate(8, (page) {
                        bool active = currentPage == page;
                        return Platform.Platform.isIOS
                            ? GestureDetector(
                                onTap: () {
                                  currentPage = page;
                                  cameraDeepArController.changeMask(page);
                                  setState(() {});
                                },
                                child: AvatarView(
                                  radius: active ? 65 : 30,
                                  borderColor: Colors.amber,
                                  borderWidth: 2,
                                  isOnlyText: false,
                                  avatarType: AvatarType.CIRCLE,
                                  backgroundColor: Colors.red,
                                  imagePath:
                                      "assets/ios/${page.toString()}.jpg",
                                  placeHolder: Icon(
                                    Icons.person,
                                    size: 50,
                                  ),
                                  errorWidget: Icon(
                                    Icons.error,
                                    size: 50,
                                  ),
                                ),
                              )
                            : GestureDetector(
                                onTap: () {
                                  currentPage = page;
                                  cameraDeepArController.changeMask(page);
                                  setState(() {});
                                },
                                child: AvatarView(
                                  radius: active ? 45 : 25,
                                  borderColor: Colors.amber,
                                  borderWidth: 2,
                                  isOnlyText: false,
                                  avatarType: AvatarType.CIRCLE,
                                  backgroundColor: Colors.red,
                                  imagePath:
                                      "assets/android/${page.toString()}.jpg",
                                  placeHolder: Icon(
                                    Icons.person,
                                    size: 50,
                                  ),
                                  errorWidget: Icon(
                                    Icons.error,
                                    size: 50,
                                  ),
                                ),
                              );
                      })),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
