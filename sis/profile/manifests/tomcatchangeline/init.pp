class profile::tomcatchangeline::init (
   $dir1 = "/opt/app/tomcat801",
   $dir2 = " /application/tomcat801",
   $dir3 = " /application/tomcat802",
) {
   exec { "chk_whether_tomcat_exists":
     command => "true",
     path    =>  ["/usr/bin","/usr/sbin", "/bin"],
     onlyif  =>   "test -d  ${dir1} || test -d  ${dir2} || test -d  ${dir3}",
   }
   
   file_line { 'Add text to /opt/app/tomcat801/conf/server.xml':
      path  => '/opt/app/tomcat801/conf/server.xml',
      line  => '<Valve className="org.apache.catalina.valves.ErrorReportValve" showReport="false" showServerInfo="false" />',
      after => '<Host name=',
      require => Exec["chk_whether_tomcat_exists"],
   }
   
   file_line { 'Add text to /application/tomcat801/conf/server.xml':
      path  => '/application/tomcat801/conf/server.xml',
      line  => '<Valve className="org.apache.catalina.valves.ErrorReportValve" showReport="false" showServerInfo="false" />',
      after => '<Host name=',
      require => Exec["chk_whether_tomcat_exists"],
   }

   file_line { 'Add text to /application/tomcat802/conf/server.xml':
      path  => '/application/tomcat802/conf/server.xml',
      line  => '<Valve className="org.apache.catalina.valves.ErrorReportValve" showReport="false" showServerInfo="false" />',
      after => '<Host name=',
      require => Exec["chk_whether_tomcat_exists"],
   }


}
