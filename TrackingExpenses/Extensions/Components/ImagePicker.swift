import SwiftUI
import RealmSwift

struct ImagePicker: UIViewControllerRepresentable { // create a struct
    @Binding var selectedImage: Image? // create a connection which image will pick user

    func makeCoordinator() -> Coordinator { // method created for recognize which image picked user
        Coordinator(self)
    }

    func makeUIViewController(context: Context) -> UIImagePickerController { // method which responsible for editing picture which had been choose.
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = context.coordinator
        imagePicker.allowsEditing = true
        return imagePicker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {} // method which we can use in future for update contoller settings

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate { // method which responsible for cases choosing Image
        var parent: ImagePicker

        init(_ parent: ImagePicker) {
            self.parent = parent
        }

        
        //method which transfer choose Image to Object Image, then selectedImage = Image
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let uiImage = info[.editedImage] as? UIImage {
                parent.selectedImage = Image(uiImage: uiImage)
            }
            picker.dismiss(animated: true)
        }
        
        // In case User will close controller
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true)
        }
    }
}
