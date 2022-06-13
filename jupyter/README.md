## DRAFT, not finished!!!

### Set up jupyter as a service

1. Set the password: `jupyter notebook password`
2. Locate jupyter-notebook binary: `which jupyter-notebook`
3. Create file: `cat /usr/lib/systemd/system/jupyter.service`
4. Enable service: 
```
sudo systemctl enable jupyter.service
sudo systemctl daemon-reload
sudo systemctl restart jupyter.service
```