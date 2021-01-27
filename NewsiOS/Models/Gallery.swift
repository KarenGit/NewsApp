//
//  Gallery.swift
//  NewsiOS
//
//  Created by Karen Madoyan on 2021/1/24.
//

struct Gallery: Codable {
    let title: String!
    let thumbnailUrl: String!
    let contentUrl: String!
    
    private enum CodingKeys: String, CodingKey {
        case title, thumbnailUrl, contentUrl
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try? container.decode(String.self, forKey: .title)
        self.thumbnailUrl = try? container.decode(String.self, forKey: .thumbnailUrl)
        self.contentUrl = try? container.decode(String.self, forKey: .contentUrl)
    }
}
