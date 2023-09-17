# Terraform Beginner Bootcamp 2023

Create a new branch

First create an issue on Github:

<img width="966" alt="Bildschirmfoto 2023-09-17 um 07 27 13" src="https://github.com/DavidTausend/terraform-beginner-bootcamp-2023/assets/125006062/9a29e245-6ed9-4485-8367-f670567ba273">


<img width="1470" alt="Bildschirmfoto 2023-09-17 um 07 25 49" src="https://github.com/DavidTausend/terraform-beginner-bootcamp-2023/assets/125006062/57f3a9bb-bbf4-4d89-a327-2aa0d25eeac6">

now that we have a number lets proceed to create a new branch in gitpod:
(we will use semantic Versioning.)

```git
git checkout -b 1_semantic_versioning
```
<img width="696" alt="Bildschirmfoto 2023-09-17 um 07 45 01" src="https://github.com/DavidTausend/terraform-beginner-bootcamp-2023/assets/125006062/262e3e8a-9ce2-45bf-acc4-edba81680eed">

then lets push the branch with the following command:

```git
git push
```

Copy the printed command of the consolo and allow the browser to past it:

<img width="609" alt="Bildschirmfoto 2023-09-17 um 07 49 11" src="https://github.com/DavidTausend/terraform-beginner-bootcamp-2023/assets/125006062/ee3c995b-a70f-421c-ad04-8197232ffc97">

<img width="922" alt="Bildschirmfoto 2023-09-17 um 07 52 22" src="https://github.com/DavidTausend/terraform-beginner-bootcamp-2023/assets/125006062/cd7a1da4-2e25-420d-8043-64de4e37579d">

once above steps are done, push the branch by just hitting enter:

<img width="926" alt="Bildschirmfoto 2023-09-17 um 07 59 27" src="https://github.com/DavidTausend/terraform-beginner-bootcamp-2023/assets/125006062/106fd924-5250-4884-a087-27274e5bf83a">

to verify the push branch go back to github and check the main tab:

<img width="1235" alt="CheckMainBranch" src="https://github.com/DavidTausend/terraform-beginner-bootcamp-2023/assets/125006062/e867007b-c17e-4142-9ab0-359bdc56ae82">

Use the following command to create a tag:

```git
git tag 0.1.0
```
<img width="544" alt="CreateTag" src="https://github.com/DavidTausend/terraform-beginner-bootcamp-2023/assets/125006062/d1717c98-0503-4f56-8783-4f395566ea4d">


Check the pushed tags with the following command:

```git
git push --tags
```
<img width="536" alt="CheckTags" src="https://github.com/DavidTausend/terraform-beginner-bootcamp-2023/assets/125006062/299f3181-45e5-4654-a950-845a74da59c6">

On Github unter the main tab and Tags you can find the created tag:

<img width="474" alt="GithubTags" src="https://github.com/DavidTausend/terraform-beginner-bootcamp-2023/assets/125006062/de4eb55e-209b-4ddf-b624-0396898428da">


## Semantic Versioning :mage:

This Project is going utilize semantic versioning for its tagging.
[semver.org](https://semver.org)

The general format: 

**MAJOR.MINOR.PATCH**, eg. `1.0.1`

- **MAJOR** version when you make incompatible API changes
- **MINOR** version when you add functionality in a backward compatible manner
- **PATCH** version when you make backward compatible bug fixes




sources:
- https://semver.org
