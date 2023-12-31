﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.Security;
using System.Security.Cryptography;

namespace EMS_25112023.Account
{
    public partial class Member : System.Web.UI.Page
    {
        string CS = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {

            CS = ConfigurationManager.ConnectionStrings["EmpDbCon"].ConnectionString;
            if (!IsPostBack)
            {
                if (CheckUserExistance(out string UserId, out string Password))
                {
                    if (IsValidUser(UserId, Password))
                    {
                        FormsAuthentication.RedirectFromLoginPage(UserId, false);
                    }
                }
            }
        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string UserId = txtUserId.Text;
            string password = txtpassword.Text;

            if (IsValidUser(UserId, password))
            {
                if (rdbRememberme.Checked)
                    RememberUser(UserId, password);

                FormsAuthentication.RedirectFromLoginPage(UserId, false);
            }
            else
            {
                string message = "toastr['error']('Invalid UserId or Password!', 'Invalid Credentials')";
                ClientScript.RegisterClientScriptBlock(this.GetType(), "S001", message, true);
            }

            //using(SqlConnection con = new SqlConnection(CS))
            //{
            //    SqlCommand cmd = new SqlCommand("spValidateUser", con);
            //    cmd.CommandType = System.Data.CommandType.StoredProcedure;

            //    cmd.Parameters.AddWithValue("@UserId", UserId);
            //    cmd.Parameters.AddWithValue("@Password", password);

            //    con.Open();
            //     string statusmessage = (string)cmd.ExecuteScalar();
            //    con.Close();

            //    if(statusmessage == "V001")
            //    {
            //        if (rdbRememberme.Checked)
            //            RememberUser(UserId, password);

            //        FormsAuthentication.RedirectFromLoginPage(UserId, false);
            //    }
            //    else
            //    {
            //        string message = "toastr['error']('Invalid UserId or Password!', 'Invalid Credentials')";
            //        ClientScript.RegisterClientScriptBlock(this.GetType(), "S001", message, true);

            //    }
            //}

        }

        [Obsolete]
        private bool IsValidUser(string UserId, string password)
        {
            string hashPassword = FormsAuthentication.HashPasswordForStoringInConfigFile(password, "SHA1");
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("spValidateUser", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@UserId", UserId);
                cmd.Parameters.AddWithValue("@Password", hashPassword);

                con.Open();
                string statusmessage = (string)cmd.ExecuteScalar();
                con.Close();

                if (statusmessage == "V001")
                    return true;
                else
                    return false;
            }

        }
        private void RememberUser(string UserId, string Password)
        {
            HttpCookie cookie = new HttpCookie("UserInfo");
            cookie["UserId"] = UserId;
            cookie["Password"] = Password;
            cookie.Expires = DateTime.Now.AddDays(90);
            Response.Cookies.Add(cookie);
        }
        private bool CheckUserExistance(out string UserId, out string Password)
        {
            UserId = null;
            Password = null;
            HttpCookie cookie = Request.Cookies["UserInfo"];
            if (cookie != null)
            {
                UserId = cookie["UserId"].ToString();
                Password = cookie["Password"].ToString();
                return true;
            }
            return false;
        }

        [Obsolete]
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            string UserID = txtemail.Text;
            string password = TextBox2.Text;
            string SecurePasswors = FormsAuthentication.HashPasswordForStoringInConfigFile(password, "SHA1");
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("spRegisterMember", con);
                cmd.CommandType = System.Data.CommandType.StoredProcedure;

                cmd.Parameters.AddWithValue("@UserId", UserID);
                cmd.Parameters.AddWithValue("@password", SecurePasswors);

                con.Open();
                string statuscode = (string)cmd.ExecuteScalar();
                con.Close();

                string Message = string.Empty;
                if (statuscode == "S001")
                    Message = "toastr['success']('User Registered successfully!', 'Registreation Successfull')";
                else if (statuscode == "RE01")
                    Message = "toastr['warrning']('User already Registered, Please Login!', 'Already Registered')";
                else
                    Message = "toastr['error']('Currently system not able to process this request!', 'System Error')";

                ClientScript.RegisterClientScriptBlock(this.GetType(), "M001", Message, true);

            }
        }
    }
}