##########Dockerfile###########
FROM openjdk:8

RUN apt-get update
RUN apt-get install -y wget
RUN apt-get install -y git 
RUN apt-get install -y curl
RUN apt-get install -y vim
RUN apt-get install -y tar

RUN apt-get install -y python3-dev
RUN apt-get install -y python3-pip

WORKDIR /
RUN pip3 install py4j==0.10.9
RUN wget http://nlp.stanford.edu/software/stanford-corenlp-4.1.0.zip
RUN unzip stanford-corenlp-4.1.0.zip
RUN mv stanford-corenlp-4.1.0/* ./
RUN wget http://nlp.stanford.edu/software/stanford-corenlp-4.1.0-models-english-kbp.jar
RUN wget https://repo1.maven.org/maven2/net/sf/py4j/py4j/0.10.7/py4j-0.10.7.jar

####neo4j
WORKDIR /
RUN pip3 install neo4j==4.1.1
RUN wget http://neo4j.com/artifact.php?name=neo4j-community-3.5.12-unix.tar.gz
RUN tar -xf 'artifact.php?name=neo4j-community-3.5.12-unix.tar.gz'
####flask
WORKDIR /
RUN pip3 install Werkzeug==0.16.1
RUN pip3 install flask==1.1.2
RUN pip3 install flask_restplus==0.13.0
RUN git clone https://github.com/gaoyuanliang/jessica_flusk.git
RUN mv jessica_flusk/* ./

###
RUN echo "tyfdeh"

RUN git clone https://github.com/gaoyuanliang/jessica_relation_extraction_docker.git
RUN mv jessica_relation_extraction_docker/* ./
RUN bash jessica_build_java_class.sh

RUN git clone https://github.com/yanliang12/yan_neo4j_docker.git
RUN mv /yan_neo4j_docker/* ./
RUN rm -r yan_neo4j_docker

RUN git clone https://github.com/gaoyuanliang/jessica_knowledge_extraction.git
RUN mv jessica_knowledge_extraction/* ./
RUN rm -r jessica_knowledge_extraction

RUN rm Dockerfile*

CMD python3 app_path.py
##########Dockerfile###########
