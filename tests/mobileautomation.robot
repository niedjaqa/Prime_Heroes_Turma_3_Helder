***Settings***
Documentation           Aqui neste arquivo estarão presentes os cenários e keywords que dizem respeito 
...                     a automação mobile

Library                 AppiumLibrary

Test Setup              Abrir app
Test Teardown           Close Application

***Variables***


***Test Cases***
Caso de Teste 01: Pesquisa canal "Prime Experts"
    [Tags]  01
    Dado que o cliente esteja na página de Home
    E pesquise um vídeo sobre "Prime Experts"
    E acesse o canal da Prime
    Quando clicar em Inscrever-se 
    Então será apresentado como Inscrito. 

Caso de Teste 02: Logar no YouTube
    [Tags]  02
    Logar no aplicativo com a conta x
    Entrar no menu “Explorar”
    Usar swipe de tela até o 10 item da tela
    Clicar no vídeo

Caso de Teste 03: Usar método Swipe na tela
    [Tags]    03
    Entrar no menu “Explorar”
    Usar swipe de tela até o 10 item da tela
    Clicar no vídeo

***Keywords***
Abrir app
    Open Application            http://localhost:4723/wd/hub
    ...                         udid=emulator-5554
    ...                         platformName=Android
    ...                         androidVersion=11
    ...                         autoGrantPermissions=true
    ...                         appPackage=com.google.android.youtube
    ...                         appActivity=com.google.android.youtube.HomeActivity

Fechar aplicativo
    Close Application

Dado que o cliente esteja na página de Home
    Sleep  5s
    Wait Until Element Is Visible       id=com.google.android.youtube:id/youtube_logo   90
    Element Attribute Should Match     xpath=//android.widget.Button[@content-desc="Home"]      selected        true

E pesquise um vídeo sobre "${BUSCA}"
    Click Element       accessibility_id=Search
    Input Text          id=search_edit_text     ${BUSCA}
    Press KeyCode       66

E acesse o canal da Prime
    Wait Until Element Is Visible       xpath=//android.view.ViewGroup[contains(@content-desc,"Prime Experts - Parceria entre Prime Control e UniBrasil")]
    Click Element                       xpath=//android.view.ViewGroup[contains(@content-desc,"Prime Experts - Parceria entre Prime Control e UniBrasil")]

Quando clicar em Inscrever-se 
    Wait Until Element Is Visible       //android.view.ViewGroup[@content-desc="Subscribe to Prime Control."]  60
    Sleep  5s
    Click Element                       //android.view.ViewGroup[@content-desc="Subscribe to Prime Control."]

Então será apresentado como Inscrito. 
    Wait Until Element Is Visible       //android.view.ViewGroup[@content-desc="Unsubscribe from Prime Control."]  60
    Click Element                       //android.view.ViewGroup[@content-desc="Unsubscribe from Prime Control."]
    Wait Until Element Is Visible       id=android:id/button1  60
    Click Element                       id=android:id/button1

#Cenário:02 
Logar no aplicativo com a conta x
    Wait Until Element Is Visible       //android.widget.ImageView[@content-desc="Account"]                         60
    Click Element                       //android.widget.ImageView[@content-desc="Account"]
    Wait Until Element Is Visible       id=com.google.android.youtube:id/switch_account                             60
    Click Element                       id=com.google.android.youtube:id/switch_account
    Wait Until Element Is Visible       id=com.google.android.youtube:id/sign_out_footer                            60
    Click Element                       id=com.google.android.youtube:id/sign_out_footer
    Sleep  3s
    Wait Until Element Is Visible       //android.widget.ImageView[@content-desc="Account"]                         60
    Click Element                       //android.widget.ImageView[@content-desc="Account"]
    Wait Until Element Is Visible       id=com.google.android.youtube:id/button                                     60
    Click Element                       id=com.google.android.youtube:id/button
    Wait Until Element Is Visible       //android.widget.RelativeLayout[@content-desc="Niedja Qa,No channel"]       60
    Click Element                       //android.widget.RelativeLayout[@content-desc="Niedja Qa,No channel"]
Entrar no menu “Explorar”
     Wait Until Element Is Visible      //android.support.v7.widget.RecyclerView[@content-desc="filters"]/android.widget.LinearLayout[1]    30
     Click Element                      //android.support.v7.widget.RecyclerView[@content-desc="filters"]/android.widget.LinearLayout[1]
Usar swipe de tela até o 10 item da tela
    Wait Until Element Is Visible      //android.view.ViewGroup/android.support.v7.widget.RecyclerView/android.view.ViewGroup[1]
    Swipe                               473  1890  493   415  500
    Swipe                               473  1890  493   415  500
    Swipe                               473  1890  493   415  500

Clicar no vídeo
    Wait Until Element Is Visible       //android.view.ViewGroup/android.support.v7.widget.RecyclerView/android.view.ViewGroup[3]
    Click Element                       //android.view.ViewGroup/android.support.v7.widget.RecyclerView/android.view.ViewGroup[3]


	
	
