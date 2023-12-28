FROM public.ecr.aws/lambda/python:3.12

# Install the function's dependencies using file requirements.txt
# from your project
COPY requirements.txt ${LAMBDA_TASK_ROOT}/requirements.txt
RUN  pip3 install -r requirements.txt --target "${LAMBDA_TASK_ROOT}"

# Copy function code
COPY awslambda ${LAMBDA_TASK_ROOT}/awslambda
COPY telegrambot ${LAMBDA_TASK_ROOT}/telegrambot
COPY nure ${LAMBDA_TASK_ROOT}/nure

# Set the CMD to your handler (could also be done as a parameter override outside of the Dockerfile)
CMD [ "awslambda.app.lambda_handler" ]


