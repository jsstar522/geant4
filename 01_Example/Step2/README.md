# Geant 4 Data

## G4Tool - Run Action

G4Tool은 histogram이나 NTuple을 생성하는 툴입니다. 여기서는 NTuple로 예시를 들어보겠습니다. NTuple은 `,`로 구별되는 리스트입니다. **G4Tool을 이용해 NTuple을 생성하고 저장하는 작업은 Run Action에서 수행합니다.**

```
1, 2, 3
4, 5, 6
100, 1000, 1
0.1, 0.02, 0.003
```

NTuple은 G4AnalysisManager에서 생성할 수 있습니다.

```c++
G4AnalysisManager* analysisManager = G4AnalysisManager::Instance();
// data 파일 불러오기 (파일명)
analysisManager -> OpenFile("data");
```

저장은 다음과 같이 수행합니다.

```c++
G4AnalysisManager* analysisManager = G4AnalysisManager::Instance();
analysisManager -> Write();
analysisManager -> CloseFile();
```

NTuple은 다음과 같이 생성할 수 있습니다.

```c++
G4AnalysisManager* analysisManager = G4AnalysisManager::Instance();
// (이름, 타이틀)
analysisManager -> CreateNtuple("step", "step");
// 데이터 세트 CreateNtuple[I or F or D]Column(이름)
// I: int, F: float, D: double
// 이벤트 Id
analysisManager -> CreateNtupleIColumn("eventID");
// Volumn Id
analysisManager -> CreateNtupleIColumn("volumnID");
// 잃어버린 에너지
analysisManager -> CreateNtupleDColumn("edep");
analysisManager -> FinishNtuple();
```

NTuple 저장은 다음과 같이 할 수 있습니다.

```c++
G4AnalysisManager* analysisManager = G4AnalysisManager::Instance();
analysisManager -> FillNtupleIColumn(0, eventID);
analysisManager -> FillNtupleIColumn(1, volumnID);
analysisManager -> FillNtupleIColumn(2, edep);
analysisManager -> AddNtupleRow();
```

`FillNtuple[I or F or D]Column(변수ID, 값)`으로 값을 채워넣을 수 있습니다. `AddNtupleRow()`를 실행하면 한줄이 완성됩니다. **이 단계는 하나의 step마다 한번의 loop를 돌아가도록 해야하므로 Stepping Action에서 실행되어야 합니다.** 그러므로 **Stepping Actions에서 NTuple을 다음과 같이 사용할 수 있도록 위와 같은 Ntuple 설정값이 들어간 header 파일과 클래스인 Run Action을 만듭니다.** `(Run Action (NTuple 설정) -> Stepping Action (Run Action 실행)-> Run Action 종료)`

```c++
// OTRunAction.hh
#ifndef OTRUNACTION_HH
#define OTRUNACTION_HH

#include "G4UserRunAction.hh"
#include "G4Run.hh"
#include "globals.hh"
#include "g4csv.hh"

class OTRunAction : public G4UserRunAction {
  public:
    OTRunAction();
    virtual ~OTRunAction();

    virtual void BeginOfRunAction(const G4Run*);
    virtual void EndOfRunAction(const G4Run*);
};

#endif
```

Run이 시작할 때는 `BeginOfRunAction`으로 접근해서 해당 작업들을 수행하고, 끝날 때는 `EndOfRunAction`으로 접근합니다. 이 두 메서드를 사용해서 NTuple의 설정을 마쳐보도록 하겠습니다.

```c++
// OTRunAction.cc

#include "OTRunAction.hh"

OTRunAction::OTRunAction()
: G4UserRunAction() {

}

OTRunAction::~OTRunAction() {
  delete G4AnalysisManager::Instance();
}

void OTRunAction::BeginOfRunAction(const G4Run*) {
  G4AnalysisManager* analysisManager = G4AnalysisManager::Instance();
  // data 파일 불러오기 (파일명)
  analysisManager -> OpenFile("data");
  // (이름, 타이틀)
  analysisManager -> CreateNtuple("step", "step");
  // 데이터 세트 CreateNtuple[I or F or D]Column(이름)
  // I: int, F: float, D: double
  // 이벤트 Id
  analysisManager -> CreateNtupleIColumn("eventID");
  // Volumn Id
  analysisManager -> CreateNtupleIColumn("volumnID");
  // 잃어버린 에너지
  analysisManager -> CreateNtupleDColumn("edep");
  analysisManager -> FinishNtuple();
}

void OTRunAction::EndOfRunAction(const G4Run*) {
  G4AnalysisManager* analysisManager = G4AnalysisManager::Instance();
  analysisManager -> Write();
  analysisManager -> CloseFile();
}
```



## G4Step - Stepping Action

**`Step`은 Geant4 전체 시뮬레이션에서 하나의 단위가 됩니다.** 일종의 Snap Shot인데, 많은 Step이 모여 전체 시뮬레이션이 됩니다. 하나의 스텝이 생성될 때마다 `G4UserSteppingAction 클래스의 UserSteppingAction(const G4Step*) 메서드`를 불러오고 `G4Step이라는 클래스`로 스텝의 관련정보에 접근할 수 있습니다. 하나의 스텝에는 다음과 같은 정보를 담고 있습니다.

