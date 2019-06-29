Imports System
Imports System.Data.SqlClient
Public Class AccesoDatos
    Public Shared Function CargarInfo() As DataTable
        Dim comando As SqlCommand = MetodosDatos.CrearComando
        comando.CommandText = "SELECT * from proyecto"
        Return MetodosDatos.EjecutarComandoSelect(comando)
    End Function

    Public Shared Function InsertarInfoProyecto(_a, _b, _c, _d, _e, _f, _g, _h) As DataTable
        Dim comandoInsertar As SqlCommand = MetodosDatos.CrearComando
        comandoInsertar.CommandText = "Insert into proyecto values (@requerimiento,@descripcion,@tpo,@fecha,@gestor,@ambiente,@ejecutor,@creacion)"
        comandoInsertar.Parameters.Add("@requerimiento", SqlDbType.NVarChar)
        comandoInsertar.Parameters.Add("@descripcion", SqlDbType.NVarChar)
        comandoInsertar.Parameters.Add("@tpo", SqlDbType.NVarChar)
        comandoInsertar.Parameters.Add("@fecha", SqlDbType.Date)
        comandoInsertar.Parameters.Add("@gestor", SqlDbType.NVarChar)
        comandoInsertar.Parameters.Add("@ambiente", SqlDbType.NVarChar)
        comandoInsertar.Parameters.Add("@ejecutor", SqlDbType.NVarChar)
        comandoInsertar.Parameters.Add("@creacion", SqlDbType.Int)
        comandoInsertar.Parameters("@requerimiento").Value = _a
        comandoInsertar.Parameters("@descripcion").Value = _b
        comandoInsertar.Parameters("@tpo").Value = _c
        comandoInsertar.Parameters("@fecha").Value = Convert.ToDateTime(_d)
        comandoInsertar.Parameters("@gestor").Value = _e
        comandoInsertar.Parameters("@ambiente").Value = _f
        comandoInsertar.Parameters("@ejecutor").Value = _g
        comandoInsertar.Parameters("@creacion").Value = Convert.ToInt32(_h)
        Return MetodosDatos.EjecutarComandoSelect(comandoInsertar)
    End Function

    Public Shared Function InsertarInfoEscenario(_a, _b, _c, _d, _e, _f, _g, _h, _i, _j) As DataTable
        Dim comandoInsertar As SqlCommand = MetodosDatos.CrearComando
        comandoInsertar.CommandText = "Insert into escenario values (@idproyecto,@escenario,@prioridad,@descripcion,@notas,@pedido,@servicio,@cuenta,@estado,@ejecutor)"
        comandoInsertar.Parameters.Add("@idproyecto", SqlDbType.Int)
        comandoInsertar.Parameters.Add("@escenario", SqlDbType.Int)
        comandoInsertar.Parameters.Add("@prioridad", SqlDbType.NVarChar)
        comandoInsertar.Parameters.Add("@descripcion", SqlDbType.NVarChar)
        comandoInsertar.Parameters.Add("@notas", SqlDbType.NVarChar)
        comandoInsertar.Parameters.Add("@pedido", SqlDbType.NVarChar)
        comandoInsertar.Parameters.Add("@servicio", SqlDbType.NVarChar)
        comandoInsertar.Parameters.Add("@cuenta", SqlDbType.NVarChar)
        comandoInsertar.Parameters.Add("@estado", SqlDbType.NVarChar)
        comandoInsertar.Parameters.Add("@ejecutor", SqlDbType.NVarChar)

        comandoInsertar.Parameters("@idproyecto").Value = Convert.ToInt32(_a)
        comandoInsertar.Parameters("@escenario").Value = Convert.ToInt32(_b)
        comandoInsertar.Parameters("@prioridad").Value = _c
        comandoInsertar.Parameters("@descripcion").Value = _d
        comandoInsertar.Parameters("@notas").Value = _e
        comandoInsertar.Parameters("@pedido").Value = _f
        comandoInsertar.Parameters("@servicio").Value = _g
        comandoInsertar.Parameters("@cuenta").Value = _h
        comandoInsertar.Parameters("@estado").Value = _i
        comandoInsertar.Parameters("@ejecutor").Value = _j
        Return MetodosDatos.EjecutarComandoSelect(comandoInsertar)
    End Function
End Class
