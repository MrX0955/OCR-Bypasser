from requests    import Session
from shutil      import copyfileobj
from uuid        import uuid4
from os          import remove
from PIL         import Image
from pytesseract import image_to_string

def captcha_coz(url):
    captcha_resmi = f"captcha_{uuid4()}.jpg"

    oturum = Session()

    captcha_istek = oturum.get(url, stream=True)
    with open(captcha_resmi, "wb") as file:
        copyfileobj(captcha_istek.raw, file)

    captcha_metni = image_to_string(Image.open(captcha_resmi))
    remove(captcha_resmi)
    return captcha_metni
