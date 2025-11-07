import 'dart:html' as html;
import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class PowerBIViewer extends StatefulWidget {
  final String url;

  const PowerBIViewer({super.key, required this.url});

  @override
  State<PowerBIViewer> createState() => _PowerBIViewerState();
}

class _PowerBIViewerState extends State<PowerBIViewer> {
  static final Set<String> _registeredViewTypes = <String>{};
  late String _viewType;

  @override
  void initState() {
    super.initState();
    
    _viewType = 'power-bi-iframe-${DateTime.now().millisecondsSinceEpoch}-${_registeredViewTypes.length}';
    
    // Registrar el iframe para Flutter Web
    _registerIFrame();
  }

  void _registerIFrame() {
    // Check if already registered to avoid duplicates
    if (_registeredViewTypes.contains(_viewType)) {
      return;
    }
    
    try {
      // ignore: undefined_prefixed_name
      ui.platformViewRegistry.registerViewFactory(
        _viewType,
        (int viewId) {
          return html.IFrameElement()
            ..src = widget.url
            ..style.border = 'none'
            ..style.width = '100%'
            ..style.height = '100%'
            ..allowFullscreen = true
            ..setAttribute('allow', 'fullscreen');
        },
      );
      
      _registeredViewTypes.add(_viewType);
    } catch (e) {
      debugPrint('Failed to register view factory: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: HtmlElementView(
        viewType: _viewType,
      ),
    );
  }
  
  @override
  void dispose() {
    // Clean up the registered view type
    _registeredViewTypes.remove(_viewType);
    super.dispose();
  }
}