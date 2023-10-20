class Links {
  final Next? next;

  Links({
    this.next,
  });

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        next: json['next'] == null ? null : Next.fromJson(json['next']),
      );
}

class Next {
  final String? title;
  final String? href;

  Next({
    this.title,
    this.href,
  });

  factory Next.fromJson(Map<String, dynamic> json) => Next(
        title: json['title'],
        href: json['href'],
      );
}
