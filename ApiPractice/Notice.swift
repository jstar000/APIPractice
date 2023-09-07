//
//  Notice.swift
//  ApiPractice
//
//  Created by 임지성 on 2023/08/12.
//

import Foundation

public class Notice {
    private var postedDate: String //공지글 게시일
    private var subject: String //공지글 제목
    private var articleId: String //URL에 있는 공지글 고유 ID
    private var url: String //공지글 URL
    
    init(postedDate: String, subject: String, articleId: String, url: String) {
        self.postedDate = postedDate
        self.subject = subject
        self.articleId = articleId
        self.url = url
    }
    
    public func getPostedDate() -> String {
        return postedDate
    }
    
    public func getSubject() -> String {
        return subject
    }
    
    public func getArticleId() -> String {
        return articleId
    }
    
    public func getUrl() -> String {
        return url
    }
}
