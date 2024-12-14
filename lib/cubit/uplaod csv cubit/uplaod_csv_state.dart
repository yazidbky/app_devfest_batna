abstract class FileUploadState {}

class FileUploadInitial extends FileUploadState {}

class FileUploadLoading extends FileUploadState {
  get progress => null;
}

class FileUploadSuccess extends FileUploadState {
  final String message;
  FileUploadSuccess(this.message);
}

class FileUploadFailure extends FileUploadState {
  final String error;
  FileUploadFailure(this.error);
}
