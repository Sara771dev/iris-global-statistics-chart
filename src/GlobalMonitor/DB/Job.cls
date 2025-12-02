Class GlobalMonitor.DB.Job Extends %Persistent
{

Property JobID As %String;

Property ClassName As %String;

Property Status As %String;

Property MethodName As %String;

Property StartTime As %String;

Property EndTime As %String;

Index ClassName On ClassName;

Index StartTime On StartTime;

Index Status On Status;

Index JobID On JobID;

Storage Default
{
<Data name="JobDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>JobID</Value>
</Value>
<Value name="3">
<Value>ClassName</Value>
</Value>
<Value name="4">
<Value>Status</Value>
</Value>
<Value name="5">
<Value>MethodName</Value>
</Value>
<Value name="6">
<Value>StartTime</Value>
</Value>
<Value name="7">
<Value>EndTime</Value>
</Value>
</Data>
<DataLocation>^GlobalMonitor.DB.JobD</DataLocation>
<DefaultData>JobDefaultData</DefaultData>
<ExtentSize>5</ExtentSize>
<IdLocation>^GlobalMonitor.DB.JobD</IdLocation>
<IndexLocation>^GlobalMonitor.DB.JobI</IndexLocation>
<Property name="%%CLASSNAME">
<AverageFieldSize>2</AverageFieldSize>
<OutlierSelectivity>.999999:</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="%%ID">
<AverageFieldSize>3</AverageFieldSize>
<Selectivity>1</Selectivity>
</Property>
<Property name="ClassName">
<AverageFieldSize>37</AverageFieldSize>
<OutlierSelectivity>.999999:"GlobalMonitor.Operations.GlobalInfo"</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="EndTime">
<AverageFieldSize>25</AverageFieldSize>
<Selectivity>20.0000%</Selectivity>
</Property>
<Property name="JobID">
<AverageFieldSize>4</AverageFieldSize>
<Selectivity>20.0000%</Selectivity>
</Property>
<Property name="MethodName">
<AverageFieldSize>14</AverageFieldSize>
<OutlierSelectivity>.999999:"GetGlobalUse"</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="StartTime">
<AverageFieldSize>25</AverageFieldSize>
<Selectivity>20.0000%</Selectivity>
</Property>
<Property name="Status">
<AverageFieldSize>5</AverageFieldSize>
<OutlierSelectivity>.999999:"end"</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<SQLMap name="ClassName">
<BlockCount>-4</BlockCount>
</SQLMap>
<SQLMap name="IDKEY">
<BlockCount>-4</BlockCount>
</SQLMap>
<SQLMap name="JobID">
<BlockCount>-4</BlockCount>
</SQLMap>
<SQLMap name="StartTime">
<BlockCount>-4</BlockCount>
</SQLMap>
<SQLMap name="Status">
<BlockCount>-4</BlockCount>
</SQLMap>
<StreamLocation>^GlobalMonitor.DB.JobS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
