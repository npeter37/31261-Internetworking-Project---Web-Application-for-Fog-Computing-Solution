<%-- 
    Document   : UploadFile
    Created on : 26/09/2017, 6:33:55 PM
    Author     : James
--%>

<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="java.io.File"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="sftp.JschSftpConnect"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Upload File</title>
        <link rel="stylesheet" href="css/MainFormat.css" />
        
        <%
            if (session.getAttribute("user") == null) {
                response.sendRedirect("Home.jsp");
            } else {
                File file;
                int maxFileSize = 5000 * 1024;
                int maxMemSize = 5000 * 1024;
                String filePath = ".\\";
                String contentType = request.getContentType();

                if ((contentType.indexOf("multipart/form-data") >= 0)) {
                    DiskFileItemFactory factory = new DiskFileItemFactory();
                    factory.setSizeThreshold(maxMemSize);

                    factory.setRepository(new File("c:\\temp"));

                    ServletFileUpload upload = new ServletFileUpload(factory);

                    upload.setSizeMax(maxFileSize);

                    try {
                        List fileItems = upload.parseRequest(request);

                        Iterator i = fileItems.iterator();

                        User user = (User) session.getAttribute("user");
                        JschSftpConnect connection = new JschSftpConnect("127.0.0.1", "tester", "password", user);        
                        while (i.hasNext()) {
                            FileItem fi = (FileItem)i.next();
                            if (!fi.isFormField()) {
                                String fieldName = fi.getFieldName();
                                String fileName = fi.getName();
                                boolean isInMemory = fi.isInMemory();
                                long sizeInBytes = fi.getSize();

                                // write the file
                                if (fileName.lastIndexOf("\\") >= 0) {
                                    file = new File (filePath + fileName.substring(fileName.lastIndexOf("\\")));
                                } else {
                                    file = new File (filePath + fileName.substring(fileName.lastIndexOf("\\")+1));
                                }
                                connection.upload(fi, fileName);
                            }
                            connection.closeConnection();
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        response.sendRedirect("ViewFiles.jsp");
                    }
                }
            }
        %>
    </head>
    <body>
        <jsp:include page="Menu.jsp" />
        <p>Uploading file</p>
    </body>
</html>
