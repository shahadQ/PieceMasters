


import SwiftUI
import SceneKit
import FirebaseAuth
import FirebaseStorage
struct threeDModel: View {
    @State var shouldShowImagePicker = false
    @State var image: UIImage?
    
    //START Button
    @State private var showAlert = false
    
    //disabled Button
    @State private var disabled = true
    @State private var fileName = ""
    
    @State private var presentImporter = false
    
    @State var isPlaying : Bool = false
    @State var isSelectedColor : Bool = false
    @State var isSelectedPicker : Bool = false
    @State var isSelected : Bool = false
    @State var isSelected1 : Bool = false
    // END Button
    @State private var selectedPicker: String = ("")
    @State  var selectedColor =  Color(.systemBackground)
    @State  var selectedimage =  Color(.systemBackground)
    @State var shouldHide = false
    
    
    
    var PrimaryColor : Color = (Color(red: 0.22745098039215686, green: 0.25882352941176473, blue: 0.4627450980392157))
    var SecondaryColor: Color = (Color(red: 0.5019607843137255, green: 0.8, blue: 0.7411764705882353))
    var BACGR: Color = (Color(red: 0.9725490196078431, green: 0.9725490196078431, blue: 0.9725490196078431))
    var  BACGR1: Color = Color(red: 0.85, green: 0.85, blue: 0.85)
    
    
    func uploadFile(url:URL) {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        guard let imageData = try? Data(contentsOf: url) else {return}
        
        let randomID = UUID().uuidString
        let uploadRef = Storage.storage().reference(withPath: "\(uid)/\(randomID).pdf")
        let uploadMetadata = StorageMetadata()
        uploadMetadata.contentType = "application/pdf"
        
        let taskRef = uploadRef.putData(imageData, metadata: uploadMetadata) { (downloadMetadata, error) in
            if let err = error {
                print("\(err)")
                return
            }
            
            print("downloadMetadata: \(String(describing: downloadMetadata))")
            
            
            uploadRef.downloadURL { url, error in
                if let err = error {
                    print("\(err)")
                    return
                }
                print("url \(String(describing: url))")
            }
        }
        
        taskRef.observe(.progress) { snapshot in
            guard let progress = snapshot.progress?.fractionCompleted else { return }
            print("progress: \(progress)")
            //  progressValue = progress
        }
        
    }
    
