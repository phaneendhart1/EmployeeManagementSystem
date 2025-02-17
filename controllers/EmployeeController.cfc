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

        <!--- Initialize required services and models --->
        <cfset var pdfService = new services.OfferLetterService()>
        <cfset var emailService = new services.EmailService()>
        <cfset var employeeModel = new models.EmployeeModel()>

        <!--- Generate PDF Offer Letter only if the checkbox is selected --->
        <cfset var pdfPath = "">
        <cfif arguments.generateOffer EQ "yes">
            <cfset pdfPath = pdfService.generateOfferLetter(arguments.name, arguments.email, arguments.role, arguments.mobile, arguments.joinDate, arguments.salary)>
        </cfif>

        <!--- Send Offer Letter via Email only if checkbox is selected --->
        <cfif arguments.sendEmail EQ "yes" AND pdfPath NEQ "">
            <cfset emailService.sendOfferLetter(arguments.email, pdfPath)>
        </cfif>

        <!--- Insert Employee Record into the Database --->
        <cfset employeeModel.addEmployee(arguments.name, arguments.email, arguments.role, arguments.mobile, arguments.joinDate, arguments.salary)>
    </cffunction>
</cfcomponent>
