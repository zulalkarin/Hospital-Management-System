import java.sql.Statement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Scanner;
import java.util.Set;

public class Phase2 {

	private static Connection connect = null;
	private static Statement statement = null;
	private static ResultSet resultSet = null;

	final private static String host = "jdbc:postgresql://10.98.98.61:5432/group7";
	final private static String user = "group7";
	final private static String password = "%+#ZHpbYv7*y3ucq";

	public static void main(String[] args) {

		try {
			connect = DriverManager.getConnection(host, user, password);
			statement = connect.createStatement();                        
			System.out.println("Java JDBC PostgreSQL Example");
			System.out.println("Connected to PostgreSQL database!");
			System.out.println("\nWelcome to Our Hospital Database Management System! ");
			Scanner keyboard= new Scanner(System.in);
			
			while(true){
				System.out.println("1) Admin Login ");
				System.out.println("2) User Login ");
				System.out.println("3) Exit ");
				System.out.println("Please enter the number of your choice: ");
				int choice = keyboard.nextInt();
				System.out.println();
				if(choice == 1){
					//admin login
					while(true){
						System.out.println("1) Add a new doctor");
						System.out.println("2) Delete a nurse");
						System.out.println("3) List All equipments");
						System.out.println("4) Return to main menu");
						System.out.println("Please enter the number of your choice: ");
						int adminChoice = keyboard.nextInt();
				
						if(adminChoice == 1){
							//insert doctor
							System.out.println("Enter the New Doctor ID: ");
							int id = keyboard.nextInt();
							System.out.println("Enter the Surname of New Doctor:  ");
							String surname = keyboard.next();
							System.out.println("Enter the Fist Name of New Doctor: ");
							String name = keyboard.next();
							System.out.println("Enter the Address of New Doctor(City): ");
							String adress = keyboard.next();
							System.out.println("Enter the Salary of New Doctor: ");
							int salary = keyboard.nextInt();
							System.out.println("Enter the Job of New Doctor(Examination or Operation:  ");
							String job = keyboard.next();
							System.out.println("Enter the Phone Number of New Doctor: ");   
							String phoneNum = keyboard.next();
							System.out.println("Enter the E-mail of New Doctor: ");  
							String eMail = keyboard.next();
							System.out.println("Enter the gender of New Doctor: ");  
							String gender = keyboard.next();
							System.out.println("Enter the Room Number of New Doctor: ");
							int roomNumber = keyboard.nextInt();
							System.out.println("Enter the Title of New Doctor: ");  
							String title = keyboard.next();
							System.out.println("Enter the Age of New Doctor: ");
							int age = keyboard.nextInt();
							System.out.println("Enter the Department ID of New Doctor: ");  
							String dept = keyboard.next();
							
							statement.executeUpdate("insert into doctor " 
							        + "(doctor_id, dlast_name, dfirst_name, daddress, d_salary, d_job, dphone_number, doctor_mail, dsex, room_number, d_title, d_age, department_id)"
									+  "values(" + id + ", '" + surname + "', '" + name + "', '" + adress + "', " + salary + ", '" + job + "', '" + phoneNum + "', '" + eMail 
									+ "', '" + gender + "', " + roomNumber + ", '" + title + "', " + age + ", '" + dept + "') ");
							System.out.println("Doctor succesfully added. ");
							System.out.println();
							
						}
						else if(adminChoice == 2){
							//delete a nurse
							System.out.println("Enter the ID of the Nurse You Want to Delete: ");
							int id = keyboard.nextInt();
							statement.executeUpdate("delete from nurse where nurse_id=" + id);
							System.out.println("Nurse successfully deleted. ");
							System.out.println();
						}
						else if(adminChoice == 3){
							//list equipment
							resultSet=statement.executeQuery("Select E_Name from EQUIPMENT");
							 writeResultSet(resultSet);
							
						}
						
						else {
							break;
						}

					}
				} else if (choice == 2) {
					// User Login
					// doctor and patient
					while(true){
						System.out.println("1) Doctor");
						System.out.println("2) Patient");
						System.out.println("3) Return to main menu");
						System.out.println("Please enter the number of your choice: ");
						int userChoice = keyboard.nextInt();
						System.out.println();
						if(userChoice == 1){
							//doctor
							System.out.println("1) Update Your Adress");  
							System.out.println("2) List Your Surgery Count");
							System.out.println("3) Return the Main Menu");
							System.out.println("Please enter the number of your choice: ");
							
							int docChoice= keyboard.nextInt();
							
							if(docChoice == 1){          
								//update doctor adress
								System.out.println("Enter your id: ");
								int id = keyboard.nextInt();
								
								
								Scanner scan = new Scanner(System.in);
								System.out.println("Enter your New Address: ");
								String newAdress = scan.nextLine();
								String d_Adres= readAdress(newAdress);
								
								statement.executeUpdate("Update doctor SET daddress ='" + d_Adres + "' where doctor_id="
										+ id);
								System.out.println("You Update your adress succesfully. ");
								System.out.println();
							}
							
							else if(docChoice == 2){             
								//list surgery count
								System.out.println("Enter your id: ");
								int doctor_id = keyboard.nextInt();
							
								resultSet=statement.executeQuery("Select D_Title,DFirst_Name, DLast_Name from doctor where Doctor_ID = " + doctor_id);
								while (resultSet.next()) {
									System.out.println("Doctor Name : " + resultSet.getString("D_Title") + " "
											+ resultSet.getString("DFirst_Name") + " " + resultSet.getString("DLast_Name"));
								}
								
								resultSet=statement.executeQuery("Select Doctor_ID, D_Job from doctor where Doctor_ID = " + doctor_id);
								while (resultSet.next()) {
									//System.out.println("check1");
									if(resultSet.getString("D_Job").equals("Examination")){
										//System.out.println("check2");
										System.out.println("Your Surgery Count is 0. ");
									}
									else if(resultSet.getString("D_Job").equals("Operation")){
										//System.out.println("check3");
										ResultSet resultSet1 = statement.executeQuery("Select Surgery_Count from doctor inner join attend " + 
											     "on doctor.Doctor_ID = attend.Doctor_ID where doctor.Doctor_ID = " + resultSet.getInt("Doctor_ID"));
										while(resultSet1.next()){
											//System.out.println("check4");
											
											System.out.println("Your Surgery Count is: " +  resultSet1.getInt("Surgery_Count")  );			
										}									
										break;									
									}							
								}
							}
							
							else 
								break;
						}
						
						else if(userChoice == 2){
							//patient login
							System.out.println("1) List Your Appointments");  
							System.out.println("2) Delete Your Appointment");
							System.out.println("3) Change Your Appointment Time");
							System.out.println("4) Return the Main Menu");
							System.out.println("Please enter the number of your choice: ");
							
							int patientChoice= keyboard.nextInt();
							
							if(patientChoice ==1){
								//list appointment
								System.out.println("Enter your id: ");
								int patient_id = keyboard.nextInt();
								
									resultSet = statement.executeQuery("select * FROM patient where Patient_ID = " + patient_id);
									while (resultSet.next()) {
										System.out.println("Patient Name : " + resultSet.getString("PFirst_Name") + " "
												 + resultSet.getString("PLast_Name"));
										
									}
									
								resultSet = statement
										.executeQuery("Select patient.PFirst_Name, patient.PLast_Name, appointment.ADate, appointment.ATime, appointment.Atype from patient inner join appointment "
												+ "on patient.Patient_ID = appointment.Patient_ID where patient.Patient_ID = "
												+ patient_id);
								while (resultSet.next()) {

									System.out.println("Appointment Date: "
											+ resultSet.getString("ADate")
											+ " Appointment Time: "
											+ resultSet.getString("ATime")
											+ " Appointment Type: "
											+ resultSet.getString("Atype"));
								}
									System.out.println();			
							}
							
							else if(patientChoice ==2){
								//delete appointment
								System.out.println("Enter your ID: ");
								int id = keyboard.nextInt();
								statement.executeUpdate("delete from appointment where Patient_ID = " + id);
								System.out.println("Your appointment successfully deleted. ");
								System.out.println();
							}
							
							else if(patientChoice == 3){
								//change appointment time
								System.out.println("Enter your id: ");
								int id = keyboard.nextInt();
								System.out.println("Enter Your New Appointment Time (hh:mm:ss): ");
								String newTime = keyboard.next();
								statement.executeUpdate("Update appointment SET ATime ='" + newTime + "' where Patient_ID="
										+ id);
								System.out.println("You Update your Appointment Time succesfully. ");
								System.out.println();

							}
							else
								break;
							

						}
						else
							break;
						
					}
					
				} 
				
				
				else if (choice == 3) {
					System.out.println("Thanks for choosing us ");
					System.out.println("Have a good day");
					System.exit(0);
				}
			}
		}
		catch (SQLException e) {
			System.out.println("Connection failure. ");
			e.printStackTrace();

		} finally {
			close();
		}

	}
	
	
	
	static String readAdress(String adres) {
		String neww="";
		String[] bol = adres.split(" ");
		for (int i = 0; i < bol.length; i++) {
			String[] arr= new String[2];
			arr[i]= bol[i] + " ";
			neww += arr[i];	
		}	
		return neww;	
		}		

	private static void writeResultSet(ResultSet resultSet) throws SQLException { // list
																					// the
																					// table
		ResultSetMetaData rsmd = resultSet.getMetaData();
		int columnsNumber = rsmd.getColumnCount();
		while (resultSet.next()) {
			for (int i = 1; i <= columnsNumber; i++)
				System.out.println("-->"+ resultSet.getString(i) + " "); // print one
																	// element
																	// of a row
			System.out.println(); // move the next line to print next row

		}
	}

    
	private static void close() {
		try {
			if (resultSet != null) {
				resultSet.close();
			}
			if (statement != null) {
				statement.close();
			}
			if (connect != null) {
				connect.close();
			}
		} catch (Exception e) {
		}
	}
	
	
}