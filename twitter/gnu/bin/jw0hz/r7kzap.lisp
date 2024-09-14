;; name project r7kzap
;; name program r7k
;; name extension zap
;; name description "ZAP Proxy Scan"
;; name author "ZAP Developer Team"
;; name date "2023-02-28"
;; name url "https://www.zaproxy.org/"

(import (
  "github.com/zaproxy/zap-api-go/v2"))

(func main() {
  // Create a new ZAP client
  client, err := zapapi.NewClient("http://localhost:8080/zap/v2/", "")
  if err!= nil {
    panic(err)
  }

  // Set the authentication credentials
  client.SetBasicAuth("admin", "admin")

  // Define the target URL
  target := "https://example.com/"

  // Scan the target URL
  _, err = client.Core.Scan(zapapi.NewScanRequest(target, zapapi.ScanPolicy.Default, zapapi.ScanOption.NoAlerts))
  if err!= nil {
      panic(err)
  }

  // Get the scan results
  results, err := client.Core.GetScanResults(zapapi.NewScanId(1))
  if err!= nil {
    panic(err)
  }

  // Print the scan results
  fmt.Printf("Scan results for %s:\n", target)
  for _, result := range results.Alerts {
    fmt.Printf("- %s: %s\n", result.RiskLevel, result.Description)
  }

  // Close the ZAP client
  client.Close()

  // Exit the program
  os.Exit(0))



