# helm
my k8s helm repo

## Manage repository
```shell
# Create new chart: mychart skeleton in current directory
helm create mychart

# Create a package: mychart-version.tgz, which version be set in
# mychart/Chart.yaml, in current directory
helm package mychart

# Put mychart-version.tgz in gh-pages branch
git checkout gh-pages
mv mychart-version.tgz ./

# Update index.yaml with new package: mychart-version.tgz
helm repo index ./
```
