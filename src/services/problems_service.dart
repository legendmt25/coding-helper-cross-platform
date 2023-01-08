class ProblemEntry {
  String id;
  String code;
  String markdown;

  ProblemEntry(this.id, this.code, this.markdown);
}

List<ProblemEntry> ENTRIES = [
  ProblemEntry('0', 'code', 'markdown'),
  ProblemEntry('1', 'code', 'markdown')
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
