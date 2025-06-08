#!/bin/bash
# 이 스크립트는 Bash 셸에서 실행됩니다.

# 🔍 Bash란?
# - 리눅스에서 기본으로 많이 사용하는 셸(Shell)입니다.
# - 사용자가 명령어를 입력하면 해석하고 실행해주는 프로그램입니다.
# - #!/bin/bash는 이 스크립트를 Bash로 실행하라는 의미입니다.

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

# 📦 WAR 파일 경로 설정
WAR_SRC=/home/ec2-user/app/dho4.war
TOMCAT_DIR=/opt/tomcat9
WAR_DEST=$TOMCAT_DIR/webapps/ROOT.war

# 📋 로그 출력을 위한 날짜 포함 메시지 함수
log() {
  echo "$(date '+%Y-%m-%d %H:%M:%S') - $1"
}

# 📝 배포 시작 로그 출력
log "배포 스크립트 시작"

# 🧹 기존 WAR 파일 삭제
log "기존 $WAR_DEST 파일 삭제 시도"
rm -f $WAR_DEST
log "$WAR_DEST 삭제 완료"

# 🚚 WAR 파일 이동
log "WAR 파일 이동: $WAR_SRC → $WAR_DEST"
mv $WAR_SRC $WAR_DEST

# ✅ 배포 완료
log "WAR 파일 이동 완료. 톰캣이 자동 배포를 시작할 예정입니다."

# 스크립트 정상 종료
exit 0
