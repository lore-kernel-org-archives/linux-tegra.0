From: =?UTF-8?B?TWlsYW4gQnXFoWth?= <milan.buska-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Internal error: Oops: 96000044 [#1] PREEMPT SMP - host1x
Date: Fri, 9 Feb 2018 14:25:41 +0000
Message-ID: <CAFCWPPLmbH6OE5Di3ED9aEoy6eV=QtopKfoCei8sS=_2VYAkkg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi,

After append firmware vic04_ucode.bin kernel reports an error

U-Boot 2016.07-g5971907 (Mar 01 2017 - 21:06:45 -0800)

TEGRA186
Model: NVIDIA P2771-0000-500
DRAM:  7.8 GiB
MC:   Tegra SD/MMC: 0, Tegra SD/MMC: 1
*** Warning - bad CRC, using default environment

In:    serial
Out:   serial
Err:   serial
Net:   eth0: ethernet@2490000
Hit any key to stop autoboot:  0
MMC: no card present
switch to partitions #0, OK
mmc0(part 0) is current device
Scanning mmc 0:1...
Found /boot/extlinux/extlinux.conf
Retrieving file: /boot/extlinux/extlinux.conf
518 bytes read in 76 ms (5.9 KiB/s)
p2771-0000 eMMC boot options
1:      primary SATA-SSD
2:      Internal-eMMC
Enter choice: 2
2:      Internal-eMMC
Retrieving file: /boot/initrd-next
6254795 bytes read in 235 ms (25.4 MiB/s)
Retrieving file: /boot/Image-next
17863168 bytes read in 502 ms (33.9 MiB/s)
append: net.ifnames=0 console=tty0 console=ttyS0,115200n8
root=UUID=bcff77ba-f2a3-488d-98ef-45c931147717 rootfstype=ext4 rw
rootwait
Retrieving file: /boot/tegra186-p2771-0000.dtb
23528 bytes read in 81 ms (283.2 KiB/s)
## Flattened Device Tree blob at 82000000
   Booting using the fdt blob at 0x82000000
   Using Device Tree in place at 0000000082000000, end 0000000082008be7

Starting kernel ...

[    0.000000] Booting Linux on physical CPU 0x0000000100 [0x411fd073]
[    0.000000] Linux version 4.15.0-next-20180208-saux (root@ishi)
(gcc version 7.3.0 (SAUX 64bit)) #1 SMP PREEMPT Fri Feb 9 11:57:20 UTC
2018
[    0.000000] Machine model: NVIDIA Tegra186 P2771-0000 Development Board
[    0.000000] efi: Getting EFI parameters from FDT:
[    0.000000] efi: UEFI not found.
[    0.000000] cma: Reserved 16 MiB at 0x00000000f5000000
[    0.000000] NUMA: No NUMA configuration found
[    0.000000] NUMA: Faking a node at [mem
0x0000000000000000-0x000000027fffffff]
[    0.000000] NUMA: NODE_DATA [mem 0x27ffd5c80-0x27ffd777f]
[    0.000000] Zone ranges:
[    0.000000]   DMA32    [mem 0x0000000080000000-0x00000000ffffffff]
[    0.000000]   Normal   [mem 0x0000000100000000-0x000000027fffffff]
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000080000000-0x00000000f5ffffff]
[    0.000000]   node   0: [mem 0x0000000100000000-0x000000027fffffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000080000000-0x000000027fffffff]
[    0.000000] psci: probing for conduit method from DT.
[    0.000000] psci: PSCIv1.0 detected in firmware.
[    0.000000] psci: Using standard PSCI v0.2 function IDs
[    0.000000] psci: MIGRATE_INFO_TYPE not supported.
[    0.000000] psci: SMC Calling Convention v1.0
[    0.000000] random: fast init done
[    0.000000] percpu: Embedded 24 pages/cpu @        (ptrval) s57880
r8192 d32232 u98304
[    0.000000] Detected PIPT I-cache on CPU0
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 2024064
[    0.000000] Policy zone: Normal
[    0.000000] Kernel command line: net.ifnames=0 console=tty0
console=ttyS0,115200n8 root=UUID=bcff77ba-f2a3-488d-98ef-45c931147717
rootfstype=ext4 rw rootwait
[    0.000000] software IO TLB [mem 0xf0fff000-0xf4fff000] (64MB)
mapped at [        (ptrval)-        (ptrval)]
[    0.000000] Memory: 7986568K/8224768K available (10364K kernel
code, 1252K rwdata, 4604K rodata, 1152K init, 404K bss, 221816K
reserved, 16384K cma-reserved)
[    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=6, Nodes=1
[    0.000000] Preemptible hierarchical RCU implementation.
[    0.000000]  RCU restricting CPUs from NR_CPUS=64 to nr_cpu_ids=6.
[    0.000000]  Tasks RCU enabled.
[    0.000000] RCU: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=6
[    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
[    0.000000] GIC: Using split EOI/Deactivate mode
[    0.000000] arch_timer: cp15 timer(s) running at 31.25MHz (phys).
[    0.000000] clocksource: arch_sys_counter: mask: 0xffffffffffffff
max_cycles: 0xe6a171046, max_idle_ns: 881590405314 ns
[    0.000002] sched_clock: 56 bits at 31MHz, resolution 32ns, wraps
every 4398046511088ns
[    0.000084] Console: colour dummy device 80x25
[    0.000247] console [tty0] enabled
[    0.000282] Calibrating delay loop (skipped), value calculated
using timer frequency.. 62.50 BogoMIPS (lpj=125000)
[    0.000296] pid_max: default: 32768 minimum: 301
[    0.000339] Security Framework initialized
[    0.002636] Dentry cache hash table entries: 1048576 (order: 11,
8388608 bytes)
[    0.003787] Inode-cache hash table entries: 524288 (order: 10, 4194304 bytes)
[    0.003846] Mount-cache hash table entries: 16384 (order: 5, 131072 bytes)
[    0.003891] Mountpoint-cache hash table entries: 16384 (order: 5,
131072 bytes)
[    0.020015] ASID allocator initialised with 32768 entries
[    0.028014] Hierarchical SRCU implementation.
[    0.036557] Tegra Revision: A02 SKU: 220 CPU Process: 0 SoC Process: 0
[    0.036702] EFI services will not be available.
[    0.044037] smp: Bringing up secondary CPUs ...
[    0.072745] Detected PIPT I-cache on CPU1
[    0.072761] CPU features: SANITY CHECK: Unexpected variation in
SYS_ID_AA64DFR0_EL1. Boot CPU: 0x00000010305106, CPU1:
0x00000010305116
[    0.072774] CPU features: SANITY CHECK: Unexpected variation in
SYS_ID_DFR0_EL1. Boot CPU: 0x00000003010066, CPU1: 0x00000003001066
[    0.072786] CPU features: Unsupported CPU feature variation detected.
[    0.072831] CPU1: Booted secondary processor 0x0000000000 [0x4e0f0030]
[    0.100372] Detected PIPT I-cache on CPU2
[    0.100385] CPU features: SANITY CHECK: Unexpected variation in
SYS_ID_AA64DFR0_EL1. Boot CPU: 0x00000010305106, CPU2:
0x00000010305116
[    0.100397] CPU features: SANITY CHECK: Unexpected variation in
SYS_ID_DFR0_EL1. Boot CPU: 0x00000003010066, CPU2: 0x00000003001066
[    0.100439] CPU2: Booted secondary processor 0x0000000001 [0x4e0f0030]
[    0.128275] Detected PIPT I-cache on CPU3
[    0.128303] CPU3: Booted secondary processor 0x0000000101 [0x411fd073]
[    0.156311] Detected PIPT I-cache on CPU4
[    0.156331] CPU4: Booted secondary processor 0x0000000102 [0x411fd073]
[    0.184348] Detected PIPT I-cache on CPU5
[    0.184367] CPU5: Booted secondary processor 0x0000000103 [0x411fd073]
[    0.184408] smp: Brought up 1 node, 6 CPUs
[    0.184491] SMP: Total of 6 processors activated.
[    0.184498] CPU features: detected feature: 32-bit EL0 Support
[    0.184506] CPU features: detected feature: Kernel page table
isolation (KPTI)
[    0.198630] CPU: All CPU(s) started at EL2
[    0.198685] alternatives: patching kernel code
[    0.200241] devtmpfs: initialized
[    0.202255] Built 1 zonelists, mobility grouping on.  Total pages: 2000738
[    0.202266] Policy zone: Normal
[    0.203456] clocksource: jiffies: mask: 0xffffffff max_cycles:
0xffffffff, max_idle_ns: 7645041785100000 ns
[    0.203505] futex hash table entries: 2048 (order: 6, 262144 bytes)
[    0.203628] pinctrl core: initialized pinctrl subsystem
[    0.204254] DMI not present or invalid.
[    0.204470] NET: Registered protocol family 16
[    0.204715] audit: initializing netlink subsys (disabled)
[    0.204779] audit: type=2000 audit(0.204:1): state=initialized
audit_enabled=0 res=1
[    0.205300] cpuidle: using governor menu
[    0.205425] vdso: 2 pages (1 code @ 00000000dc68b0fa, 1 data @
0000000017fdbbac)
[    0.205442] hw-breakpoint: found 6 breakpoint and 4 watchpoint registers.
[    0.206071] DMA: preallocated 256 KiB pool for atomic allocations
[    0.206449] Serial: AMBA PL011 UART driver
[    0.211453] tegra-bpmp bpmp: firmware: c11dd04ae487c849cc552f8f702ed8
[    1.140311] random: crng init done
[    1.358354] HugeTLB registered 2.00 MiB page size, pre-allocated 0 pages
[    1.358631] cryptd: max_cpu_qlen set to 1000
[    1.358994] ACPI: Interpreter disabled.
[    1.359649] vgaarb: loaded
[    1.359785] SCSI subsystem initialized
[    1.359999] usbcore: registered new interface driver usbfs
[    1.360031] usbcore: registered new interface driver hub
[    1.360075] usbcore: registered new device driver usb
[    1.364606] pps_core: LinuxPPS API ver. 1 registered
[    1.364616] pps_core: Software ver. 5.3.6 - Copyright 2005-2007
Rodolfo Giometti <giometti-k2GhghHVRtY@public.gmane.org>
[    1.364635] PTP clock support registered
[    1.364719] EDAC MC: Ver: 3.0.0
[    1.365081] Advanced Linux Sound Architecture Driver Initialized.
[    1.365472] clocksource: Switched to clocksource arch_sys_counter
[    1.365552] VFS: Disk quotas dquot_6.6.0
[    1.365588] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
[    1.365673] pnp: PnP ACPI: disabled
[    1.369006] NET: Registered protocol family 2
[    1.369341] tcp_listen_portaddr_hash hash table entries: 4096
(order: 4, 65536 bytes)
[    1.369430] TCP established hash table entries: 65536 (order: 7,
524288 bytes)
[    1.369731] TCP bind hash table entries: 65536 (order: 8, 1048576 bytes)
[    1.370043] TCP: Hash tables configured (established 65536 bind 65536)
[    1.370148] UDP hash table entries: 4096 (order: 5, 131072 bytes)
[    1.370206] UDP-Lite hash table entries: 4096 (order: 5, 131072 bytes)
[    1.370327] NET: Registered protocol family 1
[    1.370603] RPC: Registered named UNIX socket transport module.
[    1.370615] RPC: Registered udp transport module.
[    1.370622] RPC: Registered tcp transport module.
[    1.370629] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    1.370729] Unpacking initramfs...
[    1.587431] Freeing initrd memory: 6108K
[    1.587971] kvm [1]: 8-bit VMID
[    1.587980] kvm [1]: IDMAP page: 80a87000
[    1.587988] kvm [1]: HYP VA range: 800000000000:ffffffffffff
[    1.588663] kvm [1]: virtual timer IRQ4
[    1.588808] kvm [1]: Hyp mode initialized successfully
[    1.590947] Initialise system trusted keyrings
[    1.591008] workingset: timestamp_bits=44 max_order=21 bucket_order=0
[    1.594289] squashfs: version 4.0 (2009/01/31) Phillip Lougher
[    1.594629] NFS: Registering the id_resolver key type
[    1.594649] Key type id_resolver registered
[    1.594655] Key type id_legacy registered
[    1.594666] nfs4filelayout_init: NFSv4 File Layout Driver Registering...
[    1.594747] 9p: Installing v9fs 9p2000 file system support
[    1.596567] Key type asymmetric registered
[    1.596577] Asymmetric key parser 'x509' registered
[    1.596659] Block layer SCSI generic (bsg) driver version 0.4
loaded (major 245)
[    1.596670] io scheduler noop registered
[    1.596770] io scheduler cfq registered (default)
[    1.596779] io scheduler mq-deadline registered
[    1.596785] io scheduler kyber registered
[    1.600672] tegra-pcie 10003000.pcie: 4x1, 1x1 configuration
[    1.600700] tegra-pcie 10003000.pcie: Failed to get supply 'dvdd-pex': -517
[    1.601524] EINJ: ACPI disabled.
[    1.606130] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[    1.607314] console [ttyS0] disabled
[    1.607347] 3100000.serial: ttyS0 at MMIO 0x3100000 (irq = 22,
base_baud = 25500000) is a Tegra
[    2.461315] console [ttyS0] enabled
[    2.465177] SuperH (H)SCI(F) driver initialized
[    2.469904] msm_serial: driver initialized
[    2.474505] arm-smmu 12000000.iommu: probing hardware configuration...
[    2.481033] arm-smmu 12000000.iommu: SMMUv2 with:
[    2.485736] arm-smmu 12000000.iommu:         stage 1 translation
[    2.491131] arm-smmu 12000000.iommu:         stage 2 translation
[    2.496527] arm-smmu 12000000.iommu:         nested translation
[    2.501837] arm-smmu 12000000.iommu:         stream matching with
128 register groups
[    2.509055] arm-smmu 12000000.iommu:         64 context banks (0
stage-2 only)
[    2.515666] arm-smmu 12000000.iommu:         Supported page sizes: 0x61311000
[    2.522189] arm-smmu 12000000.iommu:         Stage-1: 48-bit VA -> 48-bit IPA
[    2.528711] arm-smmu 12000000.iommu:         Stage-2: 48-bit IPA -> 48-bit PA
[    2.535626] cacheinfo: Unable to detect cache hierarchy for CPU 0
[    2.545107] loop: module loaded
[    2.550248] libphy: Fixed MDIO Bus: probed
[    2.554646] tun: Universal TUN/TAP device driver, 1.6
[    2.560082] thunder_xcv, ver 1.0
[    2.563334] thunder_bgx, ver 1.0
[    2.566584] nicpf, ver 1.0
[    2.569446] e1000e: Intel(R) PRO/1000 Network Driver - 3.2.6-k
[    2.575276] e1000e: Copyright(c) 1999 - 2015 Intel Corporation.
[    2.581213] igb: Intel(R) Gigabit Ethernet Network Driver - version 5.4.0-k
[    2.588168] igb: Copyright (c) 2007-2014 Intel Corporation.
[    2.593761] igbvf: Intel(R) Gigabit Virtual Function Network Driver
- version 2.4.0-k
[    2.601584] igbvf: Copyright (c) 2009 - 2012 Intel Corporation.
[    2.607667] sky2: driver version 1.30
[    2.611567] VFIO - User Level meta-driver version: 0.3
[    2.617241] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    2.623768] ehci-pci: EHCI PCI platform driver
[    2.628231] ehci-platform: EHCI generic platform driver
[    2.633521] ehci-orion: EHCI orion driver
[    2.637575] ehci-exynos: EHCI EXYNOS driver
[    2.641804] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[    2.647986] ohci-pci: OHCI PCI platform driver
[    2.652450] ohci-platform: OHCI generic platform driver
[    2.657722] ohci-exynos: OHCI EXYNOS driver
[    2.662129] usbcore: registered new interface driver usb-storage
[    2.669527] i2c /dev entries driver
[    2.674971] max77620 0-003c: PMIC Version OTP:0x45 and ES:0x8
[    2.685428] max77620-sd0: supplied by regulator-dummy
[    2.690640] VDD_DDR_1V1_PMIC: Bringing 1125000uV into 1100000-1100000uV
[    2.699066] max77620-sd1: supplied by regulator-dummy
[    2.705349] max77620-sd2: supplied by regulator-dummy
[    2.711651] max77620-sd3: supplied by regulator-dummy
[    2.718246] max77620-ldo0: supplied by regulator-dummy
[    2.724223] max77620-ldo1: supplied by regulator-dummy
[    2.729991] max77620-ldo2: supplied by regulator-dummy
[    2.736260] max77620-ldo3: supplied by regulator-dummy
[    2.741938] max77620-ldo4: supplied by regulator-dummy
[    2.747592] max77620-ldo5: supplied by regulator-dummy
[    2.752747] VDDIO_SDMMC3_AP: Bringing 1800000uV into 2800000-2800000uV
[    2.759929] max77620-ldo6: supplied by regulator-dummy
[    2.765736] max77620-ldo7: supplied by regulator-dummy
[    2.770888] VDD_HDMI_1V05: Bringing 1000000uV into 1050000-1050000uV
[    2.778458] max77620-ldo8: supplied by regulator-dummy
[    2.783629] VDD_PEX_1V05: Bringing 1000000uV into 1050000-1050000uV
[    3.965428] max77686-rtc max77620-rtc: rtc core: registered
max77620-rtc as rtc0
[    3.974833] sdhci: Secure Digital Host Controller Interface driver
[    3.981015] sdhci: Copyright(c) Pierre Ossman
[    3.985487] Synopsys Designware Multimedia Card Interface Driver
[    3.991870] sdhci-pltfm: SDHCI platform and OF driver helper
[    3.997688] sdhci-tegra 3400000.sdhci: Got CD GPIO
[    4.002491] sdhci-tegra 3400000.sdhci: Got WP GPIO
[    4.024219] mmc0: Unknown controller version (4). You may
experience problems.
[    4.062743] mmc0: SDHCI controller on 3440000.sdhci [3440000.sdhci]
using ADMA
[    4.078802] ledtrig-cpu: registered to indicate activity on CPUs
[    4.085379] usbcore: registered new interface driver usbhid
[    4.090955] usbhid: USB HID core driver
[    4.095829] NET: Registered protocol family 17
[    4.100320] 9pnet: Installing 9P2000 support
[    4.104622] Key type dns_resolver registered
[    4.109201] registered taskstats version 1
[    4.113300] Loading compiled-in X.509 certificates
[    4.126241] VDD_1V8_AP: supplied by VDD_1V8
[    4.130796] SD_CARD_SW_PWR: supplied by VDD_3V3_SYS
[    4.136329] pca953x 1-0074: 1-0074 supply vcc not found, using
dummy regulator
[    4.145931] pca953x 1-0077: 1-0077 supply vcc not found, using
dummy regulator
[    4.155752] tegra-pcie 10003000.pcie: 4x1, 1x1 configuration
[    4.162539] tegra-pcie 10003000.pcie: probing port 0, using 4 lanes
[    4.170835] tegra-pcie 10003000.pcie: Slot present pin change,
signature: 00000018
[    4.572223] tegra-pcie 10003000.pcie: link 0 down, retrying
[    4.980926] tegra-pcie 10003000.pcie: link 0 down, retrying
[    5.389613] tegra-pcie 10003000.pcie: link 0 down, retrying
[    5.397191] tegra-pcie 10003000.pcie: link 0 down, ignoring
[    5.402832] tegra-pcie 10003000.pcie: PCI host bridge to bus 0000:00
[    5.409187] pci_bus 0000:00: root bus resource [io  0x0000-0xffff]
[    5.415365] pci_bus 0000:00: root bus resource [mem 0x50100000-0x57ffffff]
[    5.422234] pci_bus 0000:00: root bus resource [mem
0x58000000-0x7fffffff pref]
[    5.429538] pci_bus 0000:00: root bus resource [bus 00-ff]
[    5.435447] sdhci-tegra 3400000.sdhci: Got CD GPIO
[    5.440252] sdhci-tegra 3400000.sdhci: Got WP GPIO
[    5.453346] mmc1: Unknown controller version (4). You may
experience problems.
[    5.492175] mmc1: SDHCI controller on 3400000.sdhci [3400000.sdhci]
using ADMA
[    5.508407] mmc2: Unknown controller version (4). You may
experience problems.
[    5.516141] mmc2: Switching to 3.3V signalling voltage failed
[    5.547377] mmc2: SDHCI controller on 3460000.sdhci [3460000.sdhci]
using ADMA
[    5.555881] VDD_HDMI_5V0: supplied by VDD_5V0_SYS
[    5.561356] input: gpio-keys as /devices/platform/gpio-keys/input/input0
[    5.600737] max77686-rtc max77620-rtc: setting system clock to
2018-02-09 14:02:00 UTC (1518184920)
[    5.627182] VDD_RTC: disabling
[    5.630246] VDDIO_SDMMC3_AP: disabling
[    5.634143] SD_CARD_SW_PWR: disabling
[    5.637805] VDD_HDMI_5V0: disabling
[    5.641286] ALSA device list:
[    5.642229] mmc2: new high speed MMC card at address 0001
[    5.644251]   No soundcards found.
[    5.650063] mmcblk2: mmc2:0001 032G34 29.1 GiB
[    5.657924] mmcblk2boot0: mmc2:0001 032G34 partition 1 4.00 MiB
[    5.658102] Freeing unused kernel memory: 1152K
[    5.664178] mmcblk2boot1: mmc2:0001 032G34 partition 2 4.00 MiB
[    5.674406] mmcblk2rpmb: mmc2:0001 032G34 partition 3 4.00 MiB,
chardev (240:0)
[    5.688352]  mmcblk2: p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11 p12 p13
p14 p15 p16 p17
[    5.916125] dracut: dracut-046
[    6.226484] systemd-udevd[1559]: starting version 3.2.2
[    6.234534] udevd[1560]: starting eudev-3.2.2
[    6.640209] EXT4-fs (mmcblk2p1): mounted filesystem with ordered
data mode. Opts: discard
discard,noatime,defaults
[    6.720408] dracut: Remounting
/dev/disk/by-uuid/bcff77ba-f2a3-488d-98ef-45c931147717 with -o
discard,noatime,defaults,rw
[    6.735437] EXT4-fs (mmcblk2p1): re-mounted. Opts: discard
[    6.772757] dracut: Mounted root filesystem /dev/mmcblk2p1
[    6.931166] dracut: Switching root
INIT: version 2.88 booting
The system is coming up.  Please wait.
mount: /proc: none already mounted or mount point busy.
mount: /sys: none already mounted or mount point busy.
[    7.153251] udevd[2612]: starting version 3.2.2
[    7.187634] udevd[2614]: starting eudev-3.2.2
[    7.360489] iommu: Adding device 13e00000.host1x to group 0
[    8.043241] iommu: Adding device 15200000.display to group 1
[    8.060031] iommu: Adding device 15210000.display to group 1
[    8.073720] iommu: Adding device 15220000.display to group 1
[    8.088318] tegra-dpaux 15040000.dpaux: 15040000.dpaux supply vdd
not found, using dummy regulator
[    8.100191] tegra-dpaux 155c0000.dpaux: 155c0000.dpaux supply vdd
not found, using dummy regulator
[    8.121505] Unable to handle kernel paging request at virtual
address fffffffffffffff0
[    8.129427] Mem abort info:
[    8.132221]   ESR = 0x96000044
[    8.135282]   Exception class = DABT (current EL), IL = 32 bits
[    8.141198]   SET = 0, FnV = 0
[    8.144252]   EA = 0, S1PTW = 0
[    8.147393] Data abort info:
[    8.150274]   ISV = 0, ISS = 0x00000044
[    8.154107]   CM = 0, WnR = 1
[    8.157069] swapper pgtable: 4k pages, 48-bit VAs, pgd = 00000000aa75510e
[    8.163851] [fffffffffffffff0] *pgd=0000000000000000
[    8.168817] Internal error: Oops: 96000044 [#1] PREEMPT SMP
[    8.174378] Modules linked in: tegra_drm(+) drm_kms_helper drm
crc32_ce drm_panel_orientation_quirks crct10dif_ce host1x
[    8.185247] CPU: 5 PID: 3223 Comm: udevd Tainted: G S
4.15.0-next-20180208-saux #1
[    8.194017] Hardware name: NVIDIA Tegra186 P2771-0000 Development Board (DT)
[    8.201054] pstate: 40000005 (nZcv daif -PAN -UAO)
[    8.205873] pc : falcon_load_firmware+0x58/0x310 [tegra_drm]
[    8.211552] lr : falcon_load_firmware+0x30/0x310 [tegra_drm]
[    8.217200] sp : ffff00000efcb5d0
[    8.220505] x29: ffff00000efcb5d0 x28: 0000000000000000
[    8.225810] x27: 0000000000000000 x26: 0000000000000000
[    8.231114] x25: ffff0000091dc000 x24: 0000000000000013
[    8.236416] x23: ffff8001f412c618 x22: ffff8001f414c000
[    8.241720] x21: 0000000000000000 x20: ffff8001f4209580
[    8.247023] x19: ffff8001f412c618 x18: ffffffffffffffff
[    8.252326] x17: 00000000ffffff80 x16: ffff00000827f8a0
[    8.257628] x15: 0000000000000000 x14: 0000000000000400
[    8.262931] x13: 0000000000000400 x12: 0000000000000001
[    8.268233] x11: 0000000000b4c6ca x10: ffff8001fffc8c68
[    8.273535] x9 : 0000000000000000 x8 : 0000000000000000
[    8.278839] x7 : ffff8001fffd6538 x6 : ffff0000091bea98
[    8.284142] x5 : ffff0000091bea78 x4 : 0000000000000002
[    8.289445] x3 : 00000000000010de x2 : fffffffffffffff0
[    8.294748] x1 : 0000000000000000 x0 : 00000000000012c0
[    8.300052] Process udevd (pid: 3223, stack limit = 0x000000008d3e666a)
[    8.306652] Call trace:
[    8.309123]  falcon_load_firmware+0x58/0x310 [tegra_drm]
[    8.314452]  vic_init+0x6c/0x158 [tegra_drm]
[    8.318739]  host1x_device_init+0x4c/0x100 [host1x]
[    8.323638]  tegra_drm_load+0xc4/0x2e0 [tegra_drm]
[    8.328500]  drm_dev_register+0x154/0x1f0 [drm]
[    8.333053]  host1x_drm_probe+0x34/0x88 [tegra_drm]
[    8.337945]  host1x_device_probe+0x20/0x30 [host1x]
[    8.342818]  driver_probe_device+0x23c/0x310
[    8.347079]  __device_attach_driver+0x9c/0xf8
[    8.351430]  bus_for_each_drv+0x68/0xd0
[    8.355258]  __device_attach+0xd8/0x138
[    8.359085]  device_initial_probe+0x10/0x18
[    8.363259]  bus_probe_device+0x94/0xa0
[    8.367086]  device_add+0x408/0x628
[    8.370587]  host1x_subdev_register+0xc8/0x108 [host1x]
[    8.375824]  host1x_client_register+0x120/0x158 [host1x]
[    8.381154]  vic_probe+0x12c/0x260 [tegra_drm]
[    8.385590]  platform_drv_probe+0x58/0xb8
[    8.389592]  driver_probe_device+0x23c/0x310
[    8.393854]  __driver_attach+0xbc/0xc0
[    8.397595]  bus_for_each_dev+0x74/0xc8
[    8.401423]  driver_attach+0x20/0x28
[    8.404992]  bus_add_driver+0x1b8/0x228
[    8.408820]  driver_register+0x60/0xf8
[    8.412560]  __platform_register_drivers+0x74/0x108
[    8.417457]  host1x_drm_init+0x44/0x1000 [tegra_drm]
[    8.422414]  do_one_initcall+0x4c/0x158
[    8.426245]  do_init_module+0x58/0x1b4
[    8.429986]  load_module+0x1b0c/0x22a0
[    8.433727]  SyS_finit_module+0xd0/0xf0
[    8.437554]  el0_svc_naked+0x30/0x34
[    8.441122] Code: d342fc00 b4000100 f9400683 b8617863 (b8217843)
[    8.447205] ---[ end trace 60cda9bcc5519641 ]---
[    8.452444] udevd[2614]: worker [3223] terminated by signal 11
(Segmentation fault)
[    8.460200] udevd[2614]: worker [3223] failed while handling
'/devices/platform/13e00000.host1x/13e00000.host1x:display-hub@15200000'
[   68.536202] udevd[2614]: worker [3541]
/devices/platform/13e00000.host1x/15040000.dpaux is taking a long time
[   68.546231] udevd[2614]: worker [3221]
/devices/platform/13e00000.host1x/15580000.sor is taking a long time
[   68.556061] udevd[2614]: worker [3543]
/devices/platform/13e00000.host1x/155c0000.dpaux is taking a long time
[   71.569289] udevd[2614]: worker [3041]
/devices/platform/13e00000.host1x/13e00000.host1x:display-hub@15200000/15200000.display
is taking a long time
[   71.582684] udevd[2614]: worker [3545]
/devices/platform/13e00000.host1x/13e00000.host1x:display-hub@15200000/15210000.display
is taking a long time
[   71.596047] udevd[2614]: worker [3063]
/devices/platform/13e00000.host1x/13e00000.host1x:display-hub@15200000/15220000.display
is taking a long time
[  127.380160] EXT4-fs (mmcblk2p1): re-mounted. Opts: discard
[  127.404685] EXT4-fs (mmcblk2p1): re-mounted. Opts: discard
hostname: host
hwclock: select() to /dev/rtc0 to wait for clock tick timed out
font: default
keyboard: us
INIT: Entering runlevel: 2
starting services: sysklogd lo net crond

is the kernel or udev error?

Best regards

-- 
----------------------------------------------------------------------------
Remember, no question is too stupid and no problem
          too small--We've all been beginners
