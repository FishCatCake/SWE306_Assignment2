<%@ page import="com.swe306.asg2.dao.model.Patient" %>
<%@ page import="com.swe306.asg2.dao.concrete.MysqlPatientDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%
    int gender = 0;
    if (request.getParameter("id") == null) {
        response.sendRedirect("/patients.jsp");
    } else {
        String requestId = request.getParameter("id");
        Patient p = MysqlPatientDAO.selectPatientById(Integer.parseInt(requestId));
        request.setAttribute("p", p);
        if (p.getGender() == "male") {
            gender = 1;
        } else {
            gender = 0;
        }
    }
%>
<head>
    <title>Edit patient - ${p.getFullName()}</title>
    <style>
        .home {
            text-align: center;
        }

        .form {
            display: flex;
            justify-content: center;
        }

        .opts {
            margin-bottom: 15px;
        }
    </style>
</head>
<body>
<div class="home">
    <h1>Edit patient - ${p.getFullName()}</h1>
    <div class="opts">
        <button onclick="document.location='patients.jsp'">Back</button>
    </div>
    <div class="form">
        <form onsubmit="return validate();" action="doEditPatient.jsp" method="post">
            <table>
                <tr style="display: none;">
                    <td>Patient ID:</td>
                    <td><input type="text" name="id" id="id" value="${p.getId()}"></td>
                </tr>
                <tr>
                    <td>Patient IC No.:</td>
                    <td><input type="text" name="icNumber" id="icNumber" value="${p.getIcNumber()}"></td>
                </tr>
                <tr>
                    <td>Patient Full Name:</td>
                    <td><input type="text" name="fullName" id="fullName" value="${p.getFullName()}"></td>
                </tr>
                <tr>
                    <td>Patient Tel No:</td>
                    <td><input type="tel" name="telNo" id="telNo" value="${p.getTelNo()}"></td>
                </tr>
                <tr>
                    <td>Patient Gender:</td>
                    <td>Current Value is ${p.getGender()}</td>
                    <td><input type="radio" name="gender" value="male">Male</td>
                    <td><input type="radio" name="gender" value="female">Female</td>
                </tr>
                <tr>
                    <td>Patient Address:</td>
                    <td><input type="text" name="address" id="address" value="${p.getAddress()}"></td>
                </tr>

                <tr>
                    <td>Patient Last Visit Date:</td>
                    <td><input type="date" name="lastDate" id="lastDate" value="${p.getLastDate()}"></td>
                </tr>

                <tr>
                    <td>Patient Prescription:</td>
                    <td><input type="text" name="prescription" id="prescription" value="${p.getPrescription()}"></td>
                </tr>

                <tr>
                    <td>
                        <input  type="button" value="Update Patient" onclick="editConfirm('${p.getId()}', '${p.getFullName()}')"/>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</div>
<script src="assets/js/validatePatient.js"></script>
<script src="assets/js/patients.js"></script>
</body>
</html>
