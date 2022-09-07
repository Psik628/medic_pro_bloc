# MedicPro
[![Codemagic build status](https://api.codemagic.io/apps/6314fb882923d8c627b1cbce/6314fb882923d8c627b1cbcd/status_badge.svg)](https://codemagic.io/apps/6314fb882923d8c627b1cbce/6314fb882923d8c627b1cbcd/latest_build)

## Test environment
### Get data from firebase production db

**1. login to firebase**

`firebase login`

**2. login to gloud**

`gcloud auth login`

**3. display firebase projects**

`firebase projects:list`

**4. select firebase project**

`firebase use your-project-name`

**5. list gcloud projects**

`gcloud projects list`

**6. select gloud project**

`gcloud config set project your-project-name`

**7. export data to selected gloud bucket**

`gcloud firestore export gs://your-project-name.appspot.com/your-choosen-folder-name`

**8. import data from gcloud bucket**

`cd functions gsutil -m cp -r gs://your-project-name.appspot.com/your-choosen-folder-name .`

**9. start emulators with preconfigured data**

`firebase emulators:start --import ./your-choosen-folder-name`
