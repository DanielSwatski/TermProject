using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;

namespace StoredProcedures
{
    public static class emailer
    {


        public static Boolean emailSender(String to, int code)
        {
            string from = "danielswatski16@gmail.com"; //From address    
            MailMessage message = new MailMessage(from, to);

            string mailbody = "Here is your code: " + code;
            message.Subject = "YOUR CODE";
            message.Body = mailbody;
            message.BodyEncoding = Encoding.UTF8;
            message.IsBodyHtml = true;
            SmtpClient client = new SmtpClient("smtp.gmail.com", 587); //Gmail smtp    
            System.Net.NetworkCredential basicCredential1 = new
            System.Net.NetworkCredential("danielswatski16@gmail.com", "ssnsbvdulgsjrugj");
            client.EnableSsl = true;
            client.UseDefaultCredentials = false;
            client.Credentials = basicCredential1;
            try
            {
                client.Send(message);
                return true;
            }

            catch (Exception ex)
            {
                throw ex;
            }
            return false;

        }

    }
}
