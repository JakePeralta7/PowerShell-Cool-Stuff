$encodedBase64 = "emliaQ=="
$decodedString = [System.Text.Encoding]::ASCII.GetString([System.Convert]::FromBase64String($encodedBase64))

$encodedBase64 = [convert]::ToBase64String([Text.Encoding]::UTF8.GetBytes($decodedString))