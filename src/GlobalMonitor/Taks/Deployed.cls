Class GlobalMonitor.Taks.Deployed Extends %RegisteredObject
{

/// d ##Class(GlobalMonitor.Taks.Deployed).Run()
ClassMethod Run()
{
	Set Name="Global Size Statistics"
	Set ClassName ="GlobalMonitor.Taks.GlobalCount"
	Set status = ..Task(Name,ClassName,"00:00:00")
}

ClassMethod Task(Name As %String, ClassName As %String, Time As %String) As %String
{

	Set taskObj=##class(%SYS.Task).%New()
	Set TaskID =taskObj.FindId(Name)
	if $L(TaskID)'=0 {
		Set tSC = taskObj.%DeleteId(TaskID)
	}
	Set taskObj.Name=Name
	Set taskObj.NameSpace=$namespace
	Set taskObj.Description=Name  
	Set taskObj.TaskClass= ClassName 
	Set taskObj.TimePeriod="0"
	Set taskObj.TimePeriodDay=""
	Set taskObj.TimePeriodEvery=1
	Set taskObj.DailyFrequency=1
	Set taskObj.DailyFrequencyTime=0
	Set taskObj.DailyIncrement=60
	set time=($p(Time,":",1)*60*60)+($p(Time,":",2)*60)+($p(Time,":",3))
	Set taskObj.DailyStartTime=time
	Set taskObj.DisplayStartDate=$zd($h,3)
	S tsc=taskObj.%Save()
	IF 'tsc{
		Quit $System.Status.GetErrorText(tsc)
	}ELSE{
		Quit 1
	}
}

}
