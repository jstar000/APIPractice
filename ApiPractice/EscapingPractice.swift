//
//  EscapingPractice.swift
//  ApiPractice
//
//  Created by 임지성 on 2023/08/15.
//

import SwiftUI

class EscapingViewModel: ObservableObject {
    @Published var text: String = "안녕하세요"
    
    func getData() {
        /*
        downloadData2 { data in
            text = data
        }
        */
        
        downloadData3 { [weak self] data in
            self?.text = data
        }
    }
    
    func downloadData() -> String {
        return "서근블로그 입니다."
    }
    
    func downloadData2(completionHandler: (_ data: String) -> Void) {
        completionHandler("서근블로그 입니다")
    }
    
    func downloadData3(completionHandler: @escaping (_ data: String) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            completionHandler("서근블로그 입니다")
        }
    }
}

struct EscapingPractice: View {
    @StateObject var ViewModel = EscapingViewModel()
    
    var body: some View {
        Text(ViewModel.text)
            .font(Font.largeTitle.bold())
            .foregroundColor(.yellow)
            .onTapGesture {
                let str = ViewModel.getData()
            }
    }
}

struct EscapingPractice_Previews: PreviewProvider {
    static var previews: some View {
        EscapingPractice()
    }
}
