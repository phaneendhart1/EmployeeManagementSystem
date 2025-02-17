<cfif structKeyExists(form, "name")>
    <!--- Create an instance of EmployeeController and call addEmployee method --->
    <cfset employeeController = new controllers.EmployeeController()>

    <!--- Check if checkboxes are selected (ColdFusion only sends them if checked) --->
    <cfset generateOffer = "no">
    <cfset sendEmail = "no">
    
    <cfif structKeyExists(form, "generateOffer")>
        <cfset generateOffer = "yes">
    </cfif>

    <cfif structKeyExists(form, "sendEmail")>
        <cfset sendEmail = "yes">
    </cfif>

    <!--- Call the addEmployee function with checkbox values --->
    <cfset employeeController.addEmployee(
        form.name, 
        form.email, 
        form.role,  
        form.mobile, 
        form.joinDate, 
        form.salary, 
        generateOffer, 
        sendEmail
    )>

    <p style="color: green;">Employee added successfully!</p>

    <!--- Show success messages based on user choices --->
    <cfif generateOffer EQ "yes">
        <p style="color: blue;">Offer letter generated.</p>
    </cfif>

    <cfif sendEmail EQ "yes">
        <p style="color: blue;">Offer letter sent to candidate email.</p>
    </cfif>
</cfif>

<!--- Include Add Employee Form & Employee List --->
<!--- <cfinclude template="./views/employees.cfm"> --->
<cflocation url="views/employees.cfm?page=1" addtoken="false">
