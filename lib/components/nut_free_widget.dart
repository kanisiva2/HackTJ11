import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'nut_free_model.dart';
export 'nut_free_model.dart';

class NutFreeWidget extends StatefulWidget {
  const NutFreeWidget({super.key});

  @override
  State<NutFreeWidget> createState() => _NutFreeWidgetState();
}

class _NutFreeWidgetState extends State<NutFreeWidget> {
  late NutFreeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NutFreeModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(1.0, 1.0),
      child: ToggleIcon(
        onPressed: () async {
          setState(() => _model.nutFree = !_model.nutFree!);
        },
        value: _model.nutFree!,
        onIcon: Icon(
          Icons.circle,
          color: FlutterFlowTheme.of(context).primary,
          size: 25.0,
        ),
        offIcon: Icon(
          Icons.circle_outlined,
          color: FlutterFlowTheme.of(context).secondaryText,
          size: 25.0,
        ),
      ),
    );
  }
}
