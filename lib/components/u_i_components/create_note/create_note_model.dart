import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'create_note_widget.dart' show CreateNoteWidget;
import 'package:flutter/material.dart';

class CreateNoteModel extends FlutterFlowModel<CreateNoteWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for shortBio widget.
  FocusNode? shortBioFocusNode;
  TextEditingController? shortBioController;
  String? Function(BuildContext, String?)? shortBioControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  NotesRecord? newNote;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ActivityRecord? activityCreated;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    shortBioFocusNode?.dispose();
    shortBioController?.dispose();
  }
}
