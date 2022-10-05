import org.postgresql.gss.GSSOutputStream;

import java.sql.*;
import java.util.Properties;
import java.util.Scanner;

public class Utils {
	
	static Scanner teclado = new Scanner(System.in);

	public static Connection conectar(){

		Properties props = new Properties();

		props.setProperty("user", "jgmarquesm");
		props.setProperty("password", "postgres");
		props.setProperty("ssl", "false");

		String urlServer = "jdbc:postgresql://localhost:5432/jpostgresql";

		try {
			return DriverManager.getConnection(urlServer, props);
		} catch (Exception e){
			e.printStackTrace();
			if (e instanceof ClassNotFoundException){
				System.err.println("Verifique o Driver de conexão.");
			} else {
				System.err.println("Verifique se o Server está ativo.");
			}
			System.exit(-42);
			return null;
		}
	}

	public static void desconectar(Connection connection) {
		if (connection != null){
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	public static void listar() {

		String buscarTodos = "SELECT * FROM produtos";

		try {
			Connection connection = conectar();
			PreparedStatement produtos = connection.prepareStatement(buscarTodos, ResultSet.TYPE_SCROLL_INSENSITIVE,
					ResultSet.CONCUR_READ_ONLY
			);

			ResultSet res = produtos.executeQuery();

			res.last();
			int qtd = res.getRow();
			res.beforeFirst();

			if (qtd > 0){
				System.out.println("Listando produtos...");
				System.out.println("--------------------");
				while(res.next()){
					System.out.printf("ID: %s%n", res.getInt(1));
					System.out.printf("PRODUTO: %s%n", res.getString(2));
					System.out.printf("PREÇO: %s%n", res.getFloat(3));
					System.out.printf("ESTOQUE: %s%n", res.getInt(4));
					System.out.println("--------------------");
				}
			} else {
				System.out.println("Não existem produtos cadastrados.");
			}
			desconectar(connection);
		} catch (Exception e){
			e.printStackTrace();
			System.err.println("Erro buscando todos os produtos.");
			System.exit(-42);
		}
	}
	
	public static void inserir() {

		System.out.println("Informe o nome do produto: ");
		String nome = teclado.nextLine();
		System.out.println("Informe o preço do produto: ");
		float preco = teclado.nextFloat();
		System.out.println("Informe a quantidade em estoque: ");
		int estoque = teclado.nextInt();

		String inserirProduto = "INSERT INTO produtos (nome, preco, estoque) VALUES (?, ?, ?)"	;

		try {
			Connection connection = conectar();
			PreparedStatement salvar = connection.prepareStatement(inserirProduto);

			salvar.setString(1, nome);
			salvar.setFloat(2, preco);
			salvar.setInt(3, estoque);

			salvar.executeUpdate();
			salvar.close();
			desconectar(connection);

			System.out.printf("O produto %s foi inserido com sucesso.", nome);

		} catch (Exception e){
			e.printStackTrace();
			System.err.println("Erro salvando o produto.");
			System.exit(-42);
		}

	}
	
	public static void atualizar() {
		System.out.println("Informe o código do produto: ");
		int codigoProduto = Integer.parseInt(teclado.nextLine());

		String buscarPorcodigoProduto = "SELECT * FROM produtos WHERE id = ?";

		try {
			Connection connection = conectar();

			PreparedStatement produto = connection.prepareStatement(buscarPorcodigoProduto,
					ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);

			produto.setInt(1, codigoProduto);
			ResultSet res = produto.executeQuery();


			res.last();
			int qtd = res.getRow();
			res.beforeFirst();

			if (qtd > 0){
				System.out.println("Informe o nome do produto: ");
				String nome = teclado.nextLine();
				System.out.println("Informe o preço do produto: ");
				float preco = teclado.nextFloat();
				System.out.println("Informe a quantidade em estoque: ");
				int estoque = teclado.nextInt();

				String atualizar = "UPDATE produtos SET nome = ?, preco = ?, estoque = ? WHERE id = ?";
				PreparedStatement update = connection.prepareStatement(atualizar);

				update.setString(1, nome);
				update.setFloat(2, preco);
				update.setInt(3, estoque);
				update.setInt(4, codigoProduto);
				update.executeUpdate();
				update.close();
				desconectar(connection);
				System.out.printf("O produto %s foi atualizado com sucesso.%n", nome);
			} else {
				System.out.println("Não existe produto com o id informado.");
			}
		} catch (Exception e){
			e.printStackTrace();
			System.err.println("Não foi possível atualizar o produto.");
			System.exit(-42);
		}

	}
	
	public static void deletar() {

		String buscarPorcodigoProduto = "SELECT * FROM produtos WHERE id = ?";
		String deletarProduto = "DELETE FROM produtos WHERE id = ?";

		System.out.println("Informe o código do produto: ");
		int codigoProduto = Integer.parseInt(teclado.nextLine());

		try{
			Connection connection = conectar();

			PreparedStatement produto = connection.prepareStatement(buscarPorcodigoProduto,
					ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);

			produto.setInt(1, codigoProduto);
			ResultSet res = produto.executeQuery();


			res.last();
			int qtd = res.getRow();
			res.beforeFirst();

			if (qtd > 0){

				PreparedStatement deletar = connection.prepareStatement(deletarProduto);

				deletar.setInt(1, codigoProduto);
				deletar.executeUpdate();
				deletar.close();
				desconectar(connection);
				System.out.println("O produto foi deletado com sucesso.");
			} else {
				System.out.println("Não existe produto com o id informado.");
			}

		} catch (Exception e){
			e.printStackTrace();
			System.out.println("Erro ao deletar o produto.");
			System.exit(-42);
		}

	}
	
	public static void menu() {
		System.out.println("==================Gerenciamento de Produtos===============");
		System.out.println("Selecione uma opção: ");
		System.out.println("1 - Listar produtos.");
		System.out.println("2 - Inserir produtos.");
		System.out.println("3 - Atualizar produtos.");
		System.out.println("4 - Deletar produtos.");
		
		int opcao = Integer.parseInt(teclado.nextLine());
		if(opcao == 1) {
			listar();
		}else if(opcao == 2) {
			inserir();
		}else if(opcao == 3) {
			atualizar();
		}else if(opcao == 4) {
			deletar();
		}else {
			System.out.println("Opção inválida.");
		}
	}
}
