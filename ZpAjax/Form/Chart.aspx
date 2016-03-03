<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Chart.aspx.cs" Inherits="_Chart" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="//www.google.com/jsapi"></script>
    <script type="text/javascript">
        google.load('visualization', '1', { packages: ['corechart'] });
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            $.ajax({
                type: 'POST',
                dataType: 'json',
                contentType: 'application/json',
                url: 'Chart.aspx/GetData',
                data: '{}',
                success:
                    function (response) {
                        drawVisualization(response.d);
                    }

            });
        })

        function drawVisualization(dataValues) {
            var data = new google.visualization.DataTable();
            data.addColumn('string', 'Column Name');
            data.addColumn('number', 'Column Value');

            for (var i = 0; i < dataValues.length; i++) {
                data.addRow([dataValues[i].ColumnName, dataValues[i].Value]);
            }

            // Set chart options 
            var options = {
                'title': 'My Eatbles List for Year',
                'width': 400,
                'height': 300
            };

           // new google.visualization.PieChart(document.getElementById('visualization')).
            //    draw(data, { title: "Chart demo" });


          //var  pieChart = new google.visualization.PieChart(document.getElementById('visualization'));
          //  pieChart.draw(data, { title: "So, how was your day?" });
            //  google.visualization.events.addListener(pieChart, 'select', onAreaSliceSelected);


            var chart = new google.visualization.PieChart(document.getElementById('visualization'));

            function selectHandler() {
                var selectedItem = chart.getSelection()[0];
                if (selectedItem) {
                    var topping = data.getValue(selectedItem.row, 0);
                    alert('The user selected ' + topping);
                    window.location.href = 'https://www.google.co.in/#q=' + topping;

                }
            }

            google.visualization.events.addListener(chart, 'select', selectHandler);
            chart.draw(data, options);
           
         
        }


        function onAreaSliceSelected() {

            
            //var sel = pieChart.getSelection()[0]; //is always null
           // alert('you selected ' +sel); //displays you selected null
            
            
            var selectedItem = pieChart.getSelection()[0];
            if (selectedItem) {
                var topping = pieChart.getValue(selectedItem.row, 0);
                alert('The user selected ' + topping);
                if (topping == 'Vegetables') {
                    alert('you selected ' + sel);
                }
                if (topping == 'Fruits') {
                    alert('you selected ' + sel);
                }

            }
        }


       
         
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div id="visualization" style="width: 600px; height: 350px;"  >
<%--        onclick="return confirm('Are you sure you want delete ?');"--%>
    </div>
        <p>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
        </p>
    </form>
</body>
</html>
