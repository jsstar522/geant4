# Geant 4

## Geant 4 설치 (with MacOS)

### Home Brew 설치

맥에서 사용하는 package 관리 유틸리티 `home brew`를 설치합니다. 설치 커맨드는 <https://brew.sh/index_ko>에서 확인합니다.

```bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

### cmake 설치

home brew를 설치했다면 cmake라는 라이브러리를 설치합니다.

```bash
brew install cmake
```

### Qt4 설치

home brew를 이용해 Qt4 라이브러리를 설치합니다. MacOS에서 Geant4를 사용하기 위해선 반드시 Qt4 (version 4)를 사용해야합니다. 최신버전 Qt5로 자동설치가 되지 않도록 brew를 이용하여 설치합니다.

```bash
brew install cartr/qt4/qt
```

### X11 설치

X11은 generating된 결과물을 보기 위한 라이브러리입니다. Visualization된 결과물을 확인하기 위한 X11 라이브러리를 설치합니다. MacOS에서 X11을 사용할 수 있는 프로그램은 XQuartz가 있습니다. <https://www.xquartz.org/>에서 설치합니다.

### CLHEP 설치

Geant4에서 직접적으로 사용하는 CLHEP 라이브러리를 설치합니다. 홈페이지(<http://proj-clhep.web.cern.ch/proj-clhep/clhep23.html>)로 이동해서 최신버전의 압축파일을 받은 뒤 압축을 풀어줍니다.

```bash
cd ~/Downloads
tar -xvf clhep-2.4.1.2.tgz
```

압축을 모두 풀었다면 압축폴더를 임시 폴더로 옮긴 뒤 ccmake로 설치를 진행합니다.

```bash
mkdir build
cd build
mkdir build
cd build
ccmake ../2.4.1.2/CLHEP
```

ccmake 커맨드까지 치면 EMPTY CACHE라고 쓰여있는 새로운 bash 창이 열립니다. 키보드 `c`를 누르면 환경설정 창이 나옵니다. 특별히 바꿀게 없다면 곧바로 `c`, `g`를 눌러서 설정을 마칩니다. 이후 make를 이용해 CLHEP을 컴파일 합니다.

```bash
make -j 4 && sudo make install
```

`-j` 옵션은 컴파일 할 때 사용하는 코어 개수입니다. 본인 컴퓨터 사양에 맞는 코어개수를 입력합니다. 저는 쿼드코어이기 때문에  `-j 4`를 옵션으로 주었습니다. 위 커맨드를 끝으로 CLEHP 설치가 끝났습니다. 압축파일과 컴파일 했던 `bulid` 폴더는 삭제해도 됩니다.

### Geant4 설치

본격적으로 Geant4를 설치해보겠습니다. <http://geant4.web.cern.ch/support/download>에서 필요한 소스파일과 데이터파일을 받습니다.

```text
Source files -> GNU or Linux tar format, compressed using gzip
Data files -> 모두 다운로드
```

이제 `/usr/local/`에 Geant4를 설치할 곳을 만들어 주고 다운 받은 데이터 파일들을 넣어줍니다. 저는 파일들을 `~/Desktop/`에 설치했기 때문에 `~/Desktop/`에서 파일을 옮깁니다. 이후 압축을 풀어줍니다.

```bash
sudo mkdir -p /usr/local/Geant4/data
sudo mv ~/Desktop/G4* /usr/local/Geant4/data
sudo mv ~/Desktop/XG4* /usr/local/Geant4/data
sudo mv ~/Desktop/Real* /usr/local/Geant4/data

cd /usr/local/Geant4/data
sudo find . -name "*.tar.gz" -exec tar -xvf {} \;

sudo rm -rf *.tar.gz //압축파일 모두 삭제
```

이제 `GNU or Linux tar format, compressed using gzip`파일을 이용해 Geant4를 설치하겠습니다. 저는 `~/Desktop/`에 설치했기 때문에 `~/Desktop/`에서 build 폴더를 만든 뒤, ccmake를 통해 설치하겠습니다.

```bash
cd ~/Desktop
tar -xvf geant4.10.05.p01.tar.gz
mkdir build
cd build
ccmake ../geant4.10.05.p01
```

CLHEP을 설치할 때 처럼 EMPTY CACHE가 적힌 새로운 bash창이 뜹니다. `e`를 누른 뒤 환경설정을 합니다. 환경설정 목록에 여러가지가 있습니다. 키보드 상하키를 누르면서 ENTER키를 누르면 수정이 가능합니다. 특정 목록만 아래의 내용으로 수정해줍니다.

```text
CMAKE_INSTALL_PREFIX => /usr/local/Geant4/
GEANT4_BUILD_MULTITHREADED => ON
GEANT4_INSTALL_DATADIR => /usr/local/Geant4/data/
GEANT4_USE_OPENGL_X11 => ON
GEANT4_USE_QT => ON
GEANT4_USE_SYSTEM_CLHEP => ON
```

이후 `c`를 누르면 환경설정이 적용되고 `c`, `g`를 누른 뒤 설정을 마칩니다. 이제 컴파일을 해줍니다. 그리고 컴파일에 사용했던 압축파일과 `build`폴더를 삭제합니다.

```bash
make -j 4 && sudo make install

rm -rf geant4*
rm -rf build/
```

이제 Geant4 설치가 끝났습니다. 환경설정으로 마무리합니다.

```bash
touch ~/.bash_profle
open ~/.bash_profile
```

파일이 열리면 아래의 내용을 삽입합니다.

```text
. /usr/local/Geant4/bin/geant4.sh
```

## Geant4 예제

예제 폴더는 `/usr/local/Geant4/share/Geant4-10.5.1/examples`에 있습니다. 프로젝트 폴더에 옮긴 뒤 컴파일해서 사용합니다. `B1`이라는 폴더 안에 있는 예제만 컴파일해보도록 하겠습니다. 

```bash
cp -r /usr/local/Geant4/share/Geant4-10.5.1/examples/basic/B1 ~/Desktop/Project/geant4/examples

```

`GNUmakefile`로 컴파일하지 않고 `ccmake`로 컴파일합니다.

```bash
cd ~/Desktop/Project/geant4/B1/examples
ccmake .
```

설치과정에서 나왔던 환경설정 창이 나옵니다. `c`를 누른 뒤 `c`, `g`를 눌러서 환경설정을 종료합니다. 이제 `make`를 이용해 컴파일합니다.

```bash
make -j 4
```

컴파일이 완료되면 `exampleB1`이라는 실행파일이 생성됩니다. 실행시키면 generating이 시작됩니다.

```bash
./exampleB1
```













