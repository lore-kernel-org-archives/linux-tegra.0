From: Martin Michlmayr <tbm-R+vWnYXSFMfQT0dZR+AlfA@public.gmane.org>
Subject: Linux hangs on Jetson TX1: Page fault (SMMU translation error [--S])
Date: Sat, 17 Dec 2016 19:27:59 -0800
Message-ID: <20161218032759.GA6457@jirafa.cyrius.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="bp/iNruPH9dso1Pn"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--bp/iNruPH9dso1Pn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I get a hang with Linux on the TX1 developer kit and 4.9.0-rc8.
One of the last lines I see is:

> tegra-mc 70019000.memory-controller: gpuswr: write @0x00000003fffffff0: Page fault (SMMU translation error [--S])

When I remove all GPU modules from the disk (/lib/modules/.../kernel/drivers/gpu)
the system boot successfully.

I've attached the boot log.

-- 
Martin Michlmayr
http://www.cyrius.com/

--bp/iNruPH9dso1Pn
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment; filename=tegra-page-fault
Content-Transfer-Encoding: quoted-printable

U-Boot 2016.09+dfsg1-2 (Oct 24 2016 - 02:36:36 +0000)

TEGRA210
Model: NVIDIA P2371-2180
Board: NVIDIA P2371-2180
DRAM:  3.5 GiB
MMC:   Tegra SD/MMC: 0, Tegra SD/MMC: 1
In:    serial
Out:   serial
Err:   serial
Net:   No ethernet found.
Hit any key to stop autoboot:  2 =08=08=08 1 =08=08=08 0=20
switch to partitions #0, OK
mmc1 is current device
Scanning mmc 1:1...
Found U-Boot script /boot.scr
2176 bytes read in 78 ms (26.4 KiB/s)
## Executing script at 90000000
13558272 bytes read in 919 ms (14.1 MiB/s)
51409 bytes read in 108 ms (464.8 KiB/s)
16399539 bytes read in 1077 ms (14.5 MiB/s)
Booting Debian 4.9.0-rc8-arm64 from mmc 1:1...
## Flattened Device Tree blob at 82000000
   Booting using the fdt blob at 0x82000000
   Using Device Tree in place at 0000000082000000, end 000000008200f8d0

Starting kernel ...

[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] Linux version 4.9.0-rc8-arm64 (debian-kernel-0aAXYlwwYIKpJHnUorBY+A@public.gmane.org=
g) (gcc version 6.2.1 20161124 (Debian 6.2.1-5) ) #1 SMP Debian 4.9~rc8-1~e=
xp1 (2016-12-05)
[    0.000000] Boot CPU: AArch64 Processor [411fd071]
[    0.000000] efi: Getting EFI parameters from FDT:
[    0.000000] efi: UEFI not found.
[    0.000000] /cpus/cpu@1: missing enable-method property
[    0.000000] /cpus/cpu@2: missing enable-method property
[    0.000000] /cpus/cpu@3: missing enable-method property
[    0.000000] percpu: Embedded 22 pages/cpu @ffff8000fff8a000 s50072 r8192=
 d31848 u90112
[    0.000000] Detected PIPT I-cache on CPU0
[    0.000000] CPU features: enabling workaround for ARM erratum 832075
[    0.000000] CPU features: enabling workaround for ARM erratum 834220
[    0.000000] Built 1 zonelists in Zone order, mobility grouping on.  Tota=
l pages: 903168
[    0.000000] Kernel command line:=20
[    0.000000] PID hash table entries: 4096 (order: 3, 32768 bytes)
[    0.000000] Dentry cache hash table entries: 524288 (order: 10, 4194304 =
bytes)
[    0.000000] Inode-cache hash table entries: 262144 (order: 9, 2097152 by=
tes)
[    0.000000] software IO TLB [mem 0xdbfff000-0xdffff000] (64MB) mapped at=
 [ffff80005bfff000-ffff80005fffefff]
[    0.000000] Memory: 3501920K/3670016K available (6780K kernel code, 1016=
K rwdata, 2156K rodata, 3264K init, 626K bss, 168096K reserved, 0K cma-rese=
rved)
[    0.000000] Virtual kernel memory layout:
[    0.000000]     modules : 0xffff000000000000 - 0xffff000008000000   (   =
128 MB)
[    0.000000]     vmalloc : 0xffff000008000000 - 0xffff7dffbfff0000   (129=
022 GB)
[    0.000000]       .text : 0xffff000008080000 - 0xffff000008720000   (  6=
784 KB)
[    0.000000]     .rodata : 0xffff000008720000 - 0xffff000008940000   (  2=
176 KB)
[    0.000000]       .init : 0xffff000008940000 - 0xffff000008c70000   (  3=
264 KB)
[    0.000000]       .data : 0xffff000008c70000 - 0xffff000008d6e200   (  1=
017 KB)
[    0.000000]        .bss : 0xffff000008d6e200 - 0xffff000008e0ac34   (   =
627 KB)
[    0.000000]     fixed   : 0xffff7dfffe7fd000 - 0xffff7dfffec00000   (  4=
108 KB)
[    0.000000]     PCI I/O : 0xffff7dfffee00000 - 0xffff7dffffe00000   (   =
 16 MB)
