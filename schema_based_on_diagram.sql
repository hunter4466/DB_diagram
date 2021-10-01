CREATE TABLE IF NOT EXISTS patients (
  id int GENERATED ALWAYS AS IDENTITY,
  name VARCHAR(100) NOT NULL,
  date_of_birth DATE NULL,
  PRIMARY KEY (id));
  
CREATE TABLE IF NOT EXISTS medical_histories (
  id int GENERATED ALWAYS AS IDENTITY,
  admitted_at TIMESTAMP NOT NULL,
  patients_id INT NOT NULL,
  status VARCHAR(45) NOT NULL,
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
 
 CREATE TABLE IF NOT EXISTS medical_histories_has_treatments (
  id int GENERATED ALWAYS AS IDENTITY,
  medical_histories_id INT NOT NULL,
  treatments_id INT NOT NULL,
  PRIMARY KEY (id, medical_histories_id, treatments_id),
  CONSTRAINT fk_medical_histories_has_treatments_medical_histories1
    FOREIGN KEY (medical_histories_id)
    REFERENCES medical_histories (id),
  CONSTRAINT fk_medical_histories_has_treatments_treatments1
    FOREIGN KEY (treatments_id)
    REFERENCES treatments (id));
 
   
   
   CREATE TABLE IF NOT EXISTS invoice_items (
  id int GENERATED ALWAYS AS IDENTITY,
  unit_price DECIMAL(10,2) NOT NULL,
  quantity INT NOT NULL,
  total_price DECIMAL(10,2) NOT NULL,
  treatments_id INT NOT NULL,
  invoices_id INT NOT NULL,
  PRIMARY KEY (id),  
  CONSTRAINT fk_invoice_items_treatments1
    FOREIGN KEY (treatments_id)
    REFERENCES treatments (id),
  CONSTRAINT fk_invoice_items_invoices1
    FOREIGN KEY (invoices_id)
    REFERENCES invoices (id));
    
   
   
   CREATE INDEX fk_medical_histories_patients_idx ON medical_histories(patients_id ASC);
   
   CREATE INDEX fk_invoices_medical_histories1_idx ON invoices(medical_histories_id ASC);
   
   CREATE INDEX fk_medical_histories_has_treatments_treatments1_idx ON medical_histories_has_treatments(treatments_id ASC);
 CREATE INDEX fk_medical_histories_has_treatments_medical_histories1_idx ON medical_histories_has_treatments(medical_histories_id ASC);
  
 CREATE INDEX fk_invoice_items_treatments1_idx ON invoice_items(treatments_id ASC);
  CREATE INDEX fk_invoice_items_invoices1_idx ON invoice_items(invoices_id ASC);