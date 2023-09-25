//
//  AgregarTareaView.swift
//  Umvel-NTT
//
//  Created by Melissa Zellhuber on 22/09/23.
//

import SwiftUI

struct AgregarTareaView: View {
    @ObservedObject var tareaViewModel: TareaViewModel
    @Binding var mostrandoModal: Bool
    @State private var nombreTarea: String = ""
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Nombre de la tarea", text: $nombreTarea)
            }
            .navigationTitle("Agregar Tarea")
            .navigationBarItems(leading: Button("Cancelar") {
                mostrandoModal = false
            }, trailing: Button("Agregar") {
                tareaViewModel.agregarTarea(nombre: nombreTarea)
                mostrandoModal = false
            }
            .disabled(nombreTarea.isEmpty))
        }
    }
}

struct AgregarTareaView_Previews: PreviewProvider {
    static var previews: some View {
        AgregarTareaView(tareaViewModel: TareaViewModel(), mostrandoModal: .constant(true))
    }
}

