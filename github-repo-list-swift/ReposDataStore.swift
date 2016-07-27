//
//  FISReposDataStore.swift
//  github-repo-list-swift
//
//  Created by Haaris Muneer on 6/28/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ReposDataStore {
    
    static let sharedInstance = ReposDataStore()
    var repositories = [GithubRepository]()
    
    // Completion handler requires no arguments in this case, because the data from the API is being captured in the repositories property of ReposDataStore. (You do not need a local parameter to capture the information.)
    func getRepositoriesWithCompletion(completion: () -> ()) {
        
        GithubAPIClient.getRepositoriesWithCompletion { (reposArray) in
            // repositories.removeAll() // You want to remove previously loaded information, otherwise the data store will have duplicates from each request to the API.
            
            for webRepository in reposArray {
                let repository = GithubRepository.init(dictionary: webRepository)
                self.repositories.append(repository)
            }
            
            // You call the completion handler as soon as you know that the repository is successfully being populated with GithubRepository objects. This is when the reposArray is not empty or count is greater than zero.
            if !reposArray.isEmpty {
                    completion()
            }
        }
    }

}
