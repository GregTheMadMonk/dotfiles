#!/bin/sh

echo "Setting profile to \"performance\"..."
for CPUFREQ in /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor; do [ -f $CPUFREQ ] || continue; echo -n performance > $CPUFREQ; done

echo "Turning on \"Turbo Boost\"..."

CORES=$(cat /proc/cpuinfo | grep procesor | awk '{print $3}')
for CORE in $CORES; do
	# wrmsr -p${CORE} 0x1a0 0x4000850089 - to disable
	wrmsr -p${CORE} 0x1a0 0x850089

	STATE=$(rdmsr -p${CORE} 0x1a0 -f 38:38)
	echo $STATE
done
