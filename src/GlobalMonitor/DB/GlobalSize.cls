Class GlobalMonitor.DB.GlobalSize Extends %Persistent
{

Property Name As %String;

Property UseSize As %Numeric;

Property AllocationSize As %Numeric;

Property DBName As %String;

Property GlobalUpdateTime As %String;

Index Name On Name;

Index DBName On DBName;

Index GlobalUpdateTime On GlobalUpdateTime;

Storage Default
{
<Data name="GlobalSizeDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Name</Value>
</Value>
<Value name="3">
<Value>UseSize</Value>
</Value>
<Value name="4">
<Value>AllocationSize</Value>
</Value>
<Value name="5">
<Value>DBName</Value>
</Value>
<Value name="6">
<Value>GlobalUpdateTime</Value>
</Value>
</Data>
<DataLocation>^GlobalMonitor.DB.GlobalSizeD</DataLocation>
<DefaultData>GlobalSizeDefaultData</DefaultData>
<ExtentSize>1895</ExtentSize>
<IdLocation>^GlobalMonitor.DB.GlobalSizeD</IdLocation>
<IndexLocation>^GlobalMonitor.DB.GlobalSizeI</IndexLocation>
<Property name="%%CLASSNAME">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,16,$lb("-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000"),$lb(21,21,21,21,21,21,21,21,21,21,21,21,21,21,21),$lb(758198320,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,758198320))</Histogram>
<OutlierSelectivity>.999999:</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="%%ID">
<AverageFieldSize>3.87</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,1,0,$lb(1,127,254,381,508,635,761,887,1013,1139,1265,1391,1517,1643,1769,1895),$lb(1,0,0,0,0,0,0,0,1,1,1,1,1,1,1),"")</Histogram>
<Selectivity>1</Selectivity>
</Property>
<Property name="AllocationSize">
<AverageFieldSize>3.98</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,1,0,$lb(.01,.01,.01,.01,.01,.01,.01,.01,.01,.01,.01,.01,.02,.09,.66,871),$lb(3,3,3,3,3,3,3,3,3,3,3,2,2,1,0),"")</Histogram>
<OutlierSelectivity>.743008:.01</OutlierSelectivity>
<Selectivity>0.2824%</Selectivity>
</Property>
<Property name="DBName">
<AverageFieldSize>11.9</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" ENSLIB"," HIIGLOBAL"," HIVIEWGLOBAL"," HIVIEWGLOBAL"," HSLIB"," HSSYS"," IITGLOBAL"," IITGLOBAL"," IRISSYS"," JHIEGLOBAL"," JHIPGLOBAL"," JHIPTGLOBAL"," JHIPV5-3_DEVGLOBAL"," JHIPV5GLOBAL"," JHIPV5GLOBAL"," USER"),$lb(1,3,14,2,3,1,11,2,1,4,5,5,7,14,1),$lb(541412947,1162761036,1212762439,1229409359,1447642455,0,0,1230391621,1397508418,1279869440,1398362880,1213420377,1229542471,0,0,1230260044,1380537171,1230129491,1246251333,1162300495,1346849871,1196183362,1413958735,1413958735,1446325555,758341444,1196183362,0,0,1246251344,1431520594,542462789))</Histogram>
<Selectivity>4.3478%</Selectivity>
</Property>
<Property name="GlobalUpdateTime">
<AverageFieldSize>21</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" 2025-11-26 09:28:52"," 2025-11-26 09:29:02"," 2025-11-26 09:29:03"," 2025-11-26 09:29:18"," 2025-11-26 09:29:24"," 2025-11-26 09:29:31"," 2025-11-26 09:29:43"," 2025-11-26 09:30:01"," 2025-11-26 09:30:40"," 2025-11-26 09:31:29"," 2025-11-26 09:31:39"," 2025-11-26 09:32:07"," 2025-11-26 09:32:42"," 2025-11-26 09:32:56"," 2025-11-26 09:33:19"," 2025-11-26 09:36:40"),$lb(16,19,18,18,18,18,15,18,16,18,16,18,18,16,16),$lb(540160050,943338802,960114738,838860800,855638016,808648704,825753600,825753600,842268672,842268672,858849280,858849280,875757568,842611252,858798640,808517632,875560960,809120816,825897529,842596352,859373568,825897785,842674231,808910848,875692032,875692032,892731392,842675510,859451705,859451705,909784112,540160050))</Histogram>
<OutlierSelectivity>.054881:"2025-11-26 09:29:02"</OutlierSelectivity>
<Selectivity>0.6386%</Selectivity>
</Property>
<Property name="Name">
<AverageFieldSize>19.29</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" %"," DEEPSEE.CACHE.RESULTS"," DEEPSEE.FOLDERITEMI"," ENS.ACTIVITY.DATA.HOURSI"," ENS.CONFIG"," ENS.CONFIG.SEARCHTABLEPROPI"," ENS.MESSAGEHEADERD"," ENS.UTIL.LOGD"," ENSEDI.X12.DESCRIPTION"," ENSPORTAL"," HS.DOC.DATA.LINKD"," HS.XF.REFERENCETYPE"," JHIPLIB.UTIL.SAVE.DB.SAVEDBD"," PKG.ISC.REST.RESOURCEMAPI"," SQL"," ZPM.SETTINGS"),$lb(1,9,1,5,11,5,5,4,4,1,4,1,1,1,1),$lb(539295744,620756992,1145390416,1128350536,1179601988,1145390416,1162761006,1094931529,1129270854,0,777209153,1129270854,1296388947,1296388947,1431587148,777344073,1162103086,1162103086,1347375700,1162761040,1213410884,1146045230,1480994386,1213410904,1246251344,1246251344,1347110702,1347110702,1397836800,1397836800,1515212078,542789709))</Histogram>
<OutlierSelectivity>.015303:"ISCMethodWhitelist"</OutlierSelectivity>
<Selectivity>0.2698%</Selectivity>
</Property>
<Property name="UseSize">
<AverageFieldSize>2.71</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,1,0,$lb(0,0,0,0,0,0,0,0,0,0,0,.01,.02,.07,.64,776),$lb(1,1,1,1,1,1,1,1,1,1,0,2,2,1,0),"")</Histogram>
<OutlierSelectivity>.71029:0</OutlierSelectivity>
<Selectivity>0.3115%</Selectivity>
</Property>
<SQLMap name="DBName">
<BlockCount>-12</BlockCount>
</SQLMap>
<SQLMap name="GlobalUpdateTime">
<BlockCount>-20</BlockCount>
</SQLMap>
<SQLMap name="IDKEY">
<BlockCount>-72</BlockCount>
</SQLMap>
<SQLMap name="Name">
<BlockCount>-12</BlockCount>
</SQLMap>
<StreamLocation>^GlobalMonitor.DB.GlobalSizeS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
