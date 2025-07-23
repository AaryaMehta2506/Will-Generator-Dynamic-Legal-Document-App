# will_generator.py
def generate_will_html(data):
    def render_table(rows, headers):
        table = "<table border='1' cellspacing='0' cellpadding='5'><tr>"
        for h in headers:
            table += f"<th>{h}</th>"
        table += "</tr>" + "".join(rows) + "</table>"
        return table

    def collect_rows(prefix, columns, count):
        rows = []
        for i in range(1, count + 1):
            if data.get(f"{prefix}_{columns[0]}_{i}"):
                row = "<tr>" + "".join([f"<td>{data.get(f'{prefix}_{col}_{i}', '')}</td>" for col in columns]) + "</tr>"
                rows.append(row)
        return rows

    sections = {
        "Bank Accounts": ("bank", ["name", "account_number", "remark", "beneficiary", "share"], 2),
        "Insurance Policies": ("policy", ["name", "number", "remark", "beneficiary", "share"], 2),
        "Stocks": ("stock", ["firm", "account", "remark", "beneficiary", "share"], 2),
        "Mutual Funds": ("mf", ["distributor", "account", "remark", "beneficiary", "share"], 2),
        "Jewellery": ("jewel", ["type", "invoice", "remark", "beneficiary", "share"], 2)
    }

    html = f"""
    <html><body>
    <h2>WILL OF {data.get('name')}</h2>
    <p>I, {data.get('name')}, son of {data.get('father_name')}, residing at {data.get('address')}, declare this to be my LAST WILL made on {data.get('will_date')}.</p>
    <p>I revoke all prior wills and bequeath my assets to the following beneficiaries.</p>

    <h3>Beneficiaries</h3>
    {render_table([
        f"<tr><td>{data.get(f'b_name_{i}')}</td><td>{data.get(f'b_relation_{i}')}</td><td>{data.get(f'b_id_{i}')}</td><td>{data.get(f'b_residence_{i}')}</td><td>{data.get(f'b_age_{i}')}</td></tr>"
        for i in range(1, 4) if data.get(f'b_name_{i}')
    ], ["Name", "Relation", "ID", "Residence", "Age"])}
    """

    for title, (prefix, cols, count) in sections.items():
        html += f"<h3>{title}</h3>" + render_table(collect_rows(prefix, cols, count), [col.title() for col in cols])

    html += f"""
    <h3>Immovable Assets</h3>
    <h4>House</h4>
    {render_table([
        f"<tr><td>{data.get('house_name')}</td><td>{data.get('house_regno')}</td><td>{data.get('house_remark')}</td><td>{data.get('house_beneficiary')}</td><td>{data.get('house_share')}</td></tr>"
    ], ["Property Name", "Reg. No", "Remark", "Beneficiary", "% Share"])}

    <h4>Land</h4>
    {render_table([
        f"<tr><td>{data.get('land_name')}</td><td>{data.get('land_regno')}</td><td>{data.get('land_remark')}</td><td>{data.get('land_beneficiary')}</td><td>{data.get('land_share')}</td></tr>"
    ], ["Land Name", "Reg. No", "Remark", "Beneficiary", "% Share"])}

    <p><strong>Residue:</strong> If any assets are left unmentioned, they go to my wife, {data.get('wife_name')}.</p>
    <p><strong>Guardian:</strong> If my wife predeceases me, I appoint {data.get('guardian_name')} as guardian of my children.</p>
    <p><strong>Executors:</strong> {data.get('executor_name')}, son of {data.get('executor_father')}, resident of {data.get('executor_address')}. If unavailable, then {data.get('backup_executor_name')} will execute the will.</p>

    <h3>Signatures</h3>
    <p>Signed at {data.get('signed_location')} on {data.get('will_date')}.</p>
    <p>Witness 1: {data.get('witness1_name')} ({data.get('witness1_address')})</p>
    <p>Witness 2: {data.get('witness2_name')} ({data.get('witness2_address')})</p>
    <p>Testator: {data.get('name')}</p>
    </body></html>
    """
    return html
