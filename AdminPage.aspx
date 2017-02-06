<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPages/ResultsPageHTML5.master" CodeFile="AdminPage.aspx.cs" Inherits="AdminPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>My Home Away From Home Hotels:</h1>
        <h2>where you're always treated like family!</h2>
    Feel free to mess around with the reservations here!<br />
    GO CRAZY NUTS WITH POWER!<br />
    NO ONE WILL EVER KNOW

    <div>
        <div>
            <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px" AllowPaging="True" AutoGenerateRows="False" DataKeyNames="customerID" DataSourceID="SqlDataSource1">
                <Fields>
                    <asp:BoundField DataField="customerID" HeaderText="Customer ID" InsertVisible="False" ReadOnly="True" SortExpression="customerID" />
                    <asp:BoundField DataField="arrivalDate" HeaderText="Arrival Date" SortExpression="arrivalDate" />
                    <asp:BoundField DataField="numberOfNights" HeaderText="Number of Nights" SortExpression="numberOfNights" />
                    <asp:BoundField DataField="numAdults" HeaderText="Adults" SortExpression="numAdults" />
                    <asp:BoundField DataField="numChildren" HeaderText="Children" SortExpression="numChildren" />
                    <asp:CheckBoxField DataField="roomTypeBusiness" HeaderText="Business Room" SortExpression="roomTypeBusiness" />
                    <asp:CheckBoxField DataField="roomTypeSuite" HeaderText="Suite" SortExpression="roomTypeSuite" />
                    <asp:CheckBoxField DataField="roomTypeStandard" HeaderText="Standard Room" SortExpression="roomTypeStandard" />
                    <asp:CheckBoxField DataField="bedTypeKing" HeaderText="King Bed" SortExpression="bedTypeKing" />
                    <asp:CheckBoxField DataField="bedTypeDouble" HeaderText="Double Bed" SortExpression="bedTypeDouble" />
                    <asp:CheckBoxField DataField="smokingOption" HeaderText="Smoking?" SortExpression="smokingOption" />
                    <asp:BoundField DataField="specialRequests" HeaderText="Special Requests" SortExpression="specialRequests" />
                    <asp:BoundField DataField="name" HeaderText="name" SortExpression="Name" />
                    <asp:BoundField DataField="email" HeaderText="email" SortExpression="Email" />
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
                </Fields>
            </asp:DetailsView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:zzCS321_5ConnectionString %>" DeleteCommand="DELETE FROM [ReservationForm_1] WHERE [customerID] = @original_customerID AND [arrivalDate] = @original_arrivalDate AND [numberOfNights] = @original_numberOfNights AND (([numAdults] = @original_numAdults) OR ([numAdults] IS NULL AND @original_numAdults IS NULL)) AND (([numChildren] = @original_numChildren) OR ([numChildren] IS NULL AND @original_numChildren IS NULL)) AND (([roomTypeBusiness] = @original_roomTypeBusiness) OR ([roomTypeBusiness] IS NULL AND @original_roomTypeBusiness IS NULL)) AND (([roomTypeSuite] = @original_roomTypeSuite) OR ([roomTypeSuite] IS NULL AND @original_roomTypeSuite IS NULL)) AND (([roomTypeStandard] = @original_roomTypeStandard) OR ([roomTypeStandard] IS NULL AND @original_roomTypeStandard IS NULL)) AND (([bedTypeKing] = @original_bedTypeKing) OR ([bedTypeKing] IS NULL AND @original_bedTypeKing IS NULL)) AND (([bedTypeDouble] = @original_bedTypeDouble) OR ([bedTypeDouble] IS NULL AND @original_bedTypeDouble IS NULL)) AND (([smokingOption] = @original_smokingOption) OR ([smokingOption] IS NULL AND @original_smokingOption IS NULL)) AND (([specialRequests] = @original_specialRequests) OR ([specialRequests] IS NULL AND @original_specialRequests IS NULL)) AND (([name] = @original_name) OR ([name] IS NULL AND @original_name IS NULL)) AND (([email] = @original_email) OR ([email] IS NULL AND @original_email IS NULL))" InsertCommand="INSERT INTO [ReservationForm_1] ([arrivalDate], [numberOfNights], [numAdults], [numChildren], [roomTypeBusiness], [roomTypeSuite], [roomTypeStandard], [bedTypeKing], [bedTypeDouble], [smokingOption], [specialRequests], [name], [email]) VALUES (@arrivalDate, @numberOfNights, @numAdults, @numChildren, @roomTypeBusiness, @roomTypeSuite, @roomTypeStandard, @bedTypeKing, @bedTypeDouble, @smokingOption, @specialRequests, @name, @email)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [ReservationForm_1]" UpdateCommand="UPDATE [ReservationForm_1] SET [arrivalDate] = @arrivalDate, [numberOfNights] = @numberOfNights, [numAdults] = @numAdults, [numChildren] = @numChildren, [roomTypeBusiness] = @roomTypeBusiness, [roomTypeSuite] = @roomTypeSuite, [roomTypeStandard] = @roomTypeStandard, [bedTypeKing] = @bedTypeKing, [bedTypeDouble] = @bedTypeDouble, [smokingOption] = @smokingOption, [specialRequests] = @specialRequests, [name] = @name, [email] = @email WHERE [customerID] = @original_customerID AND [arrivalDate] = @original_arrivalDate AND [numberOfNights] = @original_numberOfNights AND (([numAdults] = @original_numAdults) OR ([numAdults] IS NULL AND @original_numAdults IS NULL)) AND (([numChildren] = @original_numChildren) OR ([numChildren] IS NULL AND @original_numChildren IS NULL)) AND (([roomTypeBusiness] = @original_roomTypeBusiness) OR ([roomTypeBusiness] IS NULL AND @original_roomTypeBusiness IS NULL)) AND (([roomTypeSuite] = @original_roomTypeSuite) OR ([roomTypeSuite] IS NULL AND @original_roomTypeSuite IS NULL)) AND (([roomTypeStandard] = @original_roomTypeStandard) OR ([roomTypeStandard] IS NULL AND @original_roomTypeStandard IS NULL)) AND (([bedTypeKing] = @original_bedTypeKing) OR ([bedTypeKing] IS NULL AND @original_bedTypeKing IS NULL)) AND (([bedTypeDouble] = @original_bedTypeDouble) OR ([bedTypeDouble] IS NULL AND @original_bedTypeDouble IS NULL)) AND (([smokingOption] = @original_smokingOption) OR ([smokingOption] IS NULL AND @original_smokingOption IS NULL)) AND (([specialRequests] = @original_specialRequests) OR ([specialRequests] IS NULL AND @original_specialRequests IS NULL)) AND (([name] = @original_name) OR ([name] IS NULL AND @original_name IS NULL)) AND (([email] = @original_email) OR ([email] IS NULL AND @original_email IS NULL))">
                <DeleteParameters>
                    <asp:Parameter Name="original_customerID" Type="Int32" />
                    <asp:Parameter Name="original_arrivalDate" Type="DateTime" />
                    <asp:Parameter Name="original_numberOfNights" Type="Int32" />
                    <asp:Parameter Name="original_numAdults" Type="Int32" />
                    <asp:Parameter Name="original_numChildren" Type="Int32" />
                    <asp:Parameter Name="original_roomTypeBusiness" Type="Boolean" />
                    <asp:Parameter Name="original_roomTypeSuite" Type="Boolean" />
                    <asp:Parameter Name="original_roomTypeStandard" Type="Boolean" />
                    <asp:Parameter Name="original_bedTypeKing" Type="Boolean" />
                    <asp:Parameter Name="original_bedTypeDouble" Type="Boolean" />
                    <asp:Parameter Name="original_smokingOption" Type="Boolean" />
                    <asp:Parameter Name="original_specialRequests" Type="String" />
                    <asp:Parameter Name="original_name" Type="String" />
                    <asp:Parameter Name="original_email" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="arrivalDate" Type="DateTime" />
                    <asp:Parameter Name="numberOfNights" Type="Int32" />
                    <asp:Parameter Name="numAdults" Type="Int32" />
                    <asp:Parameter Name="numChildren" Type="Int32" />
                    <asp:Parameter Name="roomTypeBusiness" Type="Boolean" />
                    <asp:Parameter Name="roomTypeSuite" Type="Boolean" />
                    <asp:Parameter Name="roomTypeStandard" Type="Boolean" />
                    <asp:Parameter Name="bedTypeKing" Type="Boolean" />
                    <asp:Parameter Name="bedTypeDouble" Type="Boolean" />
                    <asp:Parameter Name="smokingOption" Type="Boolean" />
                    <asp:Parameter Name="specialRequests" Type="String" />
                    <asp:Parameter Name="name" Type="String" />
                    <asp:Parameter Name="email" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="arrivalDate" Type="DateTime" />
                    <asp:Parameter Name="numberOfNights" Type="Int32" />
                    <asp:Parameter Name="numAdults" Type="Int32" />
                    <asp:Parameter Name="numChildren" Type="Int32" />
                    <asp:Parameter Name="roomTypeBusiness" Type="Boolean" />
                    <asp:Parameter Name="roomTypeSuite" Type="Boolean" />
                    <asp:Parameter Name="roomTypeStandard" Type="Boolean" />
                    <asp:Parameter Name="bedTypeKing" Type="Boolean" />
                    <asp:Parameter Name="bedTypeDouble" Type="Boolean" />
                    <asp:Parameter Name="smokingOption" Type="Boolean" />
                    <asp:Parameter Name="specialRequests" Type="String" />
                    <asp:Parameter Name="name" Type="String" />
                    <asp:Parameter Name="email" Type="String" />
                    <asp:Parameter Name="original_customerID" Type="Int32" />
                    <asp:Parameter Name="original_arrivalDate" Type="DateTime" />
                    <asp:Parameter Name="original_numberOfNights" Type="Int32" />
                    <asp:Parameter Name="original_numAdults" Type="Int32" />
                    <asp:Parameter Name="original_numChildren" Type="Int32" />
                    <asp:Parameter Name="original_roomTypeBusiness" Type="Boolean" />
                    <asp:Parameter Name="original_roomTypeSuite" Type="Boolean" />
                    <asp:Parameter Name="original_roomTypeStandard" Type="Boolean" />
                    <asp:Parameter Name="original_bedTypeKing" Type="Boolean" />
                    <asp:Parameter Name="original_bedTypeDouble" Type="Boolean" />
                    <asp:Parameter Name="original_smokingOption" Type="Boolean" />
                    <asp:Parameter Name="original_specialRequests" Type="String" />
                    <asp:Parameter Name="original_name" Type="String" />
                    <asp:Parameter Name="original_email" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
        <br />

    </div>
</asp:Content>