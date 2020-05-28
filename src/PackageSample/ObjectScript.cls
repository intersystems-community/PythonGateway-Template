Class PackageSample.ObjectScript
{

/// do ##class(PackageSample.ObjectScript).Test()
ClassMethod Test() As %Status
{
	set variable = "mylist"
	set arg1 = 1
	set arg2 = "abc"
	
	set sc = ##class(isc.py.Main).ExecuteCode("(" _ arg1 _ ",'" _ arg2 _ "')", variable)
	write:$$$ISERR(sc) $System.Status.GetErrorText(sc)

	set sc = ##class(isc.py.Main).GetVariableJson(variable, .string, $$$YES)
	
    write string 

    quit sc
}

}
