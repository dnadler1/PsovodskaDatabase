<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page import="javax.servlet.jsp.jstl.sql.Result"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<head>
    <link rel="stylesheet" type="text/css" href="css/styles.css">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <sql:setDataSource var="snapshot" driver="org.apache.derby.jdbc.ClientDriver" url="jdbc:derby://localhost:1527/PSINA" user="dnadler" password="nadlerka" scope="request"/> 
    <c:choose>
        <c:when test="${param.vehicle1 == 2}">
            <sql:query dataSource="${snapshot}" var="result1" scope="request"> SELECT PSOVODI.JMENO_PSOVODA, PSOVODI.PRIJMENI_PSOVODA FROM PSOVODI INNER JOIN PSI ON PSOVODI.ID_PSOVODA = PSI.PSOVOD_ID GROUP BY PSOVODI.JMENO_PSOVODA, PSOVODI.PRIJMENI_PSOVODA HAVING Count(PSI.PSOVOD_ID)=2</sql:query>
            <sql:query dataSource="${snapshot}" var="result2" scope="request"> SELECT * FROM PSI</sql:query>
        </c:when>
        <c:when test="${param.jmenopsa != null}">
            <sql:update dataSource="${snapshot}" var="result2" scope="request">INSERT INTO PSI VALUES (${param.idpsa},'${param.jmenopsa}','${param.specpsa}','${param.plpsa}','${param.datpsa}',${param.psid})</sql:update>
            <sql:query dataSource="${snapshot}" var="result1" scope="request"> SELECT * FROM PSOVODI</sql:query>
            <sql:query dataSource="${snapshot}" var="result2" scope="request"> SELECT * FROM PSI</sql:query>
        </c:when>
        <c:when test="${param.hodnost != null}">
            <sql:update dataSource="${snapshot}" var="result1" scope="request">INSERT INTO PSOVODI(ID_PSOVODA,JMENO_PSOVODA,PRIJMENI_PSOVODA,ADRESA,DATUM_NAROZENI,HODNOST_PSOVODA) VALUES (${param.idpso},'${param.jmeno}','${param.prijm}','${param.adresa}','${param.dat}','${param.hodnost}')</sql:update>
            <sql:query dataSource="${snapshot}" var="result1" scope="request"> SELECT * FROM PSOVODI</sql:query>
            <sql:query dataSource="${snapshot}" var="result2" scope="request"> SELECT * FROM PSI</sql:query>
        </c:when>
        <c:when test="${param.sloupec != null}">
            <sql:update dataSource="${snapshot}" var="result1" scope="request"> UPDATE PSI SET ${param.sloupec} = '${param.hodnota}' WHERE ID_PSA = ${param.id}</sql:update>
            <sql:query dataSource="${snapshot}" var="result2" scope="request"> SELECT * FROM PSI</sql:query>
            <sql:query dataSource="${snapshot}" var="result1" scope="request"> SELECT * FROM PSOVODI</sql:query>
        </c:when>
        <c:when test="${param.sloupec2 != null}">
            <sql:update dataSource="${snapshot}" var="result2" scope="request"> UPDATE PSOVODI SET ${param.sloupec2} = '${param.hodnota2}' WHERE ID_PSOVODA = ${param.id2}</sql:update>
            <sql:query dataSource="${snapshot}" var="result2" scope="request"> SELECT * FROM PSI</sql:query>
            <sql:query dataSource="${snapshot}" var="result1" scope="request"> SELECT * FROM PSOVODI</sql:query>
        </c:when>
        <c:when test="${param.psovid != null}">
            <sql:update dataSource="${snapshot}" var="result1" scope="request"> DELETE  FROM PSOVODI WHERE ID_PSOVODA = ${param.psovid}</sql:update>
            <sql:query dataSource="${snapshot}" var="result1" scope="request"> SELECT * FROM PSOVODI</sql:query>
            <sql:query dataSource="${snapshot}" var="result2" scope="request"> SELECT * FROM PSI</sql:query>
        </c:when>
        <c:when test="${param.pesid != null}">
            <sql:update dataSource="${snapshot}" var="result2" scope="request"> DELETE  FROM PSI WHERE ID_PSA = ${param.pesid}</sql:update>
            <sql:query dataSource="${snapshot}" var="result1" scope="request"> SELECT * FROM PSOVODI</sql:query>
            <sql:query dataSource="${snapshot}" var="result2" scope="request"> SELECT * FROM PSI</sql:query>
        </c:when>
        <c:otherwise>
            <sql:query dataSource="${snapshot}" var="result1" scope="request"> SELECT * FROM PSOVODI</sql:query>
            <sql:query dataSource="${snapshot}" var="result2" scope="request"> SELECT * FROM PSI</sql:query>
        </c:otherwise>
    </c:choose>
