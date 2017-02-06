using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Text;

    public partial class Reservations : System.Web.UI.Page
{
    public Reservation reservation;
    public string connectionString = WebConfigurationManager.ConnectionStrings["zzCS321_5ConnectionString"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {   //Load these when page is First loaded!

            reservation = new Reservation();

            txtArrivalDate.Text = DateTime.Today.ToShortDateString();

            ddlAdults.Items.Clear();
            ddlAdults.Items.Add("1");
            ddlAdults.Items.Add("2");
            ddlAdults.Items.Add("3");
            ddlAdults.Items.Add("4");

            ddlChildren.Items.Clear();
            ddlChildren.Items.Add("0");
            ddlChildren.Items.Add("1");
            ddlChildren.Items.Add("2");
            ddlChildren.Items.Add("3");
            ddlChildren.Items.Add("4");

            rdoStandard.Checked = true;
            rdoKing.Checked = true;


        if (!IsPostBack)
        {

            if (Session["Reservation"] != null)
            {
                reservation = (Reservation)Session["Reservation"];
                this.DisplayReservation();
            }
            else
            {
                rdoStandard.Checked = true;
                rdoKing.Checked = true;
            }


        }


    }

    protected void ibtnCalendar_Click(object sender, ImageClickEventArgs e)
    {
        ibtnCalendar.Visible = false;
        clnArrival.Visible = true;
    }
    
    protected void clnArrival_SelectionChanged(object sender, EventArgs e)
    {
        txtArrivalDate.Text = clnArrival.SelectedDate.Month.ToString() + "/" +
                              clnArrival.SelectedDate.Day.ToString() + "/" +
                              clnArrival.SelectedDate.Year.ToString();
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {

        Session["Reservation"] = reservation;

        reservation.ArrivalDate = Convert.ToDateTime(txtArrivalDate.Text);
        reservation.DepartureDate = reservation.ArrivalDate.AddDays(Convert.ToInt32(txtNights.Text));
        reservation.NoOfAdults = Convert.ToInt32(ddlAdults.SelectedValue);
        reservation.NoOfChildren = Convert.ToInt32(ddlChildren.SelectedValue);

        if (rdoBusiness.Checked)
            reservation.RoomType = "Business";
        if (rdoSuite.Checked)
            reservation.RoomType = "Suite";
        if (rdoStandard.Checked)
            reservation.RoomType = "Standard";

        if (rdoKing.Checked)
            reservation.BedType = "King";
        if (rdoDouble.Checked)
            reservation.BedType = "Double";

        if (chkSmoking.Checked)
            reservation.Smoking = true;
        else
            reservation.Smoking = false ;

        reservation.SpecialRequests = txtSpecialRequests.Text;
        reservation.Name = txtName.Text;
        reservation.Email = txtEmail.Text;

 
        Response.Redirect("Confirmation.aspx");



    }

    protected void btnClear_Click(object sender, EventArgs e)
    {
        txtArrivalDate.Text = DateTime.Today.ToShortDateString();
        txtNights.Text = "";
        ddlAdults.SelectedIndex = -1;
        ddlChildren.SelectedIndex = -1;
        rdoStandard.Checked = true;
        rdoKing.Checked = true;
        chkSmoking.Checked = false;
        txtSpecialRequests.Text = "";
        txtName.Text = "";
        txtEmail.Text = "";
        lblMessage.Text = "";
    }

    protected void btnInsert_Click(object sender, EventArgs e)
    {

        int numNights = Convert.ToInt32(txtNights.Text);
        DateTime arrivalDate = Convert.ToDateTime(txtArrivalDate.Text);
        int numAdults = Convert.ToInt32(ddlAdults.SelectedValue);
        int numChildren = Convert.ToInt32(ddlChildren.SelectedValue);
        Boolean roomTypeBusiness = false, roomTypeSuite = false, roomTypeStandard = false;
        Boolean bedTypeKing = false, bedTypeDouble = false;
        Boolean smokingOption = false;
        String specialRequests, name, email;

        if (rdoBusiness.Checked)
            roomTypeBusiness = true;
        else if (rdoSuite.Checked)
            roomTypeSuite = true;
        else
            roomTypeStandard = true;

        if (rdoKing.Checked)
            bedTypeKing = true;
        else
            bedTypeDouble = true;

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
    }

    private void DisplayReservation()
    {
        txtArrivalDate.Text = reservation.ArrivalDate.ToShortDateString();
        TimeSpan length = reservation.DepartureDate - reservation.ArrivalDate;
        txtNights.Text = length.Days.ToString();
        ddlAdults.SelectedValue = reservation.NoOfAdults.ToString();
        ddlChildren.SelectedValue = reservation.NoOfChildren.ToString();

        if (reservation.RoomType == "Business")
            rdoBusiness.Checked = true;
        else if (reservation.RoomType == "Suite")
            rdoSuite.Checked = true;
        else
            rdoStandard.Checked = true;

        if (reservation.BedType == "King")
            rdoKing.Checked = true;
        else
            rdoDouble.Checked = true;

        chkSmoking.Checked = reservation.Smoking;
        txtSpecialRequests.Text = reservation.SpecialRequests;
        txtName.Text = reservation.Name;
        txtEmail.Text = reservation.Email;


    }

    protected void btnConfirm_Click(object sender, EventArgs e)
    {
        lblMessage.Text = "Thank you for your request.<br />" +
                          "We will get back to you within 24 hours.";
    }
}