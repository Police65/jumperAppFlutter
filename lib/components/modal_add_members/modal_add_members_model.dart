import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'modal_add_members_widget.dart' show ModalAddMembersWidget;
import 'package:flutter/material.dart';

class ModalAddMembersModel extends FlutterFlowModel<ModalAddMembersWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ActivityRecord? activityCreated;
  Completer<List<UsersRecord>>? firestoreRequestCompleter;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ActivityRecord? newActivity;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}

  /// Additional helper methods.
  Future waitForFirestoreRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = firestoreRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