[    0.000000]     vmemmap : 0xffff7e0000000000 - 0xffff800000000000   (  2=
048 GB maximum)
[    0.000000]               0xffff7e0000000000 - 0xffff7e0004000000   (   =
 64 MB actual)
[    0.000000]     memory  : 0xffff800000000000 - 0xffff800100000000   (  4=
096 MB)
[    0.000000] Hierarchical RCU implementation.
[    0.000000] 	Build-time adjustment of leaf fanout to 64.
[    0.000000] 	RCU restricting CPUs from NR_CPUS=3D64 to nr_cpu_ids=3D1.
[    0.000000] RCU: Adjusting geometry for rcu_fanout_leaf=3D64, nr_cpu_ids=
=3D1
[    0.000000] NR_IRQS:64 nr_irqs:64 0
[    0.000000] GIC: Using split EOI/Deactivate mode
[    0.000000] /interrupt-controller@60004000: 192 interrupts forwarded to =
/interrupt-controller@50041000
[    0.000000] PLL_MB already enabled. Postponing set full defaults
[    0.000000] PLL_U already enabled. Postponing set full defaults
[    0.000000] PLL_P already enabled. Postponing set full defaults
[    0.000000] PLL_X already enabled. Postponing set full defaults
[    0.000000] boot misc1 0x0: expected 0x20
[    0.000000]  (comparison mask =3D 0xffffff)
[    0.000000] arm_arch_timer: Architected cp15 timer(s) running at 19.20MH=
z (phys).
[    0.000000] clocksource: arch_sys_counter: mask: 0xffffffffffffff max_cy=
cles: 0x46d987e47, max_idle_ns: 440795202767 ns
[    0.000003] sched_clock: 56 bits at 19MHz, resolution 52ns, wraps every =
4398046511078ns
[    0.000258] Console: colour dummy device 80x25
[    0.000722] console [tty0] enabled
[    0.000743] Calibrating delay loop (skipped), value calculated using tim=
er frequency.. 38.40 BogoMIPS (lpj=3D76800)
[    0.000767] pid_max: default: 32768 minimum: 301
[    0.000890] Security Framework initialized
[    0.000905] Yama: disabled by default; enable with sysctl kernel.yama.*
[    0.000929] AppArmor: AppArmor disabled by boot time parameter
[    0.000975] Mount-cache hash table entries: 8192 (order: 4, 65536 bytes)
[    0.000990] Mountpoint-cache hash table entries: 8192 (order: 4, 65536 b=
ytes)
[    0.001613] ftrace: allocating 24565 entries in 96 pages
[    0.041431] ASID allocator initialised with 65536 entries
[    0.043065] Speedo Revision 4
[    0.043097] Tegra Revision: A02 SKU: 23 CPU Process: 0 SoC Process: -22
[    0.043720] EFI services will not be available.
[    0.043865] Brought up 1 CPUs
[    0.043879] SMP: Total of 1 processors activated.
[    0.043896] CPU features: detected feature: 32-bit EL0 Support
[    0.043914] CPU: All CPU(s) started at EL2
[    0.043933] alternatives: patching kernel code
[    0.045053] devtmpfs: initialized
[    0.055076] DMI not present or invalid.
[    0.055256] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xfffffff=
f, max_idle_ns: 7645041785100000 ns
[    0.055347] pinctrl core: initialized pinctrl subsystem
[    0.056231] NET: Registered protocol family 16
[    0.056880] cpuidle: using governor ladder
[    0.056894] cpuidle: using governor menu
[    0.056929] vdso: 2 pages (1 code @ ffff000008727000, 1 data @ ffff00000=
8c75000)
[    0.056954] hw-breakpoint: found 6 breakpoint and 4 watchpoint registers.
[    0.057091] DMA: preallocated 256 KiB pool for atomic allocations
[    0.058062] Serial: AMBA PL011 UART driver
[    0.068577] tegra-mc 70019000.memory-controller: no memory timings for R=
AM code 0 registered
[    0.074024] HugeTLB registered 2 MB page size, pre-allocated 0 pages
[    0.074720] ACPI: Interpreter disabled.
[    0.074963] vgaarb: loaded
[    0.075132] dmi: Firmware registration failed.
[    0.075696] clocksource: Switched to clocksource arch_sys_counter
[    0.097478] VFS: Disk quotas dquot_6.6.0
[    0.097543] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 byte=
s)
[    0.097721] pnp: PnP ACPI: disabled
[    0.104167] NET: Registered protocol family 2
[    0.104572] TCP established hash table entries: 32768 (order: 6, 262144 =
bytes)
[    0.104712] TCP bind hash table entries: 32768 (order: 7, 524288 bytes)
[    0.104935] TCP: Hash tables configured (established 32768 bind 32768)
[    0.104992] UDP hash table entries: 2048 (order: 4, 65536 bytes)
[    0.105030] UDP-Lite hash table entries: 2048 (order: 4, 65536 bytes)
[    0.105180] NET: Registered protocol family 1
[    0.105353] Unpacking initramfs...
[    0.867685] Freeing initrd memory: 16012K (ffff800002100000 - ffff800003=
0a3000)
[    0.867955] kvm [1]: 8-bit VMID
[    0.867970] kvm [1]: IDMAP page: 8070b000
[    0.867983] kvm [1]: HYP VA range: 800000000000:ffffffffffff
[    0.868517] kvm [1]: Hyp mode initialized successfully
[    0.868556] kvm [1]: vgic-v2@50044000
[    0.868608] kvm [1]: vgic interrupt IRQ1
[    0.868629] kvm [1]: virtual timer IRQ4
[    0.869746] futex hash table entries: 256 (order: 3, 32768 bytes)
[    0.869807] audit: initializing netlink subsys (disabled)
[    0.869866] audit: type=3D2000 audit(0.835:1): initialized
[    0.870174] Initialise system trusted keyrings
[    0.870357] workingset: timestamp_bits=3D46 max_order=3D20 bucket_order=
=3D0
[    0.870425] zbud: loaded
[    0.977471] Key type asymmetric registered
[    0.977486] Asymmetric key parser 'x509' registered
[    0.977549] Block layer SCSI generic (bsg) driver version 0.4 loaded (ma=
jor 250)
[    0.977633] io scheduler noop registered
[    0.977646] io scheduler deadline registered
[    0.977674] io scheduler cfq registered (default)
[    0.985732] tegra-apbdma 60020000.dma: Tegra20 APB DMA driver register 3=
2 channels
[    0.986183] tegra-pmc 7000e400.pmc: i2c-thermtrip node not found, emerge=
ncy thermal reset disabled.
[    0.986440] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[    0.987610] 70006000.serial: ttyS0 at MMIO 0x70006000 (irq =3D 316, base=
_baud =3D 25500000) is a Tegra
[    1.682209] console [ttyS0] enabled
[    1.685967] Serial: AMBA driver
[    1.689221] msm_serial: driver initialized
[    1.693429] Unable to detect cache hierarchy from DT for CPU 0
[    1.699568] mousedev: PS/2 mouse device common for all mice
[    1.705595] tegra_rtc 7000e000.rtc: rtc core: registered 7000e000.rtc as=
 rtc1
