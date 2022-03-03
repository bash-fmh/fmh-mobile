enum ViewState {
  idle,
  busy,
  empty,
  error,
}
enum ViewStateErrorType {
  defaultError,
  networkError,
  unauthorizedError,
}
enum AppEnvironment {
  dev,
  uat,
  prod,
}
enum NavButtonType {
  dashboard,
  orders,
  products,
  suppliers,
  notification,
  apps,
}
enum ButtonStatus {
  active,
  deactivate,
}
enum DeployCountry {
  my,
  id,
  th,
}
enum DeployApplicationType {
  enterprise,
  legacy,
  v2,
}
enum MTDType {
  variance,
  discard,
}
enum QtyVariance {
  cost,
  qty,
}
