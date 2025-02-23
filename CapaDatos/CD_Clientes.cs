using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaDatos
{
    public class CD_Clientes
    {
    
        CD_Conexion db_conexion = new CD_Conexion();

        public DataTable MtMostrarClientes()
        {
            string QryMostrarClientes = "usp_clientes_mostrar";
            SqlDataAdapter adapter = new SqlDataAdapter(QryMostrarClientes,db_conexion.MtdAbrirConexion());
            DataTable dtMostrarClientes = new DataTable();
            adapter.Fill(dtMostrarClientes);
            db_conexion.MtdCerrarConexion();
            return dtMostrarClientes;
        }
        public void CD_mtdAgregarClientes(string Nombre, string Direccion, string Departamento, string Pais, 
                                            string Categoria, string Estado)
        {
            //db_conexion.MtdAbrirConexion();
            string Usp_crear = "usp_clientes_crear";
            SqlCommand cmd_InsertarClientes = new SqlCommand(Usp_crear, db_conexion.MtdAbrirConexion());
            cmd_InsertarClientes.CommandType = CommandType.StoredProcedure;

            cmd_InsertarClientes.Parameters.AddWithValue("@Nombre", Nombre);
            cmd_InsertarClientes.Parameters.AddWithValue("@Direccion", Direccion);
            cmd_InsertarClientes.Parameters.AddWithValue("@Departamento", Departamento);
            cmd_InsertarClientes.Parameters.AddWithValue("@Pais", Pais);
            cmd_InsertarClientes.Parameters.AddWithValue("@Categoria", Categoria);
            cmd_InsertarClientes.Parameters.AddWithValue("@Estado", Estado);
            cmd_InsertarClientes.ExecuteNonQuery();

            db_conexion.MtdCerrarConexion();
        }

        public void MtdActualizarClientes(int Codigo, string Nombre, String Direccion, String Departamento, String Pais, String Categoria, String Estado)
        {

            String usp_actualizar = "usp_clientes_editar";

            SqlCommand cmduspActualizar = new SqlCommand(usp_actualizar, db_conexion.MtdAbrirConexion());

            cmduspActualizar.CommandType = CommandType.StoredProcedure;

            cmduspActualizar.Parameters.AddWithValue("@Codigo", Codigo);

            cmduspActualizar.Parameters.AddWithValue("@Nombre", Nombre);
            cmduspActualizar.Parameters.AddWithValue("@Direccion", Direccion);
            cmduspActualizar.Parameters.AddWithValue("@Departamento", Departamento);
            cmduspActualizar.Parameters.AddWithValue("@Pais", Pais);
            cmduspActualizar.Parameters.AddWithValue("@Categoria", Categoria);
            cmduspActualizar.Parameters.AddWithValue("@Estado", Estado);
            cmduspActualizar.ExecuteNonQuery();

            db_conexion.MtdCerrarConexion();


        }

        public void CD_mtdEliminarrClientes(int Codigo)
        {



            string UspEliminarClientes = "ups_clientes_eliminar";
            SqlCommand commUspEliminarClientes = new SqlCommand(UspEliminarClientes, db_conexion.MtdAbrirConexion());
            commUspEliminarClientes.CommandType = CommandType.StoredProcedure;

            commUspEliminarClientes.Parameters.AddWithValue("@Codigo", Codigo);
            commUspEliminarClientes.ExecuteNonQuery();
            


            db_conexion.MtdCerrarConexion();

        }



    }
}