[    1.712778] tegra_rtc 7000e000.rtc: Tegra internal Real Time Clock
[    1.719749] tegra_soctherm 700e2000.thermal-sensor: thermtrip: will shut=
 down when cpu reaches 102500 mC
[    1.729236] tegra_soctherm 700e2000.thermal-sensor: throttrip: will thro=
ttle when cpu reaches 98500 mC
[    1.738603] tegra_soctherm 700e2000.thermal-sensor: thermtrip: will shut=
 down when gpu reaches 103000 mC
[    1.748085] tegra_soctherm 700e2000.thermal-sensor: throttrip: will thro=
ttle when gpu reaches 100000 mC
[    1.757542] tegra_soctherm 700e2000.thermal-sensor: thermtrip: will shut=
 down when pll reaches 103000 mC
[    1.767022] tegra_soctherm 700e2000.thermal-sensor: throttrip: pll: miss=
ing hot temperature
[    1.775417] tegra_soctherm 700e2000.thermal-sensor: thermtrip: will shut=
 down when mem reaches 103000 mC
[    1.784896] tegra_soctherm 700e2000.thermal-sensor: throttrip: mem: miss=
ing hot temperature
[    1.793496] ledtrig-cpu: registered to indicate activity on CPUs
[    1.799507] dmi-sysfs: dmi entry is absent.
[    1.803981] NET: Registered protocol family 10
[    1.808939] mip6: Mobile IPv6
[    1.811936] NET: Registered protocol family 17
[    1.816390] mpls_gso: MPLS GSO support
[    1.820532] registered taskstats version 1
[    1.824640] Loading compiled-in X.509 certificates
[    1.833452] alg: No test for pkcs1pad(rsa,sha256) (pkcs1pad(rsa-generic,=
sha256))
[    1.841537] Loaded X.509 cert 'Debian Project: Ben Hutchings: 008a018dca=
80932630'
[    1.849117] zswap: loaded using pool lzo/zbud
[    1.858916] hctosys: unable to open rtc device (rtc0)
[    1.866532] Freeing unused kernel memory: 3264K (ffff800000940000 - ffff=
800000c70000)
Loading, please wait...
starting version 232
[    1.908787] random: systemd-udevd: uninitialized urandom read (16 bytes =
read)
[    1.917872] random: udevadm: uninitialized urandom read (16 bytes read)
[    1.924817] random: systemd-udevd: uninitialized urandom read (16 bytes =
read)
[    1.932098] random: udevadm: uninitialized urandom read (16 bytes read)
[    1.938779] random: systemd-udevd: uninitialized urandom read (16 bytes =
read)
[    1.946387] random: udevadm: uninitialized urandom read (16 bytes read)
[    1.955082] random: udevadm: uninitialized urandom read (16 bytes read)
[    1.961938] random: udevadm: uninitialized urandom read (16 bytes read)
[    1.968811] random: udevadm: uninitialized urandom read (16 bytes read)
[    1.975639] random: udevadm: uninitialized urandom read (16 bytes read)
[    2.091330] i2c_tegra: module verification failed: signature and/or requ=
ired key missing - tainting kernel
[    2.120780] sdhci: Secure Digital Host Controller Interface driver
[    2.126986] sdhci: Copyright(c) Pierre Ossman
[    2.137750] sdhci-pltfm: SDHCI platform and OF driver helper
[    2.167845] usb2-0 supply vbus not found, using dummy regulator
[    2.180978] usbcore: registered new interface driver usbfs
[    2.200450] tegra-xusb-padctl 7009f000.padctl: failed to setup XUSB port=
s: -517
[    2.213798] usbcore: registered new interface driver hub
[    2.238287] usb2-0 supply vbus not found, using dummy regulator
[    2.244341] sdhci-tegra 700b0000.sdhci: Got CD GPIO
[    2.249366] usbcore: registered new device driver usb
[    2.261860] 0-0074 supply vcc not found, using dummy regulator
[    2.276326] tegra-xusb-padctl 7009f000.padctl: failed to setup XUSB port=
s: -517
[    2.292921] mmc0: Unknown controller version (3). You may experience pro=
blems.
[    2.324467] sdhci-tegra 700b0000.sdhci: Got CD GPIO
[    2.339253] usb2-0 supply vbus not found, using dummy regulator
[    2.352725] tegra-xusb-padctl 7009f000.padctl: failed to setup XUSB port=
s: -517
[    2.363725] mmc0: SDHCI controller on 700b0600.sdhci [700b0600.sdhci] us=
ing ADMA 64-bit
[    2.373357] sdhci-tegra 700b0000.sdhci: Got CD GPIO
[    2.378465] tegra-i2c 7000c700.i2c: could not find pctldev for node /hos=
t1x@50000000/dpaux@54040000/pinmux-i2c, deferring probe
[    2.407856] usb2-0 supply vbus not found, using dummy regulator
[    2.415118] tegra-xusb 70090000.usb: Failed to get supply 'dvddio-pex': =
-517
[    2.422176] tegra-xusb 70090000.usb: failed to get regulators: -517
[    2.431723] tegra-xusb-padctl 7009f000.padctl: failed to setup XUSB port=
s: -517
[    2.446111] max77620 1-003c: PMIC Version OTP:0x35 and ES:0x8
[    2.458672] sdhci-tegra 700b0000.sdhci: Got CD GPIO
[    2.465692] tegra-i2c 7000c700.i2c: could not find pctldev for node /hos=
t1x@50000000/dpaux@54040000/pinmux-i2c, deferring probe
[    2.480646] mmc0: new high speed MMC card at address 0001
[    2.492767] usb2-0 supply vbus not found, using dummy regulator
[    2.499678] mmcblk0: mmc0:0001 016G32 14.7 GiB=20
[    2.504487] tegra-xusb-padctl 7009f000.padctl: failed to setup XUSB port=
s: -517
[    2.512033] mmcblk0boot0: mmc0:0001 016G32 partition 1 4.00 MiB
[    2.523415] mmcblk0boot1: mmc0:0001 016G32 partition 2 4.00 MiB
[    2.529644] mmcblk0rpmb: mmc0:0001 016G32 partition 3 4.00 MiB
[    2.535537] VDD_5V0_SYS: supplied by VDD_SYS_MUX
[    2.541554] RTL_5V: supplied by VDD_5V0_SYS
[    2.546088] USB_VBUS_EN1: supplied by VDD_5V0_SYS
[    2.551002] VDD_HDMI_5V0: supplied by VDD_5V0_SYS
[    2.555835]  mmcblk0: p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11 p12 p13 p14 p15=
 p16 p17 p18
