<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@include file="../dynamic/css.jspf"%>


<%--        <!-- Navigation-->--%>
      <%@include file="../dynamic/navigationMain.jspf"%>

        <!-- Page Content-->
        <div class="container-fluid p-0">
            <!-- Education-->
            <section class="resume-section" id="education">
                <div class="resume-section-content">
                    <h2 class="mb-5">Education</h2>
                    <c:forEach items="${educationModel}" var ="item">
                    <div class="d-flex flex-column flex-md-row justify-content-between mb-5">
                        <div class="flex-grow-1">

                            <h3 class="mb-0">${item.title}</h3>
                            <div class="subheading mb-3">${item.subtitle}</div>
                            <div>${item.description}</div>

                        </div>
                        <div class="flex-shrink-0"><span class="text-primary"><fmt:formatDate pattern = "yyyy-MM" value = "${item.dateFrom}"/> -  <fmt:formatDate pattern = "yyyy-MM" value = "${item.dateTo}"/></span></div>
                        <security:authorize access="hasAnyRole('ADMIN')">
                        <span><a href='<c:url value="/editEducation/${item.id}"/>'
                               class="btn-right btn btn-primary" role="button">Edytuj</a>
                        </span>
                        </security:authorize>
                    </div>
                    </c:forEach>
                </div>
            </section>


            <security:authorize access="hasAnyRole('ADMIN')">
            <div class="container">
                <p>Dodaj edukację</p>
                <form method="post" action='<c:url value="/education"/>'>
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



