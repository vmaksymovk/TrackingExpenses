import SwiftUI
import RealmSwift


struct AccountImage: View {
    @State private var isImagePickerPresented = false // is libary with images appear
    @State private var selectedImage: Image? // Choose image
    
    var body: some View {
        VStack {
            if selectedImage != nil { // if user pick image
                selectedImage!
                    .resizable()
                    .frame(width: 140, height: 140)
                    .clipShape(Circle())
                    .overlay {
                        Circle().stroke(Color.gray, lineWidth: 4)
                    }
                    .shadow(radius: 8)
                    .onTapGesture {
                        isImagePickerPresented = true
                    }
            } else { // if user didn't pick image
                Image("sticker")
                    .resizable()
                    .frame(width: 140, height: 140)
                    .clipShape(Circle())
                    .overlay {
                        Circle().stroke(Color.gray, lineWidth: 4)
                    }
                    .shadow(radius: 8)
                    .onTapGesture {
                        isImagePickerPresented = true
                    }
            }
        }
        .sheet(isPresented: $isImagePickerPresented) { // responsible for window with images(library)
            ImagePicker(selectedImage: $selectedImage)
        }
    }
}

struct AccountImage_Previews: PreviewProvider {
    static var previews: some View {
        AccountImage()
    }
}
