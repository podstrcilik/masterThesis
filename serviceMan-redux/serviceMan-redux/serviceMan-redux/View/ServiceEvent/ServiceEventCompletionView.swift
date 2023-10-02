//
//  ServiceEventCompletionView.swift
//  serviceMan-mvvm
//
//  Created by Pavel Odstrčilík on 22.04.2023.
//

import SwiftUI
import PhotosUI

struct ServiceEventCompletionView: View {
    @State private var selectedItems: [PhotosPickerItem] = []
    @EnvironmentObject var store: Store<AppState>
    var state: ServiceEventCompletionState? { store.state.screenState(for: .serviceEventCompletion(id: eventId)) }
    let eventId: String
    
    var body: some View {
        ZStack {
            if let state, let serviceEventCompletion = state.completion {
                if state.isLoading {
                    ProgressView("Odesílání dat")
                        .progressViewStyle(CircularProgressViewStyle())
                        .padding()
                        .background(Color.systemGray2)
                        .cornerRadius(10)
                        .zIndex(1)
                }
                VStack {
                    Form {
                        Section(header: Text("Popis")) {
                            TextEditor(text: Binding(get: { serviceEventCompletion.note }, set: { store.dispatch(ServiceEventCompletionAction.updateDescriptionText($0))}))
                        }
                        Section(header: Text("Řešení")) {
                            Toggle("Vyřešeno", isOn: Binding(get: { serviceEventCompletion.isCompleted }, set: { store.dispatch(ServiceEventCompletionAction.updateIsCompleted($0))}))
                            Text("Typ řešení")
                            Picker("", selection: Binding(get: { serviceEventCompletion.selectedItemCompletionType }, set: { store.dispatch(ServiceEventCompletionAction.updateCompletionType($0))})) {
                                ForEach(ServiceEventCompletionTypeEnum.allCases, id: \.self) { item in
                                    Text(item.rawValue)
                                }
                            }
                        }
                        .pickerStyle(.segmented)
                        
                        Section(header: Text("Fotografie")) {
                            PhotosPicker(
                                selection: $selectedItems,
                                matching: .images,
                                photoLibrary: .shared()) {
                                    Text("Vybrat obrázek")
                                }
                                .onChange(of: selectedItems) { newItem in
                                    for item in selectedItems {
                                        Task {
                                            if let data = try? await item.loadTransferable(type: Data.self) {
                                                if let image = UIImage(data: data) {
                                                    store.dispatch(ServiceEventCompletionAction.didSelectImage(image))
                                                }
                                            }
                                        }
                                    }
                                }
                            VStack {
                                ForEach(serviceEventCompletion.selectedImage, id: \.cgImage) { image in
                                    Image(uiImage: image)
                                        .resizable()
                                        .scaledToFit()
                                }
                            }
                        }
                    }
                    .preferredColorScheme(.dark)
                    Button(action: {
                        if let completion = state.completion {
                            store.dispatch(ServiceEventCompletionAction.postCompletion(completion))
                            store.dispatch(ActiveScreensStateAction.dismissScreen(.serviceEventCompletion(id: eventId)))
                        }
                    }
                    ) {
                        Text("Odeslat")
                            .frame(maxWidth: .infinity, maxHeight: 50)
                    }
                    .buttonStyle(ConfirmButtonStyle()).padding(-15)
                    .padding()
                }
                .disabled(state.isLoading)
                .zIndex(0)
                .padding(.bottom)
            }
        }
    }
}

struct ServiceEventCompletionView_Previews: PreviewProvider {
    static var previews: some View {
        ServiceEventCompletionView(eventId: "")
    }
}