</head>
<body id="bodys">
    <div id="nadpis">
        <h1>Proč jsem Tuto stránku napsal?</h1>
        Tímto programem mi šlo hlavně o funkčnost programu, proto není design na Této stránce
        nic extra. Jedná se o fiktivní tabulku. Myslím jinak, že z popisků je vše jasné.
        <h2>${param.chyba}</h2>
    </div>
    <div id="stred">
        <div id="tabulka">
            <table border="1" id="table1">
                <thead>
                    <tr>
                        <th>ID PSA</th>
                        <th>JMENO PSA</th>
                        <th>SPECIALIZACE PSA</th>
                        <th>PLEMENO PSA</th>
                        <th>DATUM NAROZENI</th>
                        <th>PSOVOD ID</th>
                    </tr>
                <thead>
                <tbody>
                    <c:forEach var="coze" items="${result2.rows}">
                        <tr>
                            <td>${coze.ID_PSA}</td>
                            <td>${coze.JMENO_PSA}</td>
                            <td>${coze.SPECIALIZACE_PSA}</td>
                            <td>${coze.PLEMENO_PSA}</td>
                            <td>${coze.DATUM_NAROZENI}</td>
                            <td>${coze.PSOVOD_ID}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <div id="tabulka2">
            <table border="1" id="table2">
                <thead>
                    <tr>
                        <th>ID PSOVODA</th>
                        <th>JMENO PSOVODA</th>
                        <th>PRIJMENI PSOVODA</th>
                        <th>ADRESA</th>
                        <th>DATUM NAROZENI</th>
                        <th>HODNOST PSOVODA</th>
                    </tr>
                <thead>
                <tbody>
                    <c:forEach var="coze" items="${result1.rows}">
                        <tr>
                            <td>${coze.ID_PSOVODA}</td>
                            <td>${coze.JMENO_PSOVODA}</td>
                            <td>${coze.PRIJMENI_PSOVODA}</td>
                            <td>${coze.ADRESA}</td>
                            <td>${coze.DATUM_NAROZENI}</td>
                            <td>${coze.HODNOST_PSOVODA}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <div id="spodek">
        <div id="levyblok">
            <div id="doplpsov">
                <h4>Doplň řádek do tabulky psovodi</h4>
                <form action="Vysledek" method="post">
                    ID PSOVODA: <input type="text" name="idpso"><br>
                    JMENO PSVODA: <input type="text" name="jmeno"><br>
                    PRIJMENI PSOVODA: <input type="text" name="prijm"><br>
                    ADRESA: <input type="text" name="adresa"><br>
                    DATUM NAROZENI: <input type="text" name="dat"><br>
                    HODNOST PSOVODA: <input type="text" name="hodnost"><br>
                    <input type="submit" value="Submit">
                </form>
            </div>
            <div id="doplpes">
                <h4>Doplň řádek do tabulky pes</h4>
                <form action="Vysledek" method="post">
                    ID PSA: <input type="text" name="idpsa"><br>
                    JMENO PSA: <input type="text" name="jmenopsa"><br>
                    SPECIALIZACE PSA: <input type="text" name="specpsa"><br>
                    PLEMENO PSA: <input type="text" name="plpsa"><br>
                    DATUM NAROZENI: <input type="text" name="datpsa"><br>
                    PSOVOD ID: <select name="psid">
                        <c:forEach var="coze" items="${result2.rows}">
                            <option value="${coze.PSOVOD_ID}">${coze.PSOVOD_ID}</option>
                        </c:forEach>
                    </select><br>
                    <input type="submit" value="Submit">
                </form>
            </div>
        </div>
        <div id="pravybok">
            <div id="rokpsa">
                <form action="Vysledek" method="post">
                    Napiš ID psa, kterého chceš zrušit<input type="text" name="pesid"><br> 
                    <input type="submit" value="ZRUS">
                </form>
            </div>
            <div id="rokpsa">
                <form action="Vysledek" method="post">
                    Napiš ID psovoda, kterého chceš zrušit<input type="text" name="psovid"><br> 
                    <input type="submit" value="ZRUS">
                </form>
            </div>
            <div id="vyberpsov">
                <form action="Vysledek" method="post">
                    NAPIS, KTERY SLOUPEC CHCES ZMENIT U PSU
                    <select name="sloupec">
                        <c:forEach var="coze" items="${result2.columnNames}"> 
                            <option value="${coze}">${coze}</option>
                        </c:forEach>
                    </select><br>    
                    Napiš, které ID chceš změnit<input type="text" name="id"><br>
                    Napiš, hodnotu<input type="text" name="hodnota"><br>
                    <input type="submit" value="ZMEN">
                </form>
            </div>
            <div id="vyberpsov">
                <form action="Vysledek" method="post">
                    NAPIS, KTERY SLOUPEC CHCES ZMENIT U PSOVODU
                    <select name="sloupec2">
                        <c:forEach var="coze" items="${result1.columnNames}"> 
                            <option value="${coze}">${coze}</option>
                        </c:forEach>
                    </select><br>    
                    Napiš, které ID chceš změnit<input type="text" name="id2"><br>
                    Napiš, hodnotu<input type="text" name="hodnota2"><br>
                    <input type="submit" value="ZMEN">
                </form>
            </div>
            <div id="vicjakjedenpes">
                <form action="Vysledek" ethod="post" method="post">
                    CHCES VEDET, KTERI PSOVODI MAJI VICE JAK JEDNOHO PSA,NAPIS DVOJKU
                    <input type="text" name="vehicle1"><br>
                    <br><br>
                    <input type="submit">
                </form>
            </div>
        </div>
    </div>
</body>

