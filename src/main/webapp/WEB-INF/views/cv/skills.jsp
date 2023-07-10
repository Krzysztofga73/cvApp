<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@include file="../dynamic/css.jspf"%>


        <!-- Navigation-->
        <%@include file="../dynamic/navigationMain.jspf"%>
        <!-- Page Content-->
        <div class="container-fluid p-0">
            <!-- Skills-->
            <section class="resume-section" id="skills">
                <div class="resume-section-content">
                    <h2 class="mb-5">Skills</h2>
                    <div class="subheading mb-3">Programming Languages & Tools</div>
                    <c:forEach items="${skillsModel}" var ="item">
                        <c:if test = "${item.category == 'programming'}">
                    <div class="d-flex flex-column flex-md-row justify-content-between mb-5">
                            <ul class="list-inline">
                                <li class="list-inline-item" >${item.title}</li>
                            </ul>
                            <security:authorize access="hasAnyRole('ADMIN')">
                        <span><a href='<c:url value="/editSkills/${item.id}"/>'
                                 class="btn-right btn btn-primary" role="button">Edytuj</a>
                        </span>
                            </security:authorize>
                    </div>
                        </c:if>
                    </c:forEach>
                    <%--<ul class="list-inline dev-icons">
                        <li class="list-inline-item"><i class="fab fa-html5"></i></li>
                        <li class="list-inline-item"><i class="fab fa-css3-alt"></i></li>
                        <li class="list-inline-item"><i class="fab fa-js-square"></i></li>
                        <li class="list-inline-item"><i class="fab fa-angular"></i></li>
                        <li class="list-inline-item"><i class="fab fa-react"></i></li>
                        <li class="list-inline-item"><i class="fab fa-node-js"></i></li>
                        <li class="list-inline-item"><i class="fab fa-sass"></i></li>
                        <li class="list-inline-item"><i class="fab fa-less"></i></li>
                        <li class="list-inline-item"><i class="fab fa-wordpress"></i></li>
                        <li class="list-inline-item"><i class="fab fa-gulp"></i></li>
                        <li class="list-inline-item"><i class="fab fa-grunt"></i></li>
                        <li class="list-inline-item"><i class="fab fa-npm"></i></li>
                    </ul>--%>
                    <div class="subheading mb-3">Workflow</div>
                    <ul class="fa-ul mb-0">
                        <c:forEach items="${skillsModel}" var ="item">
                        <c:if test = "${item.category == 'workflow'}">

                            <li>
                            <span class="fa-li"><i class="fas fa-check"></i></span>
                                    ${item.title}
                        </li>
                            <security:authorize access="hasAnyRole('ADMIN')">
                        <span><a href='<c:url value="/editSkills/${item.id}"/>'
                                 class="btn-right btn btn-primary" role="button">Edytuj</a>
                        </span>
                            </security:authorize>

                        </c:if>
                        </c:forEach>
                    </ul>
                </div>
            </section>
            <security:authorize access="hasAnyRole('ADMIN')">
                <div class="container">
                    <p>Dodaj skillsy</p>
                    <form method="post" action='<c:url value="/skills"/>'>
                        <div class="form-group row">
                            <label class="col-2" for="exampleFormControlInput1">Tytuł</label>
                            <div class="col-10">
                                <input type="text" class="form-control" id="exampleFormControlInput1" name="title" placeholder="uzupełnij tytuł">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-2" for="exampleFormControlInput2">Kategoria</label>
                            <div class="col-10">
                                <input type="text" class="form-control" id="exampleFormControlInput2" name="category" placeholder="uzupełnij kategorię">
                            </div>
                        </div>
                        <input type="submit" class="btn btn-success" value="Zapisz">
                    </form>
                </div>
            </security:authorize>

        </div>
        <!-- Bootstrap core JS-->
        <%@include file="../dynamic/footer.jspf" %>
