//
//  RequestResponse.swift
//  NewsiOS
//
//  Created by Karen Madoyan on 2021/1/25.
//


struct RequestResponse: Codable {
    let success: Bool!
//    let errors: Error!
//    let internal_errors: Error!
    let metadata: [Metadata]!
    
    private enum CodingKeys: String, CodingKey {
        case success, metadata
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.success = try? container.decode(Bool.self, forKey: .success)
//        self.errors = try? container.decode(Error.self, forKey: .errors)
//        self.internal_errors = try? container.decode(Error.self, forKey: .internal_errors)
        self.metadata = try? container.decode([Metadata].self, forKey: .metadata)
    }
}
