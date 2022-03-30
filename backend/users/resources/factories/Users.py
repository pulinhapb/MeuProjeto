

def factory_new_user():

    return {
        'name': 'Paulinha via API',
        'email': 'paulinha.jampa@gmail.com',
        'password': 'pwd123'
    }

def factory_duplicado():

    return {
        'name': 'Paulinha via API ',
        'email': 'paulaAPI@paulapi.com',
        'password': 'pwd123'
    }
def factory_get_user():

    return {
        'name': 'Pedro Onofre',
        'email': 'paulinhajampa@paulinha.com',
        'password': 'pwd123'
    }

def factory_remove_user():

    return {
        'name': 'Paula remover',
        'email': 'paulinhajampa@paulinhaAPI.com',
        'password': 'pwd123'
    }

def factory_update_user():

    email = 'paulinha.jampa@gmail.com'   #'paulinha@automacao.com.br'

    return {
        'before': {
            'name': 'Paula Onofre',
            'email': email,
            'password': 'pwd123'
        },
        'after': {
            'name': 'Onofre Paula',
            'email': email,
            'whatsapp': '839994401626',
            'avatar': 'https://www.rpsengenharia.com.br/wp-content/uploads/2020/06/flores-de-inverno-conheca-10-especies-que-gostam-do-frio.jpeg'
        }
    }

def factory_user_session(target):

    name = 'Paula Onofrinho'
    email = 'paulinha.jampa@hotmail.com'
    password = 'pwd123'

    data = {
        'signup': {
            'name': name,
            'email': email,
            'password': password
        },
        'login': {
            'email': email,
            'password': password
        }
    }

    return data[target]

def factory_be_geek():

    return {
        'name': 'Onofre Paula',
        'email': 'paulinha@automacao.com.br',
        'password': 'pwd123',
        'geek_profile': {
            'whatsapp': '11999999999',
            'desc': 'Seu computador está lento? Reiniciando do nada? Talvez seja um vírus, ou algum hardware com defeito. Posso fazer a manutenção no seu PC, formando, reinstalando o SO, trocando algum componente físico e porque não remover o baidu ou qualquer outro malware.',
            'printer_repair': 'Sim',
            'work': 'Presencial',
            'cost': '150.99'
        }
    }

def factory_search_for_geeks():

    return {
        'user': {
            'name': 'Peter Quill',
            'email': 'quill@marvel.com',
            'password': 'pwd123'
        },
        'geeks': [
            {
                'name': 'Riri Willians',
                'email': 'riri@marvel.com',
                'password': 'pwd123',
                'geek_profile': {
                    'whatsapp': '11999999999',
                    'desc': 'Seu computador está lento? Reiniciando do nada? Talvez seja um vírus, ou algum hardware com defeito. Posso fazer a manutenção no seu PC, formando, reinstalando o SO, trocando algum componente físico e porque não remover o baidu ou qualquer outro malware.',
                    'printer_repair': 'Não',
                    'work': 'Presencial',
                    'cost': '100'
                }
            },
            {
                'name': 'Arnim Zola',
                'email': 'zola@hidra.com',
                'password': 'pwd123',
                'geek_profile': {
                    'whatsapp': '21999999999',
                    'desc': 'Instalo Distros Ubuntu, Debian, ElementaryOS, PopOS, Linux Mint, Kurumin, Mandrake, Connectiva, Fedora, RedHat, CentOS, Slackware, Gentoo, Archlinux, Kubuntu, Xubuntu, Suze, Mandriva, Edubuntu, KateOS, Sabayon Linux, Manjaro Linux, BigLinux, ZorinOS, Unit',
                    'printer_repair': 'Não',
                    'work': 'Ambos',
                    'cost': '110'
                }
            },
            {
                'name': 'Reed Richards',
                'email': 'reed@fantastic4.com',
                'password': 'pwd123',
                'geek_profile': {
                    'whatsapp': '31999999999',
                    'desc': 'Instalado e faço manutenção em qualquer tipo de impressora, matricial padrão, matricial fiscal, a jato, a cera, a laser e até 3D. Também faço remold de fitas coloridas para Epson LX300. ',
                    'printer_repair': 'Sim',
                    'work': 'Remoto',
                    'cost': '120'
                }
            }
        ]
    }