# MVVM with Clean Architecture. 
#### Create Infinite scrolling iOS App with MVVM arcitecure, Well-designed REST Client Networking request and Swift4 programming laguage!!!!



What is the best practices for MVVM design pattern?<br/>
What is the best practice for an Xcode project groups structure?<br/>
What is the best Practice for communication to a REST API with JSON?<br/>
How to add infinite scroll pagination to UITableview?<br/>
How to perfrom protocal orianted programming? 
How to creating UI Programmatically in Swift?


<p align="center"> 
  <img width="250" height="500" src="https://i.imgur.com/9OO16bP.png">
  <img width="250" height="500" src="https://i.imgur.com/dWTnUH8.png">
  <img width="250" height="500" src="https://i.imgur.com/ZxgYxxA.png"> 
</p>


# Swift With clean clean Architecture 

Design and develop an iOS NHAwesomeMove App using Swift where,

## Description:

* Use Restful APIs with back-end services #themoviedb.
* Use infinite scrolling to load more data. (Both Now Playing and Top Rated API responses
are paginated).
* Use Model-View-ViewModel (MVVM) to perform .
* Use programmatically Auto-layout.
* Use Protocol oriented programming 
* Software design patterns #(DI)
* Generic programming
* Don't repeat yourself

## Code Sample1

```python
 final class MovieViewModel {
    private weak var delegate: MovieViewModelDelegate?
    
    private var movies: [Movie] = []
    private var currentPage = 1
    private var total = 0
    private var isFetchInProgress = false
    
    var client : NHDataProvider!
    var pageName : String!
    init( pageName: String, client : NHDataProvider = NHClientHTTPNetworking(), delegate: MovieViewModelDelegate) {
        self.pageName = pageName
        self.client = client
        self.delegate = delegate
    }
    ....................................
```
## Code Sample2

```python
 final class NHClientHTTPNetworking : NHDataProvider {
   
    let session: URLSession
    
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    func fetchRemote<Model: Codable>(_ val: Model.Type, url: URL,
                         completion: @escaping (Result<Codable, DataResponseError>) -> Void) {
        let urlRequest = URLRequest(url: url)
        session.dataTask(with: urlRequest, completionHandler: { data, response, error in
            guard
                let httpResponse = response as? HTTPURLResponse,
                httpResponse.hasSuccessStatusCode,
                let data = data
                else {
                    completion(Result.failure(DataResponseError.network))
                    return
            }
            guard let decodedResponse = try? JSONDecoder().decode(Model.self, from: data) else {
                completion(Result.failure(DataResponseError.decoding))
                return
            }
            completion(Result.success(decodedResponse))
        }).resume()
    }
}
```
## Contributing
Pull requests are welcome. For incress efficency. If you find an issue, just open a [ticket](https://github.com/nazmulkp/NHAwesomeMovieApp/issues).

Please make sure to update tests as appropriate.


## Contact with Me

Hi!
Right now i have 4 years+ experience iPhone application development/Xcode App Update / Bug Fixes. my 7 development apps almost App store top leading app.[Stackoverflow 6000+ reputation for 150+ accepted and voted answer](https://stackoverflow.com/users/4415445/nazmul-hasan). I love to write clean code that is help to understand new developer to enhance the app easily in future.

Thanks you <br/>
Nazmul Hasan <br/>
Sr. software engineer, iOS<br/>
Skype: nazmulkp1<br/>
Mail: nazmulcsharp@gmail.com<br/>
[Linkedin](https://www.linkedin.com/in/nazmulkp/)


