Class GlobalMonitor.Operations.Job Extends %RegisteredObject
{

/// d ##class(GlobalMonitor.Operations.GlobalInfo).Job()
ClassMethod Job(ClassName, methodName, param1, param2, param3)
{
  try{
	   Set ^GlobalSize = 20
   
	   if $G(^GlobalRunSize) >= ^GlobalSize{
		    Set ^Log($zdt($now(),3,,3))="DG: "_$G(^GlobalRunSize)
		 hang 0.5
	     d ..Job(ClassName, methodName, param1, param2, param3)
	   }else{
		   
		   try{
			   Set ^GlobalRunSize =^GlobalRunSize+1 
		   }Catch e{
			   Set ^GlobalRunSize =1 
		   }
		   	   
		   job $classmethod(ClassName, methodName, param1,param2,param3)
		   Set jobid = $zchild
		   Set StartTime = $ZDT($NOW(),3,,3)
		   &SQL(insert into GlobalMonitor_DB.Job (ClassName,  JobID, MethodName, StartTime, Status)
		   values(:ClassName,:jobid,:methodName,:StartTime,'run'))
		   Set ^Log($zdt($now(),3,,3))="Create job  : "_jobid
		   
		   for {
			   
			   Set type = ..ProcessExistsId(jobid)
			   if 'type{
				   Set EndTime = $ZDT($NOW(),3,,3)
			   	   &SQL(update GlobalMonitor_DB.Job Set Status ='end' ,EndTime = :EndTime where JobID = :jobid )
			   	   Set ^GlobalRunSize =^GlobalRunSize-1 

					 Set ^Log($zdt($now(),3,,3))="job end id : "_jobid
			   	   Quit
			   }
		   }   
	   
	   }
	
  }catch e{
  		Set ^Log($zdt($now(),3,,3))= e.DisplayString()
  }
  
  quit 1
}

ClassMethod ProcessExistsId(jobid)
{
	Set NameSpace = $namespace
	new $namespace
	Set $namespace = "%SYS"
	Set type = ##class(SYS.Process).%ExistsId(jobid)
	
	new $namespace
	Set $namespace = NameSpace
	Quit type
}

}
