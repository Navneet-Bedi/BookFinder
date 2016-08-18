 import javax.xml.transform.*;
import javax.xml.transform.stream.*;
import java.io.*;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;

@ManagedBean
@SessionScoped
public class Hw3TransformBean {
  private String data;
  private String dataType;
  public void setData(String s) {
    data=s;
  }
  public String getData() {
    return data;
  }
  public void setDataType(String s) {
    dataType=s;
  }
  public String getDataType() {
    return dataType;
  }

  public String transform() {
    String xml = "";
    String response = null;
    String xsl ="";
    StringWriter sw = new StringWriter();
    try {
		  TransformerFactory tFactory = TransformerFactory.newInstance();
		  Transformer transformer = tFactory.newTransformer(new StreamSource(xsl));
		  transformer.setParameter("data",data);
		  transformer.setParameter("dataType",dataType);
		  transformer.transform(new StreamSource(xml), new StreamResult(sw));
		  response=sw.toString();
    } catch (Exception e){
	response=e.toString();
	}
    return response;
  }
}
