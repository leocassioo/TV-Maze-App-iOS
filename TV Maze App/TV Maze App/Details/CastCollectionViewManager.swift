//
//  CastCollectionViewManager.swift
//  TV Maze App
//
//  Created by Leonardo de Cassio Andrade Figueiredo on 10/06/24.
//

import UIKit

internal class CastCollectionViewManager: NSObject, UICollectionViewDataSource {
    private var castMembers: [CastModel] = []

    internal func update(with castMembers: [CastModel]) {
        self.castMembers = castMembers
    }

    internal func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return castMembers.count
    }

    internal func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CastCollectionViewCell.identifier, for: indexPath) as? CastCollectionViewCell else {
            return UICollectionViewCell()
        }
        let castMember = castMembers[indexPath.row]
        cell.configure(with: castMember)
        return cell
    }
}

extension CastCollectionViewManager: UICollectionViewDelegateFlowLayout {
    internal func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 105, height: 250)
    }
}

