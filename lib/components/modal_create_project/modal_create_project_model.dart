import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'modal_create_project_widget.dart' show ModalCreateProjectWidget;
import 'package:flutter/material.dart';

class ModalCreateProjectModel
    extends FlutterFlowModel<ModalCreateProjectWidget> {
  ///  Local state fields for this component.

  List<UsersRecord> assignUsers = [];
  void addToAssignUsers(UsersRecord item) => assignUsers.add(item);
  void removeFromAssignUsers(UsersRecord item) => assignUsers.remove(item);
  void removeAtIndexFromAssignUsers(int index) => assignUsers.removeAt(index);
  void insertAtIndexInAssignUsers(int index, UsersRecord item) =>
      assignUsers.insert(index, item);
  void updateAssignUsersAtIndex(int index, Function(UsersRecord) updateFn) =>
      assignUsers[index] = updateFn(assignUsers[index]);

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for projectName widget.
  FocusNode? projectNameFocusNode;
  TextEditingController? projectNameController;
  String? Function(BuildContext, String?)? projectNameControllerValidator;
  String? _projectNameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'zzv8enkj' /* Please enter a project name. */,
      );
    }

    if (val.length < 3) {
      return 'Requires at least 3 characters.';
    }

    return null;
  }

  // State field(s) for description widget.
  FocusNode? descriptionFocusNode;
  TextEditingController? descriptionController;
  String? Function(BuildContext, String?)? descriptionControllerValidator;
  String? _descriptionControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'e68qg04m' /* Please enter a short descripti... */,
      );
    }

    return null;
  }

  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ActivityRecord? newActivity2;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ProjectsRecord? createdProject;

  @override
  void initState(BuildContext context) {
    projectNameControllerValidator = _projectNameControllerValidator;
    descriptionControllerValidator = _descriptionControllerValidator;
  }

  @override
  void dispose() {
    projectNameFocusNode?.dispose();
    projectNameController?.dispose();

    descriptionFocusNode?.dispose();
    descriptionController?.dispose();
  }
}
