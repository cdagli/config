export USER=caner

function gbn()
{
    export branchName=`git rev-parse --abbrev-ref HEAD 2> /dev/null`
    if [ "$branchName" != "" ]; then
        export CSCOPE_DB=$HOME/.cscope/foo$branchName.cscope.out
        echo "|branch:$branchName|"
    fi
}

export PS1='\u @ \H : \w\n$ '

alias ls='ls -hp'
alias la='ls -a'
alias lls='ls --color=always -l --time-style=full-iso'
alias lla='lls -a'

alias cls='clear;ls'
alias cla='clear;la'
alias clls='clear;lls'
alias clla='clear;lla'

alias bc='bc -l'
alias rm='rm -i'
alias dir='ls -la'
alias diff=colordiff

alias gc='git commit'
alias gs='git status'
alias ga='git add'
alias gp='git pull'
alias gpom='git pull origin master'
alias cucfa='git diff-index --name-only --diff-filter=AM HEAD | xargs ucfa -t'

export TERM=xterm-color
PS1="\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;33m\]\w\[\033[01;34m\]\$(gbn)\[\033[00m\]\n$ "

### let's get some core files created
ulimit -c unlimited
ulimit -n 640000

#kafka operations
alias start_zk='/opt/uaw/noarch/kafka_2.10-0.8.2.1/bin/zookeeper-server-start.sh /opt/uaw/noarch/kafka_2.10-0.8.2.1/config/zookeeper.properties'
alias start_kafka='/opt/uaw/noarch/kafka_2.10-0.8.2.1/bin/kafka-server-start.sh /opt/uaw/noarch/kafka_2.10-0.8.2.1/config/server.properties'
function add_kafka_topic()
{
    /opt/uaw/noarch/kafka_2.10-0.8.2.1/bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic $1
}

function run_producer()
{
    /opt/uaw/noarch/kafka_2.10-0.8.2.1/bin/kafka-console-producer.sh --broker-list localhost:9092 --topic $1
}

function run_consumer()
{
    /opt/uaw/noarch/kafka_2.10-0.8.2.1/bin/kafka-console-consumer.sh --zookeeper localhost:2181 --topic $1 --from-beginning
}

alias start_app='$UNSCRAMBL_HOME/bin/services_manager start -c $UNSCRAMBL_HOME/etc/drive.json'
alias stop_app='$UNSCRAMBL_HOME/bin/services_manager stop -c $UNSCRAMBL_HOME/etc/drive.json'
alias test_js='(cd $UNSCRAMBL_DRIVE_UI_PATH && npm run test)'
alias test_integration='$UNSCRAMBL_GITROOT/src/python/infra/unscrambl/code_quality/apps/trial_runner --reporter unscrambl --temp-directory $UNSCRAMBL_TEST_RESULTS_DIR_PYTHON/trial_temp_dir --test-descriptor $UNSCRAMBL_GITROOT/test/python/tests/drive/test_run_drive_e2e_tests.py'
alias test_integration_old='(cd $UNSCRAMBL_GITROOT/test/python/tests && trial drive.test_run_drive_e2e_tests)'
alias test_manual_integration='(go_app && xvfb-run $UNSCRAMBL_PROTRACTOR_PATH tests/e2e/protractor.conf.js --browser=chrome --baseUrl=https://localhost:8443/drive)'
alias test_manual_integration_with_ui='(go_app && $UNSCRAMBL_PROTRACTOR_PATH tests/e2e/protractor.conf.js --browser=chrome --baseUrl=https://localhost:8443/drive)'
alias test_manual_integration_firefox_with_ui='(go_app && $UNSCRAMBL_PROTRACTOR_PATH tests/e2e/protractor.conf.js --browser=firefox --baseUrl=https://localhost:8443/drive)'
alias go_src='cd $UNSCRAMBL_GITROOT/src/web'
alias soft_clean_app='rm -f $UNSCRAMBL_INSTANCE_HOME/tomcat/webapps/drive.war; rm -rf $UNSCRAMBL_INSTANCE_HOME/tomcat/webapps/drive'
alias clean_app='(cd $UNSCRAMBL_GITROOT && make clean)'
alias build_app='(cd $UNSCRAMBL_GITROOT && make install)'
alias refresh_app='(soft_clean_app && build_app)'
alias rebuild_app='(clean_app && build_app)'
alias go_public='cd $UNSCRAMBL_INSTANCE_HOME/tomcat/webapps/drive'
alias go_root='cd $UNSCRAMBL_GITROOT'
alias go_app='cd $UNSCRAMBL_DRIVE_UI_PATH'
alias build_drive='(cd $UNSCRAMBL_GITROOT/src/java && ant build)'
alias build_drive_ui='(cd $UNSCRAMBL_GITROOT/src/java && ant build-drive-ui)'
alias refresh_source='source ~/.bashrc'
alias refresh_ui='$UNSCRAMBL_GITROOT/src/bash/infra/build/tomcat_webapps_updater'
alias edit_bashrc='vim ~/.bashrc; refresh_source'
alias open_intellij='nohup $UNSCRAMBL_GITROOT/src/python/infra/unscrambl/code_quality/apps/intellij_runner > ~/nohup.out 2>&1&'

# Custom commands

