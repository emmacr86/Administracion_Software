Imports System.Data
Imports System.Data.SqlClient

Public Class MetodosDatos
    Public Shared Function CrearComando() As SqlCommand
        Dim dbString = Configuracion.dbString
        Dim conexion As New SqlConnection
        conexion.ConnectionString = dbString
        Dim comando As New SqlCommand
        comando = conexion.CreateCommand
        comando.CommandType = CommandType.Text
        Return comando
    End Function

    Public Shared Function EjecutarComandoSelect(comando As SqlCommand) As DataTable
        Dim tabla As New DataTable
        Try
            comando.Connection.Open()
            Dim adaptador As New SqlDataAdapter()
            adaptador.SelectCommand = comando
            adaptador.Fill(tabla)
        Catch ex As Exception
        Finally
            comando.Connection.Close()
        End Try
        Return tabla
    End Function
End Class
