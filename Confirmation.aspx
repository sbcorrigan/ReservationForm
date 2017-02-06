<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/ResultsPageHTML5.master" AutoEventWireup="true" CodeFile="Confirmation.aspx.cs" Inherits="Confirmation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
       <h1>My Home Away From Home Hotels:</h1>
        <h2>where you're always treated like family!</h2>
    

<p>Please confirm your reservation request.</p>
<p>Your request is not finalized untill you click "Submit!"</p>

<p>Name: <asp:Label ID="lblName" runat="server" Text=""></asp:Label></p>
<p>Email: <asp:Label ID="lblEmail" runat="server" Text=""></asp:Label></p>
<p>Arrival date: <asp:Label ID="lblArrivalDate" runat="server" Text=""></asp:Label></p>
<p>Departure date: <asp:Label ID="lblDepartureDate" runat="server" Text=""></asp:Label></p>
<p>Number of adults: <asp:Label ID="lblNoOfAdults" runat="server" Text=""></asp:Label></p>
<p>Number of children: <asp:Label ID="lblNoOfChildren" runat="server" Text=""></asp:Label></p>
<p>Room type: <asp:Label ID="lblRoomType" runat="server" Text=""></asp:Label></p>
<p>Bed type: <asp:Label ID="lblBedType" runat="server" Text=""></asp:Label></p>
<p>Smoking: <asp:Label ID="lblSmoking" runat="server" Text=""></asp:Label></p>
<p>Special requests: <asp:Label ID="lblSpecialRequests" runat="server" Text=""></asp:Label></p>


<asp:Button ID="btnConfirm" runat="server" Text="Confirm Request" Width="120px" OnClick="btnConfirm_Click" />
&nbsp;
<asp:Button ID="btnModify" runat="server" Text="Modify Request" Width="120px" OnClick="btnModify_Click" />
<p><asp:Label ID="lblMessage" runat="server" Text=""></asp:Label></p>


</asp:Content>

