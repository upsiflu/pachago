# pachago
Frontend and Backend for the pachago prototype

## Contribute!

**Set up your IDE**

We use vscode but you can use any IDE. We recommend to install the language servers and your preferred extensions for git, elm, typescript, and graphQL as these are the languages we work with.

You need node LTS and git. If these are not compatible with your system, you can use remote IDE containers such as github codespaces (60 hours per month free)

### Backend

1. Install nhost

```shell
sudo curl -L https://raw.githubusercontent.com/nhost/cli/main/get.sh | bash
nhost config pull
```

- Select the Github auth method. 

> [!NOTE]
> If you are in a remote container (github codespace) without xdg-open, select the PAT method. Create your PAT in your nhost user profile and copy it into the terminal. If you entered wrong PAT, type `nhost login` and then repeat `nhost config pull`.

- Follow the instructions in your terminal.

The config and .secrets are written. The secrets are excluded from git.

- [optional] Now you can launch a local nhost instance on your development computer. This is safer than connecting with the production backend because you can't break things. Unfortunately this doesn't work in a remote container because it tries to write files outside the repository.

```shell
nhost up
```

