lparameters GPS_DATA, Station_ID
*Process_GPS(SMSTEXT)

* $GNRMC Statement from Radio's GPS
* $GNRMC,141328.000,A,5053.38109,N,00019.15541,E,0.00,335.03,030920,,,A*7F
* $GNRMC,AAAAAA.AAA,B,CCCC.CCCCC,D,EEEEE.EEEEE,F,G.GG,HHH.HH,IIIIII,,,JJJJ
* AAAAAA.AAA = UTC Time HHMMSS.SS Hour(2)Min(2)Sec(2).DecimalSec(3)
* B = V Nav Error or A Data Valid
* CCCC.CCCCC = Latitude as DDDMM.MMMMM Deg(3)Min(2).DecimalMin(5)
* D = N North or S South
* EEEEE.EEEEE = Longitude as DDDMM.MMMMM Deg(3)Min(2).DecimalMin(5)
* F = E East or W West
* GG = Speed Knots(3)
* HHH.HH = Course Deg(3).DecimalDeg(1)
* IIIIII = The date DD(2)MM(2)YY(2)
* Ignore the rest.


Field_Data = 0
GPS_UTC = ""
GPS_VALID = ""
GPS_LAT = ""
GPS_NS = ""
GPS_LON = ""
GPS_EW = ""
GPS_SPEED = ""
GPS_DIR = ""

For GPS_POS = 0 To LEN(GPS_DATA)
 GPS_CHAR = Left(Right(GPS_DATA,(LEN(GPS_DATA)-GPS_POS)),1)
 If GPS_CHAR = "," && We hit the comma between fields
  Field_Data = Field_Data + 1
 Else && Real Data & Not a comma
  If GPS_POS > 6 AND GPS_POS < 18
   GPS_UTC = GPS_UTC + GPS_CHAR
  EndIf
  If GPS_POS = 18
   GPS_VALID = GPS_VALID + GPS_CHAR
  EndIf
  If GPS_POS > 19 AND GPS_POS < 27
   GPS_LAT = GPS_LAT + GPS_CHAR
  EndIf
  If GPS_POS = 31
   GPS_NS = GPS_NS + GPS_CHAR
  EndIf
  
  If GPS_POS > 31 AND GPS_POS < 41
   GPS_LON = GPS_LON + GPS_CHAR
  EndIf
  If GPS_POS = 45
   GPS_EW = GPS_EW + GPS_CHAR
  EndIf
  If GPS_POS > 46 AND GPS_POS < 52
   GPS_SPEED = GPS_SPEED + GPS_CHAR
  EndIf
  If GPS_POS > 51 AND GPS_POS < 56
   GPS_DIR = GPS_DIR + GPS_CHAR
  EndIf
 EndIf
Next GPS_POS

*messagebox(GPS_UTC,0)
*messagebox(GPS_VALID,0)
*messagebox(GPS_LAT,0)

TestOut = "Time: " + GPS_UTC + " Validity: " + GPS_VALID + " Latitude: " + GPS_LAT + " NS: " + GPS_NS + " Longitude: " + GPS_LON + " EW: " + GPS_EW + " SPEED: " + GPS_SPEED + " DIR: " + GPS_DIR

APRS_Packet = "=" + GPS_LAT + GPS_NS + "/" + GPS_LON + GPS_EW + "b" + GPS_DIR + "/" + GPS_SPEED + " " + Station_ID + CHR(13) + CHR(10)

Return(APRS_Packet)

