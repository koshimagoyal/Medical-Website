<!DOCTYPE html>
<html>
<head>
	<title><%String msg = (String)session.getAttribute("msg");
  String msg1 = (String)session.getAttribute("msg1");
  if(msg!=null&&msg1!=null)
  out.print(msg+" "+msg1);%></title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width", initial scale="1">
  <link rel="shortcut icon" href="logo.jpg" type="image/png" width="10px;" height="10px;">
	<link rel="stylesheet" href="bootstrap-3.3.7\dist\css\bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="style.css">
	<script src="jquery.min.js"></script>
	<script src="bootstrap-3.3.7\dist\js\bootstrap.min.js"></script>
  
  <style type="text/css">

    .circle {
  width: 500px;
  height: 500px;
  border-radius: 50%;
  font-size: 50px;
  color: #fff;
  line-height: 500px;
  text-align: center;
  background:#1E90FF;
   opacity: 0.7;
    filter: alpha(opacity=30);
}
    .card {

      margin: auto;
  width: 250px;
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
  text-align: center;
  width: 400px;
}

.header {
    background-color: white;
    padding: 10px;
    font-size: 20px;
    border-bottom: solid;
}

.containr {
background-color: white;
   padding: 10px;
}

  </style>
  <script type="text/javascript">
    function validation()
    {
      
          var p=document.forms["form"]["fav"].value;
          var cp=document.forms["form"]["age"].value;
          if(p==""||cp=="")
          {
            document.getElementById("p1").innerHTML="Fill all the details";
            return false;
          }
          else
          {
            document.getElementById("form").submit();
            return true;
          }
    }
  </script>
</head>
<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="50">
<header>
	<nav class="navbar navbar-default" style="border-radius: 0px;">
  		<div class="container-fluid">
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav navbar-left" style="padding-top: 10px; padding-bottom: 10px;">
					<li><img src="logo.jpg" class="responsive" width="200px" height="50px" alt="Logo"></li>
				</ul>
      			<ul class="nav navbar-nav navbar-right" style="padding-top: 10px; padding-bottom: 10px; padding-right: 10px;">
        			<li>
        				<p><font color = "#ffffff" face = "georgia" size = "5">
Good
<script type="text/javascript">
var d = new Date()
var time = d.getHours()
if (time < 12)
{
document.write(" morning ")
}
if (time >=12 && time<18)
{
document.write(" afternoon ")
}
if (time >=18)
{
document.write(" evening ")
}
</script>
<% 
  
  if(msg!=null&&msg1!=null)
  out.print(msg+" "+msg1);
   %>
  

</font>
</p>
</li>
<li style="padding-left: 10px; padding-right: 20px;">
  <button type="button" class="btn btn-default" style="background-color: #1E90FF;"><a href="exit.jsp">Log Out</a></button>
</form>
</li>
</ul>
       </div>
      </div>
    </nav>
</header>

<div class="container text-center" style="background-image: url(profile.jpg); width: 100%; height: 730px;">
   <%
        int count = (Integer)session.getAttribute("his");
        int countt=1;
        if(count!=-1)
        {
          
          
          %>
      <script>
$(document).ready(function(){
$('#hisp').modal('show');
});
</script>
          <!-- Modal(fill details) -->
  <div class="modal fade" id="hisp" role="dialog" style="padding-top: 10%;">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header" style="background-color: #1E90FF;">
          <button type="button" class="close" data-dismiss="modal">X</button>
          <h4 style="background-color: #1E90FF;"><span class="glyphicon glyphicon-lock"></span>Past Submissions</h4>
        </div>
        <div class="modal-body"><%
          if(count==0)
          {

               %>
            <div class="card">
              <div class="containr">
                <p>No form exists till now</p>
              </div>
            </div><%
          }
          else
          {
              while(count!=0)
          {
            %>
            <div class="card">
              <div class="containr">
                <%
                    out.write("<p>");
                      out.write("<a href='show.jsp' id='"+count+"'>");
                      out.write("Form "+count);
                    out.write("</a>");
                  out.write("</p>");
                %>
              </div>
            </div>
              <% count--;
          }
          }
          %>
          <br>
          <br>
        <div class="modal-footer">
          <button type="submit" style="background-color: #1E90FF;" class="btn btn-default pull-left" data-dismiss="modal">
            <span class="glyphicon glyphicon-remove"></span> Cancel
          </button>
          <button class="btn" style="background-color: #1E90FF;" data-toggle="modal" data-target="#myModal3">NEED HELP?</button>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- Modal(help2) -->
  <div class="modal fade" id="myModal3" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header" style="background-color: #1E90FF;">
          <button type="button" class="close" data-dismiss="modal">X</button>
          <h4 style="background-color: #1E90FF;"><span class="glyphicon glyphicon-question-sign"></span>HELP</h4>
        </div>
        <div class="modal-body">
          <form role="form"> 
            <div class="form-group">
              <p>Enter email id used at the time of signup.</p>
            </div>
          </form>
          <br>
        </div>
        <div class="modal-footer">
          <button type="submit" style="background-color: #1E90FF;" class="btn btn-default pull-left" data-dismiss="modal">
            <span class="glyphicon glyphicon-remove"></span> Cancel
          </button>
        </div>
      </div>
    </div>
  </div>
          <%
        }
        
