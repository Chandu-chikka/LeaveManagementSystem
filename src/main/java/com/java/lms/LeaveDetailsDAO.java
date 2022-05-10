package com.java.lms;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class LeaveDetailsDAO {

	Connection connection;
	PreparedStatement pst;
	
public String applyLeave(LeaveDetails leaveDetails) throws ClassNotFoundException, SQLException {
		
	
		 long ms = leaveDetails.getLeaveEndDate().getTime() - leaveDetails.getLeaveStartDate().getTime();
		    long m = ms / (1000 * 24 * 60 * 60);
		    int days = (int) m;
		    Employee employee = new EmployeeDAO().searchEmploy(leaveDetails.getEmpId());
		    int leaveBalance = employee.getLeaveAvail();
		    if (days < 0) {
		    	return "Leave-Start Date Cannot be Greater than leave-End Date...";
		    } else if (leaveBalance-days < 0) {
		    	return "Insufficient Leave Balance...";
		    } else {
		    	int difference = leaveBalance-days;
		    	leaveDetails.setNoOfDays(days);
		    	connection = ConnectionHelper.getConnection();
		    	String cmd = "Insert into LEAVE_HISTORY(Emp_ID,Leave_Start_Date, "
		    			+ "Leave_End_Date,Leave_Reason,LEAVE_NO_OF_DAYS) "
		    			+ "VALUES(?,?,?,?,?)";
		    	pst = connection.prepareStatement(cmd);
		    	pst.setInt(1, leaveDetails.getEmpId());
		    	pst.setDate(2, leaveDetails.getLeaveStartDate());
		    	pst.setDate(3, leaveDetails.getLeaveEndDate());
		    	pst.setString(4, leaveDetails.getLeaveReason());
		    	pst.setInt(5, leaveDetails.getNoOfDays());
		    	pst.executeUpdate();
		    	cmd = "Update Employee set EMP_AVAIL_LEAVE_BAL=? WHERE EMP_ID=?";
		    	pst = connection.prepareStatement(cmd);
		    	pst.setInt(1,difference);
		    	pst.setInt(2, leaveDetails.getEmpId());
		    	pst.executeUpdate();
	
		    	return "Leave Applied Successfully...";
		    }
}
	
	public LeaveDetails[] showLeave() throws ClassNotFoundException, SQLException {
		connection = ConnectionHelper.getConnection();
		String cmd = "select * from leave_history";
		pst = connection.prepareStatement(cmd);
		@SuppressWarnings("unused")
		List<LeaveDetails> leaveList = new ArrayList<LeaveDetails>();
		ResultSet rs = pst.executeQuery();
		LeaveDetails leaveDetails = null;
		while(rs.next()) {
			leaveDetails = new LeaveDetails();
			leaveDetails.setLeaveId(rs.getInt("LEAVE_ID"));
			leaveDetails.setNoOfDays(rs.getInt("LEAVE_NO_OF_DAYS"));
			//leaveDetails.setManagerComments(rs.getString("LEAVE_MNGR_COMMENTS"));
			leaveDetails.setEmpId(rs.getInt("EMP_ID"));
			leaveDetails.setLeaveStartDate(rs.getDate("LEAVE_START_DATE"));
			leaveDetails.setLeaveEndDate(rs.getDate("LEAVE_END_DATE"));
			leaveDetails.setLeaveType(LeaveType.valueOf(rs.getString("LEAVE_TYPE")));
			leaveDetails.setLeaveStatus(LeaveStatus.valueOf(rs.getString("LEAVE_STATUS")));
			leaveDetails.setLeaveReason(rs.getString("LEAVE_REASON"));
			leaveList.add(leaveDetails);
		}
		return leaveList.toArray(new LeaveDetails[leaveList.size()]);
	} 
	
	public LeaveDetails[] leaveHistory(int empId) throws ClassNotFoundException, SQLException {
		connection = ConnectionHelper.getConnection();
		String cmd = "select * from Leave_History where emp_id=?";
		pst = connection.prepareStatement(cmd);
		pst.setInt(1, empId);
		ResultSet rs = pst.executeQuery();
		List<LeaveDetails> leaveList = new ArrayList<LeaveDetails>();
		LeaveDetails leaveDetails = null;
		while(rs.next()) {
			leaveDetails = new LeaveDetails();
			leaveDetails.setLeaveId(rs.getInt("LEAVE_ID"));
			leaveDetails.setEmpId(rs.getInt("EMP_ID"));
			leaveDetails.setNoOfDays(rs.getInt("LEAVE_NO_OF_DAYS"));
			leaveDetails.setLeaveStartDate(rs.getDate("LEAVE_START_DATE"));
			leaveDetails.setLeaveEndDate(rs.getDate("LEAVE_END_DATE"));
			leaveDetails.setLeaveType(LeaveType.valueOf(rs.getString("LEAVE_TYPE")));
			leaveDetails.setLeaveStatus(LeaveStatus.valueOf(rs.getString("LEAVE_STATUS")));
			leaveDetails.setLeaveReason(rs.getString("LEAVE_REASON"));
			leaveDetails.setManagerComments(rs.getString("LEAVE_MNGR_COMMENTS"));
			leaveList.add(leaveDetails);
		}
		return leaveList.toArray(new LeaveDetails[leaveList.size()]);
	}
	
	public LeaveDetails searchLeave() throws ClassNotFoundException, SQLException {
		connection = ConnectionHelper.getConnection();
		String cmd = "select * from leave_history where LEAVE_ID=?";
		pst = connection.prepareStatement(cmd);
		new ArrayList<LeaveDetails>();
		ResultSet rs = pst.executeQuery();
		LeaveDetails leaveDetails = null;
		if (rs.next()) {
			leaveDetails = new LeaveDetails();
			leaveDetails.setLeaveId(rs.getInt("LEAVE_ID"));
			leaveDetails.setEmpId(rs.getInt("EMP_ID"));
			leaveDetails.setNoOfDays(rs.getInt("LEAVE_NO_OF_DAYS"));
			leaveDetails.setLeaveStartDate(rs.getDate("LEAVE_START_DATE"));
			leaveDetails.setLeaveEndDate(rs.getDate("LEAVE_END_DATE"));
			leaveDetails.setLeaveType(LeaveType.valueOf(rs.getString("LEAVE_TYPE")));
			leaveDetails.setLeaveStatus(LeaveStatus.valueOf(rs.getString("LEAVE_STATUS")));
			leaveDetails.setLeaveReason(rs.getString("LEAVE_REASON"));
			
		}
		return leaveDetails;
	}
	
}