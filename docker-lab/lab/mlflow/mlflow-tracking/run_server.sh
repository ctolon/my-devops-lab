
run() {
  STORE_URI=postgresql+psycopg2://postgres:mysecret@postgresql/mlflow?sslmode=disable
  MLFLOW_ARTIFACT_URI=s3://mlflow
  echo "STORE_URI=$STORE_URI"
  echo "MLFLOW_ARTIFACT_URI=$MLFLOW_ARTIFACT_URI"
  mlflow server --app-name=basic-auth --host 0.0.0.0 --port 5000 --backend-store-uri $STORE_URI --default-artifact-root $MLFLOW_ARTIFACT_URI --expose-prometheus /temp/prometheus_metrics
}

run $* 2>&1 | tee server.log
