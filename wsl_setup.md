for ubuntu 20.04

see this: https://docs.nvidia.com/cuda/wsl-user-guide/index.html

- ~ not sure, double check to have `Set-ExecutionPolicy -ExecutionPolicy unrestricted`



```powershell
Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server' -name "fDenyTSConnections" -value 0
Enable-NetFirewallRule -DisplayGroup "Remote Desktop"
```

```
sudo apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/7fa2af80.pub
sudo sh -c 'echo "deb http://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64 /" > /etc/apt/sources.list.d/cuda.list'
sudo apt update
sudo apt --yes install cuda-toolkit-11-1
sudo apt --yes install cuda-toolkit-11-0
sudo apt --yes install cuda-toolkit-10-2
sudo apt --yes install cuda-toolkit-10-1
sudo apt --yes install cuda-toolkit-10-0

sudo apt install --yes --no-install-recommends cuda-10-1 libcudnn7=7.6.5.32-1+cuda10.1 libcudnn7-dev=7.6.5.32-1+cuda10.1
```



sudo add-apt-repository ppa:graphics-drivers/ppa
sudo add-apt-repository ppa:graphics-drivers/ppa
sudo ubuntu-drivers autoinstall
sudo apt install nvidia-driver-440
sudo reboot

choco install -y crystaldiskmark
choco install -y rclone pcloud
cinst -y wget

choco feature enable -n allowGlobalConfirmation


- download and run latest WSL kernel: https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi

download these:
- start https://www.pcloud.com/how-to-install-pcloud-drive-windows.html?download=windows-10-64bit
- start https://www.noip.com/client/DUCSetup_v4_1_1.exe
- add registry "C:\Users\f\Dropbox\_Folder_\RegistryHacks\Take Ownership Menu Hacks\Add Take Ownership to Context menu.reg" and run it on D:\


- cuda wsl
be sure to update wsl to wsl 2

```
wsl --set-version Ubuntu 2
```

https://docs.nvidia.com/cuda/archive/11.3.1/wsl-user-guide/index.html
https://developer.nvidia.com/cuda/wsl


```
wget https://developer.download.nvidia.com/compute/cuda/repos/wsl-ubuntu/x86_64/cuda-wsl-ubuntu.pin
sudo mv cuda-wsl-ubuntu.pin /etc/apt/preferences.d/cuda-repository-pin-600
sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/wsl-ubuntu/x86_64/7fa2af80.pub
sudo add-apt-repository "deb https://developer.download.nvidia.com/compute/cuda/repos/wsl-ubuntu/x86_64/ /"
sudo apt-get update
sudo apt-get -y install cuda


pip3 install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu116
python -c 'import torch; print(torch.__version__); torch.ones(1).cuda()'
```

