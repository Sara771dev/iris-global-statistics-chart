Class GlobalMonitor.Operations.GlobalInfo Extends %RegisteredObject
{

/// d ##class(GlobalMonitor.Operations.GlobalInfo).Run()
ClassMethod Run()
{
	Set t1="2025-11-26 10:00:08"
	Set t2="2025-11-26 14:29:08"
	zw ..GetChartByDBandName("","",t1,t2)
}

/// d ##class(GlobalMonitor.Operations.GlobalInfo).Run()
ClassMethod GetChartByDBandName(DBName, GlobalName, StartTime, EndTime)
{
	
	Set sql ="SELECT AllocationSize, DBName, GlobalUpdateTime, Name, UseSize FROM GlobalMonitor_DB.GlobalSize "
	Set:$L(StartTime)'=0 sql=sql_" where GlobalUpdateTime between '"_StartTime_"' and '"_EndTime_"' "
	Set:$L(DBName)'=0 sql=sql_"  and DBName ='"_DBName_"' "
	Set:$L(GlobalName)'=0 sql=sql_"  and Name ='"_GlobalName_"' "
	Set sql =sql_" group by DBName,Name order by UseSize desc limit 10 "
	
	Set Object ={}
	Set xArr = ##class(%DynamicArray).%New()
	Set yArr = ##class(%DynamicArray).%New()
	Set tStatment = ##class(%SQL.Statement).%New()
	Set tSC = tStatment.%Prepare(sql)
	Set Rest = tStatment.%Execute()
	While Rest.%Next(){
		Set DbName =Rest.%Get("DBName")
		Set GName =Rest.%Get("Name")
		Set Obj =..GetChart(DbName,GName,StartTime,EndTime)
		d yArr.%Push(Obj.Y)
		Set xArr =Obj.X
	}
	Set Object.X=xArr
	Set Object.Y=yArr
	
	Quit Object
}

ClassMethod GetChart(DBName, GlobalName, StartTime, EndTime)
{
	Set sql =" SELECT AllocationSize, DBName, GlobalUpdateTime, Name, UseSize   FROM GlobalMonitor_DB.GlobalSize "
			_"where  GlobalUpdateTime between '"_StartTime_"' and '"_EndTime_"'   and DBName='"_DBName_"' and Name='"_GlobalName_"'  "
			_"order by GlobalUpdateTime "
	Set Object ={}
	Set xArr = ##class(%DynamicArray).%New()
	Set yArr = ##class(%DynamicArray).%New()
	Set tStatment = ##class(%SQL.Statement).%New()
	Set tSC = tStatment.%Prepare(sql)
	Set Rest = tStatment.%Execute()
	While Rest.%Next(){
		Set time = Rest.%Get("GlobalUpdateTime")
		Set UseSize = Rest.%Get("UseSize")
		Set Name = Rest.%Get("Name")
		Set AllocationSize = Rest.%Get("AllocationSize")
		Set obj = ##class(%DynamicObject).%New()
		d obj.%Set("UseSize",UseSize)
		d obj.%Set("Name",Name)
		d obj.%Set("AllocationSize",AllocationSize)
		d xArr.%Push(time)
		d yArr.%Push(obj)
	}
	Set Object.X=xArr
	Set Object.Y=yArr
	Quit Object
}

/// zw ##class(GlobalMonitor.Operations.GlobalInfo).DBName()
ClassMethod DBName() As %DynamicArray
{
	Set arr =##class(%DynamicArray).%New()
	Set sql = "SELECT DBName FROM GlobalMonitor_DB.GlobalSize  group by DBName"
	Set tStatment = ##class(%SQL.Statement).%New()
	Set tSC = tStatment.%Prepare(sql)
	Set Rest = tStatment.%Execute()
	While Rest.%Next(){
		d arr.%Push(Rest.%Get("DBName"))
	}
	Quit arr
}

/// zw ##class(GlobalMonitor.Operations.GlobalInfo).GlobalName("ENSLIB")
ClassMethod GlobalName(DBName As %String) As %DynamicArray
{
	Set arr =##class(%DynamicArray).%New()
	Set sql = "SELECT DBName, Name  FROM GlobalMonitor_DB.GlobalSize  "
	Set:$L(DBName)'=0 sql=sql_" where DBName = '"_DBName_"' "
	Set sql =sql_" group by Name "
	Set tStatment = ##class(%SQL.Statement).%New()
	Set tSC = tStatment.%Prepare(sql)
	Set Rest = tStatment.%Execute()
	While Rest.%Next(){
		d arr.%Push(Rest.%Get("Name"))
	}
	Quit arr
}

ClassMethod select()
{
	Set Arr =..DBName()
	Set iter = Arr.%GetIterator()
	While iter.%GetNext(.key , .value ) {
	
	}
}

ClassMethod GetGlobal(name As %String, path As %String, type As %String = 1)
{
	
	 Set rs = ##class(%ResultSet).%New("%SYS.GlobalQuery:Size")
	 if type {
	 	do rs.Execute(path) // use
	 }else{
	 	do rs.Execute(path,,,,,1)  
	 }
	 while (rs.Next()) { 
	   set gname= rs.Get("Name") // global name
	   set gsize= rs.Get("Allocated MB") // global size (MB)
	   set usize= rs.Get("Used MB") // global size (MB)
	   Set time =$zdt($now(),3)
	   &SQL(insert into GlobalMonitor_DB.GlobalSize (AllocationSize, GlobalUpdateTime, Name, DBName, UseSize)
	   values(:gsize,:time,:gname,:name,:usize))

	 }
}

ClassMethod DBList() As %DynamicArray
{
	Set NameSpace = $namespace
	new $namespace
	Set $namespace = "%SYS"
	Set Name="*"
	Set dynamicArray = ##class(%DynamicArray).%New()
	Set Result=##class(%ResultSet).%New("Config.Databases.LocalDatabaseList")
	if 'Result {Quit $$$NO}
	if Result.Execute(Name) {
	 	While (Result.Next()) {
	  		Set dynamicObject = ##class(%DynamicObject).%New()
	  		Do dynamicObject.%Set("Name",Result.Data("Name"))
	  		Do dynamicObject.%Set("Directory",Result.Data("Directory"))
		  	DO dynamicArray.%Push(dynamicObject)
	 	}
	 	Do Result.Close()
	}
	new $namespace
	Set $namespace = NameSpace
	Quit dynamicArray
}

}
