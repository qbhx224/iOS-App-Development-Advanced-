import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        locationManager.requestAlwaysAuthorization()
        mapView.userTrackingMode = .follow
    }
}

