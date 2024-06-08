import UIKit
import SnapKit

public class HomeView: UIView {
    public let searchBar: UISearchBar
    public let tableView: UITableView
    
    public override init(frame: CGRect) {
        searchBar = UISearchBar()
        tableView = UITableView()
        
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        
        addSubview(searchBar)
        addSubview(tableView)
    }
    
    private func setupConstraints() {
        
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview()
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
}
