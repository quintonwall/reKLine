

import UIKit
import ENSwiftSideMenu

class SelectSeatingViewController: UIViewController, ZSeatSelectorDelegate, ENSideMenuDelegate, SOSDelegate {
    
    @IBOutlet weak var liveAgentButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
      
        //support the side menu
        self.sideMenuController()?.sideMenu?.delegate = self
        SCServiceCloud.sharedInstance().sos.addDelegate(self)
        
        let map:String =    "AAAAA_DAAAA/" +
            "UAAAA_DAAAA/" +
            "UUUUU_DAAAA/" +
            "UAAAA_AAAAA/" +
            "UAAAA_AUUAA/" +
            "UAAAA_AAADD/" +
            "___________/" +
            "UAAAA_DAAAA/" +
            "UUUUU_DAAAA/" +
            "UAAAA_AAAAA/" +
            "UAAAA_AUUAA/" +
            "UAAAA_AAADD/" +
            "AAAAA_AUDAA/";
        
        let seats = ZSeatSelector()
        seats.frame = CGRectMake(0, 100, self.view.frame.size.width, 500)
        seats.setSeatSize(CGSize(width: 30, height: 30))
        seats.setAvailableImage(UIImage(named: "A")!,
                                andUnavailableImage:UIImage(named: "U")!,
                                andDisabledImage:   UIImage(named: "D")!,
                                andSelectedImage:   UIImage(named: "S")!)
        seats.setMap(map)
        seats.seat_price = 10.0
        seats.selected_seat_limit = 3
        seats.seatSelectorDelegate = self
        self.view.addSubview(seats)
        
        
        /*
        
        let map2:String =   "_DDDDDD_DDDDDD_DDDDDDDD_/" +
            "_AAAAAA_AAAAAA_DUUUAAAA_/" +
            "________________________/" +
            "_AAAAAUUAAAUAAAAUAAAAAAA/" +
            "_UAAUUUUUUUUUUUUUUUAAAAA/" +
            "_AAAAAAAAAAAUUUUUUUAAAAA/" +
            "_AAAAAAAAUAAAAUUUUAAAAAA/" +
            "_AAAAAUUUAUAUAUAUUUAAAAA/" +
        "_______UAAAA____________/"
        
        let seats2 = ZSeatSelector()
        seats2.frame = CGRectMake(0, 250, self.view.frame.size.width, 200)
        seats2.setSeatSize(CGSize(width: 30, height: 30))
        seats2.setAvailableImage(   UIImage(named: "A")!,
                                    andUnavailableImage:    UIImage(named: "U")!,
                                    andDisabledImage:       UIImage(named: "D")!,
                                    andSelectedImage:       UIImage(named: "S")!)
        seats2.setMap(map2)
        seats2.seat_price           = 5.0
        seats2.selected_seat_limit  = 5
        seats2.seatSelectorDelegate = self
        seats2.maximumZoomScale         = 5.0
        seats2.minimumZoomScale         = 0.5

        self.view.addSubview(seats2)
     */
    }
    
    func seatSelected(seat: ZSeat) {
        //print("Seat at row: \(seat.row) and column: \(seat.column)\n")
    }
    
    func getSelectedSeats(seats: NSMutableArray) {
        var total:Float = 0.0;
        for i in 0..<seats.count {
            let seat:ZSeat  = seats.objectAtIndex(i) as! ZSeat
            print("Seat at row: \(seat.row) and column: \(seat.column)\n")
            total += seat.price
        }
        print("----- Total -----\n")
        print("----- \(total) -----\n")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func liveAgentTapped(sender: AnyObject) {
        SCServiceCloud.sharedInstance().sos.startSessionWithOptions(AppDefaults.getSOSOptions())
        
    }
    
    //MARK: - Side Menu
    @IBAction func hamburgerTapped(sender: AnyObject) {
        toggleSideMenuView()
    }
    
    //MARK: SOS
    //https://resources.docs.salesforce.com/servicesdk/1/0/en-us/pdf/service_sdk_ios.pdf
    func sos(sos: SOSSessionManager!, stateDidChange current: SOSSessionState, previous: SOSSessionState) {
        if (current == SOSSessionState.Connecting) {
            print("connecting")
        }
    }
    
    func sosDidStart(sos: SOSSessionManager!) {
        print("start")
    }
    
    func sosDidConnect(sos: SOSSessionManager!) {
        print("connected")
    }
    
    func sos(sos: SOSSessionManager!, didError error: NSError!) {
        let desc = error.localizedDescription
        let errorCode :Int = error.code
        print("something went wrong: \(desc) \(errorCode)")
        
        //todo: show dialog on error
        switch (errorCode) {
            case SOSErrorCode.SOSNoAgentsAvailableError.rawValue:
                print("Noagent")
                break
            default:
                break
        }
        
            
    }

    
}

