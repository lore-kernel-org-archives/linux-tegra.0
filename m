From: =?UTF-8?B?TWlsYW4gQnXFoWth?= <milan.buska-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: kernel-next on jetson tx2 - boot fail
Date: Fri, 9 Feb 2018 09:16:11 +0000
Message-ID: <CAFCWPPLm=3=Dta70bU+1F3w2Ob97aR7RD1pnbfsDXKHbyqd+5g@mail.gmail.com>
References: <CAFCWPPK8jvXVOL6W-NMpj9aveWQAAv33BoFbipmhEKOCte0sKw@mail.gmail.com>
 <4787c6dc-c6d3-4879-a3d6-1e48868d304b@nvidia.com> <5e4c1aef-1af9-857e-3509-b36a71454d6e@kapsi.fi>
 <269318eb-6b5f-70ec-dbbc-f280d6105441@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <269318eb-6b5f-70ec-dbbc-f280d6105441-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi all,

2018-02-08 16:20 GMT+00:00 Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>:
> On 02/08/2018 05:53 AM, Mikko Perttunen wrote:
>>
>> One issue is that most of the persistent labeling schemes require an
>> initrd to interpret them. I'm using a super-simple initrd to just find t=
he
>> first proper-looking partition and mount that, maybe I should put it
>> somewhere..
>
>
> PARTUUID is interpreted directly by the kernel. (filesystem) UUID=3D does
> require an initrd to map (but it's not complex if you put the blkid tool =
in
> there and a shell, I believe).

Output blkid on my device

/dev/sda1: LABEL=3D"ROOT-64" UUID=3D"3d36c3b7-958d-4686-a265-83ded3e3f212"
TYPE=3D"ext4" PARTUUID=3D"cee24d9e-2ec5-4551-8e39-406836c497c0"
/dev/sda2: LABEL=3D"HOME-64" UUID=3D"c6255b12-6ad6-45f7-98bd-0ee816778c95"
TYPE=3D"ext4" PARTUUID=3D"470b8920-7bbf-4175-b278-60463db0499b"
/dev/sda3: LABEL=3D"SWAP-64" UUID=3D"a1f4730d-5851-4d27-a6f7-40f3beb9c204"
TYPE=3D"swap" PARTUUID=3D"cc770a46-ec00-4383-9a6b-ce1758326011"
/dev/sda4: LABEL=3D"ROOTFS" UUID=3D"79119161-c934-4ff9-9467-749941058279"
TYPE=3D"ext4" PARTUUID=3D"daa9a0dd-254f-9940-a64a-766dcaca2379"
/dev/mmcblk0: PTTYPE=3D"gpt"
/dev/mmcblk0p1: UUID=3D"bcff77ba-f2a3-488d-98ef-45c931147717"
TYPE=3D"ext4" PARTLABEL=3D"APP"
PARTUUID=3D"00000000-0000-0000-0000-000000000000"
/dev/mmcblk0p2: PARTLABEL=3D"mts-bootpack"
PARTUUID=3D"00000000-0000-0000-0000-000000000000"
/dev/mmcblk0p3: PARTLABEL=3D"cpu-bootloader"
PARTUUID=3D"00000000-0000-0000-0000-000000000000"
/dev/mmcblk0p4: PARTLABEL=3D"bootloader-dtb"
PARTUUID=3D"00000000-0000-0000-0000-000000000000"
/dev/mmcblk0p5: PARTLABEL=3D"secure-os"
PARTUUID=3D"00000000-0000-0000-0000-000000000000"
/dev/mmcblk0p6: PARTLABEL=3D"eks" PARTUUID=3D"00000000-0000-0000-0000-00000=
0000000"
/dev/mmcblk0p7: PARTLABEL=3D"bpmp-fw"
PARTUUID=3D"00000000-0000-0000-0000-000000000000"
/dev/mmcblk0p8: PARTLABEL=3D"bpmp-fw-dtb"
PARTUUID=3D"00000000-0000-0000-0000-000000000000"
/dev/mmcblk0p9: PARTLABEL=3D"sce-fw"
PARTUUID=3D"00000000-0000-0000-0000-000000000000"
/dev/mmcblk0p10: PARTLABEL=3D"sc7" PARTUUID=3D"00000000-0000-0000-0000-0000=
00000000"
/dev/mmcblk0p11: PARTLABEL=3D"FBNAME"
PARTUUID=3D"00000000-0000-0000-0000-000000000000"
/dev/mmcblk0p12: PARTLABEL=3D"BMP" PARTUUID=3D"00000000-0000-0000-0000-0000=
00000000"
/dev/mmcblk0p13: PARTLABEL=3D"SOS" PARTUUID=3D"00000000-0000-0000-0000-0000=
00000000"
/dev/mmcblk0p14: PARTLABEL=3D"kernel"
PARTUUID=3D"00000000-0000-0000-0000-000000000000"
/dev/mmcblk0p15: PARTLABEL=3D"kernel-dtb"
PARTUUID=3D"00000000-0000-0000-0000-000000000000"
/dev/mmcblk0p16: PARTLABEL=3D"CAC" PARTUUID=3D"00000000-0000-0000-0000-0000=
00000000"
/dev/mmcblk0p17: PARTLABEL=3D"UDA" PARTUUID=3D"00000000-0000-0000-0000-0000=
00000000"

