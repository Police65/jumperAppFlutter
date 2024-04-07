import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'modal_task_details_widget.dart' show ModalTaskDetailsWidget;
import 'package:flutter/material.dart';

class ModalTaskDetailsModel extends FlutterFlowModel<ModalTaskDetailsWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for content widget.
  ScrollController? content;
  // Stores action output result for [Backend Call - Create Document] action in markComplete widget.
  ActivityRecord? completedActivity;
  // Stores action output result for [Backend Call - Create Document] action in markComplete widget.
  NotesRecord? taskActivityComplete;
  // Stores action output result for [Backend Call - Create Document] action in accept widget.
  ActivityRecord? activityCreated;
  // Stores action output result for [Backend Call - Create Document] action in accept widget.
  NotesRecord? taskActivity;
  // State field(s) for ListView widget.
  ScrollController? listViewController1;
  // State field(s) for ListView widget.
  ScrollController? listViewController2;
  // State field(s) for updateActivity widget.
  FocusNode? updateActivityFocusNode;
  TextEditingController? updateActivityController;
  String? Function(BuildContext, String?)? updateActivityControllerValidator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  NotesRecord? newNoteDesktop;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ActivityRecord? activityNew;

  @override
  void initState(BuildContext context) {
    content = ScrollController();
    listViewController1 = ScrollController();
    listViewController2 = ScrollController();
  }

  @override
  void dispose() {
    content?.dispose();
    listViewController1?.dispose();
    listViewController2?.dispose();
    updateActivityFocusNode?.dispose();
    updateActivityController?.dispose();
  }
}
