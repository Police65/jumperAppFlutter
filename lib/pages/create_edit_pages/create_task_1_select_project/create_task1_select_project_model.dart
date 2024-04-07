import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'create_task1_select_project_widget.dart'
    show CreateTask1SelectProjectWidget;
import 'dart:async';
import 'package:flutter/material.dart';

class CreateTask1SelectProjectModel
    extends FlutterFlowModel<CreateTask1SelectProjectWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  Completer<List<ProjectsRecord>>? firestoreRequestCompleter;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }

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
