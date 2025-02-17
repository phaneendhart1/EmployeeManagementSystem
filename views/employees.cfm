<cfquery name="getEmployees" datasource="employeedb">
    SELECT * FROM employees ORDER BY created_at DESC
</cfquery>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            text-align: center;
        }
        .container {
            width: 90%;
            max-width: 1000px;
            background: white;
            padding: 20px;
            margin: 20px auto;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        h2 {
            color: #333;
        }
        .btn-add {
            background-color: #28a745;
            color: white;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
            border-radius: 5px;
            font-size: 16px;
            margin-bottom: 15px;
        }
        .btn-add:hover {
            background-color: #218838;
        }
        .employee-list {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
            gap: 15px;
        }
        .card-container {
            width: 45%;
            perspective: 1000px;
        }
        .flip-card {
            width: 100%;
            height: 200px;
            position: relative;
            transform-style: preserve-3d;
            transition: transform 0.6s;
        }
        .card-container:hover .flip-card {
            transform: rotateY(180deg);
        }
        .flip-card-front, .flip-card-back {
            position: absolute;
            width: 100%;
            height: 100%;
            backface-visibility: hidden;
            padding: 15px;
            border-radius: 8px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: flex-start;
            line-height: 2.5;
            font-size: 25px;
        }
        .flip-card-front {
            background: white;
        }
        .flip-card-back {
            background: #007bff;
            color: white;
            transform: rotateY(180deg);
        }
        .flip-card h3 {
            margin: 5px 0;
            color: #007bff;
        }
        .flip-card p {
            margin: 3px 0;
            font-size: 14px;
        }
        .pdf-link {
            color: #fff;
            font-weight: bold;
            text-decoration: none;
        }
        .pdf-link:hover {
            text-decoration: underline;
        }
        /* Pagination */
        .pagination {
            margin-top: 70px;
        }
        .pagination a {
            padding: 8px 12px;
            margin: 2px;
            border: none;
            background: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }
        .pagination a:hover {
            background: #0056b3;
        }
        .pagination a.disabled {
            background: #ccc;
            pointer-events: none;
        }
        @media (max-width: 768px) {
            .card-container {
                width: 90%;
            }
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Employee List</h2>
    <button class="btn-add" onclick="window.location.href='./addEmployee.cfm'">Add Employee</button>

    <div class="employee-list">
        <cfparam name="page" default="1">
        <cfset itemsPerPage = 2>
        <cfset startRow = (page - 1) * itemsPerPage + 1>

        <cfoutput query="getEmployees" startRow="#startRow#" maxRows="#itemsPerPage#">
            <div class="card-container">
                <div class="flip-card">
                    <!-- Front Side -->
                    <div class="flip-card-front">
                        <h3>#name#</h3>
                        <p><strong>Email:</strong> #email#</p>
                        <p><strong>Role:</strong> #role#</p>
                    </div>
                    <!-- Back Side -->
                    <div class="flip-card-back">
                        <p><strong>Mobile:</strong> #mobile#</p>
                        <p><strong>Join Date:</strong> #dateFormat(join_date, 'yyyy-mm-dd')#</p>
                        <p><strong>Salary:</strong> #salary#</p>
                        <p><strong>Created At:</strong> #dateFormat(created_at, 'yyyy-mm-dd HH:mm:ss')#</p>
                        <!--- <p>
                            <cfif len(offer_letter_path)>
                                <a href="#offer_letter_path#" class="pdf-link" target="_blank">View PDF</a>
                            <cfelse>
                                Not Generated
                            </cfif>
                        </p> --->
                    </div>
                </div>
            </div>
        </cfoutput>
    </div>

    <!-- Pagination -->
    <cfset totalPages = ceiling(getEmployees.recordCount / itemsPerPage)>
    <cfset prevPage = page - 1>
    <cfset nextPage = page + 1>

    <div class="pagination">
        <cfoutput>
            <cfif prevPage GT 0>
                <a href="employees.cfm?page=#prevPage#">Previous</a>
            <cfelse>
                <a class="disabled">Previous</a>
            </cfif>

            <span> Page #page# of #totalPages# </span>

            <cfif nextPage LE totalPages>
                <a href="employees.cfm?page=#nextPage#">Next</a>
            <cfelse>
                <a class="disabled">Next</a>
            </cfif>
        </cfoutput>
    </div>
</div>

</body>
</html>
