//
//  HomeViewModel.swift
//  primeiroAppMVVM
//
//  Created by Luiz Gabriel Rebelatto Bianchi on 08/05/24.
//

import UIKit

class HomeViewModel {
    
    private var posts = [
        Posts(profileImage: "img2", userName: "Paulo", postImage: "post1"),
        Posts(profileImage: "img4", userName: "Samuel", postImage: "post2"),
        Posts(profileImage: "img3", userName: "Daniela Silva", postImage: "post3"),
        Posts(profileImage: "img6", userName: "Fred", postImage: "post4")
    ]
    
    public var getListPosts: [Posts] {
        posts
    }
    
    private var story = [
        Stories(image: "img1", username: "Add Story"),
        Stories(image: "img2", username: "Paulo"),
        Stories(image: "img3", username: "Daniela Silva"),
        Stories(image: "img4", username: "Samuel"),
        Stories(image: "img5", username: "Larissa"),
        Stories(image: "img6", username: "Fred"),
        Stories(image: "img5", username: "Gabriela"),
    ]
    
    public var getListStory: [Stories] {
        story
    }
    
    public var numberOfItems: Int {
        2
    }
    
    public func sizeForItemAt(indexPath: IndexPath, frame: CGRect) -> CGSize {
        if indexPath.row == 0 {
            return CGSize(width: 120, height: frame.height)
        } else {
            return CGSize(width: frame.width - 120, height: frame.height)
        }
    }
}
