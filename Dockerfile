FROM deepview/mcuxpressoide:latest

COPY buildit.sh /buildit.sh 
RUN chmod +x buildit.sh 

ENTRYPOINT ["/buildit.sh"]
