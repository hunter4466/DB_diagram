CREATE TABLE IF NOT EXISTS patients (
  id int GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(100) NOT NULL,
  date_of_birth DATE NULL,
  PRIMARY KEY (id));
  
CREATE TABLE IF NOT EXISTS medical_histories (
  id int GENERATED ALWAYS AS IDENTITY,
  admitted_at TIMESTAMP NOT NULL,
  patients_id INT NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_medical_histories_patients
    FOREIGN KEY (patients_id)
    REFERENCES patients (id));
    
CREATE TABLE IF NOT EXISTS invoices (
  id int GENERATED ALWAYS AS IDENTITY,
  total_amount DECIMAL(10,2) NOT NULL,
  generated_at TIMESTAMP NOT NULL,
  payed_at TIMESTAMP NOT NULL,
  medical_histories_id INT NOT NULL,
  PRIMARY KEY (id),
  CONSTRAINT fk_invoices_medical_histories1
    FOREIGN KEY (medical_histories_id)
    REFERENCES medical_histories (id));

   CREATE TABLE IF NOT EXISTS treatments (
  id int GENERATED ALWAYS AS IDENTITY,
  type VARCHAR(45) NOT NULL,
  name VARCHAR(45) NOT NULL,
  PRIMARY KEY (id));