    var body: some View {
        
        
        
        NavigationView {
            
            
            
            ZStack{
                
                ZStack{
                    
                    ZStack{
                        
                        
                        SceneView(
                            
                            scene: {
                                
                                
                                let scene = SCNScene(named: "Product1.scn")!
                                scene.background.contents = UIColor(BACGR)
                                
                                //                                let box1 = scene.rootNode.childNode(withName: "sphere", recursively: true)
                                let box = scene.rootNode.childNode(withName: "Object_0", recursively: true)
                                let box1 = scene.rootNode.childNode(withName: "logo", recursively: true)
                                box1?.isHidden = true //image == nil
                                //
                                //-------------------------------------------------------------------------------------------------
                                
                                
                                let size = CGSize(width: 100, height: 100)
                                
                                
                                if isSelected1 == true{
                                    box?.geometry?.firstMaterial?.diffuse.contents = !isSelected ?
                                    UIColor(selectedColor) :selectedPicker
                                    box1?.geometry?.firstMaterial?.diffuse.contents =  image?.resizeImage(targetSize: size)
                                }
                                //
                                if isSelected1 == false{
                                    box?.geometry?.firstMaterial?.diffuse.contents = !isSelected ?
                                    UIColor(selectedColor) :selectedPicker
                                    //                                    box1?.geometry?.firstMaterial?.diffuse.contents = !isSelected ?
                                    //                                    UIColor(selectedColor) : image?.resizeImage(targetSize: size)
                                    
                                }
                                
                                
                                
                                
                                if let image = image {
                                    let plainNode = SCNPlane(width: 0.4, height: 0.5)
                                    let node = SCNNode(geometry: plainNode)
                                    
                                    plainNode.firstMaterial?.diffuse.contents = image.resizeImage(targetSize: size).makeRoundImg()
                                    box?.addChildNode(node)
                                    node.position = SCNVector3(0, 0.7 , 0.384)
                                    node.pivot = SCNMatrix4MakeTranslation(0, 0.2, 0)
                                    
                                }
                                
                                
                                
                                
                                return scene
                                
                            }(),
                            options: [.autoenablesDefaultLighting,.allowsCameraControl]
                        )
                        
                        
                        
                        
                        .padding(.bottom ,350)
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/1, alignment: .center)
                        
                        //logo
                        //                        VStack{
                        //
                        //                            if let image = self.image {
                        //                                Image(uiImage: image)
                        //                                    .resizable()
                        //                                    .frame(width: 70, height: 70)
                        //                                    .clipShape(Circle())
                        //                                    .position(x: 205, y: 410)
                        //                                    .cornerRadius(10)
                        //                                    .foregroundColor(.white)
                        //                                    .padding(.top ,-170)
                        //
                        //                            }
                        //
                        //
                        //                        }
                        
                        //-----------------------------------
                        
                        ZStack{
                            shap3D()
                            
                            ZStack{
                                // bookmark ICON
                                Rectangle()
                                
                                    .fill(Color.white)
                                    .frame(width: 50
                                           , height: 50)
                                    .cornerRadius(10)
                                    .shadow(radius: 0.1)
                                
                                Button(action: {
                                    self.isPlaying.toggle()
                                }) {
                                    Image(systemName: self.isPlaying == true ? "bookmark.fill" : "bookmark")
                                        .resizable()
                                        .foregroundColor(SecondaryColor)
                                        .frame(width: 17.33, height: 22.86)
                                    
                                }
                                
                                
                                
                                
                            }
                            .position(x: 340, y: 510)
                            .padding(.top ,-200)
                            
                            
                            
                            
                            // START Design Area
                            VStack{
                                Text("Customise your product  ").font(.title2).bold()
                                    .foregroundColor(PrimaryColor)
                                    .padding(.trailing ,90)
                                    .padding(.bottom ,0.5)
                                HStack{
                                    Image( "compress")
                                        .resizable()
                                        .frame(width: 19, height: 16)
                                    
                                    
                                    Text("click and drag to move design artwork").font(.system(size:13))
                                        .foregroundColor(.gray)
                                        .padding(.trailing ,90)
                                    
                                }
                                
                            }
                            .padding(.top ,-95)
                            
                            
                            
                            
                            VStack {
                                HStack( spacing: 50){
                                    
                                    //1
                                    
                                    
                                    VStack{
                                        
                                        
                                        
                                        
                                        ColorPicker("  Colors " , selection: $selectedColor)
                                        
                                            .padding(.trailing ,10)
                                            .frame(width: 30, height: 30)
                                        
                                        
                                    }
                                    
                                    
                                    
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                        
                                            .stroke(self.isSelectedColor ? PrimaryColor : Color.gray, lineWidth: 1)
                                            .frame(width: 60, height: 60)
                                        
                                        
                                        
                                    )
                                    //2
                                    
                                    Button(action: {
                                        
                                        withAnimation{
                                            self.isSelectedPicker.toggle()
                                            
                                        }
                                        
                                    }) {
                                        
                                        Image("background1")
                                            .resizable()
                                            .frame(width: 30, height: 30)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 10.0)
                                                    .stroke(self.isSelectedPicker ? PrimaryColor : Color.gray, lineWidth: 1)
                                                    .frame(width: 60, height: 60)
                                            )
                                    }
                                    
                                    
                                    
                                    
                                    //3
                                    
                                    
                                    Button(action: {
                                        withAnimation{
                                            shouldShowImagePicker.toggle()
                                            
                                        }
                                        
                                    })
                                    {
                                        Image(systemName: "photo")
                                            .resizable()
                                            .foregroundStyle(.gray)
                                            .frame(width: 30, height: 30)
                                        
                                        
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 10.0)
                                                    .stroke(Color.gray, lineWidth: 1.0)
                                                    .frame(width: 60, height: 60)
                                            )
                                    }
                                    
                                    
                                    
                                    
                                    
                                }       .padding(.bottom ,10)
                                
                                
                                // END Design Area
                                
                                
                                
                                
                                
                                if isSelectedColor == true   {
                                    
                                    
                                }
                                
                                else  if isSelectedPicker == true   {
                                    
                                    MyPatternPicker(selectedPicker: $selectedPicker)
                                    
                                    
                                }
                                
                                
                                
                                
                                
                                
                            }.padding(.top , 10)
                                .padding(.bottom , -95)
                            
                            
                        }
                        
                        .position(x: 190, y: 430)
                        
                        
                        
                        //                        navig()
                        
                        Button(action: {
                            presentImporter = true
                        }) {
                            HStack {
                                VStack{
                                    Text("Upload design ")
                                        .foregroundColor(SecondaryColor)
                                        .padding(.top, 3)
                              
                                    Text(fileName)
                           
                                        .frame(width: 60, height: 0)
                                        .foregroundColor(.blue)
                                        .font(.system(size: 9.9))
                                        
                                
                                }
                                
                                
                                
                                
                                Image(systemName: "square.and.arrow.up")
                                    .foregroundColor(SecondaryColor)
                                
                            }
                            .overlay(
                                RoundedRectangle(cornerRadius: 10.0)
                                    .stroke(lineWidth: 1.0)
                                    .foregroundColor(SecondaryColor)
                                    .frame(width: 160, height: 55)
                            )
                        }      .fileImporter(isPresented: $presentImporter, allowedContentTypes: [.pdf]) { result in
                            switch result {
                                
                            case .success(let url):
                                
                                uploadFile(url: url)
                                print(url)
                                
                                
                                self.fileName =   url.lastPathComponent
                                
                                print(fileName)
                                //use `url.startAccessingSecurityScopedResource()` if you are going to read the data
                            case .failure(let error):
                                print(error)
                            }
                        }
                        .position(x: 100, y: 590)
                        // THE FUNC CHECK IF ALL FILEDS IS SELECTED
