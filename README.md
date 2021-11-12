# Users can tap the photo to see a full-screen view. 
#### Create Infinite scrolling iOS App with MVVM arcitecure, REST Client Networking request,SwiftUI and Swift programming laguage!!!!

Design and develop an iOS Image gallery App using SwiftUI where,

## Description:

* Use Restful APIs with back-end services https://picsum.photos.
* The user can tap the photo.
* The user can see a full-screen view of the photo.
* The user has an infinite scroll on the gallery screen.
* Cache images.
* Allow saving photos in JPEG format to the local gallery.
* Allow sharing the photo.
* Use Model-View-ViewModel (MVVM) to perform .
* Use SwiftUI.

## Code Sample1

```python
    func populateData(page: Int) {
        // "https://picsum.photos/v2/list?page=1&limit=100"
        guard let url = URL(string: K.APIEndpoints.getNowTreanding(pageNaem: "list", page: page, limit: 20).path) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard let data = data, error == nil else {
                return
            }
            
            let numbers = try? JSONDecoder().decode([Picsum].self, from: data)
            DispatchQueue.main.async {
                self.picsums.append(contentsOf: numbers ?? [])
                self.setCompositionalLayout()
            }
            
        }.resume()
    }
    
    ....................................
```
## Code Sample2

```python
VStack(spacing:0){
    List(picsumListVM.compositionalArray.indices, id: \.self){ index in
        VStack(spacing:4){
            if index == 0 || index % 6 == 0 {
                Layout1(picsums: picsumListVM.compositionalArray[index])
            }else if index % 3 == 0 {
                Layout3(picsums: picsumListVM.compositionalArray[index])
            }else {
                Layout2(picsums: picsumListVM.compositionalArray[index])
            }
        }.onAppear(perform: {
            print("on apper")
            if picsumListVM.shouldLoadData(id: index) {
                currentPage += 1
                picsumListVM.populateData(page: currentPage)
            }
        })
    }.padding(.trailing, 20)
}
```
## Possbile to do 
Unit test for save the image 
Cache API response 
Keep maximum 80 item in the [Picsum] array 
Make sure a notify to the user when image save in gallery [ use delegate patten]
User able to choose like photo in future explore  