[    2.564796] VDD_3V3_SYS: supplied by VDD_SYS_MUX
[    2.574164] random: fast init done
[    2.579346] VDD_3V3_SD: supplied by VDD_3V3_SYS
[    2.589755] VDD_DIS_3V3_LCD: supplied by VDD_3V3_SYS
[    2.595261] sdhci-tegra 700b0000.sdhci: Got CD GPIO
[    2.600945] tegra-i2c 7000c700.i2c: could not find pctldev for node /hos=
t1x@50000000/dpaux@54040000/pinmux-i2c, deferring probe
[    2.620670] usb2-0 supply vbus not found, using dummy regulator
[    2.627050] usb2-3 supply vbus not found, using dummy regulator
[    2.633166] usb3-0 supply vbus not found, using dummy regulator
[    2.639462] usb3-1 supply vbus not found, using dummy regulator
[    2.645906] max77686-rtc max77620-rtc: rtc core: registered max77620-rtc=
 as rtc0
[    2.690986] VDD_LCD_1V8_DIS: supplied by VDD_1V8
[    2.707565] AVDD_DSI_CSI_1V2: supplied by AVDD_SYS_1V2
[    2.715926] 70090000.usb supply dvdd-pex-pll not found, using dummy regu=
lator
[    2.724206] 70090000.usb supply hvdd-pex-pll-e not found, using dummy re=
gulator
[    2.732248] VDD_CAM_HV: Bringing 3100000uV into 2800000-2800000uV
[    2.739776] tegra-xusb 70090000.usb: firmware: direct-loading firmware n=
vidia/tegra210/xusb.bin
[    2.749656] VDD_RTC: Bringing 1000000uV into 850000-850000uV
[    2.757234] VDD_TS_HV: Bringing 3100000uV into 3300000-3300000uV
[    2.764813] VDD_TS_1V8: Bringing 2800000uV into 1800000-1800000uV
[    2.808414] tegra-xusb 70090000.usb: Firmware timestamp: 2015-08-10 09:4=
7:54 UTC
[    2.829014] tegra-xusb 70090000.usb: xHCI Host Controller
[    2.834851] tegra-xusb 70090000.usb: new USB bus registered, assigned bu=
s number 1
[    2.843593] tegra-xusb 70090000.usb: hcc params 0x0184f525 hci version 0=
x100 quirks 0x00010010
[    2.852337] tegra-xusb 70090000.usb: irq 322, io mem 0x70090000
[    2.858471] usb usb1: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002
[    2.865278] usb usb1: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    2.872506] usb usb1: Product: xHCI Host Controller
[    2.877387] usb usb1: Manufacturer: Linux 4.9.0-rc8-arm64 xhci-hcd
[    2.883571] usb usb1: SerialNumber: 70090000.usb
[    2.944289] hub 1-0:1.0: USB hub found
[    2.948669] hub 1-0:1.0: 5 ports detected
[    2.953596] tegra-xusb 70090000.usb: xHCI Host Controller
[    2.959280] tegra-xusb 70090000.usb: new USB bus registered, assigned bu=
s number 2
[    2.967352] usb usb2: We don't know the algorithms for LPM for this host=
, disabling LPM.
[    2.976039] usb usb2: New USB device found, idVendor=3D1d6b, idProduct=
=3D0003
[    2.982853] usb usb2: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    2.990082] usb usb2: Product: xHCI Host Controller
[    2.994962] usb usb2: Manufacturer: Linux 4.9.0-rc8-arm64 xhci-hcd
[    3.001143] usb usb2: SerialNumber: 70090000.usb
[    3.008543] hub 2-0:1.0: USB hub found
[    3.012630] hub 2-0:1.0: 4 ports detected
[    3.017944] sdhci-tegra 700b0000.sdhci: Got CD GPIO
[    3.023595] mmc1: Unknown controller version (3). You may experience pro=
blems.
Begin: Loading essential drivers ... [    3.084129] mmc1: SDHCI controller =
on 700b0000.sdhci [700b0000.sdhci] using ADMA 64-bit
[    3.096124] tegra-i2c 7000c700.i2c: could not find pctldev for node /hos=
t1x@50000000/dpaux@54040000/pinmux-i2c, deferring probe
done.
Begin: Running /scripts/init-premount ... done.
Begin: Mounting root file system ... Begin: Running /scripts/local-top ... =
done.
Begin: Running /scripts/local-premount ... done.
Begin: Waiting for root file system ... [    3.161108] mmc1: host does not =
support reading read-only switch, assuming write-enable
[    3.173569] mmc1: new high speed SDHC card at address aaaa
[    3.181761] mmcblk1: mmc1:aaaa SS32G 29.7 GiB=20
[    3.193330]  mmcblk1: p1 p2 p3 p4
[    3.199088] tegra-i2c 7000c700.i2c: could not find pctldev for node /hos=
t1x@50000000/dpaux@54040000/pinmux-i2c, deferring probe
[    3.280151] usb 1-2: new high-speed USB device number 2 using tegra-xusb
[    3.475725] usb 1-3: new high-speed USB device number 3 using tegra-xusb
[    3.636485] usb 1-3: New USB device found, idVendor=3D0b95, idProduct=3D=
7720
[    3.643201] usb 1-3: New USB device strings: Mfr=3D1, Product=3D2, Seria=
lNumber=3D3
[    3.650336] usb 1-3: Product: AX88x72A
[    3.654090] usb 1-3: Manufacturer: ASIX Elec. Corp.
[    3.658970] usb 1-3: SerialNumber: 136926
[    3.666296] tegra-i2c 7000c700.i2c: could not find pctldev for node /hos=
t1x@50000000/dpaux@54040000/pinmux-i2c, deferring probe
[    3.939709] usb 1-2: new high-speed USB device number 4 using tegra-xusb
[    4.084531] usb 1-2: New USB device found, idVendor=3D0955, idProduct=3D=
09ff
[    4.091238] usb 1-2: New USB device strings: Mfr=3D1, Product=3D2, Seria=
lNumber=3D6
[    4.098373] usb 1-2: Product: USB 10/100/1000 LAN
[    4.103079] usb 1-2: Manufacturer: Nvidia
[    4.107092] usb 1-2: SerialNumber: 000001000000
[    4.113636] tegra-i2c 7000c700.i2c: could not find pctldev for node /hos=
t1x@50000000/dpaux@54040000/pinmux-i2c, deferring probe
Begin: Running /scripts/local-block ... done.
done.
Begin: Will now check root file system ... fsck from util-linux 2.29
fsck: error 2 (No such file or directory) while executing fsck.ext4 for /de=
v/mmcblk1p2
fsck exited with status code 8
done.
Warning: File system check failed but did not detect errors
[    9.298724] EXT4-fs (mmcblk1p2): mounted filesystem with ordered data mo=
de. Opts: (null)
done.
Begin: Running /scripts/local-bottom ... done.
Begin: Running /scripts/init-bottom ... done.
[    9.758318] systemd[1]: System time before build time, advancing clock.
[    9.859421] ip_tables: (C) 2000-2006 Netfilter Core Team
[    9.898109] systemd[1]: systemd 232 running in system mode. (+PAM +AUDIT=
 +SELINUX +IMA +APPARMOR +SMACK +SYSVINIT +UTMP +LIBCRYPTSETUP +GCRYPT +GNU=
TLS +ACL +XZ +LZ4 +SECCOMP +BLKID +ELFUTILS +KMOD +IDN)
[    9.916424] systemd[1]: Detected architecture arm64.

