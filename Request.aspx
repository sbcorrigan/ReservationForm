<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/ResultsPageHTML5.master" AutoEventWireup="true" CodeFile="Request.aspx.cs" Inherits="Reservations" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>My Home Away From Home Hotels:</h1>
        <h2>where you're always treated like family!</h2>

    <!-- Calendar -->
    <p>
        Arrival Date:&nbsp;
        <asp:TextBox ID="txtArrivalDate" runat="server" Width="75px" Text="TextBoxHere" >
        </asp:TextBox>
        &nbsp;
        <asp:ImageButton ID="ibtnCalendar" runat="server" ImageUrl="~/Images/Calendar.bmp" ImageAlign="Top" OnClick="ibtnCalendar_Click" />
    </p>
    <p>
        <asp:Calendar ID="clnArrival" runat="server" Visible="false"
            OnSelectionChanged="clnArrival_SelectionChanged">
        </asp:Calendar>
    </p>

    <!-- Number of nights -->
    <p>
        Number of nights: &nbsp;
        <asp:TextBox ID="txtNights" runat="server" Width="45px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="txtNights" runat="server" ErrorMessage="Number of Nights Required!"></asp:RequiredFieldValidator>
    </p>

    <!-- Number of Adults and Children -->
    <p>
        Number of Adults: &nbsp;
        <asp:DropDownList ID="ddlAdults" runat="server" Width="50px">
        </asp:DropDownList>
        &nbsp;&nbsp;
        Number of Children: &nbsp;
        <asp:DropDownList ID="ddlChildren" runat="server">
        </asp:DropDownList>
    </p>

    <!-- Room Type -->
    <h3>Preferences</h3>
    <p>
        Room Type: &nbsp;
        <asp:RadioButton ID="rdoBusiness" runat="server" Text="Business" GroupName="Room" />
        <asp:RadioButton ID="rdoStandard" runat="server" Text="Standard" GroupName="Room" />
        <asp:RadioButton ID="rdoSuite" runat="server" Text="Suite" GroupName="Room" />
    </p>

    <!-- Bed Type -->

    <p>
        Bed Type: &nbsp;
        <asp:RadioButton ID="rdoKing" runat="server" Text="King" GroupName="Bed" />
        <asp:RadioButton ID="rdoDouble" runat="server" Text="Double" GroupName="Bed" />

    </p>
    <!-- Smoking? -->
    <p>
        <asp:CheckBox ID="chkSmoking" runat="server" Text="Smoking" />
    </p>

    <!-- Special Requests -->Special Requests:
    <p>
        <asp:TextBox ID="txtSpecialRequests" runat="server" Rows="4" TextMode="MultiLine" 
            Text ="none" Width="250px"></asp:TextBox>
    </p>

    <h3>Contact Information</h3>
    <!-- Contact Name -->

    <p>Name:</p>
    <p><asp:TextBox ID="txtName" runat="server" Width="320px"></asp:TextBox></p>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="txtName" runat="server" ErrorMessage="Name Required!"></asp:RequiredFieldValidator>
    <!-- Contatct Email -->

    <p>Email:</p>
    <p><asp:TextBox ID="txtEmail" runat="server" Width="320px"></asp:TextBox></p>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="txtEmail" runat="server" ErrorMessage="Email Required!"></asp:RequiredFieldValidator>
    <!-- Form Handlers -->
    <br />
    <asp:Button ID="btnSubmit" runat="server" Text="Submit" Width="80px" OnClick="btnSubmit_Click" />
    &nbsp;
    <asp:Button ID="btnClear" runat="server" Text="Clear" Width="80px" OnClick="btnClear_Click" />
    &nbsp;
   <asp:Button ID="btnInsert" runat="server" Text="Insert" Width="80px" OnClick="btnInsert_Click"/>

    <!-- Message Label -->
    <p>
        <asp:Label ID="lblMessage" runat="server"></asp:Label>
    </p>
</asp:Content>

