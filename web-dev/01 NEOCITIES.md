NEOCITIES est le site parfait pour commencer le développement web !

Il propose d'héberger gratuitement votre site personnel qui peut vous servir de vitrine ou de portfolio pour votre parcours professionnel, construit et publié avec :

- **Nix** — vous donne un environnement Ruby fonctionnel en une seule commande, sans installation manuelle
- **Ruby + le CLI Neocities** — envoie votre site web sur [Neocities](https://neocities.org)
- **GitHub Copilot** — un assistant IA qui écrit et modifie le code pour vous

Vous n'avez **pas** besoin de savoir programmer. Si vous savez copier-coller des commandes et discuter avec une IA, vous pouvez y arriver.

---

## Ce que vous obtiendrez

[](https://github.com/reksadsp/reksa-dsp-instruments#ce-que-vous-obtiendrez)

Un site en ligne à l'adresse `https://VOTRENOM.neocities.org`, que vous pouvez mettre à jour à tout moment en tapant une seule commande.

---

## Étape 1 : créer un compte sur [Neocities](https://neocities.org)

![[neocities.png]]
---

## Étape 2 : entrer dans l'environnement de développement Nix

Tout ce dont vous avez besoin (Ruby, OpenSSL, Neocities CLI) est déclaré dans le fichier `flake.nix`. Une seule commande installe tout :

```shell
nix develop
```

Le premier lancement télécharge Ruby et prend quelques minutes. Quand l'invite de commande change, vous êtes dans l'environnement — Ruby est installé et prêt, **uniquement dans ce terminal**. (Si vous fermez le terminal, relancez simplement `nix develop`.)

Le shell exécute automatiquement la configuration de l'outil Neocities :

- `gem install neocities` — installe l'outil en ligne de commande Neocities (CLI)
- `bundle install` — l'associe au `Gemfile` de votre projet

---

## Étape 3 : configurer GitHub Copilot

GitHub Copilot est l'IA qui écrit le code du site web pour vous.

1. Créez un compte GitHub si ce n'est pas déjà fait, et souscrivez à [Copilot](https://github.com/features/copilot) (il existe une offre gratuite).
    
2. Installez **VS Code** (un éditeur de code gratuit) et connectez-vous avec votre compte GitHub — Copilot s'active automatiquement.
    
3. Dans VS Code, ouvrez le dossier du projet (**File → Open Folder**), puis ouvrez le panneau Copilot Chat.
    
4. Ensuite, parlez-lui simplement en français courant, par exemple :
    
    > « Fais de mon index.html une page portfolio avec mon nom, une courte bio et des liens vers mes projets. Utilise style.css et script.js. »
    
    Copilot écrit le code ; vous cliquez sur **Accept**. C'est ça, le vibe-coding.
    

---

## Étape 4 : publier votre site

[](https://github.com/reksadsp/reksa-dsp-instruments#étape-5--publier-votre-site)

Dans votre terminal `nix develop`, lancez :

```shell
neocities login
```

- Entrez votre nom d'utilisateur.
- Quand un mot de passe est demandé, collez la **clé API** copiée (c'est le « mot de passe » de l'outil en ligne de commande).

Puis envoyez votre site sur internet :

```shell
neocities push .
```

Quelques secondes plus tard, visitez `https://UTILISATEUR.neocities.org` — votre site est en ligne. 🎉

Chaque fois que vous modifiez vos fichiers (ou que Copilot le fait), relancez simplement `neocities push .` pour mettre à jour le site en ligne.

---

## Comment les fichiers s'articulent

[](https://github.com/reksadsp/reksa-dsp-instruments#comment-les-fichiers-sarticulent)

|Fichier|Ce que c'est|
|---|---|
|`index.html`|Votre page d'accueil — la page que les visiteurs voient|
|`style.css`|Couleurs, polices et mise en page|
|`script.js`|Comportements interactifs (menus, animations)|
|`images/`|Vos images et illustrations|
|`flake.nix`|Indique à Nix exactement quels outils installer (Ruby, etc.)|
|`Gemfile`|Indique au bundler de Ruby quels gems le projet nécessite (le gem `neocities`)|

Vous n'avez jamais besoin de toucher qu'aux quatre premiers — et Copilot peut le faire pour vous.

---

## Dépannage

[](https://github.com/reksadsp/reksa-dsp-instruments#dépannage)

- **`nix: command not found`** — fermez et rouvrez votre terminal, ou lancez `. ~/.profile`.
- **`error: experimental Nix feature 'flakes' is disabled`** — faites la partie 3 de l'étape 0 (ajoutez `experimental-features = nix-command flakes`).
- **`neocities: command not found`** — vérifiez que vous avez d'abord lancé `nix develop` dans ce terminal.
- **La connexion échoue sans cesse** — vous devez coller la **clé API** des paramètres Neocities, pas le mot de passe de votre compte.
- **`sudo` demande un mot de passe à l'entrée du shell** — le script de configuration essaie d'abord `sudo gem install neocities` ; le fallback `gem install` suffit, donc vous pouvez simplement annuler l'invite sudo.
- **Tout recommencer à zéro** — supprimez le dossier et clonez-le à nouveau ; Nix garde votre système propre.

---

## Le flux de travail au quotidien

[](https://github.com/reksadsp/reksa-dsp-instruments#le-flux-de-travail-au-quotidien)

```shell
nix develop          # récupérer vos outils
# discuter avec Copilot, modifier les fichiers dans VS Code
neocities push .     # publier
```

C'est tout. Bon vibe-coding !