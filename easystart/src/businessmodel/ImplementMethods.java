package businessmodel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class ImplementMethods implements ToDoMethods{
	
	Connection connection;
	
	public ImplementMethods(Connection connection){
		
		this.connection = connection;
		
	}

	@Override
	public void inserttext(userbean text) {
		String toMySQL = "insert into doc (user_id, text)" + " values(?,?)";
		PreparedStatement p;
		try {
			
		p = this.connection.prepareStatement(toMySQL);
		
		p.setInt(1,text.getID());
		p.setString(2,text.getText());
		
		
		p.execute();
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Override
	public List<userbean> addnewtext() {
		
		List<userbean> mytext = new ArrayList<userbean>();
		
		String toMySQL = "select * FROM doc";
		try{
			java.sql.Statement stmt = connection.createStatement();
			ResultSet rs = stmt.executeQuery(toMySQL);
			while(rs.next()){
				
				userbean newtext = new userbean();
				
				int ID = rs.getInt("user_id");
				String text = rs.getString("text");
				
				
				
				newtext.setID(ID);
				newtext.setText(text);
				
				mytext.add(newtext);
			}
		}
		catch (Exception ex){
			ex.printStackTrace();
			
		}
		return mytext;
	}

    public List<String> addlink() {
        List<String> mylink = new ArrayList<String>();
		
		String toMySQL = "select * FROM link";
		try{
			java.sql.Statement stmt = connection.createStatement();
			ResultSet rs = stmt.executeQuery(toMySQL);
			while(rs.next()){
				
				  //int id = rs.getInt("id");
		            String url = rs.getString("url");
		            String title = rs.getString("title");
		            String description = rs.getString("description");
				
				mylink.add(url);
				mylink.add(title);
				mylink.add(description);
			}
		}
		catch (Exception ex){
			ex.printStackTrace();
			
		}
		return mylink;
	}
	
    public List<Link> getLinks() {
        List<Link> myLinks = new ArrayList<Link>();
		
		String toMySQL = "select * FROM link";
		try{
			java.sql.Statement stmt = connection.createStatement();
			ResultSet rs = stmt.executeQuery(toMySQL);
			while(rs.next()){
				Link link = new Link();
				link.setUrl(rs.getString("url"));
				link.setTitle(rs.getString("title"));
				link.setDescription(rs.getString("description"));
				myLinks.add(link);
			}
		}
		catch (Exception ex){
			ex.printStackTrace();
			
		}
		return myLinks;
	}

}
