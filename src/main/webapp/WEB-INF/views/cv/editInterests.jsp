<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@include file="../dynamic/css.jspf"%>


<%--        <!-- Navigation-->--%>
<%@include file="../dynamic/navigationMain.jspf"%>

<!-- Page Content-->
<div class="container-fluid p-0">

    <div class="container">
        <p>Edytuj zainteresownia</p>
        <form method="post" action='<c:url value="/editInterest/${interestModel.id}"/>'>
           <div class="form-group row">
            <label class="col-2" for="exampleFormControlInput3">Treść</label>
            <div class="col-10">
                <textarea type="text" class="form-control" rows="5" id="exampleFormControlInput3"
                          name="description" value="${interestModel.description}"></textarea>
            </div>
    </div>

            <input type="submit" class="btn btn-success" value="Zapisz zmiany" id="searchButton">
            <!-- Button to Open the Modal -->
            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                Usuń
            </button>

        </form>
        <!-- Button trigger modal -->


        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Czy napewno chcesz usunąć?</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        Potwierdź!
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <form method="post" action='<c:url value="/delInt/${interestModel.id}"/>'>
                            <input type="submit" class="btn btn-danger" value = "Usuń"/>
                        </form>
                    </div>
                </div>
            </div>
        </div>


    </div>


</div>

<!-- Bootstrap core JS-->
<%@include file="../dynamic/footer.jspf" %>
