<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@include file="../dynamic/css.jspf"%>

        <!-- Navigation-->
        <%@include file="../dynamic/navigationMain.jspf"%>
        <!-- Page Content-->
        <div class="container-fluid p-0">
            <!-- Interests-->
            <section class="resume-section" id="interests">
                <div class="resume-section-content">
                    <h2 class="mb-5">Interests</h2>
                    <c:forEach items="${interestModel}" var ="item">
                    <p> ${item.description} </p>
                        <security:authorize access="hasAnyRole('ADMIN')">
                        <p>
                        <span><a href='<c:url value="/editInterest/${item.id}"/>'
                                 class="btn-right btn btn-primary" role="button">Edytuj</a>
                        </span>

                        </p>
                    </security:authorize>
                    </c:forEach>
                    </div>

            </section>
            <security:authorize access="hasAnyRole('ADMIN')">
                        <div class="container">
                        <p>Dodaj opis zainteresowań</p>
                        <form method="post" action='<c:url value="/interest"/>'>

                        <div class="form-group row">
                        <label class="col-2" for="exampleFormControlInput3">Treść</label>
                        <div class="col-10">
                        <textarea type="text" class="form-control" rows="5" id="exampleFormControlInput3" name="description" placeholder="uzupełnij treść"></textarea>
                        </div>
                        </div>
                            <input type="submit" class="btn btn-success" value="Zapisz">

                        </form>
                        </div>
            </security:authorize>
        </div>
        <!-- Bootstrap core JS-->
        <%@include file="../dynamic/footer.jspf" %>

