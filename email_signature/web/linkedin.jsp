<%-- 
    Document   : linkedin
    Created on : Mar 29, 2016, 11:00:19 PM
    Author     : PRANSH
--%>
<%@page import="java.sql.Connection"%>
<%@page import="org.jsoup.nodes.Element"%>
<%@page import="org.jsoup.select.Elements"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="java.sql.*, java.io.*, java.text.SimpleDateFormat, java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%try {
        //url will be received from index.jsp
        String url = "";
        url=request.getParameter("url");
        String fname = "", loc = "", indus = "", org = "", edu = "";
        int k;
        //Using Jsoup Library for scraping, and extracting html and css from websites
        Document doc = Jsoup.connect(url).get();
        String title = doc.title();
        //name is extracted from the title of the linkedin page
        for (int i = 0; i < title.length(); i++) {
            if (title.charAt(i) == '|') {
                break;
            }
            fname += title.charAt(i);
        }
        //organisation the employee works for and previous education is captured from the ordered list
        try {
            Elements organisations = doc.select("ol");
            k = 0;
            for (Element organisation : organisations) {
                System.out.println(organisation.text());
                if ("a b c d e f g h i j k l m n o p q r s t u v w x y z more Browse members by country".equals(organisation.text())) {
                    
                }
                else if (k == 0) {
                    org = organisation.text();
                } else {
                    edu = organisation.text();
                }
                k++;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        //location and industry is captured from the dd tag
        try {
            Elements names = doc.select("dd");
            k = 0;
            for (Element name : names) {
                //System.out.println(name.text());
                if (k == 0) {
                    loc = name.text();
                } else if (k == 1) {
                    indus = name.text();
                }
                k++;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("Name:" + fname);
        System.out.println("Location:" + loc);
        System.out.println("Industry:" + indus);
        System.out.println("Organisation:" + org);
        System.out.println("Education:" + edu);
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = null;
            PreparedStatement st = null;
            //database:sign username:root password:root...Change Accordingly for your database
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sign", "root", "root");
            if (con != null) {
                System.out.println("Connection successful");
            }
            //table name:email_signature
            String sql = "insert into email_signature(name,location,industry,organisation,education) values(?,?,?,?,?);";
            st = con.prepareStatement(sql);
            st.setString(1, fname);
            st.setString(2, loc);
            st.setString(3, indus);
            st.setString(4, org);
            st.setString(5, edu);
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

    } catch (Exception e) {
        e.printStackTrace();
        System.out.println();
    }
%>

