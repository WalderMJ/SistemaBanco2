using CapaDatos;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace CapaPresentacion
{
    public partial class FrmCuentas: Form
    {
        public FrmCuentas()
        {
            InitializeComponent();
        }
        public void MtdMostrarCuentas()
        {
            CD_Cuentas cd_cuentas = new CD_Cuentas();
            DataTable dtMostrarCuentas = cd_cuentas.MtMostrarCuentas();
            dgvClientes.DataSource = dtMostrarCuentas;
        }

        public void mtdCrearCuentas()
        {
            CD_Cuentas cd_cuentas = new CD_Cuentas();


            try
            {
                int codigoCliente = int.Parse(txtCodigoCliente.Text);
                decimal saldo = decimal.Parse(txtSaldo.Text);
                DateTime fechaApertura = DateTime.Parse(txtFechaApertura.Text);

                cd_cuentas.CD_mtdAgregarCuentas(codigoCliente, txtNumeroCuenta.Text, cboxTipoCuenta.Text, saldo, fechaApertura, cboxEstado.Text);

                MessageBox.Show("El cliente se agrego con exito", "Correcto", MessageBoxButtons.OK, MessageBoxIcon.Information);

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.StackTrace, "ERROR", MessageBoxButtons.OK, MessageBoxIcon.Error);

                throw;
            }
        }


        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void gboxClientes_Enter(object sender, EventArgs e)
        {

        }

        private void FrmCuentas_Load(object sender, EventArgs e)
        {
            MtdMostrarCuentas();
        }

        private void btnGuardar_Click(object sender, EventArgs e)
        {
            mtdCrearCuentas();
        }

        private void btnActualizar_Click(object sender, EventArgs e)
        {
            MtdMostrarCuentas();
        }
    }
}