//                        HStack {
//                            NavigationLink(destination: Cart()){
//
//                                Text("Continue Order")
//                                    .frame(width: 160, height: 55, alignment: .center)
//                                    .foregroundColor(.white)
//                                    .background(PrimaryColor)
//                                    .cornerRadius(10)
//                                    .position(x: 287, y: 590)
//
//                            }
//
//
//                        }
                        if selectedPicker != "" || selectedColor !=  Color(.systemBackground)  || fileName != ""
                           || image != nil{
                            HStack {
                                NavigationLink(destination: Cart()){
                                    Text("Continue Order")
                                }
                                .frame(width: 160, height: 55, alignment: .center)
                                .foregroundColor(.white)
                                .background(PrimaryColor)
                                .cornerRadius(10)
                                .position(x: 287, y: 590)
                            }
                        }
                        else{
                            HStack {
                                Text("Continue Order")
                                .disabled(false)
                                .frame(width: 160, height: 55, alignment: .center)
                                .foregroundColor(.gray)
                                .background(BACGR1)
                                .cornerRadius(10)
                                .position(x: 287, y: 590)
                            }
                        }
                        
                        
                        
                        
//                         THE FUNC CHECK IF ALL FILEDS IS SELECTED
                        
//                        if selectedPicker == "" && selectedColor ==  Color(.systemBackground)  && fileName == ""
//                            && image == nil
//
//                        {
//
//
//
//                            Button("Continue Order", action: {})
//                                .disabled(false)
//                                .padding()
//                                .padding(.horizontal)
//                                .background(BACGR1)
//                                .foregroundColor(.gray)
//                                .cornerRadius(10)
//                                .position(x: 287, y: 590)
//
//                        }
//
//
//
//                        else{
//                            NavigationLink(destination: Cart()){
//                                Button("Continue Order", action: {
//
//
//
//
//                                    //Productviewmodel.addToCart(item: <#T##cart#>)
//
//
//                                })
//                                .disabled(disabled)
//                                .padding()
//                                .padding(.horizontal)
//                                .background(Color(red: 0.22745098039215686, green: 0.25882352941176473, blue: 0.4627450980392157))
//                                .cornerRadius(10.0)
//                                .foregroundColor(Color.white)
//                                .position(x: 287, y: 590)
//
//
//
//
//                            }
//
//                        }
//
                        
                    }.onChange(of: selectedColor, perform: { _ in
                        isSelected = false
                        isSelectedPicker = false
                        isSelected1 = true
                    })
                    .onChange(of: selectedPicker, perform: { _ in
                        isSelected = true
                        isSelected1 = false
                        
                    })
                    
                    .onChange(of: image, perform: { _ in
                        
//                        isSelected = false
//                        isSelectedPicker = false
//                        isSelected1 = false
                        
                        shouldShowImagePicker = false
                    })
                    
                    
                    .padding(.bottom ,-50)
                    
                    
                }
                
                
                
            }.background(BACGR)
            
            
            
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .fullScreenCover(isPresented: $shouldShowImagePicker, onDismiss: nil) {
            ImagePicker(image: $image)
            
        }
        
        
    }
    
    
    struct threeDModel_Previews: PreviewProvider {
        static var previews: some View {
            threeDModel()
        }
    }
    
    
    
    
    // ImagePicker
    struct ImagePicker: UIViewControllerRepresentable {
        
        @Binding var image: UIImage?
        
        private let controller = UIImagePickerController()
        
        func makeCoordinator() -> Coordinator {
            return Coordinator(parent: self)
        }
        
        class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
            
            let parent: ImagePicker
            
            init(parent: ImagePicker) {
                self.parent = parent
            }
            
            func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
                parent.image = info[.originalImage] as? UIImage
                picker.dismiss(animated: true)
            }
            
            func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
                picker.dismiss(animated: true)
            }
            
        }
        
        func makeUIViewController(context: Context) -> some UIViewController {
            controller.delegate = context.coordinator
            return controller
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
            
        }
        
    }
}


extension UIImage {
    func resizeImage(targetSize: CGSize) -> UIImage {
        //        let size = self.size
        //        let widthRatio  = targetSize.width  / size.width
        //        let heightRatio = targetSize.height / size.height
        let newSize = targetSize
        //        widthRatio > heightRatio ?  CGSize(width: size.width * heightRatio, height: size.height * heightRatio) : CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
        let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.width)
        
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        self.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage ?? UIImage()
    }
    
    func makeRoundImg() -> UIImage {
        let imgLayer = CALayer()
        imgLayer.frame = CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height)
        imgLayer.contents = self.cgImage
        imgLayer.masksToBounds = true
        
        imgLayer.cornerRadius = self.size.width / 2
        
        UIGraphicsBeginImageContext(self.size)
        imgLayer.render(in: UIGraphicsGetCurrentContext()!)
        let roundedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return roundedImage ?? UIImage()
    }
}




