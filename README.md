# Kubernetes Deployments

To deploy a new Virto Commerce based application, do the following steps:

1. Create a new folder called "{name}-app".
2. Add kustomization.yaml that contains the following (replace "{name}" with an app name used at step 1).

```
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization
namespace: dev
bases:
- ../../../common-base
namePrefix: {name}-
commonLabels:
  instance: {name}
```

3. Add new file under "apps-config/base" called "{name}-app.yaml" (replace "{name}" with an app name used at step 1).
```
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: {name}-dev-app
  namespace: argocd
  finalizers:
    - resources-finalizer.argocd.argoproj.io  
spec:
  destination:
    namespace: dev
    server: https://kubernetes.default.svc
  project: tenant
  source:
    path: {name}-app
    repoURL: https://github.com/virtocommerce/vc-deploy-apps
    targetRevision: HEAD
  syncPolicy:
    automated:
      prune: true
      selfHeal: true
```

4. Open apps-config/kustomization.yaml and add new line under "resources:".

```
resources:
- base/{name}-app.yaml
```

5. Checkin and go to https://cd.govirto.com. You should see a new application created.

![image](https://user-images.githubusercontent.com/1566470/83311829-4e268d00-a1c5-11ea-8c90-d9ae834d6d24.png)
