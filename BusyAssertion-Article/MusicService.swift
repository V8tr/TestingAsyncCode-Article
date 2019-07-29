//
//  MusicService.swift
//  BusyAssertion-Article
//
//  Created by Vadym Bulavin on 7/29/19.
//  Copyright © 2019 Vadym Bulavin. All rights reserved.
//

import Foundation

class MusicService {
    
    func search(_ term: String, completion: @escaping (Result<[Track], Error>) -> Void) {
        var components = URLComponents(string: "https://itunes.apple.com/search")
        components?.queryItems = [
            .init(name: "media", value: "music"),
            .init(name: "entity", value: "song"),
            .init(name: "term", value: "\(term)")
        ]
        
        URLSession.shared.dataTask(with: components!.url!) { data, response, error in
            if let data = data, (response as? HTTPURLResponse)?.statusCode == 200 {
                let tracks = try? JSONDecoder().decode(SearchMediaResponse.self, from: data).results
                DispatchQueue.main.async {
                    completion(.success(tracks ?? []))
                }
            } else {
                completion(.failure(APIError.unexpected(error)))
            }
        }.resume()
    }
}

private enum APIError: Error {
    case unexpected(Error?)
}

private struct SearchMediaResponse: Decodable {
    let results: [Track]
}
