using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//add the following
using System.Web.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Text;

public partial class AdminPage : System.Web.UI.Page
{
    //declare the connection string
    private string connectionString = WebConfigurationManager.ConnectionStrings["zzCS321_5ConnectionString"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {

    }

}