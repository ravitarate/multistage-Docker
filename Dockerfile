#get base image with python 3.9
# -----------stage 1 ------#
FROM python:3.9 AS backend-builder
#your working directory 
WORKDIR /app

#copy the source code to the workdir in contianer 
COPY . .

#install all the required dependencies with backend builder base 
RUN pip install -r requirements.txt

#---------stage 2 -----#
FROM python:3.9-slim

 
WORKDIR /app 

COPY --from=backend-builder /usr/local/lib/python3.9/site-packages/ /usr/local/lib/python3.9/site-packages/

COPY --from=backend-builder /app /app
 
#Run the python app 
CMD ["python","run.py"]
