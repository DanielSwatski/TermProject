<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ScheduleShowing.aspx.cs" Inherits="TermProject.Buyers.MakeShowing" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Schedule Showing</title>
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />

</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>

         <h1 class="text-center mt-5">Schedule your showing</h1>

        <div class="d-flex align-items-center justify-content-center m-5">
            <div class="rounded bg-light shadow h-auto w-auto mx-auto p-3">
                <div class="row g-3">
                    <div class="col-md-6">

                    <div class="col-md-6">
                        <asp:Label ID="lblDate" runat="server" Text="Date of Showing" class="form-label"></asp:Label>
                        <asp:TextBox ID="txtDate" class="form-control" runat="server" TextMode="Date" ></asp:TextBox>
                    </div>

                    <div class="col-12" style="text-align:center">
                        <asp:Button ID="btnSubmit" runat="server" Text="Submit" class="btn btn-primary" OnClick="btnSubmit_Click" />
                    </div>
                </div>
                </div>
            </div>
        </div>


        <p> Where do you want to make the comment page? We have to find a good spot for it. I think here might be good</p>
    </form>
</body>
</html>
