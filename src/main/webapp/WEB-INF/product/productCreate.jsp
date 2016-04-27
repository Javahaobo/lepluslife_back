<%--
  Created by IntelliJ IDEA.
  User: wcg
  Date: 16/3/10
  Time: 上午9:49
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@include file="../commen.jsp" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>乐+生活 后台模板管理系统</title>
    <link href="${resourceUrl}/css/bootstrap.min.css" rel="stylesheet">
    <link type="text/css" rel="stylesheet" href="${resourceUrl}/css/commonCss.css"/>
    <style>
        .thumbnail {
            width: 160px;
            height: 160px;
        }

        .thumbnail img {
            width: 100%;
            height: 100%;
        }
    </style>
    <script type="text/javascript" src="${resourceUrl}/js/jquery-2.0.3.min.js"></script>
    <script type="text/javascript" src="${resourceUrl}/js/html5shiv.min.js"></script>
    <script type="text/javascript" src="${resourceUrl}/js/respond.min.js"></script>
    <script type="text/javascript" src="${resourceUrl}/js/vendor/jquery.ui.widget.js"></script>
    <script type="text/javascript" src="${resourceUrl}/js/jquery.iframe-transport.js"></script>
    <script type="text/javascript" src="${resourceUrl}/js/jquery.fileupload.js"></script>
</head>

<body>
<div id="topIframe">
    <%@include file="../common/top.jsp" %>
</div>
<div id="content">
    <div id="leftIframe">
        <%@include file="../common/left.jsp" %>
    </div>
    <div class="m-right">
        <div class="main">
            <div class="container-fluid">
                <button type="button" class="btn btn-primary btn-return" style="margin:10px;" onclick="goProductPage()">
                    返回专题列表
                </button>
                <hr>
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="productNum" class="col-sm-2 control-label">商品序号</label>

                        <div class="col-sm-4">
                            <c:if test="${product==null}">
                                <input type="number" class="form-control" id="productNum"
                                       value="${sid+1}">
                            </c:if>
                            <c:if test="${product!=null}">
                                <input type="number" class="form-control" id="productNum"
                                       value="${product.sid}">
                            </c:if>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="productType" class="col-sm-2 control-label">商品分类</label>

                        <div class="col-sm-4">
                            <select class="form-control" id="productType" name="productType">
                                <option value="0">请选择</option>
                                <c:forEach var="productType" items="${productTypes}">
                                    <option value="${productType.id}">${productType.type}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="productName" class="col-sm-2 control-label">商品名称</label>

                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="productName"
                                   value="${product.name}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="productName" class="col-sm-2 control-label">商品描述</label>

                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="productDescription"
                                   value="${product.description}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="productPic" class="col-sm-2 control-label">商品图片</label>

                        <div class="col-sm-4">
                            <div class="thumbnail">
                                <img id="productPicture" src="${product.picture}" alt="...">
                            </div>
                            <input type="file" class="form-control" id="productPic" name="file"
                                   data-url="/manage/file/saveImage"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="smPic" class="col-sm-2 control-label">缩略图片</label>

                        <div class="col-sm-4">
                            <div class="thumbnail">
                                <img id="productThumb" src="${product.thumb}" alt="...">
                            </div>
                            <input type="file" class="form-control" id="smPic" name="file"
                                   data-url="/manage/file/saveImage"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="productPrice" class="col-sm-2 control-label">正常价格</label>

                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="productPrice"
                                   value="${product.price/100}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="productMinPrice" class="col-sm-2 control-label">真实价格</label>

                        <div class="col-sm-4">
                            <input type="text" class="form-control" id="productMinPrice"
                                   value="${product.minPrice/100}">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">可选品类</label>

                        <div class="col-sm-4" id="productKind1">
                            <c:forEach items="${productSpecs}" var="productSpec">
                                <div class="pull-left">
                                    <input type="text" class="text-primary"
                                           value="${productSpec.specDetail}">
                                    <input type="hidden" value="${productSpec.id}"/>
                                </div>
                            </c:forEach>
                            <input class="btn btn-primary addWarn" data-target="#addWarn"
                                   type="button" value="添加">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">各品类库存</label>

                        <div class="col-sm-4" id="productNum2">
                            <c:forEach items="${productSpecs}" var="productSpec">
                                <input type="text" value="${productSpec.repository}">
                            </c:forEach>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-4">
                            <input type="button" class="btn btn-primary" id="submit" value="提交"/>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<div id="bottomIframe">
    <%@include file="../common/bottom.jsp" %>
