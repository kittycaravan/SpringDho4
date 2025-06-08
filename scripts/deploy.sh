
#!/bin/bash
# 이 스크립트는 Bash 셸에서 실행됩니다.

# 🔍 톰캣(Tomcat)이란?
# - 자바 웹 애플리케이션을 실행할 수 있는 웹 서버입니다.
# - 웹 페이지, JSP, 서블릿 등을 실행할 수 있으며,
# - WAR 파일을 통해 웹 애플리케이션을 배포합니다.

# 🔍 ROOT.war란?
# - WAR는 Web Application Archive의 약자로, 웹 애플리케이션 전체를 압축한 파일입니다.
# - 톰캣은 기본적으로 /opt/tomcat9/webapps 폴더를 감시하고,
# - 새로운 .war 파일이 이 폴더에 생기면 자동으로 압축을 해제하고 실행합니다.
# - 파일 이름이 ROOT.war일 경우, 브라우저에서 http://서버주소/ 로 바로 접근 가능합니다.

# 🔄 자동 배포 과정
# 1. 톰캣은 webapps 폴더에 .war 파일이 생성되었는지 주기적으로 확인합니다.
# 2. 새 WAR 파일이 있으면 약 5초~30초 내에 압축을 해제하고 실행을 시작합니다.
#    (파일 크기와 서버 성능에 따라 차이 발생)
# 3. 압축된 파일 내용은 /webapps/ROOT 폴더로 풀리며, 이를 기반으로 웹 앱이 실행됩니다.
# 4. 따라서 기존에 있던 ROOT.war 또는 /ROOT 폴더는 배포 전에 미리 삭제해줘야 합니다.

# WAR 파일이 저장된 위치
WAR_SRC=/home/ec2-user/app/dho4.war

# 톰캣이 설치된 경로
TOMCAT_DIR=/opt/tomcat9

# WAR 파일이 배포될 대상 경로
WAR_DEST=$TOMCAT_DIR/webapps/ROOT.war

# 콘솔에 메시지 출력
echo "Deploying WAR with mv..."

# 기존 ROOT.war 파일 삭제 (중복 방지)
rm -f $WAR_DEST

# 새로운 WAR 파일을 톰캣의 webapps 폴더로 이동하면서 이름을 ROOT.war로 변경
mv $WAR_SRC $WAR_DEST

# 스크립트 정상 종료
exit 0
