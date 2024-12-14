import 'dart:html' as html;
import 'package:app_devfest_batna/api/upload%20csv/upload_csv_api.dart';
import 'package:app_devfest_batna/cubit/histogram%20cubit/histogram_cubit.dart';
import 'package:app_devfest_batna/cubit/uplaod%20csv%20cubit/uplaod_csv_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FileUploadCubit extends Cubit<FileUploadState> {
  FileUploadCubit() : super(FileUploadInitial());

  final FileUploadApiService _apiService = FileUploadApiService();

  Future<void> uploadCsvFile(
      html.File file, String fileName, BuildContext context) async {
    emit(FileUploadLoading());

    try {
      final response = await _apiService.uploadCsvFile(
        csvFile: file,
        csvFileBytes: [], // Fill in with the file's byte data
        fileName: fileName,
      );

      if (response["success"] == true) {
        // Get the fileId from the response and set it in the DashboardCubit
        final fileId = response["fileId"];
        final dashboardCubit = BlocProvider.of<DashboardCubit>(context);
        dashboardCubit.fetchDashboardData(fileId: fileId);

        emit(FileUploadSuccess(response["message"]));
      } else {
        emit(FileUploadFailure(response["error"] ?? "File upload failed."));
      }
    } catch (e) {
      emit(FileUploadFailure("An error occurred while uploading the file."));
    }
  }
}
