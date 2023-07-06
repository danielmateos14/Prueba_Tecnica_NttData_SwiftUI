//
//  Controler.swift
//  Prueba
//
//  Created by Daniel Mateos on 05/07/23.
// https://dummyjson.com/products
//

import Foundation

class RequestPrueba: ObservableObject {
    @Published var objetoProductosCombine: [Product] = []
    
    func requestProductos() {
        guard let url = URL(string: "https://dummyjson.com/products") else {
            return
        }

        let session = URLSession.shared

        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode != 200 {
                    print("Código de estado inesperado: \(httpResponse.statusCode)")
                    return
                }
            }
            
            if let data = data {
                do {
                    let decodedData = try JSONDecoder().decode(Welcome.self, from: data)
                    DispatchQueue.main.async {
                        self.objetoProductosCombine = decodedData.products
                    }
                } catch {
                    print("Error al decodificar los datos: \(error.localizedDescription)")
                }
            }
        }

        task.resume()
    }
}
