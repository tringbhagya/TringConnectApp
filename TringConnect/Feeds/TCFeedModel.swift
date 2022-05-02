//
//  TCFeedModel.swift
//  TringConnect
//
//  Created by Bhagya on 01/05/22.
//

import Foundation

struct TCFeedModel: Decodable {
    let items: [TCFeed]?
}

struct TCFeed: Decodable {
    let id: Int?
    let name: String?
    let role: String?
    let post: String?
    let type: String?
    let tags: [String]?
    let media: TCMedia?
    let userAvatar: String?
    let date: String?
    let time: String?
    let likes: Int?
    let comments: Int?
}

struct TCMedia: Decodable {
    let images: [String]?
    let videos: [String]?
    let banner: TCBanner?
    let courses: [TCCourse]?
}

struct TCBanner: Decodable {
    let image: String?
    let title: String?
    let website: String?
    let duration: String?
}

struct TCCourse: Decodable {
    let image: String?
    let title: String?
}
