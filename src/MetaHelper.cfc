<cfcomponent output="false">

	<cffunction name="init" output="false" access="public" returntype="any">
		<cfset this.version = "1.0" />
		<cfreturn this />
	</cffunction>
	
	<cffunction name="showTitle" returntype="string" output="false" access="public" mixins="controller">
		<cfargument name="spacer" required="false" type="string" default=" // " />
		<cfargument name="serverName" required="false" type="string" default="#cgi.server_name#" />
		<cfscript>
			var loc = {};
			if (StructKeyExists(request, "title"))
				loc.returnValue = request.title & arguments.spacer & arguments.serverName;
			else
				loc.returnValue = arguments.serverName;
		</cfscript>
		<cfreturn loc.returnValue />
	</cffunction>
	
	<cffunction name="setTitle" returntype="string" output="false" access="public" mixins="controller">
		<cfargument name="title" required="true" type="string" />
		<cfset request.title = arguments.title />
	</cffunction>
	
	<cffunction name="showKeywords" returntype="string" output="false" access="public" mixins="controller">
		<cfscript>
			var loc = {};
			loc.returnValue = "";
			if (StructKeyExists(request, "keywords"))
				loc.returnValue = request.keywords;
		</cfscript>
		<cfreturn loc.returnValue />
	</cffunction>
	
	<cffunction name="setKeywords" returntype="string" output="false" access="public" mixins="controller">
		<cfargument name="keywords" required="true" type="string" />
		<cfset request.keywords = arguments.keywords />
	</cffunction>
	
	<cffunction name="showDescription" returntype="string" output="false" access="public" mixins="controller">
		<cfscript>
			var loc = {};
			loc.returnValue = "";
			if (StructKeyExists(request, "description"))
				loc.returnValue = request.description;
		</cfscript>
		<cfreturn loc.returnValue />
	</cffunction>
	
	<cffunction name="setDescription" returntype="string" output="false" access="public" mixins="controller">
		<cfargument name="description" required="true" type="string" />
		<cfset request.description = arguments.description />
	</cffunction>
	
	<cffunction name="showCopyright" returntype="string" output="false" access="public" mixins="controller">
		<cfargument name="startYear" required="false" type="numeric" default="2009" />
		<cfscript>
			var loc = {
				returnValue = arguments.startYear,
				currentYear = Year(Now())
			};
			
			if (loc.returnValue neq loc.currentYear)
				loc.returnValue = loc.returnValue & " - " & loc.currentYear;
		</cfscript>
		<cfreturn loc.returnValue />
	</cffunction>	
	
</cfcomponent>