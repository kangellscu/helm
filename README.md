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

## Chart Tests
Tests be used for validating that your chart works as expected when it is installed.

A test lives under the `templates/` directory and is a pod definition that specifies a container with a given command to run.
The container shouild exit successfully (exit 0) for a test to be considered a success.
The pod definition must contain one of the helm test hook annotations: `helm.sh/hook: test-success` or `helm.sh/hook: test-failure`.

You can run the tests on a release using the command `helm test <RELEASE_NAME>`.

```shell
# Install chart
$helm install stable/wordpress

# Test <RELEASE>
helm test <RELEASE_NAME>
```
