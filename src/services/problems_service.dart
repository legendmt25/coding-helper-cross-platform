class ProblemEntry {
  String id;
  String code;
  String markdown;
  String title;
  String? description;
  String difficulty;

  ProblemEntry(this.id, this.title, this.code, this.markdown, this.description, this.difficulty);
}

List<ProblemEntry> ENTRIES = [
  ProblemEntry('0', 'title', 'code', 'markdown', 'description', 'Easy'),
  ProblemEntry('1', 'title', 'code', 'markdown', 'description', 'Medium')
];

class ProblemsService {
  const ProblemsService();

  Future<List<ProblemEntry>> getProblemEntries() {
    return Future.delayed(const Duration(milliseconds: 500), () => ENTRIES);
  }

  Future<ProblemEntry> getProblemEntry(String id) {
    return Future.delayed(
      const Duration(milliseconds: 500),
      () => ENTRIES.firstWhere((entry) => entry.id == id),
    );
  }
}
