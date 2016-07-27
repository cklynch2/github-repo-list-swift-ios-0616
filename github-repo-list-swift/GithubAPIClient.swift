//
//  FISGithubAPIClient.swift
//  github-repo-list-swift
//
//  Created by Haaris Muneer on 6/28/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class GithubAPIClient {
    
    // May need to use NSDictionary instead of Swift type-specified dictionary.
    class func getRepositoriesWithCompletion(completion: [[String:AnyObject]] -> ()) {
        let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
        
        let gitHubReposURLOptional = NSURL(string: "https://api.github.com/repositories?client_id=\(Secrets.clientID)&client_secret=\(Secrets.clientSecret)")
        
        guard let gitHubReposURL = gitHubReposURLOptional
            else {
                print("There was an error assigning the URL string to an NSURL object.")
                return
            }
        
        let task = session.dataTaskWithURL(gitHubReposURL) { (dataOptional, response, error) in
            guard let data = dataOptional
                else {
                    print("There was an error retrieving NSData object from the data task.")
                    return
                }
            
            do {
                let reposArray = try NSJSONSerialization.JSONObjectWithData(data, options: []) as! [[String:AnyObject]]
                
                completion(reposArray)
                
            } catch {
                print("There was an error executing the NSURLSessionDataTask: \(error)")
            }
        }
        task.resume()
    }
    
}

