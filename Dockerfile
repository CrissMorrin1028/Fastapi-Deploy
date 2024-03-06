FROM tiangolo/uvicorn-gunicorn-fastapi:python3.11
 
WORKDIR /app

# Copiar requirements.txt al directorio /app
COPY requirements.txt /app/requirements.txt

# Instalar las dependencias
RUN pip install --no-cache-dir --upgrade -r /app/requirements.txt

COPY main.py main.py
COPY funciones.py funciones.py
COPY df_final.parquet df_final.parquet
COPY item_similarity_df.joblib item_similarity_df.joblib
COPY user_item_model.joblib user_item_model.joblib

EXPOSE 8000
 
CMD [ "uvicorn", "--host", "0.0.0.0", "main:app" ]