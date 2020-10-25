import Kitura
import Cocoa

let router = Router()

//let dbObj = Database.getInstance()

router.all("/ClaimService/add", middleware: BodyParser())

router.post("ClaimService/add") {
    request, response, next in
    let body = request.body
    let jObj = body?.asJSON
    if let jDict = jObj as? [String:String] {
        if let title = jDict["title"], let date = jDict["date"] {
            let uuid = UUID().uuidString
            let cObj = Claim(a: uuid, b: title, c: date, d: "FALSE")
            ClaimDao().addClaim(cObj: cObj)
        }
    }
    response.send("The claim record was successfully inserted via POST")
    next()
}

router.get("/ClaimService/getAll"){
    request, response, next in
    let cList = ClaimDao().getAll()
    // JSON Serialization
    let jsonData : Data = try JSONEncoder().encode(cList)
    //JSONArray
    let jsonStr = String(data: jsonData, encoding: .utf8)
    // set Content-Type
    response.status(.OK)
    response.headers["Content-Type"] = "application/json"
    response.send(jsonStr)
    // response.send("getAll service response data : \(pList.description)")
    next()
}

Kitura.addHTTPServer(onPort: 8020, with: router)
Kitura.run()
