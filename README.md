# checkmk_cloverleaf
This script allows you to monitor your created interfaces of the [Cloverleaf](https://health-comm.de/) server in checkmk.

## How to use
- Copy the cloverleaf.ps1 to CheckMK Agent directory for local checks, default path ist %ProgramData%\checkmk\agent\local
- Edit the path and site name in the script
- Restart checkmk agent

## Limitations
- This script only outputs the protocol status and general interface status, no statistics
- If your interface names are longer than 15 characters they get cut off due to limitations of the cloverleaf executable which this script calls