Welcome to =1B[1mDebian GNU/Linux stretch/sid=1B[0m!

[    9.936596] systemd[1]: Set hostname to <tx1>.
[   10.231371] systemd[1]: Listening on udev Kernel Socket.
[=1B[0;32m  OK  =1B[0m] Listening on udev Kernel Socket.
[   10.247975] systemd[1]: Listening on Journal Audit Socket.
[=1B[0;32m  OK  =1B[0m] Listening on Journal Audit Socket.
[   10.264189] systemd[1]: Created slice User and Session Slice.
[=1B[0;32m  OK  =1B[0m] Created slice User and Session Slice.
[   10.283766] systemd[1]: Reached target Remote File Systems.
[=1B[0;32m  OK  =1B[0m] Reached target Remote File Systems.
[   10.299871] systemd[1]: Listening on Journal Socket.
[=1B[0;32m  OK  =1B[0m] Listening on Journal Socket.
[   10.315834] systemd[1]: Listening on /dev/initctl Compatibility Named Pi=
pe.
[=1B[0;32m  OK  =1B[0m] Listening on /dev/initctl Compatibility Named Pipe.
[   10.336090] systemd[1]: Created slice System Slice.
[=1B[0;32m  OK  =1B[0m] Created slice System Slice.
         Mounting Huge Pages File System...
         Starting Load Kernel Modules...
[=1B[0;32m  OK  =1B[0m] Created slice system-getty.slice.
         Starting Create list of required st=E2=80=A6ce nodes for the curre=
nt kernel...
         Mounting Debug File System...
[=1B[0;32m  OK  =1B[0m] Created slice system-serial\x2dgetty.slice.
[=1B[0;32m  OK  =1B[0m] Set up automount Arbitrary Executab=E2=80=A6rmats F=
ile System Automount Point.
[=1B[0;32m  OK  =1B[0m] Created slice system-systemd\x2dfsck.slice.
[=1B[0;32m  OK  =1B[0m] Started Forward Password Requests to Wall Directory=
 Watch.
[=1B[0;32m  OK  =1B[0m] Listening on Syslog Socket.
[=1B[0;32m  OK  =1B[0m] Listening on fsck to fsckd communication Socket.
         Starting File System Check on Root Device...
[=1B[0;32m  OK  =1B[0m] Listening on udev Control Socket.
[=1B[0;32m  OK  =1B[0m] Started Dispatch Password Requests to Console Direc=
tory Watch.
[=1B[0;32m  OK  =1B[0m] Reached target Paths.
[=1B[0;32m  OK  =1B[0m] Reached target Encrypted Volumes.
[=1B[0;32m  OK  =1B[0m] Reached target Slices.
         Mounting POSIX Message Queue File System...
[=1B[0;32m  OK  =1B[0m] Listening on Journal Socket (/dev/log).
         Starting Journal Service...
[=1B[0;32m  OK  =1B[0m] Mounted POSIX Message Queue File System.
[=1B[0;32m  OK  =1B[0m] Mounted Debug File System.
[=1B[0;32m  OK  =1B[0m] Mounted Huge Pages File System.
[=1B[0;32m  OK  =1B[0m] Started Load Kernel Modules.
[=1B[0;32m  OK  =1B[0m] Started Create list of required sta=E2=80=A6vice no=
des for the current kernel.
[=1B[0;32m  OK  =1B[0m] Started File System Check Daemon to report status.
         Starting Create Static Device Nodes in /dev...
Checking in progress on 1 disk (0.0% complete)=0D         Starting Apply Ke=
rnel Variables...=0D
[=1B[0;32m  OK  =1B[0m] Started Journal Service.
[=1B[0;32m  OK  =1B[0m] Started Apply Kernel Variables.
[=1B[0;32m  OK  =1B[0m] Started Create Static Device Nodes in /dev.
         Starting udev Kernel Device Manager...
Checking in progress on 1 disk (0.9% complete)=0D[=1B[0;32m  OK  =1B[0m] St=
arted udev Kernel Device Manager.=0D
Checking in progress on 1 disk (1.9% complete)=0D=0DChecking in progress on=
 1 disk (14.9% complete)=0D=0DChecking in progress on 1 disk (15.9% complet=
e)=0D=0DChecking in progress on 1 disk (29.9% complete)=0D=0DChecking in pr=
ogress on 1 disk (30.8% complete)=0D=0DChecking in progress on 1 disk (44.8=
% complete)=0D=0DChecking in progress on 1 disk (45.7% complete)=0D=0DCheck=
ing in progress on 1 disk (70.0% complete)=0D=0DChecking in progress on 1 d=
isk (70.0% complete)=0D=0DChecking in progress on 1 disk (70.1% complete)=
=0D=0DChecking in progress on 1 disk (70.4% complete)=0D=0DChecking in prog=
ress on 1 disk (70.6% complete)=0D=0DChecking in progress on 1 disk (70.9% =
complete)=0D=0DChecking in progress on 1 disk (71.5% complete)=0D=0DCheckin=
g in progress on 1 disk (71.6% complete)=0D=0DChecking in progress on 1 dis=
k (72.1% complete)=0D=0DChecking in progress on 1 disk (72.4% complete)=0D=
=0DChecking in progress on 1 disk (72.9% complete)=0D=0DChecking in progres=
s on 1 disk (73.2% complete)=0D=0DChecking in progress on 1 disk (73.6% com=
plete)=0D=0DChecking in progress on 1 disk (73.8% complete)=0D=0DChecking i=
n progress on 1 disk (74.2% complete)=0D=0DChecking in progress on 1 disk (=
74.6% complete)=0D=0DChecking in progress on 1 disk (75.3% complete)=0D=0DC=
hecking in progress on 1 disk (76.0% complete)=0D=0DChecking in progress on=
 1 disk (76.0% complete)=0D=0DChecking in progress on 1 disk (76.0% complet=
e)=0D=0DChecking in progress on 1 disk (76.3% complete)=0D=0DChecking in pr=
ogress on 1 disk (76.6% complete)=0D=0DChecking in progress on 1 disk (77.1=
% complete)=0D=0DChecking in progress on 1 disk (77.4% complete)=0D=0DCheck=
ing in progress on 1 disk (77.8% complete)=0D=0DChecking in progress on 1 d=
isk (78.1% complete)=0D=0DChecking in progress on 1 disk (78.5% complete)=
=0D=0DChecking in progress on 1 disk (79.0% complete)=0D=0DChecking in prog=
ress on 1 disk (79.3% complete)=0D=0DChecking in progress on 1 disk (79.7% =
complete)=0D=0DChecking in progress on 1 disk (80.0% complete)=0D=0DCheckin=
g in progress on 1 disk (80.1% complete)=0D=0DChecking in progress on 1 dis=
k (80.6% complete)=0D=0DChecking in progress on 1 disk (80.6% complete)=0D=
=0DChecking in progress on 1 disk (81.1% complete)=0D=0DChecking in progres=
s on 1 disk (81.5% complete)=0D=0DChecking in progress on 1 disk (81.8% com=
plete)=0D=0DChecking in progress on 1 disk (82.2% complete)=0D=0DChecking i=
n progress on 1 disk (82.5% complete)=0D=0DChecking in progress on 1 disk (=
83.0% complete)=0D=0DChecking in progress on 1 disk (83.3% complete)=0D=0DC=
hecking in progress on 1 disk (83.6% complete)=0D=0DChecking in progress on=
 1 disk (83.9% complete)=0D=0DChecking in progress on 1 disk (84.3% complet=
e)=0D=0DChecking in progress on 1 disk (84.6% complete)=0D=0DChecking in pr=
ogress on 1 disk (84.8% complete)=0D=0DChecking in progress on 1 disk (85.1=
% complete)=0D=0DChecking in progress on 1 disk (85.1% complete)=0D=0DCheck=
ing in progress on 1 disk (85.4% complete)=0D=0DChecking in progress on 1 d=
isk (85.9% complete)=0D=0DChecking in progress on 1 disk (86.6% complete)=
=0D=0DChecking in progress on 1 disk (87.2% complete)=0D=0DChecking in prog=
ress on 1 disk (87.5% complete)=0D=0DChecking in progress on 1 disk (87.7% =
complete)=0D=0DChecking in progress on 1 disk (88.1% complete)=0D=0DCheckin=
g in progress on 1 disk (88.2% complete)=0D=0DChecking in progress on 1 dis=
k (88.7% complete)=0D=0DChecking in progress on 1 disk (89.0% complete)=0D=
=0DChecking in progress on 1 disk (89.4% complete)=0D=0DChecking in progres=
s on 1 disk (89.5% complete)=0D=0DChecking in progress on 1 disk (89.7% com=
plete)=0D=0DChecking in progress on 1 disk (89.9% complete)=0D=0DChecking i=
n progress on 1 disk (90.1% complete)=0D=0DChecking in progress on 1 disk (=
90.3% complete)=0D=0DChecking in progress on 1 disk (90.4% complete)=0D=0DC=
hecking in progress on 1 disk (90.6% complete)=0D=0DChecking in progress on=
 1 disk (90.8% complete)=0D=0DChecking in progress on 1 disk (90.9% complet=
e)=0D=0DChecking in progress on 1 disk (91.1% complete)=0D=0DChecking in pr=
ogress on 1 disk (91.3% complete)=0D=0DChecking in progress on 1 disk (91.4=
% complete)=0D=0DChecking in progress on 1 disk (91.6% complete)=0D=0DCheck=
ing in progress on 1 disk (91.8% complete)=0D=0DChecking in progress on 1 d=
isk (91.9% complete)=0D=0DChecking in progress on 1 disk (92.6% complete)=
=0D=0DChecking in progress on 1 disk (93.6% complete)=0D=0DChecking in prog=
ress on 1 disk (94.6% complete)=0D=0DChecking in progress on 1 disk (96.6% =
complete)=0D=0DChecking in progress on 1 disk (97.5% complete)=0D=0DCheckin=
g in progress on 1 disk (100.0% complete)=0D=0DChecking in progress on 0 di=
sks (100.0% complete)=0D[=1B[0;32m  OK  =1B[0m] Started File System Check o=
n Root Device.=0D
         Starting Remount Root and Kernel File Systems...
[   12.588657] EXT4-fs (mmcblk1p2): re-mounted. Opts: errors=3Dremount-ro
[=1B[0;32m  OK  =1B[0m] Started Remount Root and Kernel File Systems.
[=1B[0;32m  OK  =1B[0m] Reached target Local File Systems (Pre).
         Starting Load/Save Random Seed...
         Starting udev Coldplug all Devices...
         Starting Flush Journal to Persistent Storage...
[=1B[0;32m  OK  =1B[0m] Started Load/Save Random Seed.
[   12.695677] systemd-journald[186]: Received request to flush runtime jou=
rnal from PID 1
[=1B[0;32m  OK  =1B[0m] Started Flush Journal to Persistent Storage.
[   12.973592] tegra-i2c 7000c700.i2c: could not find pctldev for node /hos=
t1x@50000000/dpaux@54040000/pinmux-i2c, deferring probe
[=1B[0;32m  OK  =1B[0m] Started udev Coldplug all Devices.
[=1B[0;32m  OK  =1B[0m] Found device /dev/ttyS0.
[   13.099280] 0-002c supply power not found, using dummy regulator
[   13.120275] tegra-i2c 7000c700.i2c: could not find pctldev for node /hos=
t1x@50000000/dpaux@54040000/pinmux-i2c, deferring probe
[   13.144235] [drm] Initialized
[   13.156912] lp855x 0-002c: failed to read 0x00
[   13.161383] lp855x 0-002c: pre init device err: -121
[   13.166359] lp855x 0-002c: device config err: -121
[   13.247809] lp855x: probe of 0-002c failed with error -121
[   13.294459] tegra-i2c 7000c700.i2c: could not find pctldev for node /hos=
t1x@50000000/dpaux@54040000/pinmux-i2c, deferring probe
[   13.307581] 54040000.dpaux supply vdd not found, using dummy regulator
[   13.332329] tegra-sor 54580000.sor: failed to probe output: -517
[   13.367740] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[   13.374368] [drm] No driver support for vblank timestamp query.
[   13.447475] drm drm: No connectors reported connected with modes
[   13.463272] [drm] Cannot find any crtc or sizes - going 1024x768
[   13.507394] drm drm: fb0:  frame buffer device
[   13.559928] [drm] Initialized tegra 0.0.0 20120330 on minor 0
[   13.589237] usbcore: registered new interface driver r8152
[   13.633884] usbcore: registered new interface driver cdc_ether
[=1B[0;32m  OK  =1B[0m] Found device /dev/disk/by-uuid/98a72b13-a480-4b9a-8=
627-04fd7dc8ff7d.
[   13.728119] usb 1-2: reset high-speed USB device number 4 using tegra-xu=
sb
[   13.876813] 57000000.gpu supply vdd not found, using dummy regulator
[=1B[0;32m  OK  =1B[0m] Found device /dev/disk/by-uuid/eac8dd58-c636-472d-8=
9e5-79272fd02d9e.
[=1B[0;32m  OK  =1B[0m] Found device /dev/disk/by-uuid/b2b4d279-7f34-4d03-b=
42a-b75c63d70f62.
[   13.914076] tegra-mc 70019000.memory-controller: gpuswr: write @0x000000=
03fffffff0: Page fault (SMMU translation error [--S])
[=1B[0;32m  OK  =1B[0m] Found device /dev/mmcblk1p3.
[   13.965144] alg: No test for __ecb-aes-ce (__driver-ecb-aes-ce)
[   13.981054] asix 1-3:1.0 eth0: register 'asix' at usb-70090000.usb-3, AS=
IX AX88772 USB 2.0 Ethernet, 00:50:b6:13:69:26
[   14.025201] r8152 1-2:1.0 eth1: v1.08.6

--bp/iNruPH9dso1Pn--
