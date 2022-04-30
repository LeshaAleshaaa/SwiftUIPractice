//
//  AcivityViewScreen.swift
//  SwiftUIPractice
//
//  Created by Алексей Смицкий on 22.04.2022.
//

import SwiftUI

struct ActivityViewScreen: View {
    
    @State private var isSharePresented = false
    
    var body: some View {
        Button("Press") {
            self.isSharePresented = true
        }.sheet(isPresented: $isSharePresented) {
            AcivityView(activityItems: ["message test"])
        }
    }
}

struct AcivityViewScreen_Previews: PreviewProvider {
    static var previews: some View {
        ActivityViewScreen()
    }
}

struct AcivityView: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = UIActivityViewController
    public var activityItems: [Any]
    public var applicationActivities: [UIActivity]?

    func makeUIViewController(context: Context) -> UIActivityViewController {
        let vc = UIActivityViewController(activityItems: activityItems, applicationActivities: applicationActivities)
        return vc
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {
    }
}
