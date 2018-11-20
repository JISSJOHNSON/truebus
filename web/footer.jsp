<%@page contentType="text/html" pageEncoding="UTF-8"%>
<style>
    .footer {
        position: fixed;
        bottom: 0;
        width: 100%;
        height: 30px;
        background-color: #ececec;
        z-index: 99;
        padding-top: 5px;
    }
    #last{
        float: right;
        font-weight: bold;
    }
</style>
<footer class="footer fixed">
    <div class="container">
        <p class="text-muted text-center">&copy; Jiss Johnson
            <span id="last">
                Last login : <%= mysession.getAttribute("lastdate")%>
            </span>
        </p>
    </div>
</footer>