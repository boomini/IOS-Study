import UIKit

class LoadingButton: UIButton {

    //activity indicator view
 
    private let indicator = UIActivityIndicatorView()
    
    private func makeIndicator(){
        self.addSubview(indicator)
        
        DispatchQueue.main.async {
            self.indicator.isHidden = true
        }
        //화면을 구성하는 오브젝트들은 메인 쓰레드에서 동작해야한다.
        //이 코드는 메인 쓰레드에서 동작.
        
        indicator.isUserInteractionEnabled = false
        //indicator의 touch action을 막는다.
        indicator.style = .gray
        indicator.startAnimating()
        indicator.translatesAutoresizingMaskIntoConstraints = false
        //크기나 위치에 대한 개념으로 indicator.frame이 있다. width height등의 값을 정확하게 설정해준다
        //frame을 사용할때는 indicator.translatesAutoresizingMaskIntoConstraints이 true여야 하며,
        //이미 기본값으로 설정되어 있어 해줄 필요가 없다
        //하지만 아래의 autolayout 설정을 위해서는 false로 설정해주어야지만 작동한다
        
        indicator.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        //indecator의 x축은 superview에 맞춰서 정렬한다.
        indicator.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        //indecator의 Y축은 superview에 맞춰서 정렬한다.
        //isActive 를 true로 반드시 설정해주어야지 활성화가 된다. 아니면 그냥 설정해 놓는거ㄷ
    }
    override func awakeFromNib(){
        super.awakeFromNib()
        makeIndicator()
    }
    //button이 처음 화면에 나올떄
    
    
    
    
    
    func startLoading(){
        let titleColor = self.titleLabel?.textColor
        self.setTitleColor(titleColor?.withAlphaComponent(0), for: UIControl.State.normal)
        indicator.isHidden = false
        //보이게하고
    }
    func stopLoading(){
        let titleColor = self.titleLabel?.textColor
        self.setTitleColor(titleColor?.withAlphaComponent(1), for: UIControl.State.normal)
        indicator.isHidden = true
        //숨긴다
    }
}
