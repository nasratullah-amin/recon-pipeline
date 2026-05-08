#!/bin/bash

domain=$1

echo "[+] Starting Recon on $domain"
subfinder -d $domain -o sub.txt

cat sub.txt | httpx-toolkit -silent -status-code 200,301,403,401,500 -o live.txt
nuclei -l live.txt -t exposures -o vul_result.txt

echo "[+] Recon finished. Results saved in vuln_result.txt

