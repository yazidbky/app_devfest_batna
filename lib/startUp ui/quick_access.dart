import 'dart:html' as html;
import 'dart:ui';
import 'package:app_devfest_batna/cubit/uplaod%20csv%20cubit/uplaod_csv_cubit.dart';
import 'package:app_devfest_batna/cubit/uplaod%20csv%20cubit/uplaod_csv_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:app_devfest_batna/components/upload_files.dart';
import 'package:app_devfest_batna/components/custom_button.dart';
import 'package:app_devfest_batna/components/main_color.dart';

class QuickAccess extends StatefulWidget {
  final Function(String) onNavigate;

  const QuickAccess({super.key, required this.onNavigate});

  @override
  State<QuickAccess> createState() => _QuickAccessState();
}

class _QuickAccessState extends State<QuickAccess> {
  String? selectedFileName;
  html.File? selectedFile;
  final GlobalKey<ScaffoldMessengerState> _scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  Future<void> _pickCsvFile() async {
    try {
      final html.FileUploadInputElement input = html.FileUploadInputElement();
      input.accept = '.csv';
      input.multiple = false;

      input.click();

      input.onChange.listen((e) async {
        final files = input.files;
        if (files!.isEmpty) {
          print("No file selected.");
          return;
        }

        final file = files[0];
        if (file.size > 5 * 1024 * 1024) {
          _showErrorDialog(
              "File too large. Please upload a file smaller than 5MB.");
          return;
        }

        setState(() {
          selectedFile = file;
          selectedFileName = file.name;
        });

        _validateCsvFile(file);
      });
    } catch (e) {
      _showErrorDialog("An error occurred while picking the file.");
    }
  }

  void _validateCsvFile(html.File file) {
    final reader = html.FileReader();
    reader.readAsText(file);

    reader.onLoadEnd.listen((e) {
      final content = reader.result as String;

      if (!content.contains(',')) {
        setState(() {
          selectedFileName = null;
        });
        _showErrorDialog("The selected file is not a valid CSV format.");
      }
    });
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _showFloatingSnackBar(String message) {
    _scaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldMessengerKey,
      body: Stack(
        children: [
          // Main UI
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.4,
                  child: UploadCard(
                    title: 'Upload your Data',
                    subtitle: 'Please Upload Your Valid Data',
                    dragFile: 'Drag File',
                    fileName: selectedFileName ?? 'No file selected',
                    fileSize:
                        'Size: ${selectedFileName != null ? 'Valid CSV' : 'Unknown'}',
                    onTap: _pickCsvFile,
                  ),
                ),
              ),
              BlocConsumer<FileUploadCubit, FileUploadState>(
                listener: (context, state) {
                  if (state is FileUploadSuccess) {
                    widget.onNavigate('Dashboard');
                    _showFloatingSnackBar("File successfully uploaded!");
                  } else if (state is FileUploadFailure) {
                    _showFloatingSnackBar(state.error);
                  }
                },
                builder: (context, state) {
                  if (state is FileUploadFailure) {
                    return Text(
                      state.error,
                      style: const TextStyle(color: Colors.red),
                    );
                  } else {
                    return const SizedBox.shrink(); // No progress bar here
                  }
                },
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.4,
                child: CustomButton(
                  text: 'Next',
                  borderColor: mainColor,
                  onPressed: selectedFile != null
                      ? () {
                          context.read<FileUploadCubit>().uploadCsvFile(
                                selectedFile!,
                                selectedFileName!,
                              );
                        }
                      : () {
                          _showFloatingSnackBar(
                              "Please select a file to upload.");
                        },
                  color: mainColor,
                  textColor: Colors.white,
                  size: 0.4,
                ),
              ),
            ],
          ),
          // Overlay with blur and progress bar
          BlocBuilder<FileUploadCubit, FileUploadState>(
            builder: (context, state) {
              if (state is FileUploadLoading) {
                return Stack(
                  children: [
                    // Blur effect
                    Positioned.fill(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                        child: Container(
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),
                    ),
                    // Centered circular progress bar
                    Center(
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 10,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: CircularProgressIndicator(
                            strokeWidth: 6,
                            color: mainColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                return const SizedBox.shrink(); // No overlay when not loading
              }
            },
          ),
        ],
      ),
    );
  }
}