Because mmcblk0 is PARTUUID the same for all partitions, I have
decided that this path does not lead.
I used dracut to create initrd-next and heur=C3=A9ka - success.
Here is the result.

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
6255584 bytes read in 235 ms (25.4 MiB/s)
Retrieving file: /boot/Image-next
18672128 bytes read in 521 ms (34.2 MiB/s)
append: net.ifnames=3D0 console=3Dtty0 console=3DttyS0,115200n8
root=3DUUID=3Dbcff77ba-f2a3-488d-98ef-45c931147717 rootfstype=3Dext4 rw
rootwait
Retrieving file: /boot/tegra186-p2771-0000.dtb
23528 bytes read in 82 ms (279.3 KiB/s)
## Flattened Device Tree blob at 82000000
   Booting using the fdt blob at 0x82000000
   Using Device Tree in place at 0000000082000000, end 0000000082008be7

Starting kernel ...

[    0.000000] Booting Linux on physical CPU 0x0000000100 [0x411fd073]
[    0.000000] Linux version 4.15.0-next-20180208 (root@ishi) (gcc
version 7.3.0 (SAUX 64bit)) #1 SMP PREEMPT Thu Feb 8 09:58:11 UTC 2018
[    0.000000] Machine model: NVIDIA Tegra186 P2771-0000 Development Board
[    0.000000] efi: Getting EFI parameters from FDT:
[    0.000000] efi: UEFI not found.
[    0.000000] cma: Reserved 16 MiB at 0x00000000f5000000
[    0.000000] NUMA: No NUMA configuration found
[    0.000000] NUMA: Faking a node at [mem
0x0000000000000000-0x000000027fffffff]
[    0.000000] NUMA: NODE_DATA [mem 0x27ffd4c80-0x27ffd677f]
[    0.000000] Zone ranges:
[    0.000000]   DMA32    [mem 0x0000000080000000-0x00000000ffffffff]
[    0.000000]   Normal   [mem 0x0000000100000000-0x000000027fffffff]
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000080000000-0x00000000f5ffffff]
[    0.000000]   node   0: [mem 0x0000000100000000-0x000000027fffffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000080000000-0x000000027ffff=
fff]
[    0.000000] psci: probing for conduit method from DT.
[    0.000000] psci: PSCIv1.0 detected in firmware.
[    0.000000] psci: Using standard PSCI v0.2 function IDs
[    0.000000] psci: MIGRATE_INFO_TYPE not supported.
[    0.000000] psci: SMC Calling Convention v1.0
[    0.000000] random: fast init done
[    0.000000] percpu: Embedded 24 pages/cpu @        (ptrval) s57880
r8192 d32232 u98304
[    0.000000] Detected PIPT I-cache on CPU0
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 20240=
64
[    0.000000] Policy zone: Normal
[    0.000000] Kernel command line: net.ifnames=3D0 console=3Dtty0
console=3DttyS0,115200n8 root=3DUUID=3Dbcff77ba-f2a3-488d-98ef-45c931147717
rootfstype=3Dext4 rw rootwait
[    0.000000] software IO TLB [mem 0xf0fff000-0xf4fff000] (64MB)
mapped at [        (ptrval)-        (ptrval)]
[    0.000000] Memory: 7985776K/8224768K available (10940K kernel
code, 1274K rwdata, 4840K rodata, 1152K init, 402K bss, 222608K
reserved, 16384K cma-reserved)
[    0.000000] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D6, N=
odes=3D1
[    0.000000] Preemptible hierarchical RCU implementation.
[    0.000000]  RCU restricting CPUs from NR_CPUS=3D64 to nr_cpu_ids=3D6.
[    0.000000]  Tasks RCU enabled.
[    0.000000] RCU: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_ids=
=3D6
[    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
[    0.000000] GIC: Using split EOI/Deactivate mode
[    0.000000] arch_timer: cp15 timer(s) running at 31.25MHz (phys).
[    0.000000] clocksource: arch_sys_counter: mask: 0xffffffffffffff
max_cycles: 0xe6a171046, max_idle_ns: 881590405314 ns
[    0.000002] sched_clock: 56 bits at 31MHz, resolution 32ns, wraps
every 4398046511088ns
[    0.000084] Console: colour dummy device 80x25
[    0.000250] console [tty0] enabled
[    0.000284] Calibrating delay loop (skipped), value calculated
using timer frequency.. 62.50 BogoMIPS (lpj=3D125000)
[    0.000297] pid_max: default: 32768 minimum: 301
[    0.000337] Security Framework initialized
[    0.002645] Dentry cache hash table entries: 1048576 (order: 11,
8388608 bytes)
[    0.003792] Inode-cache hash table entries: 524288 (order: 10, 4194304 b=
ytes)
[    0.003850] Mount-cache hash table entries: 16384 (order: 5, 131072 byte=
s)
[    0.003894] Mountpoint-cache hash table entries: 16384 (order: 5,
131072 bytes)
[    0.020014] ASID allocator initialised with 32768 entries
[    0.028014] Hierarchical SRCU implementation.
[    0.036554] Tegra Revision: A02 SKU: 220 CPU Process: 0 SoC Process: 0
[    0.036704] EFI services will not be available.
[    0.044035] smp: Bringing up secondary CPUs ...
[    0.072745] Detected PIPT I-cache on CPU1
[    0.072761] CPU features: SANITY CHECK: Unexpected variation in
SYS_ID_AA64DFR0_EL1. Boot CPU: 0x00000010305106, CPU1:
0x00000010305116
[    0.072774] CPU features: SANITY CHECK: Unexpected variation in
SYS_ID_DFR0_EL1. Boot CPU: 0x00000003010066, CPU1: 0x00000003001066
[    0.072786] CPU features: Unsupported CPU feature variation detected.
[    0.072833] CPU1: Booted secondary processor 0x0000000000 [0x4e0f0030]
[    0.100387] Detected PIPT I-cache on CPU2
[    0.100401] CPU features: SANITY CHECK: Unexpected variation in
SYS_ID_AA64DFR0_EL1. Boot CPU: 0x00000010305106, CPU2:
0x00000010305116
[    0.100414] CPU features: SANITY CHECK: Unexpected variation in
SYS_ID_DFR0_EL1. Boot CPU: 0x00000003010066, CPU2: 0x00000003001066
[    0.100456] CPU2: Booted secondary processor 0x0000000001 [0x4e0f0030]
[    0.128282] Detected PIPT I-cache on CPU3
[    0.128311] CPU3: Booted secondary processor 0x0000000101 [0x411fd073]
[    0.156316] Detected PIPT I-cache on CPU4
[    0.156336] CPU4: Booted secondary processor 0x0000000102 [0x411fd073]
[    0.184356] Detected PIPT I-cache on CPU5
[    0.184375] CPU5: Booted secondary processor 0x0000000103 [0x411fd073]
[    0.184415] smp: Brought up 1 node, 6 CPUs
[    0.184495] SMP: Total of 6 processors activated.
[    0.184503] CPU features: detected feature: 32-bit EL0 Support
[    0.184510] CPU features: detected feature: Kernel page table
isolation (KPTI)
[    0.198889] CPU: All CPU(s) started at EL2
[    0.198939] alternatives: patching kernel code
[    0.200505] devtmpfs: initialized
[    0.202424] Built 1 zonelists, mobility grouping on.  Total pages: 20005=
40
[    0.202434] Policy zone: Normal
[    0.203636] clocksource: jiffies: mask: 0xffffffff max_cycles:
0xffffffff, max_idle_ns: 7645041785100000 ns
[    0.203684] futex hash table entries: 2048 (order: 6, 262144 bytes)
[    0.203803] pinctrl core: initialized pinctrl subsystem
[    0.204409] DMI not present or invalid.
[    0.204606] NET: Registered protocol family 16
[    0.204887] audit: initializing netlink subsys (disabled)
[    0.204956] audit: type=3D2000 audit(0.204:1): state=3Dinitialized
audit_enabled=3D0 res=3D1
[    0.208669] cpuidle: using governor menu
[    0.208816] vdso: 2 pages (1 code @ 0000000093dd60cf, 1 data @
00000000ee565391)
[    0.208841] hw-breakpoint: found 6 breakpoint and 4 watchpoint registers=
.
[    0.209470] DMA: preallocated 256 KiB pool for atomic allocations
[    0.209891] Serial: AMBA PL011 UART driver
[    0.214929] tegra-bpmp bpmp: firmware: c11dd04ae487c849cc552f8f702ed8
[    1.155385] random: crng init done
[    1.373503] HugeTLB registered 2.00 MiB page size, pre-allocated 0 pages
[    1.373727] cryptd: max_cpu_qlen set to 1000
[    1.374107] ACPI: Interpreter disabled.
[    1.374814] vgaarb: loaded
[    1.374953] SCSI subsystem initialized
[    1.375267] usbcore: registered new interface driver usbfs
[    1.375298] usbcore: registered new interface driver hub
[    1.375355] usbcore: registered new device driver usb
[    1.380228] pps_core: LinuxPPS API ver. 1 registered
[    1.380239] pps_core: Software ver. 5.3.6 - Copyright 2005-2007
Rodolfo Giometti <giometti-k2GhghHVRtY@public.gmane.org>
[    1.380258] PTP clock support registered
[    1.380348] EDAC MC: Ver: 3.0.0
[    1.380687] Advanced Linux Sound Architecture Driver Initialized.
[    1.381068] clocksource: Switched to clocksource arch_sys_counter
[    1.381156] VFS: Disk quotas dquot_6.6.0
[    1.381193] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 byte=
s)
[    1.381283] pnp: PnP ACPI: disabled
[    1.384923] NET: Registered protocol family 2
[    1.385242] tcp_listen_portaddr_hash hash table entries: 4096
(order: 4, 65536 bytes)
[    1.385325] TCP established hash table entries: 65536 (order: 7,
524288 bytes)
[    1.385615] TCP bind hash table entries: 65536 (order: 8, 1048576 bytes)
[    1.385902] TCP: Hash tables configured (established 65536 bind 65536)
[    1.385999] UDP hash table entries: 4096 (order: 5, 131072 bytes)
[    1.386054] UDP-Lite hash table entries: 4096 (order: 5, 131072 bytes)
[    1.386173] NET: Registered protocol family 1
[    1.386911] RPC: Registered named UNIX socket transport module.
[    1.386921] RPC: Registered udp transport module.
[    1.386927] RPC: Registered tcp transport module.
[    1.386932] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    1.387023] Unpacking initramfs...
[    1.602717] Freeing initrd memory: 6108K
[    1.603253] kvm [1]: 8-bit VMID
[    1.603262] kvm [1]: IDMAP page: 80b15000
[    1.603269] kvm [1]: HYP VA range: 800000000000:ffffffffffff
[    1.603969] kvm [1]: virtual timer IRQ4
[    1.604114] kvm [1]: Hyp mode initialized successfully
[    1.606384] Initialise system trusted keyrings
[    1.606458] workingset: timestamp_bits=3D44 max_order=3D21 bucket_order=
=3D0
[    1.609626] squashfs: version 4.0 (2009/01/31) Phillip Lougher
[    1.609960] NFS: Registering the id_resolver key type
[    1.609978] Key type id_resolver registered
[    1.609985] Key type id_legacy registered
[    1.609995] nfs4filelayout_init: NFSv4 File Layout Driver Registering...
[    1.610100] 9p: Installing v9fs 9p2000 file system support
[    1.611935] Key type asymmetric registered
[    1.611945] Asymmetric key parser 'x509' registered
[    1.612030] Block layer SCSI generic (bsg) driver version 0.4
loaded (major 245)
[    1.612041] io scheduler noop registered
[    1.612150] io scheduler cfq registered (default)
[    1.612158] io scheduler mq-deadline registered
[    1.612165] io scheduler kyber registered
[    1.616287] tegra-pcie 10003000.pcie: 4x1, 1x1 configuration
[    1.616315] tegra-pcie 10003000.pcie: Failed to get supply 'dvdd-pex': -=
517
[    1.617136] EINJ: ACPI disabled.
[    1.621600] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[    1.622794] console [ttyS0] disabled
[    1.622830] 3100000.serial: ttyS0 at MMIO 0x3100000 (irq =3D 22,
base_baud =3D 25500000) is a Tegra
[    2.476393] console [ttyS0] enabled
[    2.480245] SuperH (H)SCI(F) driver initialized
[    2.484960] msm_serial: driver initialized
[    2.489537] arm-smmu 12000000.iommu: probing hardware configuration...
[    2.496064] arm-smmu 12000000.iommu: SMMUv2 with:
[    2.500770] arm-smmu 12000000.iommu:         stage 1 translation
[    2.506165] arm-smmu 12000000.iommu:         stage 2 translation
[    2.511562] arm-smmu 12000000.iommu:         nested translation
[    2.516872] arm-smmu 12000000.iommu:         stream matching with
128 register groups
[    2.524092] arm-smmu 12000000.iommu:         64 context banks (0
stage-2 only)
[    2.530702] arm-smmu 12000000.iommu:         Supported page sizes: 0x613=
11000
[    2.537225] arm-smmu 12000000.iommu:         Stage-1: 48-bit VA -> 48-bi=
t IPA
[    2.543746] arm-smmu 12000000.iommu:         Stage-2: 48-bit IPA -> 48-b=
it PA
[    2.550723] iommu: Adding device 13e00000.host1x to group 0
[    2.557886] cacheinfo: Unable to detect cache hierarchy for CPU 0
[    2.567417] loop: module loaded
[    2.572458] libphy: Fixed MDIO Bus: probed
[    2.576866] tun: Universal TUN/TAP device driver, 1.6
[    2.582325] thunder_xcv, ver 1.0
[    2.585581] thunder_bgx, ver 1.0
[    2.588822] nicpf, ver 1.0
[    2.591698] e1000e: Intel(R) PRO/1000 Network Driver - 3.2.6-k
[    2.597528] e1000e: Copyright(c) 1999 - 2015 Intel Corporation.
[    2.603465] igb: Intel(R) Gigabit Ethernet Network Driver - version 5.4.=
0-k
[    2.610420] igb: Copyright (c) 2007-2014 Intel Corporation.
[    2.616012] igbvf: Intel(R) Gigabit Virtual Function Network Driver
- version 2.4.0-k
[    2.623835] igbvf: Copyright (c) 2009 - 2012 Intel Corporation.
[    2.629918] sky2: driver version 1.30
[    2.633828] VFIO - User Level meta-driver version: 0.3
[    2.639550] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    2.646078] ehci-pci: EHCI PCI platform driver
[    2.650539] ehci-platform: EHCI generic platform driver
[    2.655821] ehci-orion: EHCI orion driver
[    2.659880] ehci-exynos: EHCI EXYNOS driver
[    2.664108] tegra-ehci: Tegra EHCI driver
[    2.668171] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[    2.674351] ohci-pci: OHCI PCI platform driver
[    2.678814] ohci-platform: OHCI generic platform driver
[    2.684090] ohci-exynos: OHCI EXYNOS driver
[    2.688503] usbcore: registered new interface driver usb-storage
[    2.695313] mousedev: PS/2 mouse device common for all mice
[    2.701543] i2c /dev entries driver
[    2.706935] max77620 0-003c: PMIC Version OTP:0x45 and ES:0x8
[    2.717205] max77620-sd0: supplied by regulator-dummy
[    2.722410] VDD_DDR_1V1_PMIC: Bringing 1125000uV into 1100000-1100000uV
[    2.730990] max77620-sd1: supplied by regulator-dummy
[    2.737420] max77620-sd2: supplied by regulator-dummy
[    2.743860] max77620-sd3: supplied by regulator-dummy
[    2.750417] max77620-ldo0: supplied by regulator-dummy
[    2.756387] max77620-ldo1: supplied by regulator-dummy
[    2.762325] max77620-ldo2: supplied by regulator-dummy
[    2.768580] max77620-ldo3: supplied by regulator-dummy
[    2.774355] max77620-ldo4: supplied by regulator-dummy
[    2.779520] VDD_RTC: Bringing 800000uV into 1000000-1000000uV
[    2.786064] max77620-ldo5: supplied by regulator-dummy
[    2.791218] VDDIO_SDMMC3_AP: Bringing 1800000uV into 2800000-2800000uV
[    2.798335] max77620-ldo6: supplied by regulator-dummy
[    2.804119] max77620-ldo7: supplied by regulator-dummy
[    2.809284] VDD_HDMI_1V05: Bringing 1000000uV into 1050000-1050000uV
[    2.816864] max77620-ldo8: supplied by regulator-dummy
[    2.822018] VDD_PEX_1V05: Bringing 1000000uV into 1050000-1050000uV
[    4.003474] max77686-rtc max77620-rtc: rtc core: registered
max77620-rtc as rtc0
[    4.013777] sdhci: Secure Digital Host Controller Interface driver
[    4.019956] sdhci: Copyright(c) Pierre Ossman
[    4.024382] Synopsys Designware Multimedia Card Interface Driver
[    4.030645] sdhci-pltfm: SDHCI platform and OF driver helper
[    4.036405] sdhci-tegra 3400000.sdhci: Got CD GPIO
[    4.041198] sdhci-tegra 3400000.sdhci: Got WP GPIO
[    4.061086] mmc0: Unknown controller version (4). You may
experience problems.
[    4.099792] mmc0: SDHCI controller on 3440000.sdhci [3440000.sdhci]
using ADMA
[    4.115747] ledtrig-cpu: registered to indicate activity on CPUs
[    4.122548] usbcore: registered new interface driver usbhid
[    4.128309] usbhid: USB HID core driver
[    4.133311] NET: Registered protocol family 17
[    4.137786] 9pnet: Installing 9P2000 support
[    4.142076] Key type dns_resolver registered
[    4.146560] registered taskstats version 1
[    4.150655] Loading compiled-in X.509 certificates
[    4.160479] VDD_1V8_AP: supplied by VDD_1V8
[    4.164979] SD_CARD_SW_PWR: supplied by VDD_3V3_SYS
[    4.170966] pca953x 1-0074: 1-0074 supply vcc not found, using
dummy regulator
[    4.180642] pca953x 1-0077: 1-0077 supply vcc not found, using
dummy regulator
[    4.190459] tegra-pcie 10003000.pcie: 4x1, 1x1 configuration
[    4.197228] tegra-pcie 10003000.pcie: probing port 0, using 4 lanes
[    4.205725] tegra-pcie 10003000.pcie: Slot present pin change,
signature: 00000018
[    4.618727] tegra-pcie 10003000.pcie: link 0 down, retrying
[    5.027112] tegra-pcie 10003000.pcie: link 0 down, retrying
[    5.435494] tegra-pcie 10003000.pcie: link 0 down, retrying
[    5.443064] tegra-pcie 10003000.pcie: link 0 down, ignoring
[    5.448680] tegra-pcie 10003000.pcie: PCI host bridge to bus
0000:00
[    5.455032] pci_bus 0000:00: root bus resource [io  0x0000-0xffff]
[    5.461207] pci_bus 0000:00: root bus resource [mem 0x50100000-0x57fffff=
f]
[    5.468072] pci_bus 0000:00: root bus resource [mem
0x58000000-0x7fffffff pref]
[    5.475374] pci_bus 0000:00: root bus resource [bus 00-ff]
[    5.481196] sdhci-tegra 3400000.sdhci: Got CD GPIO
[    5.485992] sdhci-tegra 3400000.sdhci: Got WP GPIO
[    5.499050] mmc1: Unknown controller version (4). You may
experience problems.
[    5.537731] mmc1: SDHCI controller on 3400000.sdhci [3400000.sdhci]
using ADMA
[    5.553847] mmc2: Unknown controller version (4). You may
experience problems.
[    5.561499] mmc2: Switching to 3.3V signalling voltage failed
[    5.592694] mmc2: SDHCI controller on 3460000.sdhci [3460000.sdhci]
using ADMA
[    5.601151] VDD_HDMI_5V0: supplied by VDD_5V0_SYS
[    5.606448] input: gpio-keys as /devices/platform/gpio-keys/input/input0
[    5.645776] max77686-rtc max77620-rtc: setting system clock to
2018-02-09 08:12:47 UTC (1518163967)
[    5.668962] VDD_RTC: disabling
[    5.672018] VDDIO_SDMMC3_AP: disabling
[    5.675894] SD_CARD_SW_PWR: disabling
[    5.679551] VDD_HDMI_5V0: disabling
[    5.683034] ALSA device list:
[    5.683940] mmc2: new high speed MMC card at address 0001
[    5.685996]   No soundcards found.
[    5.695144] mmcblk2: mmc2:0001 032G34 29.1 GiB
[    5.695215] Freeing unused kernel memory: 1152K
[    5.699942] mmcblk2boot0: mmc2:0001 032G34 partition 1 4.00 MiB
[    5.710410] mmcblk2boot1: mmc2:0001 032G34 partition 2 4.00 MiB
[    5.716405] mmcblk2rpmb: mmc2:0001 032G34 partition 3 4.00 MiB,
chardev (239:0)
[    5.725626]  mmcblk2: p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11 p12 p13
p14 p15 p16 p17
[    5.880330] dracut: dracut-046
[    6.094099] systemd-udevd[1582]: starting version 3.2.2
[    6.101349] udevd[1583]: starting eudev-3.2.2
[    6.454772] EXT4-fs (mmcblk2p1): INFO: recovery required on
readonly filesystem
[    6.462134] EXT4-fs (mmcblk2p1): write access will be enabled during rec=
overy
[    6.594032] EXT4-fs (mmcblk2p1): recovery complete
[    6.600619] EXT4-fs (mmcblk2p1): mounted filesystem with ordered
data mode. Opts: discard
discard,noatime,defaults
[    6.665182] dracut: Remounting
/dev/disk/by-uuid/bcff77ba-f2a3-488d-98ef-45c931147717 with -o
discard,noatime,defaults,rw
[    6.681138] EXT4-fs (mmcblk2p1): re-mounted. Opts: discard
[    6.717379] dracut: Mounted root filesystem /dev/mmcblk2p1
[    6.830454] dracut: Switching root
INIT: version 2.88 booting
The system is coming up.  Please wait.
mount: /proc: none already mounted or mount point busy.
mount: /sys: none already mounted or mount point busy.
[    7.037219] udevd[2648]: starting version 3.2.2
[    7.065003] udevd[2649]: starting eudev-3.2.2
[    7.291504] iommu: Adding device 15200000.display to group 1
[    7.307235] iommu: Adding device 15210000.display to group 1
[    7.323606] iommu: Adding device 15220000.display to group 1
[    7.338970] tegra-dpaux 15040000.dpaux: 15040000.dpaux supply vdd
not found, using dummy regulator
[    7.351333] tegra-dpaux 155c0000.dpaux: 155c0000.dpaux supply vdd
not found, using dummy regulator
[    7.383725] tegra-vic 15340000.vic: Direct firmware load for
nvidia/tegra186/vic04_ucode.bin failed with error -2
[    7.394144] tegra-vic: probe of 15340000.vic failed with error -2
[    7.479508] EXT4-fs (mmcblk2p1): re-mounted. Opts: discard
[    7.504278] EXT4-fs (mmcblk2p1): re-mounted. Opts: discard
hostname: host
hwclock: select() to /dev/rtc0 to wait for clock tick timed out
font: default
keyboard: us
INIT: Entering runlevel: 2
starting services: sysklogd lo net crond

- end output serial console

You were right. The name of the disk was overwritten.

I recompile the kernel again and add the firmware vic04_ucode.bin

Let me thank you, Mr Jon, Mikko, Stephen for your support.

Notice: I look forward to the driver support for the sata interface on
the jetson tx2.

Best regards

--=20
---------------------------------------------------------------------------=
-
Remember, no question is too stupid and no problem
          too small--We've all been beginners
