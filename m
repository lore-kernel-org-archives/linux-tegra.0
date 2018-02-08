From: Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>
Subject: Re: kernel-next on jetson tx2 - boot fail
Date: Thu, 8 Feb 2018 14:53:36 +0200
Message-ID: <5e4c1aef-1af9-857e-3509-b36a71454d6e@kapsi.fi>
References: <CAFCWPPK8jvXVOL6W-NMpj9aveWQAAv33BoFbipmhEKOCte0sKw@mail.gmail.com>
 <4787c6dc-c6d3-4879-a3d6-1e48868d304b@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4787c6dc-c6d3-4879-a3d6-1e48868d304b-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, =?UTF-8?Q?Milan_Bu=c5=a1ka?= <milan.buska-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

One issue is that most of the persistent labeling schemes require an 
initrd to interpret them. I'm using a super-simple initrd to just find 
the first proper-looking partition and mount that, maybe I should put it 
somewhere..

Mikko

On 02/08/2018 02:39 PM, Jon Hunter wrote:
> Hi Milan,
> 
> Add linux-tegra to CC ...
> 
> On 08/02/18 11:53, Milan Buška wrote:
>> Hi Jon,
>>
>> I have jetson tx2 and I'm trying to run kernel-next.
>> I'm not a programmer, so I do not know where I'm making a mistake.
>>
>> You can check it out and write me if there is a bug in the bootloader
>> or kernel configuration.
> 
> ...
> 
> 
>> U-Boot 2016.07-g5971907 (Mar 01 2017 - 21:06:45 -0800)
>>
>> TEGRA186
>> Model: NVIDIA P2771-0000-500
>> DRAM:  7.8 GiB
>> MC:   Tegra SD/MMC: 0, Tegra SD/MMC: 1
>> *** Warning - bad CRC, using default environment
>>
>> In:    serial
>> Out:   serial
>> Err:   serial
>> Net:   eth0: ethernet@2490000
>> Hit any key to stop autoboot:  0
>> MMC: no card present
>> switch to partitions #0, OK
>> mmc0(part 0) is current device
>> Scanning mmc 0:1...
>> Found /boot/extlinux/extlinux.conf
>> Retrieving file: /boot/extlinux/extlinux.conf
>> 544 bytes read in 76 ms (6.8 KiB/s)
>> p2771-0000 eMMC boot options
>> 1:      primary SATA-SSD
>> 2:      Internal-eMMC
>> Enter choice: 2
>> 2:      Internal-eMMC
>> Retrieving file: /boot/Image-next
>> 18672128 bytes read in 521 ms (34.2 MiB/s)
>> append: fbcon=map:0 net.ifnames=0 console=tty0 OS=l4t
>> console=ttyS0,115200n8 memtype=0 no_console_suspend=1
>> earlycon=uart8250,mmio32,0x03100000 gpt maxcpus=6 root=/dev/mmcblk0p1
>> rw rootwait
>> Retrieving file: /boot/tegra186-p2771-0000.dtb
>> 23528 bytes read in 81 ms (283.2 KiB/s)
>> ## Flattened Device Tree blob at 82000000
>>     Booting using the fdt blob at 0x82000000
>>     Using Device Tree in place at 0000000082000000, end 0000000082008be7
>>
>> Starting kernel ...
>>
>> [    0.000000] Booting Linux on physical CPU 0x0000000100 [0x411fd073]
>> [    0.000000] Linux version 4.15.0-next-20180208 (root@ishi) (gcc
>> version 7.3.0 (SAUX 64bit)) #1 SMP PREEMPT Thu Feb 8 09:58:11 UTC 2018
>> [    0.000000] Machine model: NVIDIA Tegra186 P2771-0000 Development Board
>> [    0.000000] earlycon: uart8250 at MMIO32 0x0000000003100000 (options '')
>> [    0.000000] bootconsole [uart8250] enabled
>> [    0.000000] efi: Getting EFI parameters from FDT:
>> [    0.000000] efi: UEFI not found.
>> [    0.000000] cma: Reserved 16 MiB at 0x00000000f5000000
>> [    0.000000] NUMA: No NUMA configuration found
>> [    0.000000] NUMA: Faking a node at [mem
>> 0x0000000000000000-0x000000027fffffff]
>> [    0.000000] NUMA: NODE_DATA [mem 0x27ffd4d00-0x27ffd67ff]
>> [    0.000000] Zone ranges:
>> [    0.000000]   DMA32    [mem 0x0000000080000000-0x00000000ffffffff]
>> [    0.000000]   Normal   [mem 0x0000000100000000-0x000000027fffffff]
>> [    0.000000] Movable zone start for each node
>> [    0.000000] Early memory node ranges
>> [    0.000000]   node   0: [mem 0x0000000080000000-0x00000000f5ffffff]
>> [    0.000000]   node   0: [mem 0x0000000100000000-0x000000027fffffff]
>> [    0.000000] Initmem setup node 0 [mem 0x0000000080000000-0x000000027fffffff]
>> [    0.000000] psci: probing for conduit method from DT.
>> [    0.000000] psci: PSCIv1.0 detected in firmware.
>> [    0.000000] psci: Using standard PSCI v0.2 function IDs
>> [    0.000000] psci: MIGRATE_INFO_TYPE not supported.
>> [    0.000000] psci: SMC Calling Convention v1.0
>> [    0.000000] random: fast init done
>> [    0.000000] percpu: Embedded 24 pages/cpu @        (ptrval) s57880
>> r8192 d32232 u98304
>> [    0.000000] Detected PIPT I-cache on CPU0
>> [    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 2024064
>> [    0.000000] Policy zone: Normal
>> [    0.000000] Kernel command line: fbcon=map:0 net.ifnames=0
>> console=tty0 OS=l4t console=ttyS0,115200n8 memtype=0
>> no_console_suspend=1 earlycon=uart8250,mmio32,0x03100000 gpt maxcpus=6
>> root=/dev/mmcblk0p1 rw rootwait
>> [    0.000000] software IO TLB [mem 0xf0fff000-0xf4fff000] (64MB)
>> mapped at [        (ptrval)-        (ptrval)]
>> [    0.000000] Memory: 7991892K/8224768K available (10940K kernel
>> code, 1274K rwdata, 4840K rodata, 1152K init, 402K bss, 216492K
>> reserved, 16384K cma-reserved)
>> [    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=6, Nodes=1
>> [    0.000000] Preemptible hierarchical RCU implementation.
>> [    0.000000]  RCU restricting CPUs from NR_CPUS=64 to nr_cpu_ids=6.
>> [    0.000000]  Tasks RCU enabled.
>> [    0.000000] RCU: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=6
>> [    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
>> [    0.000000] GIC: Using split EOI/Deactivate mode
>> [    0.000000] arch_timer: cp15 timer(s) running at 31.25MHz (phys).
>> [    0.000000] clocksource: arch_sys_counter: mask: 0xffffffffffffff
>> max_cycles: 0xe6a171046, max_idle_ns: 881590405314 ns
>> [    0.000003] sched_clock: 56 bits at 31MHz, resolution 32ns, wraps
>> every 4398046511088ns
>> [    0.008398] Console: colour dummy device 80x25
>> [    0.013177] console [tty0] enabled
>> [    0.016728] Calibrating delay loop (skipped), value calculated
>> using timer frequency.. 62.50 BogoMIPS (lpj=125000)
>> [    0.027480] pid_max: default: 32768 minimum: 301
>> [    0.032304] Security Framework initialized
>> [    0.038861] Dentry cache hash table entries: 1048576 (order: 11,
>> 8388608 bytes)
>> [    0.047603] Inode-cache hash table entries: 524288 (order: 10, 4194304 bytes)
>> [    0.055066] Mount-cache hash table entries: 16384 (order: 5, 131072 bytes)
>> [    0.062240] Mountpoint-cache hash table entries: 16384 (order: 5,
>> 131072 bytes)
>> [    0.085872] ASID allocator initialised with 32768 entries
>> [    0.091523] Hierarchical SRCU implementation.
>> [    0.104590] Tegra Revision: A02 SKU: 220 CPU Process: 0 SoC Process: 0
>> [    0.111512] EFI services will not be available.
>> [    0.124229] smp: Bringing up secondary CPUs ...
>> [    0.157649] Detected PIPT I-cache on CPU1
>> [    0.157665] CPU features: SANITY CHECK: Unexpected variation in
>> SYS_ID_AA64DFR0_EL1. Boot CPU: 0x00000010305106, CPU1:
>> 0x00000010305116
>> [    0.157679] CPU features: SANITY CHECK: Unexpected variation in
>> SYS_ID_DFR0_EL1. Boot CPU: 0x00000003010066, CPU1: 0x00000003001066
>> [    0.157691] CPU features: Unsupported CPU feature variation detected.
>> [    0.157736] CPU1: Booted secondary processor 0x0000000000 [0x4e0f0030]
>> [    0.185274] Detected PIPT I-cache on CPU2
>> [    0.185288] CPU features: SANITY CHECK: Unexpected variation in
>> SYS_ID_AA64DFR0_EL1. Boot CPU: 0x00000010305106, CPU2:
>> 0x00000010305116
>> [    0.185300] CPU features: SANITY CHECK: Unexpected variation in
>> SYS_ID_DFR0_EL1. Boot CPU: 0x00000003010066, CPU2: 0x00000003001066
>> [    0.185341] CPU2: Booted secondary processor 0x0000000001 [0x4e0f0030]
>> [    0.213179] Detected PIPT I-cache on CPU3
>> [    0.213206] CPU3: Booted secondary processor 0x0000000101 [0x411fd073]
>> [    0.241212] Detected PIPT I-cache on CPU4
>> [    0.241231] CPU4: Booted secondary processor 0x0000000102 [0x411fd073]
>> [    0.269252] Detected PIPT I-cache on CPU5
>> [    0.269271] CPU5: Booted secondary processor 0x0000000103 [0x411fd073]
>> [    0.269312] smp: Brought up 1 node, 6 CPUs
>> [    0.384655] SMP: Total of 6 processors activated.
>> [    0.389535] CPU features: detected feature: 32-bit EL0 Support
>> [    0.395591] CPU features: detected feature: Kernel page table
>> isolation (KPTI)
>> [    0.417710] CPU: All CPU(s) started at EL2
>> [    0.422019] alternatives: patching kernel code
>> [    0.428236] devtmpfs: initialized
>> [    0.433638] Built 1 zonelists, mobility grouping on.  Total pages: 2002069
>> [    0.440790] Policy zone: Normal
>> [    0.445356] clocksource: jiffies: mask: 0xffffffff max_cycles:
>> 0xffffffff, max_idle_ns: 7645041785100000 ns
>> [    0.455515] futex hash table entries: 2048 (order: 6, 262144 bytes)
>> [    0.462153] pinctrl core: initialized pinctrl subsystem
>> [    0.468229] DMI not present or invalid.
>> [    0.472410] NET: Registered protocol family 16
>> [    0.477304] audit: initializing netlink subsys (disabled)
>> [    0.482974] audit: type=2000 audit(0.356:1): state=initialized
>> audit_enabled=0 res=1
>> [    0.491054] cpuidle: using governor menu
>> [    0.495909] vdso: 2 pages (1 code @ 00000000bee5903f, 1 data @
>> 000000009082fb3d)
>> [    0.503754] hw-breakpoint: found 6 breakpoint and 4 watchpoint registers.
>> [    0.512980] DMA: preallocated 256 KiB pool for atomic allocations
>> [    0.520596] Serial: AMBA PL011 UART driver
>> [    0.533732] tegra-bpmp bpmp: firmware: c11dd04ae487c849cc552f8f702ed8
>> [    1.480427] random: crng init done
>> [    1.703280] HugeTLB registered 2.00 MiB page size, pre-allocated 0 pages
>> [    1.710472] cryptd: max_cpu_qlen set to 1000
>> [    1.715276] ACPI: Interpreter disabled.
>> [    1.719960] vgaarb: loaded
>> [    1.722912] SCSI subsystem initialized
>> [    1.727311] usbcore: registered new interface driver usbfs
>> [    1.733276] usbcore: registered new interface driver hub
>> [    1.738839] usbcore: registered new device driver usb
>> [    1.748893] pps_core: LinuxPPS API ver. 1 registered
>> [    1.754067] pps_core: Software ver. 5.3.6 - Copyright 2005-2007
>> Rodolfo Giometti <giometti-k2GhghHVRtY@public.gmane.org>
>> [    1.763550] PTP clock support registered
>> [    1.767731] EDAC MC: Ver: 3.0.0
>> [    1.771327] Advanced Linux Sound Architecture Driver Initialized.
>> [    1.778064] clocksource: Switched to clocksource arch_sys_counter
>> [    1.784481] VFS: Disk quotas dquot_6.6.0
>> [    1.788585] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
>> [    1.795819] pnp: PnP ACPI: disabled
>> [    1.802951] NET: Registered protocol family 2
>> [    1.807788] tcp_listen_portaddr_hash hash table entries: 4096
>> (order: 4, 65536 bytes)
>> [    1.815996] TCP established hash table entries: 65536 (order: 7,
>> 524288 bytes)
>> [    1.823772] TCP bind hash table entries: 65536 (order: 8, 1048576 bytes)
>> [    1.831014] TCP: Hash tables configured (established 65536 bind 65536)
>> [    1.837884] UDP hash table entries: 4096 (order: 5, 131072 bytes)
>> [    1.844263] UDP-Lite hash table entries: 4096 (order: 5, 131072 bytes)
>> [    1.851147] NET: Registered protocol family 1
>> [    1.855876] RPC: Registered named UNIX socket transport module.
>> [    1.862028] RPC: Registered udp transport module.
>> [    1.866914] RPC: Registered tcp transport module.
>> [    1.871793] RPC: Registered tcp NFSv4.1 backchannel transport module.
>> [    1.879067] kvm [1]: 8-bit VMID
>> [    1.882336] kvm [1]: IDMAP page: 80b15000
>> [    1.886500] kvm [1]: HYP VA range: 800000000000:ffffffffffff
>> [    1.893073] kvm [1]: virtual timer IRQ4
>> [    1.897196] kvm [1]: Hyp mode initialized successfully
>> [    1.904159] Initialise system trusted keyrings
>> [    1.908831] workingset: timestamp_bits=44 max_order=21 bucket_order=0
>> [    1.918656] squashfs: version 4.0 (2009/01/31) Phillip Lougher
>> [    1.925050] NFS: Registering the id_resolver key type
>> [    1.930310] Key type id_resolver registered
>> [    1.934655] Key type id_legacy registered
>> [    1.938824] nfs4filelayout_init: NFSv4 File Layout Driver Registering...
>> [    1.945868] 9p: Installing v9fs 9p2000 file system support
>> [    1.953331] Key type asymmetric registered
>> [    1.957612] Asymmetric key parser 'x509' registered
>> [    1.962765] Block layer SCSI generic (bsg) driver version 0.4
>> loaded (major 245)
>> [    1.970448] io scheduler noop registered
>> [    1.974619] io scheduler cfq registered (default)
>> [    1.979507] io scheduler mq-deadline registered
>> [    1.984201] io scheduler kyber registered
>> [    1.992267] tegra-pcie 10003000.pcie: 4x1, 1x1 configuration
>> [    1.998178] tegra-pcie 10003000.pcie: Failed to get supply 'dvdd-pex': -517
>> [    2.006191] EINJ: ACPI disabled.
>> [    2.013862] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
>> [    2.021536] console [ttyS0] disabled
>> [    2.025285] 3100000.serial: ttyS0 at MMIO 0x3100000 (irq = 22,
>> base_baud = 25500000) is a Tegra
>> [    2.034338] console [ttyS0] enabled
>> [    2.034338] console [ttyS0] enabled
>> [    2.041433] bootconsole [uart8250] disabled
>> [    2.041433] bootconsole [uart8250] disabled
>> [    2.050283] SuperH (H)SCI(F) driver initialized
>> [    2.055011] msm_serial: driver initialized
>> [    2.059590] arm-smmu 12000000.iommu: probing hardware configuration...
>> [    2.066118] arm-smmu 12000000.iommu: SMMUv2 with:
>> [    2.070819] arm-smmu 12000000.iommu:         stage 1 translation
>> [    2.076215] arm-smmu 12000000.iommu:         stage 2 translation
>> [    2.081610] arm-smmu 12000000.iommu:         nested translation
>> [    2.086921] arm-smmu 12000000.iommu:         stream matching with
>> 128 register groups
>> [    2.094140] arm-smmu 12000000.iommu:         64 context banks (0
>> stage-2 only)
>> [    2.100754] arm-smmu 12000000.iommu:         Supported page sizes: 0x61311000
>> [    2.107277] arm-smmu 12000000.iommu:         Stage-1: 48-bit VA -> 48-bit IPA
>> [    2.113802] arm-smmu 12000000.iommu:         Stage-2: 48-bit IPA -> 48-bit PA
>> [    2.120762] iommu: Adding device 13e00000.host1x to group 0
>> [    2.127903] cacheinfo: Unable to detect cache hierarchy for CPU 0
>> [    2.137356] loop: module loaded
>> [    2.142384] libphy: Fixed MDIO Bus: probed
>> [    2.146777] tun: Universal TUN/TAP device driver, 1.6
>> [    2.152218] thunder_xcv, ver 1.0
>> [    2.155474] thunder_bgx, ver 1.0
>> [    2.158727] nicpf, ver 1.0
>> [    2.161591] e1000e: Intel(R) PRO/1000 Network Driver - 3.2.6-k
>> [    2.167421] e1000e: Copyright(c) 1999 - 2015 Intel Corporation.
>> [    2.173362] igb: Intel(R) Gigabit Ethernet Network Driver - version 5.4.0-k
>> [    2.180318] igb: Copyright (c) 2007-2014 Intel Corporation.
>> [    2.185907] igbvf: Intel(R) Gigabit Virtual Function Network Driver
>> - version 2.4.0-k
>> [    2.193729] igbvf: Copyright (c) 2009 - 2012 Intel Corporation.
>> [    2.199806] sky2: driver version 1.30
>> [    2.203709] VFIO - User Level meta-driver version: 0.3
>> [    2.209456] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
>> [    2.215982] ehci-pci: EHCI PCI platform driver
>> [    2.220446] ehci-platform: EHCI generic platform driver
>> [    2.225725] ehci-orion: EHCI orion driver
>> [    2.229782] ehci-exynos: EHCI EXYNOS driver
>> [    2.234009] tegra-ehci: Tegra EHCI driver
>> [    2.238083] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
>> [    2.244263] ohci-pci: OHCI PCI platform driver
>> [    2.248724] ohci-platform: OHCI generic platform driver
>> [    2.253996] ohci-exynos: OHCI EXYNOS driver
>> [    2.258419] usbcore: registered new interface driver usb-storage
>> [    2.265239] mousedev: PS/2 mouse device common for all mice
>> [    2.271436] i2c /dev entries driver
>> [    2.276859] max77620 0-003c: PMIC Version OTP:0x45 and ES:0x8
>> [    2.287409] max77620-sd0: supplied by regulator-dummy
>> [    2.292614] VDD_DDR_1V1_PMIC: Bringing 1125000uV into 1100000-1100000uV
>> [    2.301156] max77620-sd1: supplied by regulator-dummy
>> [    2.307603] max77620-sd2: supplied by regulator-dummy
>> [    2.314038] max77620-sd3: supplied by regulator-dummy
>> [    2.320617] max77620-ldo0: supplied by regulator-dummy
>> [    2.326580] max77620-ldo1: supplied by regulator-dummy
>> [    2.332513] max77620-ldo2: supplied by regulator-dummy
>> [    2.338772] max77620-ldo3: supplied by regulator-dummy
>> [    2.344541] max77620-ldo4: supplied by regulator-dummy
>> [    2.349692] VDD_RTC: Bringing 800000uV into 1000000-1000000uV
>> [    2.356220] max77620-ldo5: supplied by regulator-dummy
>> [    2.361373] VDDIO_SDMMC3_AP: Bringing 1800000uV into
>> 2800000-2800000uV
>> [    2.368573] max77620-ldo6: supplied by regulator-dummy
>> [    2.374361] max77620-ldo7: supplied by regulator-dummy
>> [    2.379513] VDD_HDMI_1V05: Bringing 1000000uV into 1050000-1050000uV
>> [    2.387117] max77620-ldo8: supplied by regulator-dummy
>> [    2.392267] VDD_PEX_1V05: Bringing 1000000uV into 1050000-1050000uV
>> [    3.573612] max77686-rtc max77620-rtc: rtc core: registered
>> max77620-rtc as rtc0
>> [    3.583782] sdhci: Secure Digital Host Controller Interface driver
>> [    3.589958] sdhci: Copyright(c) Pierre Ossman
>> [    3.594395] Synopsys Designware Multimedia Card Interface Driver
>> [    3.600660] sdhci-pltfm: SDHCI platform and OF driver helper
>> [    3.606426] sdhci-tegra 3400000.sdhci: Got CD GPIO
>> [    3.611222] sdhci-tegra 3400000.sdhci: Got WP GPIO
>> [    3.632817] mmc0: Unknown controller version (4). You may
>> experience problems.
>> [    3.671571] mmc0: SDHCI controller on 3440000.sdhci [3440000.sdhci]
>> using ADMA
>> [    3.687628] ledtrig-cpu: registered to indicate activity on CPUs
>> [    3.694229] usbcore: registered new interface driver usbhid
>> [    3.700183] usbhid: USB HID core driver
>> [    3.705159] NET: Registered protocol family 17
>> [    3.709635] 9pnet: Installing 9P2000 support
>> [    3.713923] Key type dns_resolver registered
>> [    3.718439] registered taskstats version 1
>> [    3.722538] Loading compiled-in X.509 certificates
>> [    3.732345] VDD_1V8_AP: supplied by VDD_1V8
>> [    3.736848] SD_CARD_SW_PWR: supplied by VDD_3V3_SYS
>> [    3.742861] pca953x 1-0074: 1-0074 supply vcc not found, using
>> dummy regulator
>> [    3.752508] pca953x 1-0077: 1-0077 supply vcc not found, using
>> dummy regulator
>> [    3.762333] tegra-pcie 10003000.pcie: 4x1, 1x1 configuration
>> [    3.769097] tegra-pcie 10003000.pcie: probing port 0, using 4 lanes
>> [    3.777592] tegra-pcie 10003000.pcie: Slot present pin change,
>> signature: 00000018
>> [    4.190598] tegra-pcie 10003000.pcie: link 0 down, retrying
>> [    4.598973] tegra-pcie 10003000.pcie: link 0 down, retrying
>> [    5.007344] tegra-pcie 10003000.pcie: link 0 down, retrying
>> [    5.014918] tegra-pcie 10003000.pcie: link 0 down, ignoring
>> [    5.020533] tegra-pcie 10003000.pcie: PCI host bridge to bus 0000:00
>> [    5.026883] pci_bus 0000:00: root bus resource [io  0x0000-0xffff]
>> [    5.033056] pci_bus 0000:00: root bus resource [mem 0x50100000-0x57ffffff]
>> [    5.039919] pci_bus 0000:00: root bus resource [mem
>> 0x58000000-0x7fffffff pref]
>> [    5.047219] pci_bus 0000:00: root bus resource [bus 00-ff]
>> [    5.053048] sdhci-tegra 3400000.sdhci: Got CD GPIO
>> [    5.057846] sdhci-tegra 3400000.sdhci: Got WP GPIO
>> [    5.070920] mmc1: Unknown controller version (4). You may
>> experience problems.
>> [    5.109641] mmc1: SDHCI controller on 3400000.sdhci [3400000.sdhci]
>> using ADMA
>> [    5.125756] mmc2: Unknown controller version (4). You may
>> experience problems.
>> [    5.133410] mmc2: Switching to 3.3V signalling voltage failed
>> [    5.164596] mmc2: SDHCI controller on 3460000.sdhci [3460000.sdhci]
>> using ADMA
>> [    5.173049] VDD_HDMI_5V0: supplied by VDD_5V0_SYS
>> [    5.178340] input: gpio-keys as /devices/platform/gpio-keys/input/input0
>> [    5.217669] max77686-rtc max77620-rtc: setting system clock to
>> 2018-02-08 11:26:23 UTC (1518089183)
>> [    5.240365] VDD_RTC: disabling
>> [    5.243422] VDDIO_SDMMC3_AP: disabling
>> [    5.247290] SD_CARD_SW_PWR: disabling
>> [    5.250948] VDD_HDMI_5V0: disabling
>> [    5.254432] ALSA device list:
>> [    5.256234] mmc2: new high speed MMC card at address 0001
>> [    5.257391]   No soundcards found.
>> [    5.263103] mmcblk2: mmc2:0001 032G34 29.1 GiB
>> [    5.270972] mmcblk2boot0: mmc2:0001 032G34 partition 1 4.00 MiB
>> [    5.277140] mmcblk2boot1: mmc2:0001 032G34 partition 2 4.00 MiB
>> [    5.283129] mmcblk2rpmb: mmc2:0001 032G34 partition 3 4.00 MiB,
>> chardev (239:0)
>> [    5.292271]  mmcblk2: p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11 p12 p13
>> p14 p15 p16 p17
>> [    5.301019] Waiting for root device /dev/mmcblk0p1...
> 
> So the kernel is looking for the internal eMMC on /dev/mmcblk0p1,
> however, in your case it is actually /dev/mmcblk2p1. So the easiest
> thing to do is update the kernel command line to have
> "root=/dev/mmcblk2p1" instead of "root=/dev/mmcblk0p1".
> 
> The problem is that the order in which MMC/SD devices get initialised on
> boot can change and so eMMC may not always be on mmcblk0. You can avoid
> this by using persistent block device naming [0]. Note that everytime
> you format the eMMC the UUID changes.
> 
> Cheers
> Jon
> 
> [0] https://wiki.archlinux.org/index.php/persistent_block_device_naming
> 
