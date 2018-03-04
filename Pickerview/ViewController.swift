
import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nosePicker: UIPickerView!
    
    let soccorTeams = ["MMT", "WMT", "TMT", "VVT", "VVV", "VVV", "VVV", "MMM"]
    
    var width: CGFloat = 0.0
    var height: CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let superView = nosePicker.superview!
        width = superView.bounds.height
        height = superView.bounds.height
        nosePicker.delegate = self
        nosePicker.dataSource = self
        nosePicker.transform = CGAffineTransform(rotationAngle: -150 * (.pi/100))
        nosePicker.translatesAutoresizingMaskIntoConstraints = false
        nosePicker.widthAnchor.constraint(equalToConstant: superView.bounds.height).isActive = true
        nosePicker.heightAnchor.constraint(equalToConstant: superView.superview!.bounds.width + 300).isActive = true
        nosePicker.centerXAnchor.constraint(equalTo: superView.centerXAnchor).isActive = true
        nosePicker.centerYAnchor.constraint(equalTo: superView.centerYAnchor).isActive = true
    }
}


extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {

    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return soccorTeams.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return height
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return width
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: width, height: height)
        label.text = soccorTeams[row]
        label.textAlignment = .center
        label.transform = CGAffineTransform(rotationAngle: 150 * (.pi/100))
        return label
    }
 
}

