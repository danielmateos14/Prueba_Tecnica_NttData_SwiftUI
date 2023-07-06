//
//  ContentView.swift
//  Prueba
//
//  Created by Daniel Mateos on 05/07/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var productos = RequestPrueba()
    @State private var showProducts = false
    
    var body: some View {
        VStack {
            Text("Prueba NttData")
            List(productos.objetoProductosCombine) { product in
                VStack {
                    Text(product.title)
                        .font(.headline)
                    Text(product.description)
                        .font(.subheadline)
                }
            }.onAppear(){
                productos.requestProductos()
        }
        }
    }
}






struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
