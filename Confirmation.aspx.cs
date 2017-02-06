using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Web.Mail

public partial class Confirmation : System.Web.UI.Page
{
    public Reservation reservation;
    private string connectionString = WebConfigurationManager.ConnectionStrings["zzCS321_5ConnectionString"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {

    reservation = (Reservation)Session["Reservation"];

        this.DisplayReservation();
    }

    protected void DisplayReservation()
    {
        if (reservation != null)
        {

            lblArrivalDate.Text = reservation.ArrivalDate.ToShortDateString();
            lblDepartureDate.Text = reservation.DepartureDate.ToShortDateString();
            lblNoOfAdults.Text = reservation.NoOfAdults.ToString();
            lblNoOfChildren.Text = reservation.NoOfChildren.ToString();
            lblRoomType.Text = reservation.RoomType;
            lblBedType.Text = reservation.BedType;

            if (reservation.Smoking)
                lblSmoking.Text = "Yes";
            else
                lblSmoking.Text = "No";

            if (reservation.SpecialRequests == "")
                lblSpecialRequests.Text = "None";
            else
                lblSpecialRequests.Text = reservation.SpecialRequests;

            lblName.Text = reservation.Name;
            lblEmail.Text = reservation.Email;
        }
    }

    protected void btnConfirm_Click(object sender, EventArgs e)
    {
     /*   int numNights = Convert.ToInt32(txtNights.Text);
        DateTime arrivalDate = Convert.ToDateTime(txtArrivalDate.Text);
        int numAdults = Convert.ToInt32(ddlAdults.SelectedValue);
        int numChildren = Convert.ToInt32(ddlChildren.SelectedValue);
        Boolean roomTypeBusiness = false, roomTypeSuite = false, roomTypeStandard = false;
        Boolean bedTypeKing = false, bedTypeDouble = false;
        Boolean smokingOption = false;
        String specialRequests, name, email, bedType;

        if (rdoBusiness.Checked)
            roomTypeBusiness = true;
        else if (rdoSuite.Checked)
            roomTypeSuite = true;
        else
            roomTypeStandard = true;

        if (rdoKing.Checked)
            bedTypeKing = true;
        //bedType = "King";
        else
            bedTypeDouble = true;
        //bedType = "Double";

        if (chkSmoking.Checked)
            smokingOption = true;

        specialRequests = txtSpecialRequests.Text;
        txtSpecialRequests.Text = reservation.SpecialRequests;
        name = txtName.Text;
        email = txtEmail.Text;   

        //Define ADO.NET objects
        string insertSQL;
        insertSQL = "INSERT INTO ReservationForm_1(";
        insertSQL += "arrivalDate, numberOfNights, numAdults, numChildren, roomTypeBusiness, roomTypeSuite, roomTypeStandard, ";
        insertSQL += "bedTypeKing, bedTypeDouble, ";
        insertSQL += "smokingOption, ";
        insertSQL += "specialRequests, name, email)";
        insertSQL += "VALUES(";
        insertSQL += "@arrivalDate, @numberOfNights, @numAdults, @numChildren, @roomTypeBusiness, @roomTypeSuite, @roomTypeStandard,   ";
        insertSQL += "@bedTypeKing, @bedTypeDouble, ";
        insertSQL += "@smokingOption, ";
        insertSQL += "@specialRequests, @name, @email)";

        SqlConnection con = new SqlConnection(connectionString);
        SqlCommand cmd = new SqlCommand(insertSQL, con);

        //Add the parameters.
        cmd.Parameters.AddWithValue("@arrivalDate", arrivalDate);
        cmd.Parameters.AddWithValue("@numberOfNights", numNights);
        cmd.Parameters.AddWithValue("@numAdults", numAdults);
        cmd.Parameters.AddWithValue("@numChildren", numChildren);
        cmd.Parameters.AddWithValue("@roomTypeBusiness", roomTypeBusiness);
        cmd.Parameters.AddWithValue("@roomTypeSuite", roomTypeSuite);
        cmd.Parameters.AddWithValue("@roomTypeStandard", roomTypeStandard);
        cmd.Parameters.AddWithValue("@bedTypeKing", bedTypeKing);
        cmd.Parameters.AddWithValue("@bedTypeDouble", bedTypeDouble);
        cmd.Parameters.AddWithValue("@smokingOption", smokingOption);
        cmd.Parameters.AddWithValue("@specialRequests", specialRequests);
        cmd.Parameters.AddWithValue("@name", name);
        cmd.Parameters.AddWithValue("@email", email);

        //Try to open the database and execute the update.
        int added = 0;  //counter
        try
        {
            con.Open();
            added = cmd.ExecuteNonQuery();
            lblMessage.Text = added.ToString() + " record inserted.";
        }
        catch (Exception err)
        {
            lblMessage.Text = "Error inserting record. ";
            lblMessage.Text += err.Message;
        }
        finally
        {
            con.Close();
        }

        //If the insert succeeded, refresh the person list
        if (added > 0)
        {
            //FillPersonList();
            lblMessage.Text = "Database updated";
        } 
        lblMessage.Text = "Thank you for your request.<br />" +
                  "We will get back to you within 24 hours."; */
    }

    protected void btnModify_Click(object sender, EventArgs e)
    {
        Response.Redirect("Request.aspx");
    }

    
}