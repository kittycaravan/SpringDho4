#!/bin/bash
# 이 스크립트는 Bash 셸에서 실행됩니다.

# 🔍 이 스크립트의 목적:
# - 현재 실행 중인 톰캣 서버를 중지하고,
# - 이전에 배포된 웹 애플리케이션 파일(예: ROOT.war, ROOT 폴더 등)을 삭제하여
#   새 버전의 웹 앱이 충돌 없이 배포될 수 있도록 준비합니다.

# 톰캣이 설치된 디렉토리를 변수로 정의합니다.
TOMCAT_DIR=/opt/tomcat9

# 콘솔에 톰캣 중지 메시지를 출력합니다.
echo "Stopping Tomcat..."

# 톰캣을 중지하는 스크립트를 실행합니다.
# 만약 톰캣이 이미 꺼져 있어도 에러가 발생하지 않도록 하기 위해 "|| true"를 붙입니다.
$TOMCAT_DIR/bin/shutdown.sh || true

# 톰캣이 완전히 종료될 때까지 약간의 대기 시간을 줍니다.
sleep 10

# 기존에 배포된 웹 애플리케이션 파일 및 폴더를 삭제합니다.
# 예: ROOT.war, ROOT/ 디렉토리 등
rm -rf $TOMCAT_DIR/webapps/ROOT*

# 이전에 배포된 WAR 파일도 삭제
rm -f /home/ec2-user/app/dho4.war

# 스크립트가 정상 종료되었음을 시스템에 알립니다.
exit 0
