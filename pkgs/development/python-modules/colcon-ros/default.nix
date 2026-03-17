{
  buildPythonPackage,
  lib,
  fetchFromGitHub,
  # build-system
  setuptools,
  # dependencies
  catkin-pkg,
  colcon,
  colcon-cmake,
  colcon-pkg-config,
  colcon-python-setup-py,
  colcon-recursive-crawl,
}:

buildPythonPackage rec {
  pname = "colcon-ros";
  version = "0.5.0";
  pyproject = true;

  src = fetchFromGitHub {
    owner = "colcon";
    repo = pname;
    tag = version;
    hash = "sha256-BsGCgFGxOIAGTP4A8bulakMoeUj+Ki6sPIpTQ4L7LSo=";
  };

  build-system = [ setuptools ];

  dependencies = [
    catkin-pkg
    colcon
    colcon-cmake
    colcon-pkg-config
    colcon-python-setup-py
    colcon-recursive-crawl
  ];

  doCheck = false;

  pythonImportsCheck = [ "colcon_ros" ];

  meta = {
    description = "An extension for colcon-core to support CMake projects.";
    homepage = "https://colcon.readthedocs.io/en/released/";
    downloadPage = "https://github.com/colcon/colcon-ros";
    license = lib.licenses.asl20;
    maintainers = with lib.maintainers; [ amronos ];
  };
}
