//
//  Bantuan.swift
//  SafeType
//
//  Created by Yafonia Hutabarat on 15/10/21.
//

import Foundation

struct Bantuan: Decodable {
    var question: String
    var explanation: String
}

func loadBantuanStaticData() -> [Bantuan]{
    if let data = readLocalFile() {
        return parse(jsonData: data)
    }
    return []
}

private func readLocalFile() -> Data? {
    do {
        if let bundlePath = Bundle.main.path(forResource: "bantuanContent",
                                             ofType: "json"),
            let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
            return jsonData
        }
    } catch {
        print(error)
    }
    return nil
}

private func parse(jsonData: Data) -> [Bantuan] {
    do {
        let decodedData = try JSONDecoder().decode([Bantuan].self,
                                                   from: jsonData)
        return decodedData
    } catch {
        print("decode error")
    }
    return []
}

