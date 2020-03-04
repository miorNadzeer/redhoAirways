package redho;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class StoreCust{
	// Use a prepared statement to store a student into the database
	private PreparedStatement pstmt, pstmt1;

	public StoreCust() {
		initializeJdbc();
	}

	/** Initialize database connection */
	private void initializeJdbc() {
		try {
			Class.forName("com.mysql.jdbc.Driver");

			// Connect to the sample database
			Connection connection = DriverManager.getConnection
					("jdbc:mysql://localhost/redhoairways" , "root", "kucing3");

			// Create a Statement
			pstmt = connection.prepareStatement("insert into customer " +
					"(cust_email, cust_password, cust_id, cust_title,cust_last_name,"
					+ "cust_first_name,cust_nationality,cust_phone) "
					+ "values (?, ?, ?, ?, ?, ?, ?, ?)");
			
			pstmt1 = connection.prepareStatement("insert into user " +
					"(user_type,username, password) "
					+ "values ('Customer', ?, ?)");
			
		}
		catch (Exception ex) {
			System.out.println(ex);
		}
	}

	/** Store a student record to the database */
	public void storeCust(Customer customer) throws SQLException {
		pstmt.setString(1, customer.getEmail());
		pstmt.setString(2, customer.getPassword());
		pstmt.setString(3, customer.getId());
		pstmt.setString(4, customer.getTitle());
		pstmt.setString(5, customer.getLastName());
		pstmt.setString(6, customer.getFirstName());
		pstmt.setString(7, customer.getNationality());
		pstmt.setString(8, customer.getTel());
		pstmt1.setString(1, customer.getEmail());
		pstmt1.setString(2, customer.getPassword());
		pstmt.executeUpdate();
		pstmt1.executeUpdate();
	}
}