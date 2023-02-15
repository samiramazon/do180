FROM jboss/base-jdk:11

# Set environment variables
ENV JBOSS_HOME /opt/jboss
ENV LAUNCH_JBOSS_IN_BACKGROUND true

# Download and install JBoss
RUN curl -O https://github.com/wildfly/wildfly/releases/download/27.0.1.Final/wildfly-27.0.1.Final.tar.gz \
    && tar -xvf wildfly-27.0.1.Final.tar.gz \
    && mv wildfly-27.0.1.Final $JBOSS_HOME \
    && rm wildfly-27.0.1.Final.tar.gz
# User 
USER jboss

# Expose the JBoss management port
EXPOSE 9990

# Start JBoss
RUN $JBOSS_HOME/wildfly-27.0.1.Final/bin/add-user.sh admin123 -silent
CMD ["/opt/jboss/wildfly-27.0.1.Final/bin/standalone.sh", "-b", "0.0.0.0", "-bmanagement", "0.0.0.0"]
