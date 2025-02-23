using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using CapaDatos;

namespace CapaPresentacion
{
    public partial class FrmClientes : Form
    {
        CD_Clientes cd_clientes = new CD_Clientes();
        public FrmClientes()
        {
            
            InitializeComponent();
        }

        /*    
        public void MtdMostrarClientes()
        {
            CD_Clientes cd_clientes = new CD_Clientes();
            DataTable dtClientes = cd_clientes.MtMostrarClientes();
            dgvClientes.DataSource = dtClientes;
        }
        */

        public void MtdMostrarClientes()
        {
            
            DataTable dtMostrarClientes = cd_clientes.MtMostrarClientes();
            dgvClientes.DataSource = dtMostrarClientes;
        }

        public void mtdCrearClientes()
        {
            


            try
            {
                cd_clientes.CD_mtdAgregarClientes(txtNombres.Text,txtDireccion.Text,txtDepartamento.Text,txtPais.Text,cboxCategoria.Text,cboxEstado.Text);

                MessageBox.Show("El cliente se agrego con exito","Correcto", MessageBoxButtons.OK,MessageBoxIcon.Information);
                MtdMostrarClientes();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.StackTrace, "ERROR", MessageBoxButtons.OK, MessageBoxIcon.Error);

                throw;
            }

           
        }
        
        private void FrmClientes_Load(object sender, EventArgs e)
        {
            MtdMostrarClientes();
            this.Enabled = true;
        }

        private void label4_Click(object sender, EventArgs e)
        {

        }

        private void gboxClientes_Enter(object sender, EventArgs e)
        {

        }

        private void btnGuardar_Click(object sender, EventArgs e)
        {
            mtdCrearClientes();
        }

        private void btnActualizar_Click(object sender, EventArgs e)
        {
         



            try
            {

                cd_clientes.MtdActualizarClientes(int.Parse(txtCodigoCliente.Text), txtNombres.Text, txtDireccion.Text, txtDepartamento.Text, txtPais.Text, cboxCategoria.Text, cboxEstado.Text);


                MessageBox.Show("El cliente se actualizo con exito", "Correcto", MessageBoxButtons.OK, MessageBoxIcon.Information);
                MtdMostrarClientes();
            }


            catch (Exception ex)

            {
                MessageBox.Show(ex.StackTrace, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);


            }

        }

        private void dgvClientes_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            txtCodigoCliente.Text = dgvClientes.SelectedCells[0].Value.ToString();
            txtNombres.Text = dgvClientes.SelectedCells[1].Value.ToString();
            txtDireccion.Text = dgvClientes.SelectedCells[2].Value.ToString();
            txtDepartamento.Text = dgvClientes.SelectedCells[3].Value.ToString();
            txtPais.Text = dgvClientes.SelectedCells[4].Value.ToString();
            cboxCategoria.Text = dgvClientes.SelectedCells[5].Value.ToString();
            cboxEstado.Text = dgvClientes.SelectedCells[6].Value.ToString();

        }

        private void btnEliminar_Click(object sender, EventArgs e)
        {
            try
            {

                cd_clientes.CD_mtdEliminarrClientes(int.Parse(txtCodigoCliente.Text));


                MessageBox.Show("El cliente se elimino con exito", "Correcto", MessageBoxButtons.OK, MessageBoxIcon.Information);
                MtdMostrarClientes();
            }


            catch (Exception ex)

            {
                MessageBox.Show(ex.StackTrace, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);


            }
        }
    }
}
