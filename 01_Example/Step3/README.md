# Geant 4 Data_2

## Event Action

SteppingAction 메서드에서 step 클래스를 통해 에너지, 볼륨Id 등을 불러왔습니다.

```c++
// 에너지 불러오기
step -> GetTotalEnergyDeposit();
```

Step 기준 뿐만 아니라 Event 기준으로도 값을 불러올 수 있습니다. 먼저 Ntuple을 생성합니다.

```c++
// OTRunAction.cc
// ...
analysisManager -> CreateNtuple("event", "energy deposit per event in volumn-1");
analysisManager -> CreateNtupleDColumn("edep1");
analysisManager -> FinishNtuple();
// ...
```

이제 Step단위가 아닌 Event 단위로 Ntuple을 채워야 하므로 `OTEventAction.hh`와 `OTEventAction.cc`를 만듭니다. 

```c++
// OTEventAction.hh
#ifndef OTEVENTACTION_HH
#define OTEVENTACTION_HH

#include "G4UserEventAction.hh"
#include "G4Event.hh"
#include "globals.hh"
#include "g4root.hh"

class OTEventAction : public G4UserEventAction
{
  public:
    OTEventAction();
    virtual ~OTEventAction();

    // method from the base class
    virtual void BeginOfEventAction(const G4Event *);
    virtual void EndOfEventAction(const G4Event *);

	// energy deposit값 모두 더하기
	// 이 함수는 SteppingAction에서 실행된다.
    void AddEnergyDeposit1(G4double edep) { edep1 += edep; }

  private:
  	// 이벤트 액션에서 사용할 edep1 변수 선언
    G4double edep1;
};

#endif
```

```c++
// EventAction.cc


#include "OTEventAction.hh"

OTEventAction::OTEventAction()
: G4UserEventAction()
{
}

OTEventAction::~OTEventAction()
{
}

// 이벤트 시작시 호출
void OTEventAction::BeginOfEventAction(const G4Event*)
{
  // 이벤트 시작시 초기화
  edep1 = 0.;
}

// 이벤트 종료시 호출
void OTEventAction::EndOfEventAction(const G4Event*)
{
  G4AnalysisManager* analysisManager = G4AnalysisManager::Instance();
  // 한 이벤트가 끝날때 값 채우기
  analysisManager -> FillNtupleDColumn(1, 0, edep1);
  analysisManager -> AddNtupleRow(1);
}
```

**EventAction은 이벤트가 시작할 때 호출됩니다.** 한 이벤트에서 생기는 여러번의 Step에서의 energy deposit을 구해야 하므로 SteppingAction 클래스에서 OTEventAction.hh의 `AddEnergyDeposit1`을 실행해줍니다.

```c++
// OTSteppingAction.cc
//...
#inlcude "OTEventAction.hh"
//...
  analysisManager -> FillNtupleIColumn(1, volumeID);
  analysisManager -> FillNtupleDColumn(2, totalEdep);
  analysisManager -> AddNtupleRow();

  OTEventAction *eventAction = (OTEventAction *) G4EventManager::GetEventManager() -> GetUserEventAction();
  if (volumeID == 1)
    eventAction -> AddEnergyDeposit1(totalEdep);
//..
```

이제 실행파일에 `OTEventAction.hh`를 추가하고 Action을 추가해주면 됩니다.

```c++
// example.cc
// ...
#inlcude "OTEventAction.hh"
// ...
runManager -> SetUserAction(new OTEventAction());
// ...
```

