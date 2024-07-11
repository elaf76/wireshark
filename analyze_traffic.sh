

#!/usr/bin/bash

# Bash Script to Analyze Network Traffic

# Input: Path to the Wireshark pcap file
pcap_file="/home/vboxuser/linux/your_capture_file.pcap"
# capture input from terminal.

# Function to extract information from the pcap file
analyze_traffic() {
    # Use tshark or similar commands for packet analysis.
    # Hint: Consider commands to count total packets, filter by protocols (HTTP, HTTPS/TLS),
    # extract IP addresses, and generate summary statistics.

   total_packets=$(tshark -r "$pcap_file" | wc -l)
   http_packets=$(tshark -r "$pcap_file" -Y http | wc -l)
   https_packets=$(tshark -r "$pcap_file" -Y ssl | wc -l)
   top_dest_ips=$(tshark -r "$pcap_file" -T fields -e ip.dst | sort -n | uniq -c | sort -nr | head -n 5)
   top_source_ips=$(tshark -r "$pcap_file" -T fields -e ip.src | sort -n | uniq -c | sort -nr | head -n 5)


    # Output analysis summary
    echo "----- Network Traffic Analysis Report -----"
    # Provide summary information based on your analysis
    # Hints: Total packets, protocols, top source, and destination IP addresses.
    echo "1. Total Packets: $total_packets "
    echo "2. Protocols:"
    echo "   - HTTP: $http_packets packets"
    echo "   - HTTPS/TLS: $https_packets packets"
    echo ""
    echo "3. Top 5 Source IP Addresses:"
    # Provide the top source IP addresses
    echo "$top_source_ips"
    echo ""
    echo "4. Top 5 Destination IP Addresses:"
    # Provide the top destination IP addresses
    echo "$top_dest_ips"
    echo ""
    echo "----- End of Report -----"
}

analyze_traffic