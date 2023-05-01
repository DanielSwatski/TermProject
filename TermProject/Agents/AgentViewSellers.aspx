<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AgentViewSellers.aspx.cs" Inherits="TermProject.Agents.AgentViewSellers" %>

<%@ Register Src="~/CustomUC/AgentNavBar.ascx" TagName="AgentNavBar" TagPrefix="uc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</head>
<body>
    <form id="form1" runat="server">
        <uc1:AgentNavBar ID="AgentNav" runat="server"></uc1:AgentNavBar>

        <div>
            <div class="bg-body d-flex align-items-center justify-content-center">
                <div class="h-auto w-75 mx-auto p-3">
                    <div class="row g-3">
                        <div class="col-md-12">
                            <asp:GridView class="table table-striped rounded bg-light shadow p-5" ID="grdSeller" runat="server" AutoGenerateColumns="False">
                                <Columns>
                                    <asp:BoundField DataField="Username" HeaderText="SellerID" />
                                    <asp:BoundField DataField="Name" HeaderText="Name" />
                                    <asp:TemplateField HeaderText="Manage">
                                        <ItemTemplate>
                                            <asp:Button ID="btnManageSeller" runat="server" OnClick="btnManageSeller_Click" Text="Manage" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>

            <div class="d-flex align-items-center justify-content-center m-5">
                <div class="rounded bg-light shadow h-auto w-auto mx-auto p-3">
                    <div class="row g-3">

                        <div class="col-md-12" style="text-align:center;">
                            <asp:Label ID="lblSelectedSeller" runat="server" Text="" class="form-label"></asp:Label>
                        </div>

                        <div class="col-md-12" style="text-align:center;">
                            <asp:Button runat="server" ID="btnMakeHouse" Text="Make House For Selected Seller" class="btn btn-primary" OnClick="btnMakeHouse_Click" Enabled="false" />
                        </div>

                        <div class="col-md-12" style="text-align:center;">
                            <asp:Button runat="server" ID="btnAddSeller" Text="Add Seller" class="btn btn-primary" OnClick="btnAddSeller_Click" />
                        </div>


                    </div>
                </div>
            </div>
    </form>
</body>
</html>