```
1. PreStepPoint, PostStepPoint의 포인터
2. 스텝이 속해있는 G4Track의 포인터
3. 스텝의 길이와 소요시간
4. 이전 스텝에서부터 잃은 에너지
```

### StepPoint

`PreStepPoint`와 `PostStepPoint`는 스텝의 양단에 있는 스텝 점(Point)입니다. 이 Point를 통과할 때 다음과 같은 정보를 얻을 수 있습니다.

```
1. 위치 및 시간
2. 운동량 및 에너지
3. Physical Volumn 포인터
```

Physical Volume은 어떤 물질에서 스텝이 생긴건지 알려줍니다. `World`와 `Detector`와 같이 물질의 경계를 지나갈 때 하나의 step은 무조건 끝납니다. 즉, 서로다른 물질에 걸쳐있는 step은 없습니다. 그렇기 때문에 Physical Volume은 속해 있는 물질을 나타내고 고유한 Id (하나의 Id)로 나오게 됩니다.

```c++
step -> GetPreStepPoint() -> GetPhysicalVolumn() -> GetCopyNo();
```

### Energy Deposit

4번을 통해 NTuple의 "edep"을 채워넣을 수 있습니다. 다음과 같이 잃은 에너지를 가져올 수 있습니다.

```c++
step -> GetTotalEnergyDeposit();
```

### Event Id

이벤트 Id는 `G4Event 포인터의 GetEventNo() 함수`가 가지고 있습니다. 이는 G4UserEventAction에서 가져올 수 있습니다.

```c++
G4RunManager::GetRunManager() -> GetCurrentEvent() -> GetEventID();
```



## 실행

```c++
// OTSteppingAction.hh

#ifndef OTSTEPPINGACTION_HH
#define OTSTEPPINGACTION_HH

#include "G4UserSteppingAction.hh"
#include "G4Step.hh"
#include "globals.hh"
#include "g4csv.hh"

class OTSteppingAction : public G4UserSteppingAction
{
  public:
    OTSteppingAction();
    virtual ~OTSteppingAction();

    // method from the base class
    virtual void UserSteppingAction(const G4Step*);
};

#endif
```

```c++
// OTSteppingAction.cc

#include "OTSteppingAction.hh"

#include "G4Event.hh"
#include "G4RunManager.hh"
#include "G4SystemOfUnits.hh"
#include "G4RunManager.hh"

OTSteppingAction::OTSteppingAction()
: G4UserSteppingAction() {

}

OTSteppingAction::~OTSteppingAction() {

}

void OTSteppingAction::G4UserSteppingAction(const G4Step* step) {
  G4int eventID = G4RunManager::GetRunManager() -> GetCurrentEvent() -> GetEventID();
  G4int volumeID = step -> GetPreStepPoint() -> GetPhysicalVolume() -> GetCopyNo();
  G4double totalEdep = step -> GetTotalEnergyDeposit();

  G4AnalysisManager* analysisManager = G4AnalysisManager::Instance();
  analysisManager -> FillNtupleIColumn(0, eventID);
  analysisManager -> FillNtupleIColumn(1, volumeID);
  analysisManager -> FillNtupleDColumn(2, totalEdep);
  analysisManager -> AddNtupleRow();
}
```

이제 NTuple을 생성하기 위해서 두가지의 액션클래스가 추가 되었습니다. **NTuple을 생성하고 저장하는 역할을 하는 Run Action과 Step 단위로 정보를 저장(Fill)하는 Stepping Action, 이렇게 두가지죠.** 이제 이 두 액션을 메인 프로그램에서 runManager를 통해 액션설정을 해줍니다.

```c++
// example.cc
...
#include "OTRunAction.hh"
#include "OTSteppingAction.hh"

int main(int argc, char** argv) {
...
    runManager -> SetUserAction(new OTRunAction());
    runManager -> SetUserAction(new OTSteppingAction());
...
}
```

이제 컴파일 이후 커맨드라인을 띄우고, 입자를 발사하면 csv파일이 생성됩니다.

```bash
/run/beamOn 5
```

```
#class tools::wcsv::ntuple
#title step
#separator 44
#vector_separator 59
#column int eventID
#column int volumnID
#column double edep
0,0,0.00730004
0,0,0.00228412
0,0,0.00812834
0,0,0.0050042
...
1,0,0
1,0,0.00369296
1,0,0.0141652
1,0,0.00408388
1,1,4.95074
...
2,0,0.00133614
2,0,0.00504242
2,0,0.0101228

...
3,0,0.00805489
3,0,0.0154269
3,0,0.00346382
3,1,4.63198
...
4,0,0.0118657
4,0,0.0094862
4,1,5.10434
4,1,4.31364
...
```

`이벤트 Id, 볼륨 Id, 잃은 에너지`로 구성되어 있는 데이터입니다. 다섯번의 이벤트를 실행했으므로 이벤트 Id는 0~4까지, 물질은 두종류로 나뉘어져 있으므로 0 or 1, 그리고 잃은 에너지가 저장되어 있습니다.

