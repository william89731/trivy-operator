#!/bin/bash
echo "

████████╗██████╗ ██╗██╗   ██╗██╗
╚══██╔══╝██╔══██╗██║██║   ██║██║
   ██║   ██████╔╝██║██║   ██║██║
   ██║   ██╔══██╗██║╚██╗ ██╔╝██║
   ██║   ██║  ██║██║ ╚████╔╝ ██║
   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═══╝  ╚═╝

 ██████╗ ██████╗ ███████╗██████╗  █████╗ ████████╗ ██████╗ ██████╗
██╔═══██╗██╔══██╗██╔════╝██╔══██╗██╔══██╗╚══██╔══╝██╔═══██╗██╔══██╗
██║   ██║██████╔╝█████╗  ██████╔╝███████║   ██║   ██║   ██║██████╔╝
██║   ██║██╔═══╝ ██╔══╝  ██╔══██╗██╔══██║   ██║   ██║   ██║██╔══██╗
╚██████╔╝██║     ███████╗██║  ██║██║  ██║   ██║   ╚██████╔╝██║  ██║
 ╚═════╝ ╚═╝     ╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝

"
sleep 4
sleep 10 & PID=$!
echo "Trivy operator is an security tool which continuously scans your Kubernetes cluster"
printf "["
while kill -0 $PID 2> /dev/null; do
    printf  "▓"
    sleep 1
done
printf "] "
printf "\n"
clear
function info { echo -e "\e[32m[info] $*\e[39m"; }
function warn  { echo -e "\e[33m[warn] $*\e[39m"; }
function error { echo -e "\e[31m[error] $*\e[39m"; exit 1; }

info "read namespace list"
truncate -s 0 ~/trivy-operator/report.txt
set -o noclobber
for NAMESPACE in $(cat $1); do
  echo ""
  $NAMESPACE >>  ~/trivy-operator/report.txt
  kubectl get vuln -o wide -n $NAMESPACE >>  ~/trivy-operator/report.txt
  kubectl get configaudit -o wide -n $NAMESPACE >>  ~/trivy-operator/report.txt
  echo ""
done
info "see result in report.txt"
date  >>  ~/trivy-operator/report.txt
