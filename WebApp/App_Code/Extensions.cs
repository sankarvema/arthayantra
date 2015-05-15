using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for Extensions
/// </summary>
public static class  Extensions
{

    public static T? GetValue<T>(this DataRow row, string columnName) where T : struct
    {
        if (row.IsNull(columnName))
            return null;

        return row[columnName] as T?;
    }

    public static string GetText(this DataRow row, string columnName)
    {
        if (row.IsNull(columnName))
            return string.Empty;

        return row[columnName] as string ?? string.Empty;
    }

    public static string GetText(this SqlDataReader reader, string columnName)
    {
        if (reader.IsDBNull(reader.GetOrdinal(columnName)))
            return string.Empty;

        string dataType = reader.GetDataTypeName(reader.GetOrdinal(columnName));

        string dbColValue = string.Empty;

        if (dataType == "nvarchar")
            dbColValue = reader.GetString(reader.GetOrdinal(columnName)) as string ?? string.Empty;
        else if (dataType == "datetime")
            dbColValue = reader.GetDateTime(reader.GetOrdinal(columnName)).ToString("dd MMM yyyy");
        else if (dataType == "money")
            dbColValue = reader.GetDecimal(reader.GetOrdinal(columnName)).ToString("C");
        else
            dbColValue = "Unknown [" + dataType + "]";

        return dbColValue;

    }
}