%>

  <%
        String error = (String)request.getAttribute("Error");
        if(error!=null)
        {%>
          <div class="alert alert-danger">
            <%
          out.print(error);
          %>
        </div><%
        }
        String error2 = (String)request.getAttribute("Error2");
        if(error2!=null)
        {%>
          <div class="alert alert-danger">
            <%
          out.print(error2);
          %>
        </div><%
        }
        String error3 = (String)request.getAttribute("Error3");
        if(error3!=null)
        {%>
          <div class="alert alert-danger">
            <%
          out.print(error3);
          %>
        </div><%
        }
        %>

  <p align="center" style="font-size: 50px;">
      <strong>Check your health details</strong>
  </p>

  <br>
    <div class="row" style="margin: auto;">
     
   <div class="circle col-sm-4 col-sm-push-1">
     <a href="" data-toggle="modal" data-target="#fill"><p align="center"><strong>Fill fresh details</strong></p> </a>
</div>

<div class="circle col-sm-4 col-sm-push-3">
    <a href="history.jsp"><p align="center"><strong>Past Submissions</strong></p>
</div>

    </div>
 
</div>


  <!-- Modal(fill details) -->
  <div class="modal fade" id="fill" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header" style="background-color: #1E90FF;">
          <button type="button" class="close" data-dismiss="modal">X</button>
          <h4 style="background-color: #1E90FF;"><span class="glyphicon glyphicon-lock"></span>Fill Details</h4>
        </div>
        <div class="modal-body">
          <form role="form" method="post" action="store.jsp" id="form" name="formn">
            <strong><p id="p1" style="color: red;"></p></strong>
            <div class="form-group">
              <label for="fav"><font color="black">Favourite Food</font></label>
              <input type="text" class="form-control" name="fav" id="fav">
            </div>
            <div class="form-group">
              <label for="age"><font color="black">Age</font></label>
              <input type="text" class="form-control" name="age" id="age">
            </div>
            <div class="form-group">
          <button type="button" style="background-color: #1E90FF;" class="btn btn-default pull-right" onclick="return validation()">Send</button>
            </div>
          </form>
          <br>
        </div>
        <div class="modal-footer">
          <button type="submit" style="background-color: #1E90FF;" class="btn btn-default pull-left" data-dismiss="modal">
            <span class="glyphicon glyphicon-remove"></span> Cancel
          </button>
          <button class="btn" style="background-color: #1E90FF;" data-toggle="modal" data-target="#myModal3">NEED HELP?</button>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- Modal(help2) -->
  <div class="modal fade" id="myModal3" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header" style="background-color: #1E90FF;">
          <button type="button" class="close" data-dismiss="modal">X</button>
          <h4 style="background-color: #1E90FF;"><span class="glyphicon glyphicon-question-sign"></span>HELP</h4>
        </div>
        <div class="modal-body">
          <form role="form"> 
            <div class="form-group">
              <p>Enter email id used at the time of signup.</p>
            </div>
          </form>
          <br>
        </div>
        <div class="modal-footer">
          <button type="submit" style="background-color: #1E90FF;" class="btn btn-default pull-left" data-dismiss="modal">
            <span class="glyphicon glyphicon-remove"></span> Cancel
          </button>
        </div>
      </div>
    </div>
  </div>
<footer class="text-center">
  <a class="up-arrow" href="#myPage" data-toggle="tooltip" title="TO TOP">
    <span class="glyphicon glyphicon-chevron-up"></span>
  </a>
  <div align="center">
  <a href="about.html"><p font size="4" style="display: inline-block; float: left; margin-left: 300px;"><b>About Us</b></p></a>
  <a href="contact.html"><p font size="4" style="display: inline-block; float: right;
  margin-right: 270px;"><b>Contact Us</b></p></a>
</div>
<br>
  <div align="center">
  	<p font size="4"><strong>Copyright@abc</strong></p>
  </div>
</footer>
</body>
</html>