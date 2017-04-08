alias a='source aliases.sh'
alias subl='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'
alias ea='subl aliases.sh'

KEY='-i /Users/jiwon/keys/amazon.jiwon.pem'
PIGFARM0='ubuntu@ec2-52-25-245-158.us-west-2.compute.amazonaws.com'
PIGFARM1='ubuntu@ec2-54-149-117-43.us-west-2.compute.amazonaws.com'

alias sp0="ssh $KEY $PIGFARM0"
alias sp1="ssh $KEY $PIGFARM1"

alias ssh-pigfarm='sp1'

alias cpdb2="
	ssh $KEY $PIGFARM0 'cd ~; rm -rf dump; mongodump; tar czvf dump.tar.gz dump'
	scp $KEY $PIGFARM0:/home/ubuntu/dump.tar.gz .
	scp $KEY dump.tar.gz $PIGFARM1:/home/ubuntu
	ssh $KEY $PIGFARM1 'cd ~; tar xvf dump.tar.gz; mongorestore db'
"

alias cpall="
	ssh $KEY $PIGFARM0 'cd ~; cd ..; sudo tar czvf ubuntu.tar.gz ubuntu'
	scp $KEY $PIGFARM0:/home/ubuntu.tar.gz .
	scp $KEY ubuntu.tar.gz $PIGFARM1:/home
	ssh $KEY $PIGFARM1 'cd ~; cd ..; sudo tar xvf ubuntu.tar.gz'
"
