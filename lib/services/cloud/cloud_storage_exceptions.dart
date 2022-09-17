class CloudStorageException implements Exception {
  const CloudStorageException();
}
// C in crud
class CouldNotCreateNotesException extends CloudStorageException {}

// R in crud
class CouldNotGetAllNotesException extends CloudStorageException {}

// U in crud
class CouldNotUpdateNotesException extends CloudStorageException {}

// D in crud
class CouldNotDeleteNoteException extends CloudStorageException {}
