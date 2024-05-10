//
//  RepInfoAPI.swift
//  API Project
//
//  Created by Cesar Fernandez on 5/9/24.
//

import Foundation

struct RepInfoAPI {
   
    static func fetchRepInfo(zip: String) async -> [RepInfo] {
        do {
            // Step 1: Declare URL
            let url = URL(string: "https://whoismyrepresentative.com/getall_mems.php?zip=\(zip)&output=json")!
            
            // Step 2: Get Data back from the URL
            let (data, _) = try await URLSession.shared.data(from: url)
            
            // Step 3: Convert that data to something you care about
            let results = try JSONDecoder().decode(RepInfoResults.self, from: data)
                
            return results.results
        } catch {
            print("Failed to get representative info \(error)")
            fatalError()
        }
    }
}
