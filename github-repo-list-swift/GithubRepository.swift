//
//  FISGithubRepository.swift
//  github-repo-list-swift
//
//  Created by Haaris Muneer on 6/28/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class GithubRepository {
    
    let fullName: String
    let htmlURL: NSURL
    let repositoryID: String
    
    // This initializer turns API dictionary into an instance of GithubRepository class:
    init(dictionary: [String: AnyObject]) {
        
        if let fullNameDictionaryResult = dictionary["full_name"] {
            fullName = String(fullNameDictionaryResult)
        } else {
            print("ERROR: No full name key for this repo.")
            fullName = ""
        }
        
        if let htmlURLDictionaryResult = dictionary["html_url"] {
            htmlURL = NSURL(string: String(htmlURLDictionaryResult))!
        } else {
            print("ERROR: No html URL key for this repo.")
            htmlURL = NSURL()
        }
        
        if let repoIDDictionaryResult = dictionary["id"] {
            repositoryID = String(repoIDDictionaryResult)
        } else {
            print("ERROR: No ID key for this repo.")
            repositoryID = ""
        }
    }
    
}
