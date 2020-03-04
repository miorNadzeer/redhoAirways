package redho;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class StoreOfficer{
	// Use a prepared statement to store a student into the database
	private PreparedStatement pstmt, pstmt1;

	public StoreOfficer() {
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
			pstmt = connection.prepareStatement("INSERT INTO  counterofficer ( staff_email, "
					+ "staff_pass, staff_last_name, staff_first_name, staff_IC, staff_dob, "
					+ "staff_startDate, staff_tel) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
			
			pstmt1 = connection.prepareStatement("insert into user " +
					"(user_type,username, password) "
					+ "values ('Counter officer', ?, ?)");
			
		}
		catch (Exception ex) {
			System.out.println(ex);
		}
	}

	/** Store a student record to the database */
	public void storeOfficer(Officer officer) throws SQLException {
		pstmt.setString(1, officer.getEmail());
		pstmt.setString(2, officer.getPassword());
		pstmt.setString(3, officer.getLastName());
		pstmt.setString(4, officer.getFirstName());
		pstmt.setString(5, officer.getIc());
		pstmt.setString(6, officer.getDob());
		pstmt.setString(7, officer.getStartDate());
		pstmt.setString(8, officer.getTel());
		pstmt1.setString(1, officer.getEmail());
		pstmt1.setString(2, officer.getPassword());
		pstmt.executeUpdate();
		pstmt1.executeUpdate();
	}
}