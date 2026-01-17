import os
import zipfile
import base64
import tempfile

def zip_and_encode():
    terraform_dir = os.path.join(os.getcwd(), "terraform")

    if not os.path.isdir(terraform_dir):
        raise RuntimeError("terraform directory not found in repo")

    with tempfile.NamedTemporaryFile(suffix=".zip", delete=False) as tmp:
        with zipfile.ZipFile(tmp.name, "w", zipfile.ZIP_DEFLATED) as z:
            for root, _, files in os.walk(terraform_dir):
                for f in files:
                    full = os.path.join(root, f)
                    arc = os.path.relpath(full, terraform_dir)
                    z.write(full, arc)

        with open(tmp.name, "rb") as f:
            print(base64.b64encode(f.read()).decode())

if __name__ == "__main__":
    zip_and_encode()
