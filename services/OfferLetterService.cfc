<cfcomponent>
    <cffunction name="generateOfferLetter" returntype="string">
        <cfargument name="name" required="true">
        <cfargument name="email" required="true">
        <cfargument name="role" required="true">
        <cfargument name="mobile" required="true">
        <cfargument name="joinDate" required="true">
        <cfargument name="salary" required="true">
        <cfoutput>
        <cfset var pdfPath = expandPath("/SampleWorkSpace/EMS/pdfs/") & arguments.name & "_offer.pdf">
                
        <!--- <cfdocument format="pdf" filename="#pdfPath#" overwrite="yes">
            <h2>Offer Letter</h2>
            <p>Dear #arguments.name#,</p>
            <p>We are pleased to offer you the role of <strong>#arguments.role#</strong>.</p>
            <p>Best regards,</p>
            <p>Company HR</p>
        </cfdocument> --->
        <cfdocument format="pdf" filename="#pdfPath#" overwrite="yes">
            <cfset location = "Hyderabad">
            <cfset companyName = "BizAcuity Solutions Pvt. Ltd.">
    
            <html>
            <head>
                <style>
                    body { font-family: Arial, sans-serif; font-size: 12pt; }
                    .header { text-align: right; }
                    .logo { width: 150px; }
                    .content { margin: 20px; }
                    .bold { font-weight: bold; }
                    .signature { margin-top: 50px; }
                    .stamp { position: absolute; left: 200px; top: -30px; width: 100px; opacity: 0.7; }
                    .footer { text-align: center; font-size: 10pt; margin-top: 20px; }
                </style>
            </head>
            <body>
                <div class="header">
                    <img src="https://bizacuity.com/wp-content/uploads/2022/12/BizAcuity-Logo-1.png" class="logo">
                </div>
        
                <p>#dateFormat(now(), "mmmm dd, yyyy")#</p>
                <p><strong>#name#</strong></p>
                <p><strong>#location#</strong> </p>
                <p><strong>Email:</strong> #email#</p>
                <p><strong>Mobile:</strong> #mobile#</p>
        
                <h3>Subject: Offer of Employment</h3>
        
                <p>Dear #name#,</p>
        
                <p>On behalf of #companyName#, I am pleased to confirm our offer of employment to you as <span class="bold">#role#</span> based in <span class="bold">#location#</span>. We extend this offer with great confidence in your abilities.</p>
        
                <p>Your annual gross compensation is <span class="bold">Rs. #salary#</span>, subject to statutory deductions.</p>
        
                <p>You are required to join on <span class="bold">#joinDate#</span>. At the time of joining, it is mandatory to submit the required documents.</p>
        
                <p>BizAcuity is committed to providing a productive working environment. A background check will be carried out as part of company policy.</p>
        
                <p>We look forward to you joining our team.</p>
        
                <div class="signature">

                    <table>
                        <tr>
                            <td>
                                <p>Sincerely,</p>
                                <p>For <span class="bold">#companyName#</span></p>
                                <p>__________________________</p>
                                <p>Authorized Signatory</p>
                            </td>
<!---                             <td><img src="./views/stamp.jpg" width="200" height="200" /></td>--->                        </tr>
                    </table>
                    <!--- <p>Sincerely,</p>
                    <p>For <span class="bold">#companyName#</span></p>
                    <img src="./views/stamp.jpg" width="120" height="120" />
                    <p>__________________________</p>
                    <p>Authorized Signatory</p> --->
                </div>
        
                <div class="footer">
                    <p>#companyName# | www.bizacuity.com | Hyderabad, India</p>
                </div>
            </body>
            </html>
        </cfdocument>
        
        
        <cfreturn pdfPath>
    </cfoutput>
    </cffunction>
</cfcomponent>