<cfcomponent>
    
    <cffunction name = "sendOfferLetter" returntype = "void">
        <cfargument name = "email" required = "true"/>
        <cfargument name = "pdfPath" required = "true"/>
    
        <cfoutput>
            <cfmail to = "#arguments.email#" from = "babithota5@gmail.com" 
                    subject = "Your Offer Letter" type = "html">
                <p>Dear Candidate,</p>
                <p>Please find attached your offer letter.</p>
                <cfmailparam file = "#arguments.pdfPath#" disposition = "attachment">
            </cfmail>
        
        </cfoutput>
    
        <!--- <cfmail to="#arguments.email#" from="tphaneendhar1@gmail.com" subject="Your Offer 
        Letter" type="html">
            <p>Dear Candidate,</p>
            <p>Please find attached your offer letter.</p>
            <cfmailparam file="#arguments.pdfPath#" disposition="attachment">
        </cfmail> --->
    </cffunction>
    

</cfcomponent>