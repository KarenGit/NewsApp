//
//  Metadata.swift
//  NewsiOS
//
//  Created by Karen Madoyan on 2021/1/24.
//

struct Metadata: Codable {
    let category: String!
    let title: String!
    let body: String!
    let shareUrl: String!
    let coverPhotoUrl: String!
    let date: Int!
    let gallery: [Gallery]!

    private enum CodingKeys: String, CodingKey {
        case category, title, body, shareUrl, coverPhotoUrl, date, gallery
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.category = try? container.decode(String.self, forKey: .category)
        self.title = try? container.decode(String.self, forKey: .title)
        self.body = try? container.decode(String.self, forKey: .body)
        self.shareUrl = try? container.decode(String.self, forKey: .shareUrl)
        self.coverPhotoUrl = try? container.decode(String.self, forKey: .coverPhotoUrl)
        self.date = try? container.decode(Int.self, forKey: .date)
        self.gallery = try? container.decode([Gallery].self, forKey: .gallery)
    }
//    init(_ dictionary: [String: Any]) {
}

//struct Metadata {
//    var category: String = ""
//    var title: String = ""
//    var body: String = ""
//    var shareUrl: String = ""
//    var coverPhotoUrl: String = ""
//    var date: Int = 0
//    var gallery: [Gallery] = []
//
//    init(_ dictionary: [String : AnyObject]) {
//        self.category = dictionary[""] as? String ?? ""
//        self.title = dictionary[""] as? String ?? ""
//        self.body = dictionary[""] as? String ?? ""
//        self.shareUrl = dictionary[""] as? String ?? ""
//        self.coverPhotoUrl = dictionary[""] as? String ?? ""
//        self.date = dictionary[""] as? Int ?? 0
//        self.gallery = dictionary[""] as? [Gallery] ?? []
//    }
//}
