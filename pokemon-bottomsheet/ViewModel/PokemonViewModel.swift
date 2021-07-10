//
//  PokemonViewModel.swift
//  pokemon-bottomsheet
//
//  Created by jinreol on 2021/06/20.
//
import Foundation
import Combine

class PokemonViewModel: ObservableObject {

    // Output 
    @Published var pokemonlist: [PokemonItem]?

    init() {
        if let localData = self.readLocalFile(forName: "data") {
            if let pokemon = self.parse(jsonData: localData) {
                self.pokemonlist = pokemon.pokemon
            }
        }
    }

    private func readLocalFile(forName name: String) -> Data? {
        do {
            if let bundlePath = Bundle.main.path(forResource: name, ofType: "json"),
                let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                return jsonData
            }

        } catch {
            print(error)
        }

        return nil
    }

    private func loadJson(
        fromURLString urlString: String,
        completion: @escaping (Result<Data, Error>) -> Void
    ) {
        if let url = URL(string: urlString) {
            let urlSession = URLSession(configuration: .default).dataTask(with: url) { (data, _, error) in
                if let error = error {
                    completion(.failure(error))
                }

                if let data = data {
                    completion(.success(data))
                }
            }

            urlSession.resume()
        }
    }

    private func parse(jsonData: Data) -> Pokemon? {
        do {
            let decodedData = try JSONDecoder().decode(Pokemon.self, from: jsonData)
            return decodedData
        } catch {
            print("decode error: \(error).")
            return nil
        }
    }
}
