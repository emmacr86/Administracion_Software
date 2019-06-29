Imports Datos
Imports System.Data
Imports System.Data.SqlClient
Public Class AccesoLogica
    Public Shared Function InsertarInfoProyecto(_a, _b, _c, _d, _e, _f, _g, _h) As DataTable
        Return AccesoDatos.InsertarInfoProyecto(_a, _b, _c, _d, _e, _f, _g, _h)
    End Function
    Public Shared Function InsertarInfoEscenario(_a, _b, _c, _d, _e, _f, _g, _h, _i, _j) As DataTable
        Return AccesoDatos.InsertarInfoEscenario(_a, _b, _c, _d, _e, _f, _g, _h, _i, _j)
    End Function
    Public Shared Function CargarInfo() As DataTable
        Return AccesoDatos.CargarInfo()
    End Function
End Class
