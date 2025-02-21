<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add New Employee</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            background: white;
            padding: 20px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            width: 350px;
        }
        h2 {
            text-align: center;
            color: #333;
        }
        label {
            font-weight: bold;
            display: block;
            margin: 10px 0 5px;
        }
        input[type="text"], input[type="email"], input[type="date"] {
            width: 90%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
        }
        input[type="submit"] {
            width: 90%;
            background: #28a745;
            color: white;
            border: none;
            padding: 10px;
            font-size: 16px;
            cursor: pointer;
            margin-top: 15px;
            border-radius: 5px;
        }
        input[type="submit"]:hover {
            background: #218838;
        }
    </style>
    <script>
        function toggleEmailCheckbox() {
            var generateOffer = document.getElementById("generateOffer");
            var sendEmailContainer = document.getElementById("sendEmailContainer");

            if (generateOffer.checked) {
                sendEmailContainer.style.display = "block";
            } else {
                sendEmailContainer.style.display = "none";
                document.getElementById("sendEmail").checked = false; // Uncheck when hidden
            }
        }
    </script>
</head>
<body>

<div class="container">
    <h2>Add New Employee</h2>
    <form action="../index.cfm" method="post">
        <label for="name">Name:</label>
        <input type="text" name="name" id="name" required>

        <label for="email">Email:</label>
        <input type="email" name="email" id="email" required>

        <label for="role">Role:</label>
        <input type="text" name="role" id="role" required>

        <label for="mobile">Mobile:</label>
        <input type="text" name="mobile" id="mobile" required>

        <label for="joinDate">Join Date:</label>
        <input type="date" name="joinDate" id="joinDate" required>

        <label for="salary">Salary:</label>
        <input type="text" name="salary" id="salary" required>

        <label>
            <input type="checkbox" name="generateOffer" id="generateOffer" value="yes" onclick="toggleEmailCheckbox()"> Generate Offer Letter
        </label>
        <div id="sendEmailContainer" style="display: none;">
            <label>
                <input type="checkbox" name="sendEmail" value="yes"> Send Email to Candidate
            </label>
        </div>
    <input type="submit" value="Add Employee">
    </form>
</div>

</body>
</html>
