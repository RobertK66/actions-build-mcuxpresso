FROM deepview/mcuxpressoide:11.4.0

COPY buildit.sh /buildit.sh 
RUN chmod +x buildit.sh 

ENTRYPOINT ["/buildit.sh"]
