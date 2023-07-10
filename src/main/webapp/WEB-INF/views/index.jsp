<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@include file="dynamic/css.jspf"%>


        <!-- Navigation-->
        <%@include file="dynamic/navigationMain.jspf"%>
        <!-- Page Content-->
        <div class="container-fluid p-0">
            <!-- About-->
            <section class="resume-section" id="about">
                <div class="resume-section-content">
                    <c:forEach items="${personModel}" var = "person">
                    <h1 class="mb-0">
                        ${person.name}
                        <span class="text-primary">${person.surname}</span>
                    </h1>
                    <div class="subheading mb-5">
                            ${person.adress} · ${person.phone}  ·
                                <a href="mailto:${person.email}">${person.email}</a>
                    </div>
                    <p class="lead mb-5">${person.description}</p>
                    </c:forEach>
                        <div class="social-icons">
                        <a class="social-icon" href="#!"><i class="fab fa-linkedin-in"></i></a>
                        <a class="social-icon" href="#!"><i class="fab fa-github"></i></a>
                        <a class="social-icon" href="#!"><i class="fab fa-twitter"></i></a>
                        <a class="social-icon" href="#!"><i class="fab fa-facebook-f"></i></a>
                    </div>
                </div>
            </section>
        </div>
        <!-- Bootstrap core JS-->
        <!-- Bootstrap core JS-->
        <%@include file="dynamic/footer.jspf" %>

