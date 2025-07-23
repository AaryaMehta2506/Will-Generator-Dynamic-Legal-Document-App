# app.py
from flask import Flask, render_template, request, redirect, url_for
import mysql.connector
from will_generator import generate_will_html
import datetime
from xhtml2pdf import pisa
import os

app = Flask(__name__)

def get_db_connection():
    return mysql.connector.connect(
        host="localhost",
        user="root",
        password="aarya25", 
        database="will_db"
    )

def convert_html_to_pdf(source_html, output_filename):
    with open(output_filename, "w+b") as result_file:
        pisa_status = pisa.CreatePDF(source_html, dest=result_file)
    return pisa_status.err

@app.route('/')
def index():
    return render_template('form.html')

@app.route('/submit', methods=['POST'])
def submit():
    data = request.form.to_dict(flat=True)

    conn = get_db_connection()
    cursor = conn.cursor()

    cursor.execute("""
        INSERT INTO testator (name, father_name, address, will_date)
        VALUES (%s, %s, %s, %s)
    """, (data['name'], data['father_name'], data['address'], data['will_date']))
    testator_id = cursor.lastrowid

    for i in range(1, 4):
        if data.get(f'b_name_{i}'):
            cursor.execute("""
                INSERT INTO beneficiaries (testator_id, name, relationship, id_number, residence, age)
                VALUES (%s, %s, %s, %s, %s, %s)
            """, (
                testator_id,
                data[f'b_name_{i}'],
                data[f'b_relation_{i}'],
                data[f'b_id_{i}'],
                data[f'b_residence_{i}'],
                data[f'b_age_{i}']
            ))

    for i in range(1, 3):
        if data.get(f'bank_name_{i}'):
            cursor.execute("""
                INSERT INTO bank_accounts (testator_id, bank_name, account_number, remark, beneficiary, share)
                VALUES (%s, %s, %s, %s, %s, %s)
            """, (
                testator_id,
                data[f'bank_name_{i}'],
                data[f'account_number_{i}'],
                data[f'bank_remark_{i}'],
                data[f'bank_beneficiary_{i}'],
                data[f'bank_share_{i}']
            ))

    for i in range(1, 3):
        if data.get(f'policy_name_{i}'):
            cursor.execute("""
                INSERT INTO insurance_policies (testator_id, policy_name, policy_number, remark, beneficiary, share)
                VALUES (%s, %s, %s, %s, %s, %s)
            """, (
                testator_id,
                data[f'policy_name_{i}'],
                data[f'policy_number_{i}'],
                data[f'policy_remark_{i}'],
                data[f'policy_beneficiary_{i}'],
                data[f'policy_share_{i}']
            ))

    for i in range(1, 3):
        if data.get(f'stock_firm_{i}'):
            cursor.execute("""
                INSERT INTO stocks (testator_id, firm_name, account_number, remark, beneficiary, share)
                VALUES (%s, %s, %s, %s, %s, %s)
            """, (
                testator_id,
                data[f'stock_firm_{i}'],
                data[f'stock_account_{i}'],
                data[f'stock_remark_{i}'],
                data[f'stock_beneficiary_{i}'],
                data[f'stock_share_{i}']
            ))

    for i in range(1, 3):
        if data.get(f'mf_distributor_{i}'):
            cursor.execute("""
                INSERT INTO mutual_funds (testator_id, distributor, account_number, remark, beneficiary, share)
                VALUES (%s, %s, %s, %s, %s, %s)
            """, (
                testator_id,
                data[f'mf_distributor_{i}'],
                data[f'mf_account_{i}'],
                data[f'mf_remark_{i}'],
                data[f'mf_beneficiary_{i}'],
                data[f'mf_share_{i}']
            ))

    for i in range(1, 3):
        if data.get(f'jewel_type_{i}'):
            cursor.execute("""
                INSERT INTO jewellery (testator_id, jewellery_type, invoice_number, remark, beneficiary, share)
                VALUES (%s, %s, %s, %s, %s, %s)
            """, (
                testator_id,
                data[f'jewel_type_{i}'],
                data[f'jewel_invoice_{i}'],
                data[f'jewel_remark_{i}'],
                data[f'jewel_beneficiary_{i}'],
                data[f'jewel_share_{i}']
            ))

    if data.get('house_name'):
        cursor.execute("""
            INSERT INTO houses (testator_id, property_name, registration_number, remark, beneficiary, share)
            VALUES (%s, %s, %s, %s, %s, %s)
        """, (
            testator_id,
            data['house_name'],
            data['house_regno'],
            data['house_remark'],
            data['house_beneficiary'],
            data['house_share']
        ))

    if data.get('land_name'):
        cursor.execute("""
            INSERT INTO lands (testator_id, land_name, registration_number, remark, beneficiary, share)
            VALUES (%s, %s, %s, %s, %s, %s)
        """, (
            testator_id,
            data['land_name'],
            data['land_regno'],
            data['land_remark'],
            data['land_beneficiary'],
            data['land_share']
        ))

    conn.commit()
    cursor.close()
    conn.close()

    os.makedirs('static', exist_ok=True)
    will_html = generate_will_html(data)
    pdf_path = 'C:/Users/dell/Documents/will_generation/static/generated_will.pdf'
    convert_html_to_pdf(will_html, pdf_path)

    return render_template('will_output.html', will_html=will_html, pdf_path=pdf_path)

if __name__ == '__main__':
    app.run(debug=True)
