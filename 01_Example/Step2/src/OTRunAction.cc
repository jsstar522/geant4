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