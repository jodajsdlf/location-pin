<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
    <head>
   		<meta charset="UTF-8"> 
   		<title>card</title>
        <meta http-equiv="x-ua-compatible" content="IE=edge,chrome=1">
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0">
        <!-- base css -->
        <link id="vendorsbundle" rel="stylesheet" media="screen, print" href="<%= request.getContextPath() %>/ui/css/vendors.bundle.css">
        <link id="appbundle" rel="stylesheet" media="screen, print" href="<%= request.getContextPath() %>/ui/css/app.bundle.css">
        <link id="mytheme" rel="stylesheet" media="screen, print" href="<%= request.getContextPath() %>/ui/css/themes/cust-theme-1.css" color="#">
        <link id="myskin" rel="stylesheet" media="screen, print" href="<%= request.getContextPath() %>/ui/css/skins/skin-master.css">
		<link rel="stylesheet" media="screen, print" href="<%= request.getContextPath() %>/ui/css/notifications/sweetalert2/sweetalert2.bundle.css">	
		<link rel="stylesheet" media="screen, print" href="<%= request.getContextPath() %>/ui/css/miscellaneous/fullcalendar/fullcalendar.bundle.css">	
		<link rel="stylesheet" media="screen, print" href="<%= request.getContextPath() %>/ui/css/notifications/toastr/toastr.css">
        <link rel="stylesheet" href="<%= request.getContextPath() %>/ui/css/demo.css">
        <link rel="stylesheet" href="<%= request.getContextPath() %>/ui/css/font/font.css">
        <link rel="icon" type="image/png" sizes="32x32" href="<%= request.getContextPath() %>/ui/img/logo.png">
        <!-- JavaScript -->
        <script src="<%= request.getContextPath() %>/ui/js/vendors.bundle.js"></script>
        <script src="<%= request.getContextPath() %>/ui/js/notifications/sweetalert2/sweetalert2.bundle.js"></script>
        <script src="<%= request.getContextPath() %>/ui/js/notifications/toastr/toastr.js"></script>
		
