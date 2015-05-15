using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for SessionManager
/// </summary>
public class SessionManager
{
    public static DateTime TransactionStartDate { get; set; }
    public static DateTime TransactionEndDate { get; set; }

    static SessionManager()
    {
        TransactionStartDate = new DateTime(2004, 7, 6);    //"07/06/2004"
        TransactionEndDate = new DateTime(2004, 7,15);      // "07/15/2004"
    }
}