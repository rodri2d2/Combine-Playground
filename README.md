# Combine Playground
About It is a collection of sample projects designed to explore and demonstrate the use of the Combine framework in iOS application development with SwiftUI. Each sub-project within this repository focuses on a specific Combine use case, from fetching data from an API to implementing reactive functionality in user interfaces with SwiftUI.

[![Swift](https://img.shields.io/badge/swift-%23FA7343.svg?style=for-the-badge&logo=swift&logoColor=white)](https://swift.org/)




## Demos

<table>
    <tr>
        <th colspan="2"><h3><bold>Getting Data from an API</bold></h3></th>
    </tr>
    <tr>
        <td><img src="https://github.com/rodri2d2/Combine-Playground/blob/main/CombineAPIRequestData/DEMO/DEMO.gif" width="150" height="300" /></td>
        <td style="text-align:center;">
             <a href="https://github.com/rodri2d2/Combine-Playground/tree/main/CombineAPIRequestData">This app</a> demonstrates how to easily make a request to an endpoint and parse the response into a local data model. For the View itself it is used a simple list and with a "CharacterRow" that uses AsyncImage to load image dynamically.
        </td>
    </tr>
        <tr>
        <th colspan="2"><h3><bold>Real time validation form</bold></h3></th>
    </tr>
    <tr>
        <td><img src="https://github.com/rodri2d2/Combine-Playground/blob/main/FormValidation/DEMO/DEMO.gif" width="150" height="300" /></td>
        <td style="text-align:center;">
             <a href="https://github.com/rodri2d2/Combine-Playground/tree/main/FormValidationa">This app</a> demonstrates how to validate a form vie Combine. It uses @Publishers and the Combine operator <bold>CombineLatest</bold>. The view itself just updates when user taps a correct email and password
        </td>
    </tr>
        </tr>
        <tr>
        <th colspan="2"><h3><bold>Combine Tip Calculator</bold></h3></th>
    </tr>
    <tr>
        <td><img src="https://github.com/rodri2d2/Combine-Playground/blob/main/CombineTipCalulator/DEMO/DMEO.gif" width="150" height="300" /></td>
        <td style="text-align:center;">
             <a href="https://github.com/rodri2d2/Combine-Playground/tree/main/CombineTipCalulator">This app</a> demonstrates how to create create simple functional app by using only few <bold>@Publishers</bold> and how powerful Combine is. It is true that theres no "Combine impor" for this app because in Combine, @Published is a property attribute that automatically announces changes so that the SwiftUI UI can update views that depend on this data. When you mark an ObservableObject property with @Published, you are creating a publisher.
        </td>
    </tr>
        </tr>
        </tr>
        <tr>
        <th colspan="2"><h3><bold>Getting Data from an API with Cache</bold></h3></th>
    </tr>
    <tr>
        <td><img src="https://github.com/rodri2d2/Combine-Playground/blob/main/CombineCacheAPICalls/DEMO/DEMO.gif" width="150" height="300" /></td>
        <td style="text-align:center;">
             <a href="https://github.com/rodri2d2/Combine-Playground/tree/main/CombineCacheAPICalls/CombineCacheAPICalls">The app</a>
              itself is very simple. It makes a request, loads a list and you can navigate to see the detail of the selected item in the list. However the highlight here is that I have implemented a cache class based on Apple's NSCache.This class is the evolution of a previous project. There are still functionalities to implement like self-cleaning or self-checking in regarding to expiration times. </br> <hr>
              <a href="https://developer.apple.com/tutorials/app-dev-training/caching-network-data">Inspiration from Apple</a></br> <a href="https://github.com/rodri2d2/RickAndMortyApp/blob/main/RickAndMortyApp/RickAndMortyApp/DataManagers/Services/ImageLocallFileManager.swift">Previous project that create a need for change</a>
        </td>
    </tr>
</table>


<br>


> ## Author
>Check my LinkedIn profile to know more about me. Feel free to contact for any question. 
>
>[![Linkedin](https://img.shields.io/badge/linkedin-%230077B5.svg?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/rodricandido)