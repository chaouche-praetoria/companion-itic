import 'package:flutter/material.dart';

mixin AutoScrollMixin<T extends StatefulWidget> on State<T> {
  final ScrollController scrollController = ScrollController();
  final Map<String, GlobalKey> fieldKeys = {};
  final Map<String, FocusNode> focusNodes = {};
  
  @override
  void dispose() {
    scrollController.dispose();
    focusNodes.values.forEach((node) => node.dispose());
    super.dispose();
  }
  
  void registerField(String fieldId, {FocusNode? focusNode}) {
    fieldKeys[fieldId] = GlobalKey();
    
    if (focusNode != null) {
      focusNodes[fieldId] = focusNode;
      focusNode.addListener(() {
        if (focusNode.hasFocus) {
          _scrollToField(fieldKeys[fieldId]!);
        }
      });
    }
  }
  
  void scrollToField(String fieldId) {
    final key = fieldKeys[fieldId];
    if (key != null) {
      _scrollToField(key);
    }
  }
  
  void _scrollToField(GlobalKey fieldKey) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (fieldKey.currentContext != null && scrollController.hasClients) {
        final RenderBox renderBox = fieldKey.currentContext!.findRenderObject() as RenderBox;
        final position = renderBox.localToGlobal(Offset.zero);
        final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
        
        if (keyboardHeight > 0) {
          final screenHeight = MediaQuery.of(context).size.height;
          final targetPosition = position.dy - (screenHeight * 0.3);
          
          scrollController.animateTo(
            targetPosition.clamp(0.0, scrollController.position.maxScrollExtent),
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        }
      }
    });
  }
  
  Widget buildFieldWithKey(String fieldId, Widget child) {
    return Container(
      key: fieldKeys[fieldId],
      child: child,
    );
  }
}
