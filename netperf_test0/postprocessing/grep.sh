grep -B1 -A 3 '\(====\|Throughput\)' netperfdata | grep -v control | grep -v MIGRATED | grep -v Interim > netperfdata1
