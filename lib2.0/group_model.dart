class Group {
  final String groupTopic;
  final String? batchRequisites;
  final int numOfMembers;

  Group({
    required this.groupTopic,
    this.batchRequisites,
    required this.numOfMembers,
  });
}

// Global list to store groups
//List<Group> groups = [];
