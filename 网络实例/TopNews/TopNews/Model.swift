//
//  Model.swift
//  TopNews
//
//  Created by student on 2024/10/24.
//
import Foundation


struct NewsModel: Codable {
    let reason: String
    let result: News
    let error_code: Int
}


struct News: Codable {
    let stat: String
    let data: [Item]
    let page, pageSize: String
}


struct Item: Codable {
    let uniquekey, title, date: String
    let category: String
    let author_name: String
    let url: String
    let thumbnail_pic_s: String
    let thumbnail_pic_s02, thumbnail_pic_s03: String?
    let is_content: String
}
