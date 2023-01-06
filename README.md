![scan2](https://user-images.githubusercontent.com/68069659/210850710-ed7f822d-22b4-4604-9a09-a893af8f82d1.gif)



[![platform](https://img.shields.io/badge/platform-kubernetes-blue)](https://kubernetes.io/)
[![os](https://img.shields.io/badge/os-linux-red)](https://www.linux.org/)
[![script](https://img.shields.io/badge/script-bash-orange)](https://www.gnu.org/software/bash/)
[![license](https://img.shields.io/badge/license-Apache--2.0-yellowgreen)](https://apache.org/licenses/LICENSE-2.0)
[![donate](https://img.shields.io/badge/donate-wango-blue)](https://www.wango.org/donate.aspx)
# Trivy Operator

[Trivy operator](https://aquasecurity.github.io/trivy-operator/v0.10.1/) is an security tool which continuously scans your [Kubernetes cluster](https://kubernetes.io/)

### step 1

- Install trivy operator:

```bash
kubectl apply -f https://raw.githubusercontent.com/aquasecurity/trivy-operator/v0.10.1/deploy/static/trivy-operator.yaml
```
- check the operator is running:

```bash
kubectl get deployment -n trivy-system
```
![image](https://user-images.githubusercontent.com/68069659/210912943-123aac97-8cbc-4669-a84d-7cf01c260ead.png)


### step 2

- Clone this repo:

```bash
cd ~ && git clone https://github.com/william89731/trivy-operator && cd trivy-operator
```
- make your [namespace.txt](https://github.com/william89731/trivy-operator/blob/main/namespace.txt)

![image](https://user-images.githubusercontent.com/68069659/210927282-57a5228b-33fb-4739-8b20-dc43fdb8109c.png)


- set alias:

```alias trivy-operator='bash ~/trivy-operator/operator.sh ~/trivy-operator/namespace.txt'```

- launch script:

```bash
trivy-operator
```
![script](https://user-images.githubusercontent.com/68069659/211056782-817a3e41-40cb-446f-8bad-2449763b0a74.gif)


```see result in report.txt```

![image](https://user-images.githubusercontent.com/68069659/210921053-1bcbef46-e93b-4969-8676-d2aa7311fb0d.png)

- for more info:

```bash
kubectl describe vuln <REPLICASET> -n <NAMESPACE>
```
or

```bash
kubectl describe configaudit <REPLICASET> -n <NAMESPACE>
```

![image](https://user-images.githubusercontent.com/68069659/210922151-f079a7c5-84fb-483e-87b8-6daa1bc22078.png)



