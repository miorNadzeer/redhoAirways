package redho;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class StoreFlight {
	// Use a prepared statement to store a student into the database
	private PreparedStatement pstmt;

	public StoreFlight() {
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
			pstmt = connection.prepareStatement("insert into bookflight " +
					"(flightType, flightClass, flightOrigin, flightDestination, flightDepartDate, flightDepartTime,"
					+ "flightReturnDate, flightReturnTime, flightAdult, flightChild, flightAddWeight,flightMeal,"
					+ "cust_lastName, cust_firstName, cust_id, nationality, staff_id, flightCharge) values "
					+ "(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
		}
		catch (Exception ex) {
			System.out.println(ex);
		}
	}

	/** Store a student record to the database */
	public void flightStore(Flight flight) throws SQLException {
		pstmt.setString(1, flight.getFlightType());
		pstmt.setString(2, flight.getFlightClass());
		pstmt.setString(3, flight.getFlightFrom());
		pstmt.setString(4, flight.getFlightTo());
		pstmt.setString(5, flight.getDepartDate());
		pstmt.setString(6, flight.getDepartTime());
		pstmt.setString(7, flight.getReturnDate());
		pstmt.setString(8, flight.getReturnTime());
		pstmt.setInt(9, flight.getAdult());
		pstmt.setInt(10, flight.getChild());
		pstmt.setDouble(11, flight.getAddWeight());
		pstmt.setString(12, flight.getMeal());
		pstmt.setString(13, flight.getLastName());
		pstmt.setString(14, flight.getFirstName());
		pstmt.setString(15, flight.getId());
		pstmt.setString(16, flight.getNationality());
		pstmt.setString(17, flight.getOfficer());
		pstmt.setDouble(18, flight.ticketCharge());
		pstmt.executeUpdate();
	}
}