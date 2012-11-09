package businessmodel;

import java.util.List;


public interface ToDoMethods {
	public void inserttext(userbean text);
	public List<userbean> addnewtext();
	public List<String> addlink();
	public List<Link> getLinks();

}
