# News

This demo for iOS developer vacancy in EmberMedical.

## About This Task

It is a simple new app which fetches data from a remote data source - News API https://newsapi.org/docs/get-started - and filtering them based on Country || News Source.

### Used Architecture and patterns

- Clean Architecture <br/>
- MVVM + XCoordinator <br/>
- Coordinator <br/>
- Repository <br/>
- Factory

### Dependency Graph

The App originally consists of 4 tiers: <br />

**Presentation -** Responsible for representing data on screen and handle presentation logic, MVVM design pattern used in this layer. <br />
**Domain -** Responsible for handling App business UseCases. <br />
**Persistent -** Responsible for data saving and retrieving from/to data stores,and this is where repository pattern used. <br />
**Coordinator -** Its responsibility is to build modules with it's dependancies, and handling navigation beween them. <br/>

Every inner layer doesn't know anything about the outer layer. <br />

**(Protocols)** used everywhere to establish a pipeline from inner layers to outer layers, used for encapsulation and increse substitutability and this where protocol orientd comes in.

### Third Party Libraries

**Alamofire -** for network requests. <br />
**kingFisher -** for downloading images. <br />
**SwiftSpinner** for better loader. <br />
**SwiftMessages** for better message views. <br />
**XCoordinator** for seperation of modules. <br />
<br/>
Note - please install podfile before tuning the project.

### Remote Data Source

News API https://newsapi.org/docs/get-started
