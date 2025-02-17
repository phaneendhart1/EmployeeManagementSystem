<cfcomponent>
    <cffunction name="addEmployee" returntype="void">
        <cfargument name="name" required="true">
        <cfargument name="email" required="true">
        <cfargument name="role" required="true">
        <cfargument name="mobile" required="true">
        <cfargument name="joinDate" required="true">
        <cfargument name="salary" required="true">
        <cfargument name="generateOffer" required="false" default="no">
        <cfargument name="sendEmail" required="false" default="no">
        
        <!--- Initialize pdfPath as empty by default --->
        <cfset var pdfPath = "">

        <!--- Check if Offer Letter needs to be generated --->
        <cfif arguments.generateOffer EQ "yes">
            <cfset var pdfService = new services.OfferLetterService()>
            <cfset pdfPath = pdfService.generateOfferLetter(arguments.name, arguments.email, arguments.role)>
        </cfif>

        <!--- Check if Email needs to be sent --->
        <cfif arguments.sendEmail EQ "yes" AND pdfPath NEQ "">
            <cfset var emailService = new services.EmailService()>
            <cfset emailService.sendOfferLetter(arguments.email, pdfPath)>
        </cfif>

        <!--- Database Connection --->
        <cfset dsn = new config.dbConfig().getConnection()>

        <!--- Insert Employee into the database --->
        <cfquery datasource="#dsn#">
            INSERT INTO employees (name, email, role, mobile, join_date, salary, offer_letter_path, created_at)
            VALUES (
                <cfqueryparam value="#arguments.name#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.email#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.role#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.mobile#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#arguments.joinDate#" cfsqltype="CF_SQL_DATE">,
                <cfqueryparam value="#arguments.salary#" cfsqltype="CF_SQL_VARCHAR">,
                <cfqueryparam value="#pdfPath#" cfsqltype="CF_SQL_VARCHAR">,
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
