//
//  ServiceEventCompletionView.swift
//  serviceMan-mvvm
//
//  Created by Pavel Odstrčilík on 22.04.2023.
//

import SwiftUI
import PhotosUI

struct ServiceEventCompletionView: View {
    @ObservedObject var viewModel: ServiceEventCompletionViewModel
    @State private var selectedItems: [PhotosPickerItem] = []

    init(serviceEventId: String, isCompletionViewPresenting: Binding<Bool>) {
        let eventCompletion = ServiceEventCompletion(id: "", serviceEventId: "", isCompleted: false, note: "", selectedItemCompletionType: .repaired)
        viewModel = ServiceEventCompletionViewModel(serviceEventCompletion: eventCompletion, isCompletionViewPresenting: isCompletionViewPresenting)
    }

    var body: some View {
        ZStack {
            if viewModel.isLoading {
                ProgressView("Odesílání dat")
                    .progressViewStyle(CircularProgressViewStyle())
                    .padding()
                    .background(Color.systemGray)
                    .cornerRadius(10)
                    .zIndex(1)
            }
            VStack {
                Form {
                    Section(header: Text("Popis")) {
                        TextEditor(text: $viewModel.fullText)
                    }
                    Section(header: Text("Řešení")) {
                        Toggle("Vyřešeno", isOn: $viewModel.serviceEventCompletion.isCompleted)
                        Text("Typ řešení")
                        Picker("", selection: $viewModel.selectedItemCompletionType) {
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
                                                viewModel.selectedImage.append(image)
                                            }
                                        }
                                    }
                                }
                            }

                        VStack {
                            ForEach(viewModel.selectedImage, id: \.cgImage) { image in
                                Image(uiImage: image)
                                    .resizable()
                                    .scaledToFit()
                            }
                        }
                    }


                }
                .preferredColorScheme(.dark)
                Button(action:
                        { viewModel.sendData() }
                ) {
                    Text("Odeslat")
                        .frame(maxWidth: .infinity, maxHeight: 50)
                }
                .buttonStyle(ConfirmButtonStyle()).padding(-15)
                .padding()
            }
            .disabled(viewModel.isLoading)
            .zIndex(0)
            .padding(.bottom)
        }
    }
}

struct ServiceEventCompletionView_Previews: PreviewProvider {
    static var previews: some View {
        ServiceEventCompletionView(serviceEventId: "", isCompletionViewPresenting: .constant(true))
    }
}
