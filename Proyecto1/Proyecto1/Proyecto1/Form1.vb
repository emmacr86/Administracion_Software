Imports Logica
Public Class Form1
    Private Sub Form1_Load(sender As Object, e As EventArgs) Handles MyBase.Load


        ComboBoxProyecto.ValueMember = "idproyecto"
        ComboBoxProyecto.DisplayMember = "descripcion"
        ComboBoxProyecto.DataSource = AccesoLogica.CargarInfo()

        intProyecto = Convert.ToInt32(ComboBoxProyecto.SelectedValue)
        strDescripcion = ComboBoxProyecto.Text

    End Sub

    Private Sub btnInsertar_Click(sender As Object, e As EventArgs) Handles btnInsertar.Click
        AccesoLogica.InsertarInfoProyecto(txtrequerimiento.Text, txtdescripcion.Text, txttipo.Text, dtpfecha.Value.Date, ComboBoxGestor.SelectedItem.ToString, ComboBoxAmbiente.SelectedItem.ToString, ComboBoxEjecutor.SelectedItem.ToString, Convert.ToInt32(ComboBoxCreacion.SelectedItem.ToString))
    End Sub

    Private Sub btnCerrar_Click(sender As Object, e As EventArgs) Handles btnCerrar.Click
        Application.Exit()
    End Sub

    Private Sub ComboBoxProyecto_SelectedIndexChanged(sender As Object, e As EventArgs) 
        intProyecto = Convert.ToInt32(ComboBoxProyecto.SelectedValue)
        strDescripcion = ComboBoxProyecto.Text
    End Sub

    Private Sub TabControlCalidad_Selected(sender As Object, e As TabControlEventArgs) Handles TabControlCalidad.Selected
        ComboBoxProyecto.ValueMember = "idproyecto"
        ComboBoxProyecto.DisplayMember = "descripcion"
        ComboBoxProyecto.DataSource = AccesoLogica.CargarInfo()

        intProyecto = Convert.ToInt32(ComboBoxProyecto.SelectedValue)
        strDescripcion = ComboBoxProyecto.Text
    End Sub

    Private Sub btnInsertarEscenario_Click(sender As Object, e As EventArgs) 
        AccesoLogica.InsertarInfoEscenario(intProyecto, Convert.ToInt32(txtidEscenario.Text), ComboBoxPrioridad.SelectedItem.ToString, txtEscDescripcion.Text, txtEscNotas.Text, txtPedido.Text, txtServicio.Text, txtCuenta.Text, cbxEstado.SelectedItem.ToString, cbxEjecutor.SelectedItem.ToString)
    End Sub
End Class
