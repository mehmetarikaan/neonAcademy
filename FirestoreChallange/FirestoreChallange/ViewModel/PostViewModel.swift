//
//  PostViewModel.swift
//  FirestoreChallange
//
//  Created by Mehmet Arıkan on 26.02.2023.
//

import Foundation

struct PostViewModel {
    let post: Post
    
    var imageUrl: URL? { return URL(string: post.imageUrl) }
    
    var userProfileImageUrl: URL? { return URL(string: post.ownerImageUrl) }
    
    var username: String { return post.ownerUsername }
    
    var caption: String { return post.caption }
    
    init(post: Post) {
        self.post = post
    }
}