</div>
<!--添加提示框-->
<div class="modal" id="addWarn">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span
                        aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title">添加（品类和库存均不能为空）</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="productKind" class="col-sm-2 control-label">品类</label>

                        <div class="col-sm-9">
                            <input type="text" class="form-control" id="productKind">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="productNum1" class="col-sm-2 control-label">库存</label>

                        <div class="col-sm-9">
                            <input type="number" class="form-control" id="productNum1">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary add-product">确认</button>
                <input type="hidden" id="productId" value="${product.id}"/>
            </div>
        </div>
    </div>
</div>

<script src="${resourceUrl}/js/bootstrap.min.js"></script>
<script>
    $(function () {
        $('#productPic').fileupload({
                                        dataType: 'json',
                                        maxFileSize: 5000000,
                                        acceptFileTypes: /(\.|\/)(gif|jpe?g|png)$/i,
                                        add: function (e, data) {
                                            data.submit();
                                        },
                                        done: function (e, data) {
                                            var resp = data.result;
                                            $('#productPicture').attr('src',
                                                                      '${ossImageReadRoot}/'
                                                                      + resp.data);
                                        }
                                    });
        $('#smPic').fileupload({
                                   dataType: 'json',
                                   maxFileSize: 5000000,
                                   acceptFileTypes: /(\.|\/)(gif|jpe?g|png)$/i,
                                   add: function (e, data) {
                                       data.submit();
                                   },
                                   done: function (e, data) {
                                       var resp = data.result;
                                       $('#productThumb').attr('src',
                                                               '${ossImageReadRoot}/'
                                                               + resp.data);
                                   }
                               });
//        数组
        $("#productType option[value=${product.productType.id}]").attr("selected", true);

        var indexVal = 0;
        $('.addWarn').click(function () {
            var beforeStr = '<div class="pull-left"><input type="text" class="text-primary" value="请编辑"> <span class="label label-default" data-index="'
                            + indexVal + '">X</span></div>';
            $('.addWarn').before(beforeStr);
            bindListener();
            var afterStr = '<input type="text" data-index="' + indexVal + '" value="请编辑">';
            $('#productNum2').append(afterStr);
            indexVal++;
        });

        <%--bindListener();--%>
        //规格选择
        function bindListener() {
            var divs = $('#productKind1 div');
            divs.each(function (i) {
                divs.eq(i).find('span').unbind().bind('click', function () {
                    //获取当前的规格的dom节点序号
                    var index = $(this).attr('data-index');
                    $(this).parent('div').remove();
                    var name = '#productNum2 input[data-index="' + index + '"]';
                    $(name).remove();
                })
            });
        }
    });

    $("#submit").bind("click", function () {
        if($("#productType").val()==0||$("#productType").val()==null){
            alert("请选择分类");
            return;
        }
        var productDto = {};
        var productType = {};
        productType.id = $("#productType").val();
        productDto.name = $("#productName").val();
        productDto.productType = productType;
        productDto.sid = $("#productNum").val();
        productDto.description = $("#productDescription").val();
        productDto.price = $("#productPrice").val();
        productDto.minPrice = $("#productMinPrice").val();
        productDto.picture = $("#productPicture").attr("src");
        productDto.thumb = $("#productThumb").attr("src");
        var productSpecs = [];
        var divs = $('#productKind1 div');
        var inputs = $('#productNum2 input');
        divs.each(function (i) {
            //获取当前的规格的dom节点序号
            var productSpec = {};
            productSpec.specDetail = divs.eq(i).find('input[type=text]').val();
            productSpec.id = divs.eq(i).find('input[type=hidden]').val();
            var index = $(this).attr('data-index');
            productSpec.repository = inputs.eq(i).val();
            productSpecs[i] = productSpec;
        });
        productDto.productSpecs = productSpecs;
        if (${product!=null}) {
            productDto.id = $("#productId").val();
            $.ajax({
                       type: "put",
                       url: "/manage/product",
                       contentType: "application/json",
                       data: JSON.stringify(productDto),
                       success: function (data) {
                           alert(data.msg);
                           setTimeout(function () {
                               location.href = "/manage/product";
                           }, 0);
                       }
                   });
        } else {
            $.ajax({
                       type: "post",
                       url: "/manage/product",
                       contentType: "application/json",
                       data: JSON.stringify(productDto),
                       success: function (data) {
                           alert(data.msg);
                           setTimeout(function () {
                               location.href = "/manage/product";
                           }, 0);
                       }
                   });
        }
    });


    //        控制字数
    $("#productName").bind("input propertychange", function () {
        if($(this).val().length>12){
            alert("已经是最大字数了哦！");
            $(this).val($(this).val().slice(0,13));
        }
    });
    $("#productDescription").bind("input propertychange", function () {
        if($(this).val().length>35){
            alert("已经是最大字数了哦！");
            $(this).val($(this).val().slice(0,36));
        }
    });

    function goProductPage(){
        location.href = "/manage/product"
    }

</script>
</body>
</html>


