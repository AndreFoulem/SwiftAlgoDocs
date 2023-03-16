//
//  OptionalmageView.swift
//  SwiftAlgoDocs
//
//  Created by AndreMacBook on 2023-03-16.
//

import SwiftUI

struct OptionalmageView: View {
  
  // need a data
  let data: Data?
  
    var body: some View {
      
      //Image(uiImage: UIImage(data: note.img))
      if let data = data, let uiImage = UIImage(data: data) {
        Image(uiImage: uiImage)
          .resizable()
          .scaledToFit()
      } else {
        EmptyView()
      }
    }
}

//struct OptionalmageView_Previews: PreviewProvider {
//    static var previews: some View {
//      OptionalmageView(data: Image(uiImage: UIImage(data: note.img))
//)
//    }
//}
