//
//  SwiftUIView.swift
//  Desafio07
//
//  Created by Turma01-7 on 27/04/26.
//

import SwiftUI

struct SheetView: View {
    @Binding var local: Location
    var body: some View {
        ScrollView{
            VStack() {
                //AsyncImage(url: URL(string: local.foto)) { image in
                   // image
                        
                        
                }
            }
        }
    }
//}


#Preview {
    SheetView()
}
