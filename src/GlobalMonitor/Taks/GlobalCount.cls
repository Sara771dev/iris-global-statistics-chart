Class GlobalMonitor.Taks.GlobalCount Extends %SYS.Task.Definition
{

Method OnTask() As %Status
{
	Set tSC = $$$OK
	Set GlobalInfo = ##class(GlobalMonitor.Operations.GlobalInfo).%New()
	Set DataArr= GlobalInfo.DBList()
	Set ClassName = "GlobalMonitor.Operations.GlobalInfo"
	Set Method = "GetGlobal"

	Set iter =DataArr.%GetIterator()
	while iter.%GetNext(.key,.value){
		job ##class(GlobalMonitor.Operations.Job).Job(ClassName,Method,value.Name,value.Directory,1)	
	}
	Quit tSC
}

}
