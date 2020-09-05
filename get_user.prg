lparameters STATION_ID

Station_Name = "UNKNOWN"

If Station_ID = "200"
 Station_Name = "REPEATER"
EndIf

If Station_ID = "505050"
 Station_Name = "Kev"
EndIf
If Station_ID = "515151"
 Station_Name = "Sean"
EndIf
If Station_ID = "525252"
 Station_Name = "Rob-AnyTone"
EndIf
If Station_ID = "535353"
 Station_Name = "Mark"
EndIf
If Station_ID = "545454"
 Station_Name = "Rob-Baofeng"
EndIf
If Station_ID = "555555"
 Station_Name = "Rob-DMX1"
EndIf
If Station_ID = "565656"
 Station_Name = "Rob-DMX2"
EndIf
If Station_ID = "575757"
 Station_Name = "Rob-Retevis"
EndIf

Return(Station_Name)
