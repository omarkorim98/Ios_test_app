//
//  ContentView.swift
//  niceIOS
//
//  Created by Omar Mohamed Korim on 05/07/2023.
//

import SwiftUI
import FirebaseAnalytics
import Firebase
import FirebaseAnalyticsSwift

final class AnalyticsManager{
    static let shared = AnalyticsManager()
    
    private init(){}
    
    func logEvent(name: String, params: [String:Any]? = nil){
        Analytics.logEvent(name, parameters: params)
    }
    func setUserId(userId: String){
        Analytics.setUserID(userId)
    }
    
    func setUserProperty(value: String?, property: String){
        Analytics.setUserProperty(value, forName: property)
    }
}

struct ContentView: View {
    var item1: [String: Any] = [
      AnalyticsParameterItemID: "itemID",
      AnalyticsParameterItemName: "itemName",
      AnalyticsParameterAffiliation: "affiliation",
      AnalyticsParameterCoupon: "coupon",
      AnalyticsParameterDiscount: "discount",
      AnalyticsParameterIndex: "index",
      AnalyticsParameterItemCategory2: "itemCategory2",
      AnalyticsParameterItemCategory3: "itemCategory3",
      AnalyticsParameterItemCategory4: "itemCategory4",
      AnalyticsParameterItemCategory5: "itemCategory5",
      AnalyticsParameterItemListID: "itemListID",
      AnalyticsParameterItemListName: "itemListName",
      AnalyticsParameterItemVariant: "itemVariant",
      AnalyticsParameterItemBrand: "itemBrand",
      AnalyticsParameterLocationID: "locationID",
      AnalyticsParameterPrice: 9.99,
    ]

    var item2: [String: Any] = [
      AnalyticsParameterItemID: "itemID2",
      AnalyticsParameterItemName: "itemName2",
      AnalyticsParameterAffiliation: "affiliation2",
      AnalyticsParameterCoupon: "coupon2",
      AnalyticsParameterDiscount: "discount2",
      AnalyticsParameterIndex: "index2",
      AnalyticsParameterItemCategory2: "itemCategory22",
      AnalyticsParameterItemCategory3: "itemCategory32",
      AnalyticsParameterItemCategory4: "itemCategory42",
      AnalyticsParameterItemCategory5: "itemCategory52",
      AnalyticsParameterItemListID: "itemListID2",
      AnalyticsParameterItemListName: "itemListName2",
      AnalyticsParameterItemVariant: "itemVariant2",
      AnalyticsParameterItemBrand: "itemBrand2",
      AnalyticsParameterLocationID: "locationID2",
      AnalyticsParameterPrice: 500,
      "item_color":"blue",
    ]
    var item4: [String: Any] = [
      AnalyticsParameterItemID: "itemID4",
      AnalyticsParameterItemName: "itemName4",
      AnalyticsParameterAffiliation: "affiliation4",
      AnalyticsParameterCoupon: "coupon4",
      AnalyticsParameterDiscount: "discount4",
      AnalyticsParameterIndex: "index4",
      AnalyticsParameterItemCategory2: "itemCategory24",
      AnalyticsParameterItemCategory3: "itemCategory34",
      AnalyticsParameterItemCategory4: "itemCategory44",
      AnalyticsParameterItemCategory5: "itemCategory54",
      AnalyticsParameterItemListID: "itemListID4",
      AnalyticsParameterItemListName: "itemListName4",
      AnalyticsParameterItemVariant: "itemVariant4",
      AnalyticsParameterItemBrand: "itemBrand4",
      AnalyticsParameterLocationID: "locationID4",
      AnalyticsParameterPrice: 321,
      "item_color":"blue",
    ]

    var item3: [String: Any] = [
      "item_color":"red",
    ]
    var body: some View {
    
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Tap Here")
            Button{
                Analytics.logEvent(AnalyticsEventScreenView, parameters:[
                AnalyticsParameterScreenName: "screenName",
                AnalyticsParameterScreenClass:"screenClass",
                "previous_screen_name":"previousScreenName",
                "previous_screen_class":"previousScreenClass"
                ]
                 )
                
                // Prepare ecommerce parameters
                  var itemList_custom: [String: Any] = [
                   AnalyticsParameterItemListID: "vacuum flasks set id",
                   AnalyticsParameterItemListName: "vacuum flasks set",
                              ]
                // Add items array
                  itemList_custom[AnalyticsParameterItems] = [item3]

                // Log view item list event
                Analytics.logEvent(AnalyticsEventViewItemList, parameters: itemList_custom)
               
                Analytics.logEvent("inAppEvent", parameters: [
                  "name": "Omar",
                ])


            } label: {
                Text("Here")
                    .font(.largeTitle)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
