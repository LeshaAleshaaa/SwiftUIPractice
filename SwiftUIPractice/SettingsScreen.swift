//
//  SettingsScreen.swift.swift
//  SwiftUIPractice
//
//  Created by Алексей Смицкий on 17.04.2022.
//

import SwiftUI

struct SettingsScreen: View {
    @State private var aviaModeToggleState = false
    @State private var wifiPickerIndex = 0
    @State private var bluetoothPickerIndex = 0
    @State private var mobileDataIndex = 0
    @State private var modemDataIndex = 0
    @State private var VPNToggleState = false
    
    @State private var nofityIndex = 0
    @State private var soundsIndex = 0
    @State private var focusIndex = 0
    @State private var screenTimeIndex = 0

    private var wifiNames = ["HomeWiFi", "CafeWifi"]
    private var bluetoothNames = ["Вкл", "Выкл"]
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    HStack(spacing: 0.0) {
                        Image(systemName: "heart.fill").frame(width: 40, height: 40)
                        VStack(alignment: .leading) {
                            Text("Алексей Смицкий")
                                .multilineTextAlignment(.leading)
                                .frame(height: 20)
                            Text("Apple ID, iCloud, контент и покупки")
                                .multilineTextAlignment(.leading)
                        }
                    }
                }
                
                Section {
                    aviaModeToggle
                    wifiPicker
                    bluetoothPicker
                    mobileDataPicker
                    modemDataPicker
                    VPNToggle
                }
                
                Section {
                    notificationsPicker
                    soundsPicker
                    focusPicker
                    screenTimePicker
                }
            }.navigationTitle("Настройки")
        }
    }
    
    private var aviaModeToggle: some View {
        Toggle(isOn: $aviaModeToggleState) {
            Text("Авиарежим")
        }
    }
    
    private var bluetoothPicker: some View {
        Picker(selection: $bluetoothPickerIndex) {
            ForEach(0..<bluetoothNames.count) {
                Text("\(bluetoothNames[$0])")
            }
        } label: {
            Text("Bluetooth \(self.bluetoothNames[bluetoothPickerIndex])")
        }
    }
    
    private var wifiPicker: some View {
        Picker(selection: $wifiPickerIndex) {
            ForEach(0..<wifiNames.count) {
                Text("\(wifiNames[$0])")
            }
        } label: {
            Text("Wi-Fi")
        }
    }
    
    private var mobileDataPicker: some View {
        Picker(selection: $mobileDataIndex) {
        } label: {
            Text("Сотовая связь")
        }
    }
    
    private var modemDataPicker: some View {
        Picker(selection: $modemDataIndex) {
        } label: {
            Text("Режим модема")
        }
    }
    
    private var VPNToggle: some View {
        Toggle(isOn: $VPNToggleState) {
            Text("VPN")
        }
    }
    
    private var notificationsPicker: some View {
        Picker(selection: $nofityIndex) {
        } label: {
            Text("Уведомления")
        }
    }
    
    private var soundsPicker: some View {
        Picker(selection: $soundsIndex) {
        } label: {
            Text("Звуки, тактильные сигналы")
        }
    }
    
    private var focusPicker: some View {
        Picker(selection: $focusIndex) {
        } label: {
            Text("Фокусирование")
        }
    }
    
    private var screenTimePicker: some View {
        Picker(selection: $screenTimeIndex) {
        } label: {
            Text("Экранное время")
        }
    }
}

struct SettingsScreen_Previews: PreviewProvider {
    static var previews: some View {
        SettingsScreen()
    }
}
