//
//  ContentListView.swift
//  DogChallenge
//
//  Created by Naveen Ramachandrappa on 2/3/23.
//

import SwiftUI

struct ContentListView<Data, Content>: View where Data: RandomAccessCollection, Data.Element: Hashable, Content: View {
	@Binding private  var data: Data

	let content: (Data.Element) -> Content

	init(data: Binding<Data>, content: @escaping (Data.Element) -> Content) {
		_data = data
		self.content = content
	}

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
			LazyVStack(spacing: 0) {
				ForEach(data, id: \.self) { item in
					content(item)
				}
			}
		}
    }
}
