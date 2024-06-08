import UIKit
import SnapKit

internal class HomeView: UIView {
    internal let searchBar: UISearchBar = {
        let view = UISearchBar()
        return view
    }()
    internal let tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    internal override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    @available(*, unavailable)
    required internal init?(coder _: NSCoder) {
        return nil
    }
    
    private func setupViews() {
        
        addSubview(searchBar)
        addSubview(tableView)
        
        tableView.register(ShowTableViewCell.self, forCellReuseIdentifier: ShowTableViewCell.identifier)

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
