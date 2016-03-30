<%-- 
    Document   : twitter
    Created on : Mar 28, 2016, 10:20:45 AM
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
        //url = "https://twitter.com/Pransht?lang=en";
        String loc = "", work = "", handle = "", lnk = "", dob = "", join = "", date1 = "", date2 = "", name = "";
        int k;
        //Using Jsoup Library for scraping, and extracting html and css from websites
        Document doc = Jsoup.connect(url).get();
        //location
        try {
            Elements locations = doc.select("span.ProfileHeaderCard-locationText.u-dir");
            for (Element location : locations) {
                System.out.println(location.text());
                loc = location.text();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        //job
        try {
            Elements jobs = doc.select("p.ProfileHeaderCard-bio.u-dir");
            for (Element job : jobs) {
                System.out.println(job.text());
                work = job.text();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        //handle
        k = 0;
        try {
            Elements hs = doc.select("span.u-linkComplex-target");
            for (Element h : hs) {
                if (k > 0) {
                    break;
                }
                k++;
                System.out.println(h.text());
                handle = h.text();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        //name
        try {
            Elements links = doc.select("h1.ProfileHeaderCard-name");
            for (Element link : links) {
                System.out.println(link.text());
                name = link.text();
            }
            if (name.endsWith("Verified account")) {
                name = name.substring(0, name.length() - 16);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        //link
        try {
            Elements links = doc.select("span.ProfileHeaderCard-urlText.u-dir");
            for (Element link : links) {
                System.out.println(link.text());
                lnk = link.text();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        //Date of Birth
        k = 0;
        try {
            Elements links = doc.select("span.js-tooltip");
            for (Element link : links) {
                System.out.println(link.text());
                if (k == 0) {
                    date1 = link.text();
                } else {
                    date2 = link.text();
                }
                k++;
            }
            if (k == 1) {
                if (date1.charAt(0) == 'J') {
                    join = date1.substring(7);
                } else {
                    dob = date1.substring(8);
                }
            } else if (k == 2) {
                if (date1.charAt(0) == 'J') {
                    join = date1.substring(7);
                } else {
                    dob = date1.substring(8);
                }

                if (date2.charAt(0) == 'J') {
                    join = date2.substring(7);
                } else {
                    dob = date2.substring(8);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("Name:" + name);
        System.out.println("Handle:" + handle);
        System.out.println("Link:" + lnk);
        System.out.println("Work:" + work);
        System.out.println("Location:" + loc);
        System.out.println("Date of Birth:" + dob);
        System.out.println("Join Date:" + join);
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
            String sql = "insert into twitter_signature(name,handle,link,work,location,dateOfBirth,joiningDate) values(?,?,?,?,?,?,?);";
            st = con.prepareStatement(sql);
            st.setString(1, name);
            st.setString(2, handle);
            st.setString(3, lnk);
            st.setString(4, work);
            st.setString(5, loc);
            st.setString(6, dob);
            st.setString(7, join);
            st.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    } catch (Exception e) {
        e.printStackTrace();
        System.out.println();
    }
%>
