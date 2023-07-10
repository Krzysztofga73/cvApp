<%@ page import="java.util.Date" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@include file="../dynamic/css.jspf"%>


    <body id="page-top">
    <%@include file="../dynamic/navigationMain.jspf"%>
        <!-- Page Content-->
        <div class="container-fluid p-0">
            <!-- Experience-->
            <section class="resume-section" id="experience">
                <div class="resume-section-content">
                    <h2 class="mb-5">Experience</h2>
                    <c:forEach items="${experienceModel}" var ="item">
                        <div class="d-flex flex-column flex-md-row justify-content-between mb-5">
                            <div class="flex-grow-1">

                                <h3 class="mb-0">${item.title}</h3>
                                <div class="subheading mb-3">${item.subtitle}</div>
                                <div>${item.description}</div>

                            </div>
                            <jsp:useBean id="now" class="java.util.Date"/>
                            <c:if test = "${item.dateTo < now}">
                            <div class="flex-shrink-0"><span class="text-primary"><fmt:formatDate pattern = "yyyy-MM" value = "${item.dateFrom}"/> -  <fmt:formatDate pattern = "yyyy-MM" value = "${item.dateTo}"/></span></div>
                            </c:if>
                            <c:if test = "${item.dateTo > now}">
                                <div class="flex-shrink-0"><span class="text-primary"><fmt:formatDate pattern = "yyyy-MM" value = "${item.dateFrom}"/> - Obecnie </span></div>
                            </c:if>
                            <security:authorize access="hasAnyRole('ADMIN')">
                            <span><a href='<c:url value="/editExperience/${item.id}"/>'
                                     class="btn-right btn btn-primary" role="button">Edytuj</a>
                        </span>
                            </security:authorize>
                        </div>
                    </c:forEach>
                </div>
            </section>

            <security:authorize access="hasAnyRole('ADMIN')">
            <div class="container">
                <p>Dodaj doświadczenie</p>
                <form method="post" action='<c:url value="/experience"/>'>
                    <div class="form-group row">
                        <label class="col-2" for="exampleFormControlInput1">Tytuł</label>
                        <div class="col-10">
                            <input type="text" class="form-control" id="exampleFormControlInput1" name="title" placeholder="uzupełnij tytuł">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label class="col-2" for="exampleFormControlInput2">Podtytuł</label>
                        <div class="col-10">
                            <input type="text" class="form-control" id="exampleFormControlInput2" name="subtitle" placeholder="uzupełnij podtytuł">
                        </div>
                    </div>


                    <div class="form-group row">
                        <label class="col-2" for="exampleFormControlInput3">Treść</label>
                        <div class="col-10">
                            <textarea type="text" class="form-control" rows="5" id="exampleFormControlInput3" name="description" placeholder="uzupełnij treść"></textarea>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-2" for="exampleFormControlInput4">Początek</label>
                        <div class="col-10">
                            <input type="date" class="form-control" rows="5" id="exampleFormControlInput4" name="dateFrom" placeholder="Podaj początek">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-2" for="exampleFormControlInput5">Koniec</label>
                        <div class="col-10">
                            <input type="date" class="form-control" rows="5" id="exampleFormControlInput5" name="dateTo" placeholder="Podaj koniec">
                        </div>
                    </div>
                    <input type="submit" class="btn btn-success" value="Zapisz">
                </form>
            </div>
            </security:authorize>
        </div>

    <!-- Bootstrap core JS-->
    <%@include file="../dynamic/footer.jspf" %>
