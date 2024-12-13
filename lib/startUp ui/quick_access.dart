import 'package:app_devfest_batna/components/custom_button.dart';
import 'package:app_devfest_batna/components/main_color.dart';
import 'package:app_devfest_batna/components/upload_files.dart';
import 'package:flutter/material.dart';

class QuickAccess extends StatefulWidget {
  const QuickAccess({super.key});

  @override
  State<QuickAccess> createState() => _QuickAccessState();
}

class _QuickAccessState extends State<QuickAccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              width: MediaQuery.sizeOf(context).width *
                  0.4, // Adjust the width as needed
              child: const UploadCard(
                title: 'Upload your Data',
                subtitle: 'Please Upload Your Valid Data',
                drgaFile: 'drgaFile',
                fileName: 'fileName',
                fileSize: 'fileSize',
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.4,
            child: CustomButton(
              text: 'Next',
              borderColor: mainColor,
              onPressed: () {},
              color: mainColor,
              textColor: Colors.white,
              size: 0.4,
            ),
          ),
        ],
      ),
    );
  }
}
