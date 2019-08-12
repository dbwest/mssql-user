FROM mcr.microsoft.com/mssql/server:latest

ENV RUN_USER dbuser
ENV RUN_GROUP dbgroup

ENV SA_PASSWORD=Swordfish2001$$$ \
    MSSQL_PID=Express \
    ACCEPT_EULA=Y

RUN groupadd -r -g 1000 dbgroup
RUN useradd -u 1000 -m -g 1000 dbuser

RUN mkdir /var/opt/mssql && \
    chown -R dbuser:dbgroup /var/opt/mssql && \
    chmod -R 770 /var/opt/mssql

RUN mkdir /scripts

EXPOSE 1433

USER ${RUN_USER}:${RUN_GROUP}
