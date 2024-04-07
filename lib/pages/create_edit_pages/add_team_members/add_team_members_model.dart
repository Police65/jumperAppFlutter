import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'add_team_members_widget.dart' show AddTeamMembersWidget;
import 'package:flutter/material.dart';

class AddTeamMembersModel extends FlutterFlowModel<AddTeamMembersWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for userName widget.
  FocusNode? userNameFocusNode;
  TextEditingController? userNameController;
  String? Function(BuildContext, String?)? userNameControllerValidator;
  String? _userNameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        '41umybiv' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressController;
  String? Function(BuildContext, String?)? emailAddressControllerValidator;
  String? _emailAddressControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'i5wagnfq' /* Field is required */,
      );
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Has to be a valid email address.';
    }
    return null;
  }

  // State field(s) for titleRole widget.
  FocusNode? titleRoleFocusNode;
  TextEditingController? titleRoleController;
  String? Function(BuildContext, String?)? titleRoleControllerValidator;
  String? _titleRoleControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return FFLocalizations.of(context).getText(
        'h5euxn0m' /* Field is required */,
      );
    }

    return null;
  }

  // State field(s) for teamSelect widget.
  String? teamSelectValue;
  FormFieldController<String>? teamSelectValueController;
  // State field(s) for shortBio widget.
  FocusNode? shortBioFocusNode;
  TextEditingController? shortBioController;
  String? Function(BuildContext, String?)? shortBioControllerValidator;

  @override
  void initState(BuildContext context) {
    userNameControllerValidator = _userNameControllerValidator;
    emailAddressControllerValidator = _emailAddressControllerValidator;
    titleRoleControllerValidator = _titleRoleControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    userNameFocusNode?.dispose();
    userNameController?.dispose();

    emailAddressFocusNode?.dispose();
    emailAddressController?.dispose();

    titleRoleFocusNode?.dispose();
    titleRoleController?.dispose();

    shortBioFocusNode?.dispose();
    shortBioController?.dispose();
  }
}
