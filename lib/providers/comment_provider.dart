import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pharmassist/providers/comment.dart';

class CommentProvider with ChangeNotifier {
  void createCommentSection(String id) {
    FirebaseFirestore.instance.collection('commentSections/').doc(id).set({});
  }

  void addComment(
      String sectionId, String commentId, String comment, String username) {
    FirebaseFirestore.instance
        .collection('commentSections/')
        .doc(sectionId)
        .collection('comments')
        .doc(commentId)
        .set({
      'id': commentId,
      'username': username,
      'comment': comment,
    });
  }
}
