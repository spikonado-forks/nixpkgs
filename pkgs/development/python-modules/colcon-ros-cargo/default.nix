{
  buildPythonPackage,
  lib,
  fetchFromGitHub,
  # build-system
  setuptools,
  # dependencies
  cargo-ament-build,
  colcon,
  colcon-cargo,
  colcon-library-path,
  colcon-ros,
  toml,
  # tests
  pytestCheckHook,
  scspell,
  writableTmpDirAsHomeHook,
}:

buildPythonPackage rec {
  pname = "colcon-ros-cargo";
  version = "0.2.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "colcon";
    repo = pname;
    tag = "v${version}";
    hash = "sha256-79HsQk5F+Vkx3GafdX08YBQLrBv4dxBmWtdexDDqGbU=";
  };

  build-system = [ setuptools ];

  dependencies = [
    cargo-ament-build
    colcon
    colcon-cargo
    colcon-library-path
    colcon-ros
    toml
  ];

  nativeCheckInputs = [
    pytestCheckHook
    scspell
    writableTmpDirAsHomeHook
  ];

  doCheck = false;

  pythonImportsCheck = [ "colcon_ros_cargo" ];

  meta = {
    description = "Build cargo projects with colcon.";
    homepage = "https://colcon.readthedocs.io/en/released/";
    downloadPage = "https://github.com/colcon/colcon-ros-cargo";
    license = lib.licenses.asl20;
    maintainers = with lib.maintainers; [ amronos ];
  };
}
