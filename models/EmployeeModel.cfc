<cfcomponent>
    <cffunction name="addEmployee" returntype="void">
        <cfargument name="name" required="true">
        <cfargument name="email" required="true">
        <cfargument name="role" required="true">
        <cfargument name="mobile" required="true">
        <cfargument name="joinDate" required="true">
        <cfargument name="salary" required="true">
        <cfargument name="pdfPath" required="true">

        <cfset dsn = new config.dbConfig().getConnection()>

        <cfquery datasource="#dsn#">
            INSERT INTO employees (name, email, role, mobile, join_date, salary, offer_letter_path, created_at)
            VALUES (
                <cfqueryparam value="#arguments.name#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.email#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.role#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.mobile#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.joinDate#" cfsqltype="CF_SQL_DATE">,
                <cfqueryparam value="#arguments.salary#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.pdfPath#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#now()#" cfsqltype="CF_SQL_TIMESTAMP">
            )
        </cfquery>
    </cffunction>

    <cffunction name="getEmployees" returntype="query">
        <cfset dsn = new config.dbConfig().getConnection()>

        <cfquery name="employees" datasource="#dsn#">
            SELECT id, name, email, role, mobile, join_date, salary, offer_letter_path, created_at
            FROM employees
            ORDER BY id
        </cfquery>

        <cfreturn employees>
    </cffunction>
</cfcomponent>
