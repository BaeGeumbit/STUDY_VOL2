<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="ko">

	<%@include file="header.jsp"%>
	
	<link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/ax5ui/ax5ui-grid/master/dist/ax5grid.css" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script type="text/javascript" src="https://cdn.rawgit.com/ax5ui/ax5core/master/dist/ax5core.min.js"></script>
	<script type="text/javascript" src="https://cdn.rawgit.com/ax5ui/ax5ui-grid/master/dist/ax5grid.min.js"></script>
	
	<script type="text/javascript">
    $(document.body).ready(function () {
    	
    	var firstGrid = new ax5.ui.grid();
    	firstGrid.setConfig({
    	    target: $('[data-ax5grid="first-grid"]'),
    	    frozenColumnIndex: 2,
    	    frozenRowIndex: 0,
    	    showLineNumber: true,
    	    showRowSelector: true,
    	    multipleSelect: true,
    	    lineNumberColumnWidth: 40,
    	    rowSelectorColumnWidth: 28,
    	    sortable: true, 
    	    multiSort: false,
    	    header: {
    	        align: "center",
    	        columnHeight: 28
    	    },
    	    body: {
    	        align: "center",
    	        columnHeight: 28,
    	        onClick: function () {
    	            // console.log(this);
    	            this.self.select(this.dindex);
    	        }
    	    },
    	    columns: [
    	        {
    	            key: "a",
    	            label: "필드A",
    	            width: 80,
    	            styleClass: function () {
    	                return "ABC";
    	            },
    	            enableFilter: true,
    	            align: "center"
    	        },
    	        {key: "b", label: "필드B", align: "center"},
    	        {
    	            key: undefined, label: "필드C", columns: [
    	            {key: "price", label: "단가", formatter: "money", align: "right"},
    	            {key: "amount", label: "수량", formatter: "money", align: "right"},
    	            {key: "cost", label: "금액", align: "right", formatter: "money"}
    	        ]
    	        },
    	        {key: "saleDt", label: "판매일자", align: "center"},
    	        {key: "customer", label: "고객명"},
    	        {key: "saleType", label: "판매타입"}
    	    ]
    	}); //setConfig
    	
    	$('[data-grid-control]').click(function () {
            switch (this.getAttribute("data-grid-control")) {
                case "row-add":
                    firstGrid.addRow($.extend({}, firstGrid.list[Math.floor(Math.random() * firstGrid.list.length)], {__index: undefined}));
                    break;
                case "row-remove":
                    firstGrid.removeRow();
                    break;
                case "row-update":
                    var updateIndex = Math.floor(Math.random() * firstGrid.list.length);
                    firstGrid.updateRow($.extend({}, firstGrid.list[updateIndex], {price: 100, amount: 100, cost: 10000}), updateIndex);
                    break;
            }
        });
    	
    	var secondGrid = new ax5.ui.grid({
            target: $('[data-ax5grid="second-grid"]'),
            columns: [
            	 {key: "a", label: "d A"},
                 {key: "b", label: "d B"},
                 {key: "c", label: "d C"},
                 {key: "d", label: "d D"},
                 {key: "e", label: "d E"},
                 {key: "f", label: "d F"},
                 {key: "g", label: "d G"},
                 {key: "h", label: "d H"}
    	    ]
        });
 
//         secondGrid.setData([
//             {key: "a", label: "d A"},
//             {key: "b", label: "d B"},
//             {key: "c", label: "d C"},
//             {key: "d", label: "d D"},
//             {key: "e", label: "d E"},
//             {key: "f", label: "d F"},
//             {key: "g", label: "d G"},
//             {key: "h", label: "d H"}
//         ]);
    	
//     	 var API_SERVER = "http://api-demo.ax5.io";
    	 
//         $.ajax({
//             method: "GET",
//             url: API_SERVER + "/api/v1/ax5grid",
//             success: function (res) {
//                 res.forEach(function (v, k) {
//                    v.c = k * 1000;
//                 });
//                 firstGrid.setData(res);
//             }
//         });
        
    }); //document
</script>
		
		<div class="col-xs-10 right">
			<div class="container">
				<br><br>
				  <form name="skillListfrm" method="post">
				  
				  <div style="position: relative;height:400px;" id="grid-parent">
						<div data-ax5grid="first-grid" data-ax5grid-config='{name:"my first grid"}' style="height: 100%;">
						</div>
						 <div data-ax5grid="second-grid" style="height: 100%;">
						</div> 
				</div>

						 
						<div style="padding: 10px;">
						    <button class="btn btn-default" data-grid-control="row-add">row add</button>
						    <button class="btn btn-default" data-grid-control="row-remove">row remove</button>
						    <button class="btn btn-default" data-grid-control="row-update">row update</button>
						</div>
				  
				  </form>	  
			</div>  <!-- .container -->
		</div><!-- .col-xs-10 right-->	
	</div><!-- .index -->

</html>