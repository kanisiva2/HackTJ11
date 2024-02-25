import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'vegetarian_model.dart';
export 'vegetarian_model.dart';

class VegetarianWidget extends StatefulWidget {
  const VegetarianWidget({super.key});

  @override
  State<VegetarianWidget> createState() => _VegetarianWidgetState();
}

class _VegetarianWidgetState extends State<VegetarianWidget> {
  late VegetarianModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VegetarianModel());
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
          setState(() => _model.vegetarian = !_model.vegetarian!);
        },
        value: _model.vegetarian!,
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
