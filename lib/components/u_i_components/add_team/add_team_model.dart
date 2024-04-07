import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'add_team_widget.dart' show AddTeamWidget;
import 'package:flutter/material.dart';

class AddTeamModel extends FlutterFlowModel<AddTeamWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for searchField widget.
  FocusNode? searchFieldFocusNode;
  TextEditingController? searchFieldController;
  String? Function(BuildContext, String?)? searchFieldControllerValidator;
  List<UsersRecord> simpleSearchResults = [];
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ActivityRecord? newActivity;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  NotesRecord? taskActivity;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    searchFieldFocusNode?.dispose();
    searchFieldController?.dispose();
  }
}
