using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaDatos
{
    public class CD_Cuentas
    {
        CD_Conexion db_conexion = new CD_Conexion();

        public DataTable MtMostrarCuentas()
        {
            string QryMostrarCuentas = "usp_cuentas_mostrar";
            SqlDataAdapter adapter = new SqlDataAdapter(QryMostrarCuentas, db_conexion.MtdAbrirConexion());
            DataTable dtMostrarCuentas = new DataTable();
            adapter.Fill(dtMostrarCuentas);
            db_conexion.MtdCerrarConexion();
            return dtMostrarCuentas;
        }
        public void CD_mtdAgregarCuentas(string Nombre, string Direccion, string Departamento, string Pais, string Categoria, string Estado)
        {
            //db_conexion.MtdAbrirConexion();
            string Usp_crear = "usp_cuentas_crear";
            SqlCommand cmd_InsertarCuentas = new SqlCommand(Usp_crear, db_conexion.MtdAbrirConexion());
            cmd_InsertarCuentas.CommandType = CommandType.StoredProcedure;

            cmd_InsertarCuentas.Parameters.AddWithValue("@Nombre", Nombre);
            cmd_InsertarCuentas.Parameters.AddWithValue("@Direccion", Direccion);
            cmd_InsertarCuentas.Parameters.AddWithValue("@Departamento", Departamento);
            cmd_InsertarCuentas.Parameters.AddWithValue("@Pais", Pais);
            cmd_InsertarCuentas.Parameters.AddWithValue("@Categoria", Categoria);
            cmd_InsertarCuentas.Parameters.AddWithValue("@Estado", Estado);
            cmd_InsertarCuentas.ExecuteNonQuery();

            db_conexion.MtdCerrarConexion();
        }



    }
}
