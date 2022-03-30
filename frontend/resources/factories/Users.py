from faker import Faker
fake = Faker()

def screenshot_name():
    return fake.sha1()
# import bcrypt

# def get_hashed_pass(password):
#     hashed = bcrypt.hashpw(password.encode('utf-8'), bcrypt.gensalt(8))
#     return hashed


def factory_user(target):

    data = {
        'faker': {
            'name': fake.first_name(),
            'lastname': fake.last_name(),
            'email': fake.free_email(),
            'password': 'pwd123'
        },
        'wrong_email': {
            'name': 'Pedro',
            'lastname': 'De Lara',
            'email': 'pedro_dl*hotmail.com',
            'password': 'abc123'
        },
        'login': {
           'name': 'paulinha',
            'lastname': 'onofre',
            'email': 'paulinha.jampa@gmail.com',
            'password': 'paula1983',    
            'password_hash': '$2b$08$incWFVZG7AtQ6JIUdKdDmufquc9dEWWwjPu8cVw8UUAAiWl1hikCG'
        },
        'be_geek': {
            'name': 'paulinha',
            'lastname': 'onofre',
            'email': 'paulinha.jampa@gmail.com',
            'password': 'paula1983',
            'password_hash': '$2b$08$incWFVZG7AtQ6JIUdKdDmufquc9dEWWwjPu8cVw8UUAAiWl1hikCG',
            'geek_profile': {
                'whats': '11999999999',
                'desc': 'Seu computador está lento? Reiniciando do nada? Talvez seja um vírus, ou algum hardware com defeito. Posso fazer a manutenção no seu PC, formando, reinstalando o SO, trocando algum componente físico e porque não remover o baidu ou qualquer outro malware.',
                'printer_repair': 'Sim',
                'work': 'Remoto',
                'cost': '500'
            }
        },
        "attempt_be_geek": {
            'name': 'paulinha',
            'lastname': 'Onofre',
            'email': 'paulinha.jampa@gmail.com',
            'password': 'paula1983',
            'password_hash': '$2b$08$incWFVZG7AtQ6JIUdKdDmufquc9dEWWwjPu8cVw8UUAAiWl1hikCG',
            'geek_profile': {
                'whats': '11888888888',
                'desc': 'attempt Distros Ubuntu, Debian, ElementaryOS, PopOS, Linux Mint, Kurumin, Mandrake, Connectiva, Fedora, RedHat, CentOS, Slackware, Gentoo, Archlinux, Kubuntu, Xubuntu, Suze, Mandriva, Edubuntu, KateOS, Sabayon Linux, Manjaro Linux, BigLinu',
                'printer_repair': 'Não',
                'work': 'Ambos',
                'cost': '200'
            }
        }
    }

    return data[target]


################### GEEK
