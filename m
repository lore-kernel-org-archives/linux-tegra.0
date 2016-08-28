From: Martin Michlmayr <tbm-R+vWnYXSFMfQT0dZR+AlfA@public.gmane.org>
Subject: XUSB not working on Jetson TX1: failed to enable UPHY
Date: Sun, 28 Aug 2016 15:12:36 -0700
Message-ID: <20160828221236.GA14695@jirafa.cyrius.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="7JfCtLOvnd9MIVvH"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--7JfCtLOvnd9MIVvH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

XUSB is not working for me on the Jetson TX1 development kit with
4.8-rc3.

I built a Debian kernel with 4.8-rc3.  When I boot into Debian
installer, USB works fine and Ethernet works.

But when I boot into the installed system, I get:

usb3-0: tegra210_usb3_port_enable: failed to enable UPHY: -110
usb3-1: tegra210_usb3_port_enable: failed to enable UPHY: -110

This is the same kernel but the installer is a minimal system and
contains fewer modules and the order of module loading is different.

I've attached one log where it works (in the installer) and two logs
where it fails (in the full system).

This is with U-Boot 2016.03-00633-g3ef9cdb (from NVIDIA).

-- 
Martin Michlmayr
http://www.cyrius.com/

--7JfCtLOvnd9MIVvH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=works

Starting kernel ...

[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] Linux version 4.8.0-rc3-arm64 (debian-kernel-0aAXYlwwYIJuHlm7Suoebg@public.gmane.org) (gcc version 5.4.1 20160803 (Debian 5.4.1-1) ) #1 SMP Debian 4.8~rc3-1~exp1 (2016-08-28)
[    0.000000] Boot CPU: AArch64 Processor [411fd071]
[    0.000000] efi: Getting EFI parameters from FDT:
[    0.000000] efi: UEFI not found.
[    0.000000] /cpus/cpu@1: missing enable-method property
[    0.000000] /cpus/cpu@2: missing enable-method property
[    0.000000] /cpus/cpu@3: missing enable-method property
[    0.000000] percpu: Embedded 22 pages/cpu @ffffffc0fff78000 s49176 r8192 d32744 u90112
[    0.000000] Detected PIPT I-cache on CPU0
[    0.000000] CPU features: enabling workaround for ARM erratum 832075
[    0.000000] Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 903168
[    0.000000] Kernel command line: 
[    0.000000] PID hash table entries: 4096 (order: 3, 32768 bytes)
[    0.000000] Dentry cache hash table entries: 524288 (order: 10, 4194304 bytes)
[    0.000000] Inode-cache hash table entries: 262144 (order: 9, 2097152 bytes)
[    0.000000] software IO TLB [mem 0xdbfff000-0xdffff000] (64MB) mapped at [ffffffc05bfff000-ffffffc05fffefff]
[    0.000000] Memory: 3499952K/3670016K available (6140K kernel code, 1017K rwdata, 1916K rodata, 3072K init, 613K bss, 170064K reserved, 0K cma-reserved)
[    0.000000] Virtual kernel memory layout:
[    0.000000]     modules : 0xffffff8000000000 - 0xffffff8008000000   (   128 MB)
[    0.000000]     vmalloc : 0xffffff8008000000 - 0xffffffbebfff0000   (   250 GB)
[    0.000000]       .text : 0xffffff8008080000 - 0xffffff8008680000   (  6144 KB)
[    0.000000]     .rodata : 0xffffff8008680000 - 0xffffff8008870000   (  1984 KB)
[    0.000000]       .init : 0xffffff8008870000 - 0xffffff8008b70000   (  3072 KB)
[    0.000000]       .data : 0xffffff8008b70000 - 0xffffff8008c6e600   (  1018 KB)
[    0.000000]        .bss : 0xffffff8008c6e600 - 0xffffff8008d07dbc   (   614 KB)
[    0.000000]     fixed   : 0xffffffbefe7fd000 - 0xffffffbefec00000   (  4108 KB)
[    0.000000]     PCI I/O : 0xffffffbefee00000 - 0xffffffbeffe00000   (    16 MB)
[    0.000000]     vmemmap : 0xffffffbf00000000 - 0xffffffc000000000   (     4 GB maximum)
[    0.000000]               0xffffffbf00000000 - 0xffffffbf04000000   (    64 MB actual)
[    0.000000]     memory  : 0xffffffc000000000 - 0xffffffc100000000   (  4096 MB)
[    0.000000] Hierarchical RCU implementation.
[    0.000000] 	Build-time adjustment of leaf fanout to 64.
[    0.000000] 	RCU restricting CPUs from NR_CPUS=64 to nr_cpu_ids=1.
[    0.000000] RCU: Adjusting geometry for rcu_fanout_leaf=64, nr_cpu_ids=1
[    0.000000] NR_IRQS:64 nr_irqs:64 0
[    0.000000] GIC: Using split EOI/Deactivate mode
[    0.000000] /interrupt-controller@60004000: 192 interrupts forwarded to /interrupt-controller@50041000
[    0.000000] PLL_MB already enabled. Postponing set full defaults
[    0.000000] PLL_U already enabled. Postponing set full defaults
[    0.000000] PLL_P already enabled. Postponing set full defaults
[    0.000000] PLL_X already enabled. Postponing set full defaults
[    0.000000] boot misc1 0x0: expected 0x20
[    0.000000]  (comparison mask = 0xffffff)
[    0.000000] arm_arch_timer: Architected cp15 timer(s) running at 19.20MHz (phys).
[    0.000000] clocksource: arch_sys_counter: mask: 0xffffffffffffff max_cycles: 0x46d987e47, max_idle_ns: 440795202767 ns
[    0.000005] sched_clock: 56 bits at 19MHz, resolution 52ns, wraps every 4398046511078ns
[    0.000284] Console: colour dummy device 80x25
[    0.000986] console [tty0] enabled
[    0.001015] Calibrating delay loop (skipped), value calculated using timer frequency.. 38.40 BogoMIPS (lpj=76800)
[    0.001050] pid_max: default: 32768 minimum: 301
[    0.001184] Security Framework initialized
[    0.001205] Yama: disabled by default; enable with sysctl kernel.yama.*
[    0.001238] AppArmor: AppArmor disabled by boot time parameter
[    0.001293] Mount-cache hash table entries: 8192 (order: 4, 65536 bytes)
[    0.001316] Mountpoint-cache hash table entries: 8192 (order: 4, 65536 bytes)
[    0.002143] ftrace: allocating 22010 entries in 86 pages
[    0.049553] ASID allocator initialised with 65536 entries
[    0.051576] Speedo Revision 4
[    0.051615] Tegra Revision: A02 SKU: 23 CPU Process: 0 SoC Process: -22
[    0.052286] EFI services will not be available.
[    0.052466] Brought up 1 CPUs
[    0.052485] SMP: Total of 1 processors activated.
[    0.052509] CPU features: detected feature: 32-bit EL0 Support
[    0.052533] CPU: All CPU(s) started at EL2
[    0.052560] alternatives: patching kernel code
[    0.053863] devtmpfs: initialized
[    0.067145] DMI not present or invalid.
[    0.067382] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
[    0.067500] pinctrl core: initialized pinctrl subsystem
[    0.068594] NET: Registered protocol family 16
[    0.069334] vdso: 2 pages (1 code @ ffffff8008686000, 1 data @ ffffff8008b75000)
[    0.069382] hw-breakpoint: found 6 breakpoint and 4 watchpoint registers.
[    0.069562] DMA: preallocated 256 KiB pool for atomic allocations
[    0.069683] Serial: AMBA PL011 UART driver
[    0.077077] tegra-mc 70019000.memory-controller: no memory timings for RAM code 0 registered
[    0.083702] HugeTLB registered 2 MB page size, pre-allocated 0 pages
[    0.084784] vgaarb: loaded
[    0.085021] dmi: Firmware registration failed.
[    0.085781] clocksource: Switched to clocksource arch_sys_counter
[    0.113307] VFS: Disk quotas dquot_6.6.0
[    0.113392] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
[    0.121901] NET: Registered protocol family 2
[    0.122422] TCP established hash table entries: 32768 (order: 6, 262144 bytes)
[    0.122652] TCP bind hash table entries: 32768 (order: 7, 524288 bytes)
[    0.122928] TCP: Hash tables configured (established 32768 bind 32768)
[    0.123009] UDP hash table entries: 2048 (order: 4, 65536 bytes)
[    0.123064] UDP-Lite hash table entries: 2048 (order: 4, 65536 bytes)
[    0.123253] NET: Registered protocol family 1
[    0.123473] Unpacking initramfs...
[    1.368184] Freeing initrd memory: 18952K (ffffffc002100000 - ffffffc003382000)
[    1.369740] futex hash table entries: 256 (order: 3, 32768 bytes)
[    1.369865] audit: initializing netlink subsys (disabled)
[    1.369937] audit: type=2000 audit(1.339:1): initialized
[    1.370608] workingset: timestamp_bits=46 max_order=20 bucket_order=0
[    1.370684] zbud: loaded
[    1.372273] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 251)
[    1.372390] io scheduler noop registered
[    1.372412] io scheduler deadline registered
[    1.372452] io scheduler cfq registered (default)
[    1.382218] tegra-apbdma 60020000.dma: Tegra20 APB DMA driver register 32 channels
[    1.382714] tegra-pmc 7000e400.pmc: i2c-thermtrip node not found, emergency thermal reset disabled.
[    1.383015] Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
[    1.384518] 70006000.serial: ttyS0 at MMIO 0x70006000 (irq = 314, base_baud = 25500000) is a Tegra
[    2.015181] console [ttyS0] enabled
[    2.019027] Serial: AMBA driver
[    2.022317] msm_serial: driver initialized
[    2.026566] Unable to detect cache hierarchy from DT for CPU 0
[    2.032808] mousedev: PS/2 mouse device common for all mice
[    2.039064] tegra_rtc 7000e000.rtc: rtc core: registered 7000e000.rtc as rtc1
[    2.046282] tegra_rtc 7000e000.rtc: Tegra internal Real Time Clock
[    2.053297] ledtrig-cpu: registered to indicate activity on CPUs
[    2.059317] dmi-sysfs: dmi entry is absent.
[    2.063910] NET: Registered protocol family 10
[    2.068989] mip6: Mobile IPv6
[    2.071999] NET: Registered protocol family 17
[    2.076461] mpls_gso: MPLS GSO support
[    2.080748] registered taskstats version 1
[    2.084906] zswap: loaded using pool lzo/zbud
[    2.089590] hctosys: unable to open rtc device (rtc0)
[    2.104570] Freeing unused kernel memory: 3072K (ffffffc000870000 - ffffffc000b70000)
[    2.137519] random: udevadm: uninitialized urandom read (16 bytes read)
[    2.145566] random: systemd-udevd: uninitialized urandom read (16 bytes read)
[    2.153155] random: systemd-udevd: uninitialized urandom read (16 bytes read)
[    2.160520] random: udevadm: uninitialized urandom read (16 bytes read)
[    2.167242] random: systemd-udevd: uninitialized urandom read (16 bytes read)
[    2.175061] random: udevadm: uninitialized urandom read (16 bytes read)
[    2.181773] random: systemd-udevd: uninitialized urandom read (16 bytes read)
[    2.189459] random: udevadm: uninitialized urandom read (16 bytes read)
[    2.198144] random: udevadm: uninitialized urandom read (16 bytes read)
[    2.206051] random: udevadm: uninitialized urandom read (16 bytes read)
[    2.422575] tegra-i2c 7000c700.i2c: could not find pctldev for node /host1x@50000000/dpaux@54040000/pinmux-i2c, deferring probe
[    2.470214] [drm] Initialized drm 1.1.0 20060810
[    2.483426] usb2-0 supply vbus not found, using dummy regulator
[    2.491703] usbcore: registered new interface driver usbfs
[    2.534436] tegra-xusb-padctl 7009f000.padctl: failed to setup XUSB ports: -517
[    2.580946] usbcore: registered new interface driver hub
[    2.600953] max77620 1-003c: PMIC Version OTP:0x35 and ES:0x8
[    2.606980] usbcore: registered new device driver usb
[    2.612258] tegra-i2c 7000c700.i2c: could not find pctldev for node /host1x@50000000/dpaux@54040000/pinmux-i2c, deferring probe
[    2.624625] tegra-dsi 54300000.dsi: cannot get VDD supply
[    2.637180] sdhci: Secure Digital Host Controller Interface driver
[    2.643408] sdhci: Copyright(c) Pierre Ossman
[    2.657762] 54040000.dpaux supply vdd not found, using dummy regulator
[    2.677562] usb2-0 supply vbus not found, using dummy regulator
[    2.687703] i2c i2c-2: of_i2c: modalias failure on /host1x@50000000/dpaux@54040000/pinmux-aux
[    2.696281] i2c i2c-2: of_i2c: modalias failure on /host1x@50000000/dpaux@54040000/pinmux-i2c
[    2.704833] i2c i2c-2: of_i2c: modalias failure on /host1x@50000000/dpaux@54040000/pinmux-off
[    2.713377] i2c i2c-2: of_i2c: modalias failure on /host1x@50000000/dpaux@54040000/i2c-bus
[    2.726647] sdhci-pltfm: SDHCI platform and OF driver helper
[    2.732666] tegra-xusb-padctl 7009f000.padctl: failed to setup XUSB ports: -517
[    2.750984] tegra-dsi 54300000.dsi: cannot get VDD supply
[    2.761947] tegra-i2c 7000c700.i2c: could not find pctldev for node /host1x@50000000/dpaux@54040000/pinmux-i2c, deferring probe
[    2.787611] usb2-0 supply vbus not found, using dummy regulator
[    2.798193] tegra-sor 54580000.sor: failed to probe output: -517
[    2.810075] tegra-xusb-padctl 7009f000.padctl: failed to setup XUSB ports: -517
[    2.818351] max77686-rtc max77620-rtc: rtc core: registered max77620-rtc as rtc0
[    2.841405] tegra-dsi 54300000.dsi: cannot get VDD supply
[    2.851046] sdhci-tegra 700b0000.sdhci: Got CD GPIO
[    2.858203] VDD_5V0_SYS: supplied by VDD_SYS_MUX
[    2.866423] mmc0: Unknown controller version (3). You may experience problems.
[    2.883201] tegra-sor 54580000.sor: cannot get AVDD I/O supply: -517
[    2.889598] tegra-sor 54580000.sor: failed to probe HDMI: -517
[    2.896133] VDD_3V3_SYS: supplied by VDD_SYS_MUX
[    2.907049] VDD_3V3_SD: supplied by VDD_3V3_SYS
[    2.918198] VDD_DIS_3V3_LCD: supplied by VDD_3V3_SYS
[    2.927446] usb2-0 supply vbus not found, using dummy regulator
[    2.939456] RTL_5V: supplied by VDD_5V0_SYS
[    2.946123] USB_VBUS_EN1: supplied by VDD_5V0_SYS
[    2.951309] tegra-xusb-padctl 7009f000.padctl: failed to setup XUSB ports: -517
[    2.958673] mmc0: SDHCI controller on 700b0600.sdhci [700b0600.sdhci] using ADMA 64-bit
[    2.979171] VDD_HDMI_5V0: supplied by VDD_5V0_SYS
[    2.998366] sdhci-tegra 700b0000.sdhci: Got CD GPIO
[    3.016817] tegra-dsi 54300000.dsi: cannot get VDD supply
[    3.045130] mmc0: new high speed MMC card at address 0001
[    3.055892] tegra-sor 54580000.sor: cannot get AVDD I/O supply: -517
[    3.062300] tegra-sor 54580000.sor: failed to probe HDMI: -517
[    3.091824] mmcblk0: mmc0:0001 016G32 14.7 GiB 
[    3.115502] mmcblk0boot0: mmc0:0001 016G32 partition 1 4.00 MiB
[    3.130625] usb2-0 supply vbus not found, using dummy regulator
[    3.152413] mmcblk0boot1: mmc0:0001 016G32 partition 2 4.00 MiB
[    3.162970] usb2-3 supply vbus not found, using dummy regulator
[    3.172297] random: fast init done
[    3.176235] mmcblk0rpmb: mmc0:0001 016G32 partition 3 4.00 MiB
[    3.187869] usb3-0 supply vbus not found, using dummy regulator
[    3.194537] VDD_LCD_1V8_DIS: supplied by VDD_1V8
[    3.204732]  mmcblk0: p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11 p12 p13 p14 p15 p16 p17 p18
[    3.216121] AVDD_DSI_CSI_1V2: supplied by AVDD_SYS_1V2
[    3.226888] usb3-1 supply vbus not found, using dummy regulator
[    3.243448] VDD_CAM_HV: Bringing 3100000uV into 2800000-2800000uV
[    3.262642] 70090000.usb supply dvdd-pex-pll not found, using dummy regulator
[    3.278294] VDD_RTC: Bringing 1000000uV into 850000-850000uV
[    3.292166] 70090000.usb supply hvdd-pex-pll-e not found, using dummy regulator
[    3.305700] VDD_TS_HV: Bringing 3100000uV into 3300000-3300000uV
[    3.327354] tegra-xusb 70090000.usb: firmware: direct-loading firmware nvidia/tegra210/xusb.bin
[    3.336734] VDD_TS_1V8: Bringing 2800000uV into 1800000-1800000uV
[    3.402493] tegra-xusb 70090000.usb: Firmware timestamp: 2015-08-10 09:47:54 UTC
[    3.414566] tegra-xusb 70090000.usb: xHCI Host Controller
[    3.420577] tegra-xusb 70090000.usb: new USB bus registered, assigned bus number 1
[    3.429441] tegra-xusb 70090000.usb: hcc params 0x0184f525 hci version 0x100 quirks 0x00010010
[    3.438559] tegra-xusb 70090000.usb: irq 320, io mem 0x70090000
[    3.444764] usb usb1: New USB device found, idVendor=1d6b, idProduct=0002
[    3.451592] usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    3.458835] usb usb1: Product: xHCI Host Controller
[    3.463725] usb usb1: Manufacturer: Linux 4.8.0-rc3-arm64 xhci-hcd
[    3.469914] usb usb1: SerialNumber: 70090000.usb
[    3.475973] hub 1-0:1.0: USB hub found
[    3.480145] hub 1-0:1.0: 5 ports detected
[    3.485174] tegra-xusb 70090000.usb: xHCI Host Controller
[    3.491107] tegra-xusb 70090000.usb: new USB bus registered, assigned bus number 2
[    3.498921] usb usb2: We don't know the algorithms for LPM for this host, disabling LPM.
[    3.507246] usb usb2: New USB device found, idVendor=1d6b, idProduct=0003
[    3.514066] usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    3.521308] usb usb2: Product: xHCI Host Controller
[    3.526197] usb usb2: Manufacturer: Linux 4.8.0-rc3-arm64 xhci-hcd
[    3.532385] usb usb2: SerialNumber: 70090000.usb
[    3.538836] hub 2-0:1.0: USB hub found
[    3.543274] hub 2-0:1.0: 4 ports detected
[    3.548743] sdhci-tegra 700b0000.sdhci: Got CD GPIO
[    3.554549] mmc1: Unknown controller version (3). You may experience problems.
[    3.607975] mmc1: SDHCI controller on 700b0000.sdhci [700b0000.sdhci] using ADMA 64-bit
[    3.648782] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[    3.655449] [drm] No driver support for vblank timestamp query.
[    3.681752] mmc1: host does not support reading read-only switch, assuming write-enable
[    3.741501] mmc1: new high speed SDHC card at address aaaa
[    3.805891] mmcblk1: mmc1:aaaa SS32G 29.7 GiB 
[    3.824048]  mmcblk1: p1
[    3.840828] drm drm: fb0:  frame buffer device
[    3.852301] [drm] Initialized tegra 0.0.0 20120330 on minor 0
Starting system log daemon: syslogd, klogd.

--7JfCtLOvnd9MIVvH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=error1
Content-Transfer-Encoding: quoted-printable

Starting kernel ...

[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] Linux version 4.8.0-rc3-arm64 (debian-kernel-0aAXYlwwYIKpJHnUorBY+A@public.gmane.org=
g) (gcc version 5.4.1 20160803 (Debian 5.4.1-1) ) #1 SMP Debian 4.8~rc3-1~e=
xp1 (2016-08-28)
[    0.000000] Boot CPU: AArch64 Processor [411fd071]
[    0.000000] efi: Getting EFI parameters from FDT:
[    0.000000] efi: UEFI not found.
[    0.000000] /cpus/cpu@1: missing enable-method property
[    0.000000] /cpus/cpu@2: missing enable-method property
[    0.000000] /cpus/cpu@3: missing enable-method property
[    0.000000] percpu: Embedded 22 pages/cpu @ffffffc0fff78000 s49176 r8192=
 d32744 u90112
[    0.000000] Detected PIPT I-cache on CPU0
[    0.000000] CPU features: enabling workaround for ARM erratum 832075
[    0.000000] Built 1 zonelists in Zone order, mobility grouping on.  Tota=
l pages: 903168
[    0.000000] Kernel command line: console=3DttyS0,115200n8
[    0.000000] PID hash table entries: 4096 (order: 3, 32768 bytes)
[    0.000000] Dentry cache hash table entries: 524288 (order: 10, 4194304 =
bytes)
[    0.000000] Inode-cache hash table entries: 262144 (order: 9, 2097152 by=
tes)
[    0.000000] software IO TLB [mem 0xdbfff000-0xdffff000] (64MB) mapped at=
 [ffffffc05bfff000-ffffffc05fffefff]
[    0.000000] Memory: 3503008K/3670016K available (6140K kernel code, 1023=
K rwdata, 1928K rodata, 3072K init, 611K bss, 167008K reserved, 0K cma-rese=
rved)
[    0.000000] Virtual kernel memory layout:
[    0.000000]     modules : 0xffffff8000000000 - 0xffffff8008000000   (   =
128 MB)
[    0.000000]     vmalloc : 0xffffff8008000000 - 0xffffffbebfff0000   (   =
250 GB)
[    0.000000]       .text : 0xffffff8008080000 - 0xffffff8008680000   (  6=
144 KB)
[    0.000000]     .rodata : 0xffffff8008680000 - 0xffffff8008870000   (  1=
984 KB)
[    0.000000]       .init : 0xffffff8008870000 - 0xffffff8008b70000   (  3=
072 KB)
[    0.000000]       .data : 0xffffff8008b70000 - 0xffffff8008c6fe00   (  1=
024 KB)
[    0.000000]        .bss : 0xffffff8008c6fe00 - 0xffffff8008d08dbc   (   =
612 KB)
[    0.000000]     fixed   : 0xffffffbefe7fd000 - 0xffffffbefec00000   (  4=
108 KB)
[    0.000000]     PCI I/O : 0xffffffbefee00000 - 0xffffffbeffe00000   (   =
 16 MB)
[    0.000000]     vmemmap : 0xffffffbf00000000 - 0xffffffc000000000   (   =
  4 GB maximum)
[    0.000000]               0xffffffbf00000000 - 0xffffffbf04000000   (   =
 64 MB actual)
[    0.000000]     memory  : 0xffffffc000000000 - 0xffffffc100000000   (  4=
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
[    0.000004] sched_clock: 56 bits at 19MHz, resolution 52ns, wraps every =
4398046511078ns
[    0.000282] Console: colour dummy device 80x25
[    0.000305] Calibrating delay loop (skipped), value calculated using tim=
er frequency.. 38.40 BogoMIPS (lpj=3D76800)
[    0.000319] pid_max: default: 32768 minimum: 301
[    0.000439] Security Framework initialized
[    0.000451] Yama: disabled by default; enable with sysctl kernel.yama.*
[    0.000470] AppArmor: AppArmor disabled by boot time parameter
[    0.000514] Mount-cache hash table entries: 8192 (order: 4, 65536 bytes)
[    0.000524] Mountpoint-cache hash table entries: 8192 (order: 4, 65536 b=
ytes)
[    0.001330] ftrace: allocating 22108 entries in 87 pages
[    0.047397] ASID allocator initialised with 65536 entries
[    0.049397] Speedo Revision 4
[    0.049422] Tegra Revision: A02 SKU: 23 CPU Process: 0 SoC Process: -22
[    0.050102] EFI services will not be available.
[    0.050273] Brought up 1 CPUs
[    0.050282] SMP: Total of 1 processors activated.
[    0.050294] CPU features: detected feature: 32-bit EL0 Support
[    0.050307] CPU: All CPU(s) started at EL2
[    0.050323] alternatives: patching kernel code
[    0.051640] devtmpfs: initialized
[    0.064877] DMI not present or invalid.
[    0.065102] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xfffffff=
f, max_idle_ns: 7645041785100000 ns
[    0.065198] pinctrl core: initialized pinctrl subsystem
[    0.066280] NET: Registered protocol family 16
[    0.067034] vdso: 2 pages (1 code @ ffffff8008686000, 1 data @ ffffff800=
8b75000)
[    0.067053] hw-breakpoint: found 6 breakpoint and 4 watchpoint registers.
[    0.067200] DMA: preallocated 256 KiB pool for atomic allocations
[    0.067330] Serial: AMBA PL011 UART driver
[    0.074816] tegra-mc 70019000.memory-controller: no memory timings for R=
AM code 0 registered
[    0.081377] HugeTLB registered 2 MB page size, pre-allocated 0 pages
[    0.082466] vgaarb: loaded
[    0.082682] dmi: Firmware registration failed.
[    0.083443] clocksource: Switched to clocksource arch_sys_counter
[    0.110747] VFS: Disk quotas dquot_6.6.0
[    0.110811] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 byte=
s)
[    0.119294] NET: Registered protocol family 2
[    0.119828] TCP established hash table entries: 32768 (order: 6, 262144 =
bytes)
[    0.120037] TCP bind hash table entries: 32768 (order: 7, 524288 bytes)
[    0.120301] TCP: Hash tables configured (established 32768 bind 32768)
[    0.120370] UDP hash table entries: 2048 (order: 4, 65536 bytes)
[    0.120413] UDP-Lite hash table entries: 2048 (order: 4, 65536 bytes)
[    0.120591] NET: Registered protocol family 1
[    0.120803] Unpacking initramfs...
[    1.202437] Freeing initrd memory: 15892K (ffffffc002100000 - ffffffc003=
085000)
[    1.204038] futex hash table entries: 256 (order: 3, 32768 bytes)
[    1.204109] audit: initializing netlink subsys (disabled)
[    1.204169] audit: type=3D2000 audit(1.171:1): initialized
[    1.204807] workingset: timestamp_bits=3D46 max_order=3D20 bucket_order=
=3D0
[    1.204870] zbud: loaded
[    1.206442] Block layer SCSI generic (bsg) driver version 0.4 loaded (ma=
jor 251)
[    1.206536] io scheduler noop registered
[    1.206545] io scheduler deadline registered
[    1.206575] io scheduler cfq registered (default)
[    1.216550] tegra-apbdma 60020000.dma: Tegra20 APB DMA driver register 3=
2 channels
[    1.217047] tegra-pmc 7000e400.pmc: i2c-thermtrip node not found, emerge=
ncy thermal reset disabled.
[    1.217332] Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
[    1.218785] console [ttyS0] disabled
[    1.218861] 70006000.serial: ttyS0 at MMIO 0x70006000 (irq =3D 314, base=
_baud =3D 25500000) is a Tegra
[    1.851664] console [ttyS0] enabled
[    1.855529] Serial: AMBA driver
[    1.858796] msm_serial: driver initialized
[    1.863041] Unable to detect cache hierarchy from DT for CPU 0
[    1.869282] mousedev: PS/2 mouse device common for all mice
[    1.875560] tegra_rtc 7000e000.rtc: rtc core: registered 7000e000.rtc as=
 rtc1
[    1.882760] tegra_rtc 7000e000.rtc: Tegra internal Real Time Clock
[    1.889762] ledtrig-cpu: registered to indicate activity on CPUs
[    1.895773] dmi-sysfs: dmi entry is absent.
[    1.900489] NET: Registered protocol family 10
[    1.905559] mip6: Mobile IPv6
[    1.908555] NET: Registered protocol family 17
[    1.913010] mpls_gso: MPLS GSO support
[    1.917306] registered taskstats version 1
[    1.921462] zswap: loaded using pool lzo/zbud
[    1.926143] hctosys: unable to open rtc device (rtc0)
[    1.941126] Freeing unused kernel memory: 3072K (ffffffc000870000 - ffff=
ffc000b70000)
Loading, please wait...
starting version 231
[    2.000944] random: systemd-udevd: uninitialized urandom read (16 bytes =
read)
[    2.009257] random: udevadm: uninitialized urandom read (16 bytes read)
[    2.016253] random: systemd-udevd: uninitialized urandom read (16 bytes =
read)
[    2.023605] random: udevadm: uninitialized urandom read (16 bytes read)
[    2.030312] random: systemd-udevd: uninitialized urandom read (16 bytes =
read)
[    2.038099] random: udevadm: uninitialized urandom read (16 bytes read)
[    2.047714] random: udevadm: uninitialized urandom read (16 bytes read)
[    2.054698] random: udevadm: uninitialized urandom read (16 bytes read)
[    2.061634] random: udevadm: uninitialized urandom read (16 bytes read)
[    2.068549] random: udevadm: uninitialized urandom read (16 bytes read)
[    2.438924] sdhci: Secure Digital Host Controller Interface driver
[    2.445134] sdhci: Copyright(c) Pierre Ossman
[    2.451432] sdhci-pltfm: SDHCI platform and OF driver helper
[    2.473683] usbcore: registered new interface driver usbfs
[    2.493041] usb2-0 supply vbus not found, using dummy regulator
[    2.537620] usbcore: registered new interface driver hub
[    2.543915] tegra-xusb-padctl 7009f000.padctl: failed to setup XUSB port=
s: -517
[    2.585580] usbcore: registered new device driver usb
[    2.598384] usb2-0 supply vbus not found, using dummy regulator
[    2.604463] sdhci-tegra 700b0000.sdhci: Got CD GPIO
[    2.635898] mmc0: Unknown controller version (3). You may experience pro=
blems.
[    2.659937] tegra-xusb-padctl 7009f000.padctl: failed to setup XUSB port=
s: -517
[    2.739492] mmc0: SDHCI controller on 700b0600.sdhci [700b0600.sdhci] us=
ing ADMA 64-bit
[    2.787713] sdhci-tegra 700b0000.sdhci: Got CD GPIO
[    2.813975] usb2-0 supply vbus not found, using dummy regulator
[    2.856363] mmc0: new high speed MMC card at address 0001
[    2.895158] tegra-xusb-padctl 7009f000.padctl: failed to setup XUSB port=
s: -517
[    2.911227] mmcblk0: mmc0:0001 016G32 14.7 GiB=20
[    2.961504] mmcblk0boot0: mmc0:0001 016G32 partition 1 4.00 MiB
[    3.004589] mmcblk0boot1: mmc0:0001 016G32 partition 2 4.00 MiB
[    3.047068] mmcblk0rpmb: mmc0:0001 016G32 partition 3 4.00 MiB
[    3.088118]  mmcblk0: p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11 p12 p13 p14 p15=
 p16 p17 p18
[    3.181408] sdhci-tegra 700b0000.sdhci: Got CD GPIO
[    3.214955] usb2-0 supply vbus not found, using dummy regulator
[    3.261365] tegra-xusb-padctl 7009f000.padctl: failed to setup XUSB port=
s: -517
[    3.559338] random: fast init done
Begin: Loading essential drivers ... done.
Begin: Running /scripts/init-premount ... done.
Begin: Mounting root file system ... Begin: Running /scripts/local-top ... =
done.
Begin: Running /scripts/local-premount ... done.
Begin: Will now check root file system ... fsck from util-linux 2.28.1
[/sbin/fsck.ext2 (1) -- /dev/mmcblk0p1] fsck.ext2 -a -C0 /dev/mmcblk0p1=20
/dev/mmcblk0p1: clean, 30662/917504 files, 297805/3670016 blocks
done.
[    3.983426] EXT4-fs (mmcblk0p1): mounting ext2 file system using the ext=
4 subsystem
[    3.997741] EXT4-fs (mmcblk0p1): mounted filesystem without journal. Opt=
s: (null)
done.
Begin: Running /scripts/local-bottom ... done.
Begin: Running /scripts/init-bottom ... done.
[    4.319152] systemd[1]: System time before build time, advancing clock.
[    4.380437] systemd[1]: systemd 231 running in system mode. (+PAM +AUDIT=
 +SELINUX +IMA +APPARMOR +SMACK +SYSVINIT +UTMP +LIBCRYPTSETUP +GCRYPT +GNU=
TLS +ACL +XZ -LZ4 +SECCOMP +BLKID +ELFUTILS +KMOD +IDN)
[    4.398903] systemd[1]: Detected architecture arm64.

Welcome to =1B[1mDebian GNU/Linux stretch/sid=1B[0m!

[    4.420470] systemd[1]: Set hostname to <tx1>.
[    4.655363] systemd[1]: Listening on udev Kernel Socket.
[=1B[0;32m  OK  =1B[0m] Listening on udev Kernel Socket.
[    4.671571] systemd[1]: Reached target Remote File Systems.
[=1B[0;32m  OK  =1B[0m] Reached target Remote File Systems.
[    4.687786] systemd[1]: Listening on Journal Audit Socket.
[=1B[0;32m  OK  =1B[0m] Listening on Journal Audit Socket.
[    4.703540] systemd[1]: Reached target Swap.
[=1B[0;32m  OK  =1B[0m] Reached target Swap.
[    4.719599] systemd[1]: Listening on fsck to fsckd communication Socket.
[=1B[0;32m  OK  =1B[0m] Listening on fsck to fsckd communication Socket.
[    4.739680] systemd[1]: Started Forward Password Requests to Wall Direct=
ory Watch.
[=1B[0;32m  OK  =1B[0m] Started Forward Password Requests to Wall Directory=
 Watch.
[    4.760065] systemd[1]: Created slice User and Session Slice.
[=1B[0;32m  OK  =1B[0m] Created slice User and Session Slice.
[=1B[0;32m  OK  =1B[0m] Listening on Syslog Socket.
[=1B[0;32m  OK  =1B[0m] Listening on udev Control Socket.
[=1B[0;32m  OK  =1B[0m] Reached target Encrypted Volumes.
[=1B[0;32m  OK  =1B[0m] Created slice System Slice.
[=1B[0;32m  OK  =1B[0m] Created slice system-getty.slice.
[=1B[0;32m  OK  =1B[0m] Set up automount Arbitrary Executab...ats File Syst=
em Automount Point.
[=1B[0;32m  OK  =1B[0m] Listening on Journal Socket (/dev/log).
[=1B[0;32m  OK  =1B[0m] Listening on Journal Socket.
         Starting Journal Service...
         Starting Create list of required st... nodes for the current kerne=
l...
         Mounting Huge Pages File System...
         Mounting Debug File System...
[=1B[0;32m  OK  =1B[0m] Listening on /dev/initctl Compatibility Named Pipe.
         Mounting POSIX Message Queue File System...
         Starting Load Kernel Modules...
[=1B[0;32m  OK  =1B[0m] Created slice system-serial\x2dgetty.slice.
[=1B[0;32m  OK  =1B[0m] Started Dispatch Password Requests to Console Direc=
tory Watch.
[=1B[0;32m  OK  =1B[0m] Reached target Paths.
         Starting Remount Root and Kernel File Systems...
[=1B[0;32m  OK  =1B[0m] Reached target Slices.
[    5.048692] EXT4-fs (mmcblk0p1): re-mounted. Opts: errors=3Dremount-ro
[=1B[0;32m  OK  =1B[0m] Mounted Debug File System.
[=1B[0;32m  OK  =1B[0m] Mounted Huge Pages File System.
[=1B[0;32m  OK  =1B[0m] Mounted POSIX Message Queue File System.
[=1B[0;32m  OK  =1B[0m] Started Journal Service.
[=1B[0;32m  OK  =1B[0m] Started Create list of required sta...ce nodes for =
the current kernel.
[=1B[0;32m  OK  =1B[0m] Started Load Kernel Modules.
[=1B[0;32m  OK  =1B[0m] Started Remount Root and Kernel File Systems.
         Starting Load/Save Random Seed...
         Starting udev Coldplug all Devices...
         Starting Apply Kernel Variables...
         Starting Create Static Device Nodes in /dev...
         Starting Flush Journal to Persistent Storage...
[=1B[0;32m  OK  =1B[0m] Started Load/Save Random Seed.
[=1B[0;32m  OK  =1B[0m] Started Apply Kernel Variables.
[=1B[0;32m  OK  =1B[0m] Started Create Static Device Nodes in /dev.
[    5.309679] systemd-journald[469]: Received request to flush runtime jou=
rnal from PID 1
[=1B[0;32m  OK  =1B[0m] Reached target Local File Systems (Pre).
[=1B[0;32m  OK  =1B[0m] Reached target Local File Systems.
         Starting udev Kernel Device Manager...
         Starting Raise network interfaces...
[=1B[0;32m  OK  =1B[0m] Started Flush Journal to Persistent Storage.
[=1B[0;32m  OK  =1B[0m] Started udev Kernel Device Manager.
         Starting Create Volatile Files and Directories...
[=1B[0;32m  OK  =1B[0m] Started Create Volatile Files and Directories.
         Starting Update UTMP about System Boot/Shutdown...
         Starting Network Time Synchronization...
[=1B[0;32m  OK  =1B[0m] Started Update UTMP about System Boot/Shutdown.
[    6.359793] sdhci-tegra 700b0000.sdhci: Got CD GPIO
[    6.444956] usb2-0 supply vbus not found, using dummy regulator
[    6.579923] tegra-xusb-padctl 7009f000.padctl: failed to setup XUSB port=
s: -517
[    6.690110] sdhci-tegra 700b0000.sdhci: Got CD GPIO
[    6.731186] [drm] Initialized drm 1.1.0 20060810
[    6.754140] usb2-0 supply vbus not found, using dummy regulator
[    6.857016] tegra-xusb-padctl 7009f000.padctl: failed to setup XUSB port=
s: -517
[    6.926923] tegra-i2c 7000c700.i2c: could not find pctldev for node /hos=
t1x@50000000/dpaux@54040000/pinmux-i2c, deferring probe
[    6.976076] tegra-dsi 54300000.dsi: cannot get VDD supply
[    6.988650] sdhci-tegra 700b0000.sdhci: Got CD GPIO
[    7.020123] 54040000.dpaux supply vdd not found, using dummy regulator
[    7.028192] max77620 1-003c: PMIC Version OTP:0x35 and ES:0x8
[    7.041476] usb2-0 supply vbus not found, using dummy regulator
[    7.066877] i2c i2c-2: of_i2c: modalias failure on /host1x@50000000/dpau=
x@54040000/pinmux-aux
[    7.075429] i2c i2c-2: of_i2c: modalias failure on /host1x@50000000/dpau=
x@54040000/pinmux-i2c
[    7.083960] i2c i2c-2: of_i2c: modalias failure on /host1x@50000000/dpau=
x@54040000/pinmux-off
[    7.092482] i2c i2c-2: of_i2c: modalias failure on /host1x@50000000/dpau=
x@54040000/i2c-bus
[    7.117463] tegra-xusb-padctl 7009f000.padctl: failed to setup XUSB port=
s: -517
[    7.166852] VDD_5V0_SYS: supplied by VDD_SYS_MUX
[    7.191954] RTL_5V: supplied by VDD_5V0_SYS
[    7.205033] USB_VBUS_EN1: supplied by VDD_5V0_SYS
[    7.223628] VDD_HDMI_5V0: supplied by VDD_5V0_SYS
[=1B[0;32m  OK  =1B[0m] Found device /dev/ttyS0.
[    7.256453] VDD_3V3_SYS: supplied by VDD_SYS_MUX
[=1B[0;32m  OK  =1B[0m] Started udev Coldplug al[    7.264308] tegra-sor 54=
580000.sor: failed to probe output: -517
l Devices.
[    7.274085] max77686-rtc max77620-rtc: rtc core: registered max77620-rtc=
 as rtc0
[    7.295884] VDD_3V3_SD: supplied by VDD_3V3_SYS
[    7.324081] VDD_DIS_3V3_LCD: supplied by VDD_3V3_SYS
[=1B[0;32m  OK  =1B[0m] Started Network Time Synchronization.
[    7.405727] tegra-dsi 54300000.dsi: cannot get VDD supply
[    7.531642] sdhci-tegra 700b0000.sdhci: Got CD GPIO
[    7.621561] usb2-0 supply vbus not found, using dummy regulator
[    7.745584] usb2-3 supply vbus not found, using dummy regulator
[    7.800644] usb3-0 supply vbus not found, using dummy regulator
[    7.870771] usb3-1 supply vbus not found, using dummy regulator
[    8.011070] alg: No test for __ecb-aes-ce (__driver-ecb-aes-ce)
[    8.039625]  usb3-0: tegra210_usb3_port_enable: failed to enable UPHY: -=
110
[    8.046623] tegra-xusb-padctl 7009f000.padctl: failed to enable port usb=
3-0: -110
[    8.171840] alg: No test for __ecb-aes-ce (cryptd(__driver-ecb-aes-ce))
[    8.307537]  usb3-1: tegra210_usb3_port_enable: failed to enable UPHY: -=
110
[    8.314526] tegra-xusb-padctl 7009f000.padctl: failed to enable port usb=
3-1: -110
[    8.322026] tegra-xusb-padctl 7009f000.padctl: failed to setup XUSB port=
s: -110
[    8.533129] tegra-xusb-padctl: probe of 7009f000.padctl failed with erro=
r -110
[    8.628884] tegra-sor 54580000.sor: cannot get AVDD I/O supply: -517
[    8.635285] tegra-sor 54580000.sor: failed to probe HDMI: -517
[    8.894965] 0-002c supply power not found, using dummy regulator
[    8.974293] lp855x 0-002c: failed to read 0x00
[    8.978790] lp855x 0-002c: pre init device err: -121
[    8.983777] lp855x 0-002c: device config err: -121
[    9.049288] VDD_LCD_1V8_DIS: supplied by VDD_1V8
[    9.128343] AVDD_DSI_CSI_1V2: supplied by AVDD_SYS_1V2
[    9.186586] lp855x: probe of 0-002c failed with error -121
[    9.229891] VDD_CAM_HV: Bringing 3100000uV into 2800000-2800000uV
[    9.291752] VDD_RTC: Bringing 1000000uV into 850000-850000uV
[    9.304870] VDD_TS_HV: Bringing 3100000uV into 3300000-3300000uV
[    9.320926] VDD_TS_1V8: Bringing 2800000uV into 1800000-1800000uV
[    9.350173] sdhci-tegra 700b0000.sdhci: Got CD GPIO
[    9.394720] mmc1: Unknown controller version (3). You may experience pro=
blems.
[    9.503698] mmc1: SDHCI controller on 700b0000.sdhci [700b0000.sdhci] us=
ing ADMA 64-bit
[    9.551564] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[    9.558201] [drm] No driver support for vblank timestamp query.
[=1B[0;32m  OK  =1B[0m] Reached target System Time Synchronized.
[    9.577147] mmc1: host does not support reading read-only switch, assumi=
ng write-enable
[=1B[0;32m  OK  =1B[0m] Reached target System Initialization.
[=1B[0;32m  OK  =1B[0m] Started Daily apt activities.
[    9.605544] mmc1: new high speed SDHC card at address aaaa
[=1B[0;32m  OK  =1B[0m] Listening on D-Bus System Message Bus Socket.
[=1B[0;32m  OK  =1B[0m] Reached target Sockets.
[    9.626848] mmcblk1: mmc1:aaaa SS32G 29.7 GiB=20
[=1B[0;32m  OK  =1B[0m] Started Daily Cleanup of Temporary Directories.
[    9.644751]  mmcblk1: p1
[=1B[0;32m  OK  =1B[0m] Reached target Timers.
[=1B[0;32m  OK  =1B[0m] Reached target Basic System.
[=1B[0;32m  OK  =1B[0m] Started Regular background program processing da[  =
  9.682652] drm drm: fb0:  frame buffer device
emon.
[    9.698871] [drm] Initialized tegra 0.0.0 20120330 on minor 0
         Starting System Logging Service...
         Starting Login Service...
[=1B[0;32m  OK  =1B[0m] Started D-Bus System Message Bus.
[=1B[0;32m  OK  =1B[0m] Started System Logging Service.
[=1B[0;32m  OK  =1B[0m] Started Raise network interfaces.
[=1B[0;32m  OK  =1B[0m] Started Login Service.
[=1B[0;32m  OK  =1B[0m] Reached target Network.
         Starting Permit User Sessions...
         Starting OpenBSD Secure Shell server...
[=1B[0;32m  OK  =1B[0m] Started Permit User Sessions.
[=1B[0;32m  OK  =1B[0m] Started Getty on tty1.
[=1B[0;32m  OK  =1B[0m] Started Serial Getty on ttyS0.
[=1B[0;32m  OK  =1B[0m] Reached target Login Prompts.
[=1B[0;32m  OK  =1B[0m] Started OpenBSD Secure Shell server.
[=1B[0;32m  OK  =1B[0m] Reached target Multi-User System.
[=1B[0;32m  OK  =1B[0m] Reached target Graphical Interface.
         Starting Update UTMP about System Runlevel Changes...
[=1B[0;32m  OK  =1B[0m] Started Update UTMP about System Runlevel Changes.
=0D
Debian GNU/Linux stretch/sid tx1 ttyS0

tx1 login:=20

--7JfCtLOvnd9MIVvH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=error2
Content-Transfer-Encoding: quoted-printable

Starting kernel ...

[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] Linux version 4.8.0-rc3-arm64 (debian-kernel-0aAXYlwwYIKpJHnUorBY+A@public.gmane.org=
g) (gcc version 5.4.1 20160803 (Debian 5.4.1-1) ) #1 SMP Debian 4.8~rc3-1~e=
xp1 (2016-08-28)
[    0.000000] Boot CPU: AArch64 Processor [411fd071]
[    0.000000] efi: Getting EFI parameters from FDT:
[    0.000000] efi: UEFI not found.
[    0.000000] /cpus/cpu@1: missing enable-method property
[    0.000000] /cpus/cpu@2: missing enable-method property
[    0.000000] /cpus/cpu@3: missing enable-method property
[    0.000000] percpu: Embedded 22 pages/cpu @ffffffc0fff78000 s49176 r8192=
 d32744 u90112
[    0.000000] Detected PIPT I-cache on CPU0
[    0.000000] CPU features: enabling workaround for ARM erratum 832075
[    0.000000] Built 1 zonelists in Zone order, mobility grouping on.  Tota=
l pages: 903168
[    0.000000] Kernel command line: console=3DttyS0,115200n8
[    0.000000] PID hash table entries: 4096 (order: 3, 32768 bytes)
[    0.000000] Dentry cache hash table entries: 524288 (order: 10, 4194304 =
bytes)
[    0.000000] Inode-cache hash table entries: 262144 (order: 9, 2097152 by=
tes)
[    0.000000] software IO TLB [mem 0xdbfff000-0xdffff000] (64MB) mapped at=
 [ffffffc05bfff000-ffffffc05fffefff]
[    0.000000] Memory: 3503008K/3670016K available (6140K kernel code, 1023=
K rwdata, 1928K rodata, 3072K init, 611K bss, 167008K reserved, 0K cma-rese=
rved)
[    0.000000] Virtual kernel memory layout:
[    0.000000]     modules : 0xffffff8000000000 - 0xffffff8008000000   (   =
128 MB)
[    0.000000]     vmalloc : 0xffffff8008000000 - 0xffffffbebfff0000   (   =
250 GB)
[    0.000000]       .text : 0xffffff8008080000 - 0xffffff8008680000   (  6=
144 KB)
[    0.000000]     .rodata : 0xffffff8008680000 - 0xffffff8008870000   (  1=
984 KB)
[    0.000000]       .init : 0xffffff8008870000 - 0xffffff8008b70000   (  3=
072 KB)
[    0.000000]       .data : 0xffffff8008b70000 - 0xffffff8008c6fe00   (  1=
024 KB)
[    0.000000]        .bss : 0xffffff8008c6fe00 - 0xffffff8008d08dbc   (   =
612 KB)
[    0.000000]     fixed   : 0xffffffbefe7fd000 - 0xffffffbefec00000   (  4=
108 KB)
[    0.000000]     PCI I/O : 0xffffffbefee00000 - 0xffffffbeffe00000   (   =
 16 MB)
[    0.000000]     vmemmap : 0xffffffbf00000000 - 0xffffffc000000000   (   =
  4 GB maximum)
[    0.000000]               0xffffffbf00000000 - 0xffffffbf04000000   (   =
 64 MB actual)
[    0.000000]     memory  : 0xffffffc000000000 - 0xffffffc100000000   (  4=
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
[    0.000004] sched_clock: 56 bits at 19MHz, resolution 52ns, wraps every =
4398046511078ns
[    0.000283] Console: colour dummy device 80x25
[    0.000306] Calibrating delay loop (skipped), value calculated using tim=
er frequency.. 38.40 BogoMIPS (lpj=3D76800)
[    0.000320] pid_max: default: 32768 minimum: 301
[    0.000441] Security Framework initialized
[    0.000452] Yama: disabled by default; enable with sysctl kernel.yama.*
[    0.000472] AppArmor: AppArmor disabled by boot time parameter
[    0.000515] Mount-cache hash table entries: 8192 (order: 4, 65536 bytes)
[    0.000526] Mountpoint-cache hash table entries: 8192 (order: 4, 65536 b=
ytes)
[    0.001342] ftrace: allocating 22108 entries in 87 pages
[    0.048077] ASID allocator initialised with 65536 entries
[    0.050081] Speedo Revision 4
[    0.050107] Tegra Revision: A02 SKU: 23 CPU Process: 0 SoC Process: -22
[    0.050762] EFI services will not be available.
[    0.050935] Brought up 1 CPUs
[    0.050943] SMP: Total of 1 processors activated.
[    0.050956] CPU features: detected feature: 32-bit EL0 Support
[    0.050968] CPU: All CPU(s) started at EL2
[    0.050984] alternatives: patching kernel code
[    0.052310] devtmpfs: initialized
[    0.065507] DMI not present or invalid.
[    0.065733] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xfffffff=
f, max_idle_ns: 7645041785100000 ns
[    0.065831] pinctrl core: initialized pinctrl subsystem
[    0.066926] NET: Registered protocol family 16
[    0.067678] vdso: 2 pages (1 code @ ffffff8008686000, 1 data @ ffffff800=
8b75000)
[    0.067697] hw-breakpoint: found 6 breakpoint and 4 watchpoint registers.
[    0.067842] DMA: preallocated 256 KiB pool for atomic allocations
[    0.067972] Serial: AMBA PL011 UART driver
[    0.075457] tegra-mc 70019000.memory-controller: no memory timings for R=
AM code 0 registered
[    0.082039] HugeTLB registered 2 MB page size, pre-allocated 0 pages
[    0.083132] vgaarb: loaded
[    0.083347] dmi: Firmware registration failed.
[    0.084113] clocksource: Switched to clocksource arch_sys_counter
[    0.111516] VFS: Disk quotas dquot_6.6.0
[    0.111581] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 byte=
s)
[    0.120052] NET: Registered protocol family 2
[    0.120583] TCP established hash table entries: 32768 (order: 6, 262144 =
bytes)
[    0.120792] TCP bind hash table entries: 32768 (order: 7, 524288 bytes)
[    0.121056] TCP: Hash tables configured (established 32768 bind 32768)
[    0.121124] UDP hash table entries: 2048 (order: 4, 65536 bytes)
[    0.121168] UDP-Lite hash table entries: 2048 (order: 4, 65536 bytes)
[    0.121347] NET: Registered protocol family 1
[    0.121555] Unpacking initramfs...
[    1.203084] Freeing initrd memory: 15892K (ffffffc002100000 - ffffffc003=
085000)
[    1.204696] futex hash table entries: 256 (order: 3, 32768 bytes)
[    1.204766] audit: initializing netlink subsys (disabled)
[    1.204826] audit: type=3D2000 audit(1.171:1): initialized
[    1.205469] workingset: timestamp_bits=3D46 max_order=3D20 bucket_order=
=3D0
[    1.205530] zbud: loaded
[    1.207103] Block layer SCSI generic (bsg) driver version 0.4 loaded (ma=
jor 251)
[    1.207196] io scheduler noop registered
[    1.207205] io scheduler deadline registered
[    1.207234] io scheduler cfq registered (default)
[    1.217180] tegra-apbdma 60020000.dma: Tegra20 APB DMA driver register 3=
2 channels
[    1.217680] tegra-pmc 7000e400.pmc: i2c-thermtrip node not found, emerge=
ncy thermal reset disabled.
[    1.217966] Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
[    1.219432] console [ttyS0] disabled
[    1.219508] 70006000.serial: ttyS0 at MMIO 0x70006000 (irq =3D 314, base=
_baud =3D 25500000) is a Tegra
[    1.852303] console [ttyS0] enabled
[    1.856167] Serial: AMBA driver
[    1.859434] msm_serial: driver initialized
[    1.863678] Unable to detect cache hierarchy from DT for CPU 0
[    1.869915] mousedev: PS/2 mouse device common for all mice
[    1.876189] tegra_rtc 7000e000.rtc: rtc core: registered 7000e000.rtc as=
 rtc1
[    1.883388] tegra_rtc 7000e000.rtc: Tegra internal Real Time Clock
[    1.890387] ledtrig-cpu: registered to indicate activity on CPUs
[    1.896396] dmi-sysfs: dmi entry is absent.
[    1.901114] NET: Registered protocol family 10
[    1.906186] mip6: Mobile IPv6
[    1.909183] NET: Registered protocol family 17
[    1.913635] mpls_gso: MPLS GSO support
[    1.917928] registered taskstats version 1
[    1.922085] zswap: loaded using pool lzo/zbud
[    1.926765] hctosys: unable to open rtc device (rtc0)
[    1.941695] Freeing unused kernel memory: 3072K (ffffffc000870000 - ffff=
ffc000b70000)
Loading, please wait...
starting version 231
[    2.001583] random: systemd-udevd: uninitialized urandom read (16 bytes =
read)
[    2.009513] random: udevadm: uninitialized urandom read (16 bytes read)
[    2.016510] random: systemd-udevd: uninitialized urandom read (16 bytes =
read)
[    2.023824] random: udevadm: uninitialized urandom read (16 bytes read)
[    2.030530] random: systemd-udevd: uninitialized urandom read (16 bytes =
read)
[    2.038309] random: udevadm: uninitialized urandom read (16 bytes read)
[    2.047795] random: udevadm: uninitialized urandom read (16 bytes read)
[    2.054746] random: udevadm: uninitialized urandom read (16 bytes read)
[    2.061720] random: udevadm: uninitialized urandom read (16 bytes read)
[    2.068636] random: udevadm: uninitialized urandom read (16 bytes read)
[    2.405578] sdhci: Secure Digital Host Controller Interface driver
[    2.411782] sdhci: Copyright(c) Pierre Ossman
[    2.442248] usb2-0 supply vbus not found, using dummy regulator
[    2.454574] sdhci-pltfm: SDHCI platform and OF driver helper
[    2.487878] tegra-xusb-padctl 7009f000.padctl: failed to setup XUSB port=
s: -517
[    2.504101] usbcore: registered new interface driver usbfs
[    2.564289] sdhci-tegra 700b0000.sdhci: Got CD GPIO
[    2.569770] usb2-0 supply vbus not found, using dummy regulator
[    2.596285] mmc0: Unknown controller version (3). You may experience pro=
blems.
[    2.603640] usbcore: registered new interface driver hub
[    2.620657] tegra-xusb-padctl 7009f000.padctl: failed to setup XUSB port=
s: -517
[    2.644272] usbcore: registered new device driver usb
[    2.720979] mmc0: SDHCI controller on 700b0600.sdhci [700b0600.sdhci] us=
ing ADMA 64-bit
[    2.790476] sdhci-tegra 700b0000.sdhci: Got CD GPIO
[    2.802644] usb2-0 supply vbus not found, using dummy regulator
[    2.837479] mmc0: new high speed MMC card at address 0001
[    2.884334] tegra-xusb-padctl 7009f000.padctl: failed to setup XUSB port=
s: -517
[    2.898375] mmcblk0: mmc0:0001 016G32 14.7 GiB=20
[    2.944081] mmcblk0boot0: mmc0:0001 016G32 partition 1 4.00 MiB
[    3.000232] mmcblk0boot1: mmc0:0001 016G32 partition 2 4.00 MiB
[    3.059576] mmcblk0rpmb: mmc0:0001 016G32 partition 3 4.00 MiB
[    3.101285]  mmcblk0: p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11 p12 p13 p14 p15=
 p16 p17 p18
[    3.191062] sdhci-tegra 700b0000.sdhci: Got CD GPIO
[    3.223363] usb2-0 supply vbus not found, using dummy regulator
[    3.268601] tegra-xusb-padctl 7009f000.padctl: failed to setup XUSB port=
s: -517
[    3.534861] random: fast init done
Begin: Loading essential drivers ... done.
Begin: Running /scripts/init-premount ... done.
Begin: Mounting root file system ... Begin: Running /scripts/local-top ... =
done.
Begin: Running /scripts/local-premount ... done.
Begin: Will now check root file system ... fsck from util-linux 2.28.1
[/sbin/fsck.ext2 (1) -- /dev/mmcblk0p1] fsck.ext2 -a -C0 /dev/mmcblk0p1=20
/dev/mmcblk0p1: clean, 30662/917504 files, 297754/3670016 blocks
done.
[    3.958897] EXT4-fs (mmcblk0p1): mounting ext2 file system using the ext=
4 subsystem
[    3.973192] EXT4-fs (mmcblk0p1): mounted filesystem without journal. Opt=
s: (null)
done.
Begin: Running /scripts/local-bottom ... done.
Begin: Running /scripts/init-bottom ... done.
[    4.295261] systemd[1]: System time before build time, advancing clock.
[    4.356653] systemd[1]: systemd 231 running in system mode. (+PAM +AUDIT=
 +SELINUX +IMA +APPARMOR +SMACK +SYSVINIT +UTMP +LIBCRYPTSETUP +GCRYPT +GNU=
TLS +ACL +XZ -LZ4 +SECCOMP +BLKID +ELFUTILS +KMOD +IDN)
[    4.375122] systemd[1]: Detected architecture arm64.

Welcome to =1B[1mDebian GNU/Linux stretch/sid=1B[0m!

[    4.397149] systemd[1]: Set hostname to <tx1>.
[    4.626282] systemd[1]: Started Forward Password Requests to Wall Direct=
ory Watch.
[=1B[0;32m  OK  =1B[0m] Started Forward Password Requests to Wall Directory=
 Watch.
[    4.648240] systemd[1]: Reached target Encrypted Volumes.
[=1B[0;32m  OK  =1B[0m] Reached target Encrypted Volumes.
[    4.664473] systemd[1]: Listening on Journal Audit Socket.
[=1B[0;32m  OK  =1B[0m] Listening on Journal Audit Socket.
[    4.680217] systemd[1]: Reached target Remote File Systems.
[=1B[0;32m  OK  =1B[0m] Reached target Remote File Systems.
[    4.696270] systemd[1]: Listening on fsck to fsckd communication Socket.
[=1B[0;32m  OK  =1B[0m] Listening on fsck to fsckd communication Socket.
[    4.716311] systemd[1]: Listening on Journal Socket (/dev/log).
[=1B[0;32m  OK  =1B[0m] Listening on Journal Socket (/dev/log).
[    4.736360] systemd[1]: Started Dispatch Password Requests to Console Di=
rectory Watch.
[=1B[0;32m  OK  =1B[0m] Started Dispatch Password Requests to Console Direc=
tory Watch.
[=1B[0;32m  OK  =1B[0m] Created slice User and Session Slice.
[=1B[0;32m  OK  =1B[0m] Listening on Syslog Socket.
[=1B[0;32m  OK  =1B[0m] Listening on udev Kernel Socket.
[=1B[0;32m  OK  =1B[0m] Listening on /dev/initctl Compatibility Named Pipe.
[=1B[0;32m  OK  =1B[0m] Reached target Swap.
[=1B[0;32m  OK  =1B[0m] Reached target Paths.
[=1B[0;32m  OK  =1B[0m] Listening on Journal Socket.
[=1B[0;32m  OK  =1B[0m] Created slice System Slice.
         Starting Load Kernel Modules...
[=1B[0;32m  OK  =1B[0m] Created slice system-getty.slice.
         Starting Create list of required st... nodes for the current kerne=
l...
         Starting Remount Root and Kernel File Systems...
[=1B[0;32m  OK  =1B[0m] Created slice system-serial\x2dgetty.slice.
         Mounting Debug File System...
[=1B[0;32m  OK  =1B[0m] Reached target Slices.
         Mounting POSIX Message Q[    4.954676] EXT4-fs (mmcblk0p1): re-mou=
nted. Opts: errors=3Dremount-ro
ueue File System...
         Starting Journal Service...
         Mounting Huge Pages File System...
[=1B[0;32m  OK  =1B[0m] Listening on udev Control Socket.
[=1B[0;32m  OK  =1B[0m] Set up automount Arbitrary Executab...ats File Syst=
em Automount Point.
[=1B[0;32m  OK  =1B[0m] Mounted Debug File System.
[=1B[0;32m  OK  =1B[0m] Mounted Huge Pages File System.
[=1B[0;32m  OK  =1B[0m] Mounted POSIX Message Queue File System.
[=1B[0;32m  OK  =1B[0m] Started Journal Service.
[=1B[0;32m  OK  =1B[0m] Started Load Kernel Modules.
[=1B[0;32m  OK  =1B[0m] Started Create list of required sta...ce nodes for =
the current kernel.
[=1B[0;32m  OK  =1B[0m] Started Remount Root and Kernel File Systems.
         Starting Load/Save Random Seed...
         Starting udev Coldplug all Devices...
         Starting Create Static Device Nodes in /dev...
         Starting Apply Kernel Variables...
         Starting Flush Journal to Persistent Storage...
[=1B[0;32m  OK  =1B[0m] Started Load/Save Random Seed.
[=1B[0;32m  OK  =1B[0m] Started Apply Kernel Variables.
[=1B[0;32m  OK  =1B[0m] Started Create Static Device Nodes in /dev.
[    5.286578] systemd-journald[478]: Received request to flush runtime jou=
rnal from PID 1
         Starting udev Kernel Device Manager...
[=1B[0;32m  OK  =1B[0m] Reached target Local File Systems (Pre).
[=1B[0;32m  OK  =1B[0m] Reached target Local File Systems.
         Starting Raise network interfaces...
[=1B[0;32m  OK  =1B[0m] Started Flush Journal to Persistent Storage.
[=1B[0;32m  OK  =1B[0m] Started udev Kernel Device Manager.
         Starting Create Volatile Files and Directories...
[=1B[0;32m  OK  =1B[0m] Started Create Volatile Files and Directories.
         Starting Network Time Synchronization...
         Starting Update UTMP about System Boot/Shutdown...
[=1B[0;32m  OK  =1B[0m] Started Update UTMP about System Boot/Shutdown.
[    6.388455] sdhci-tegra 700b0000.sdhci: Got CD GPIO
[    6.457698] usb2-0 supply vbus not found, using dummy regulator
[    6.560533] tegra-xusb-padctl 7009f000.padctl: failed to setup XUSB port=
s: -517
[    6.688462] sdhci-tegra 700b0000.sdhci: Got CD GPIO
[    6.722546] [drm] Initialized drm 1.1.0 20060810
[    6.742125] usb2-0 supply vbus not found, using dummy regulator
[    6.837251] tegra-xusb-padctl 7009f000.padctl: failed to setup XUSB port=
s: -517
[    6.852415] tegra-i2c 7000c700.i2c: could not find pctldev for node /hos=
t1x@50000000/dpaux@54040000/pinmux-i2c, deferring probe
[    6.945849] sdhci-tegra 700b0000.sdhci: Got CD GPIO
[    6.973150] max77620 1-003c: PMIC Version OTP:0x35 and ES:0x8
[    6.988720] tegra-dsi 54300000.dsi: cannot get VDD supply
[    6.995575] usb2-0 supply vbus not found, using dummy regulator
[    7.025961] 54040000.dpaux supply vdd not found, using dummy regulator
[    7.044425] tegra-xusb-padctl 7009f000.padctl: failed to setup XUSB port=
s: -517
[    7.081356] i2c i2c-2: of_i2c: modalias failure on /host1x@50000000/dpau=
x@54040000/pinmux-aux
[    7.089916] i2c i2c-2: of_i2c: modalias failure on /host1x@50000000/dpau=
x@54040000/pinmux-i2c
[    7.098455] i2c i2c-2: of_i2c: modalias failure on /host1x@50000000/dpau=
x@54040000/pinmux-off
[    7.106980] i2c i2c-2: of_i2c: modalias failure on /host1x@50000000/dpau=
x@54040000/i2c-bus
[    7.132485] VDD_5V0_SYS: supplied by VDD_SYS_MUX
[    7.148914] RTL_5V: supplied by VDD_5V0_SYS
[    7.169811] USB_VBUS_EN1: supplied by VDD_5V0_SYS
[=1B[0;32m  OK  =1B[0m] Found device /dev/ttyS0.
[    7.192335] VDD_HDMI_5V0: supplied by VDD_5V0_SYS
[=1B[0;32m  OK  =1B[0m] Started udev Coldplug all Devices.
[    7.218949] max77686-rtc max77620-rtc: rtc core: registered max77620-rtc=
 as rtc0
[    7.233184] VDD_3V3_SYS: supplied by VDD_SYS_MUX
[=1B[0;32m  OK  =1B[0m] Started Network Time Synchronization.
[    7.264462] VDD_3V3_SD: supplied by VDD_3V3_SYS
[    7.302831] VDD_DIS_3V3_LCD: supplied by VDD_3V3_SYS
[    7.315552] tegra-sor 54580000.sor: failed to probe output: -517
[=1B[0;32m  OK  =1B[0m] Reached target System Initialization.
[    7.335137] sdhci-tegra 700b0000.sdhci: Got CD GPIO
[=1B[0;32m  OK  =1B[0m] Started Daily Cleanup of Temporary Directories.
[=1B[0;32m  OK  =1B[0m] Listening on D-Bus System Message Bus Socket.
[=1B[0;32m  OK  =1B[0m] Reached target Sockets.
[=1B[0;32m  OK  =1B[0m] Reached target Basic System.
[=1B[0;32m  OK  =1B[0m] Started Regular background program processing daemo=
n.
         Starting Login Service...
[    7.493055] tegra-dsi 54300000.dsi: cannot get VDD supply
[=1B[0;32m  OK  =1B[0m] Started D-Bus System Message Bus.
[    7.613294] usb2-0 supply vbus not found, using dummy regulator
[    7.737724] usb2-3 supply vbus not found, using dummy regulator
[    7.816482] usb3-0 supply vbus not found, using dummy regulator
[    7.904430] usb3-1 supply vbus not found, using dummy regulator
         Starting System Logging Service...
[=1B[0;32m  OK  =1B[0m] Reached target System Time Synchronized.
[=1B[0;32m  OK  =1B[0m] Started Daily apt activities.
[=1B[0;32m  OK  =1B[0m] Reached target Timers.
[    8.054336] alg: No test for __ecb-aes-ce (__driver-ecb-aes-ce)
[    8.060361]  usb3-0: tegra210_usb3_port_enable: failed to enable UPHY: -=
110
[    8.067361] tegra-xusb-padctl 7009f000.padctl: failed to enable port usb=
3-0: -110
[    8.212221] alg: No test for __ecb-aes-ce (cryptd(__driver-ecb-aes-ce))
[    8.332287]  usb3-1: tegra210_usb3_port_enable: failed to enable UPHY: -=
110
[    8.339286] tegra-xusb-padctl 7009f000.padctl: failed to enable port usb=
3-1: -110
[    8.346801] tegra-xusb-padctl 7009f000.padctl: failed to setup XUSB port=
s: -110
[=1B[0;32m  OK  =1B[0m] Started System Logging Service.
[    8.574874] tegra-xusb-padctl: probe of 7009f000.padctl failed with erro=
r -110
[    8.657601] list_add corruption. prev->next should be next (ffffff8008c0=
4e40), but was           (null). (prev=3Dffffffc0f69448f8).
[    8.669291] ------------[ cut here ]------------
[    8.673917] WARNING: CPU: 0 PID: 45 at /home/tbm/debian/a/linux-4.8~rc3/=
lib/list_debug.c:33 __list_add+0x94/0xe0
[    8.684071] Modules linked in: aes_ce_blk ablk_helper cryptd aes_ce_ciph=
er ghash_ce sha2_ce sha1_ce tegra_drm pwm_tegra i2c_tegra drm_kms_helper dr=
m syscopyarea sysfillrect sysimgblt fb_sys_fops cfbfillrect cfbimgblt cfbco=
pyarea fb host1x autofs4 ext4 crc16 jbd2 crc32c_generic fscrypto ecb mbcach=
e xhci_tegra xhci_hcd fixed sdhci_tegra usbcore sdhci_pltfm sdhci phy_tegra=
_xusb usb_common
[    8.718535]=20
[    8.720029] CPU: 0 PID: 45 Comm: kworker/u2:1 Not tainted 4.8.0-rc3-arm6=
4 #1 Debian 4.8~rc3-1~exp1
[    8.728970] Hardware name: NVIDIA Jetson TX1 Developer Kit (DT)
[    8.734888] Workqueue: deferwq deferred_probe_work_func
[    8.740112] task: ffffffc0fa679080 task.stack: ffffffc0fa704000
[    8.746022] PC is at __list_add+0x94/0xe0
[    8.750024] LR is at __list_add+0x94/0xe0
[    8.754027] pc : [<ffffff8008391534>] lr : [<ffffff8008391534>] pstate: =
60000145
[    8.761407] sp : ffffffc0fa707ce0
[    8.764714] x29: ffffffc0fa707ce0 x28: ffffffc0fa677c00=20
[    8.770032] x27: 0000000000000000 x26: ffffff8008c50572=20
[    8.775350] x25: 0000000000000001 x24: ffffff8008c03000=20
[    8.780667] x23: ffffff80087dd7a8 x22: ffffff8008c66ba0=20
[    8.785983] x21: ffffffc0f69448f8 x20: ffffff8008c04e40=20
[    8.791298] x19: ffffffc0fb3360c8 x18: 0000000000000006=20
[    8.796614] x17: 0000007fb0e84878 x16: ffffff8008284930=20
[    8.801929] x15: ffffff8008c79f9d x14: 3034653430633830=20
[    8.807244] x13: 3038666666666666 x12: 28207478656e2065=20
[    8.812559] x11: 6220646c756f6873 x10: 00000000000000e0=20
[    8.817875] x9 : 0000000000000085 x8 : 3434393666306366=20
[    8.823190] x7 : 66666666663d7665 x6 : ffffff8008c7a014=20
[    8.828506] x5 : 0000000000000000 x4 : 0000000000000000=20
[    8.833821] x3 : 0000000000000000 x2 : 0000000000040800=20
[    8.839136] x1 : 0000000000000000 x0 : 0000000000000075=20
[    8.844450]=20
[    8.845937] ---[ end trace 88c54cfbe4adcee1 ]---
[    8.850543] Call trace:
[    8.852986] Exception stack(0xffffffc0fa707af0 to 0xffffffc0fa707c20)
[    8.859415] 7ae0:                                   ffffffc0fb3360c8 000=
0008000000000
[    8.867232] 7b00: ffffffc0fa707ce0 ffffff8008391534 0000000060000145 fff=
fff80081007fc
[    8.875047] 7b20: ffffff8008c799e0 0000000008b97670 ffffffc0fa707bd0 fff=
fff8008100c28
[    8.882863] 7b40: ffffffc0fa707c30 ffffff80087bfe28 ffffffc0f69448f8 fff=
fff8008c66ba0
[    8.890679] 7b60: ffffff80087dd7a8 ffffff8008c03000 0000000000000001 fff=
fff8008c50572
[    8.898494] 7b80: 0000000000000000 ffffffc0fa677c00 ffffffc0fa679650 000=
0000000000000
[    8.906308] 7ba0: ffffff8008c7c3c0 0000000000040800 0000000000000075 000=
0000000000000
[    8.914124] 7bc0: 0000000000040800 0000000000000000 0000000000000000 000=
0000000000000
[    8.921938] 7be0: ffffff8008c7a014 66666666663d7665 3434393666306366 000=
0000000000085
[    8.929753] 7c00: 00000000000000e0 6220646c756f6873 28207478656e2065 303=
8666666666666
[    8.937570] [<ffffff8008391534>] __list_add+0x94/0xe0
[    8.942617] [<ffffff8008483a28>] device_pm_move_last+0x40/0x98
[    8.948441] [<ffffff8008471d00>] deferred_probe_work_func+0x80/0xe8
[    8.954700] [<ffffff80080bf20c>] process_one_work+0x14c/0x3f0
[    8.960435] [<ffffff80080bf50c>] worker_thread+0x5c/0x450
[    8.965826] [<ffffff80080c5f9c>] kthread+0xec/0x100
[    8.970697] [<ffffff8008083690>] ret_from_fork+0x10/0x40
[    9.173080] list_add corruption. prev->next should be next (ffffffc0fb1b=
b280), but was           (null). (prev=3Dffffffc0f6944858).
[    9.184788] ------------[ cut here ]------------
[    9.189412] WARNING: CPU: 0 PID: 686 at /home/tbm/debian/a/linux-4.8~rc3=
/lib/list_debug.c:33 __list_add+0x94/0xe0
[    9.199652] Modules linked in: lp855x_bl(+) aes_ce_blk ablk_helper crypt=
d aes_ce_cipher ghash_ce sha2_ce sha1_ce tegra_drm pwm_tegra i2c_tegra drm_=
kms_helper drm syscopyarea sysfillrect sysimgblt fb_sys_fops cfbfillrect cf=
bimgblt cfbcopyarea fb host1x autofs4 ext4 crc16 jbd2 crc32c_generic fscryp=
to ecb mbcache xhci_tegra xhci_hcd fixed sdhci_tegra usbcore sdhci_pltfm sd=
hci phy_tegra_xusb usb_common
[    9.235230]=20
[    9.236724] CPU: 0 PID: 686 Comm: systemd-udevd Tainted: G        W     =
  4.8.0-rc3-arm64 #1 Debian 4.8~rc3-1~exp1
[    9.247052] Hardware name: NVIDIA Jetson TX1 Developer Kit (DT)
[    9.252960] task: ffffffc0f69d4f80 task.stack: ffffffc0f68dc000
[    9.258870] PC is at __list_add+0x94/0xe0
[    9.262874] LR is at __list_add+0x94/0xe0
[    9.266876] pc : [<ffffff8008391534>] lr : [<ffffff8008391534>] pstate: =
60000145
[    9.274256] sp : ffffffc0f68dfa00
[    9.277562] x29: ffffffc0f68dfa00 x28: ffffff8000fed1d0=20
[    9.282881] x27: 0000000000000124 x26: ffffffc0f8eecb90=20
[    9.288197] x25: ffffffc0f88f4600 x24: ffffffc0f88f4610=20
[    9.293514] x23: 0000000000000025 x22: ffffff8000fed068=20
[    9.298829] x21: ffffffc0f6944858 x20: ffffffc0fb1bb280=20
[    9.304144] x19: ffffffc0f6a5cc38 x18: 0000000000000006=20
[    9.309460] x17: 0000007f89670ca8 x16: ffffff80080a8520=20
[    9.314775] x15: ffffff8008c79f9d x14: 7720747562202c29=20
[    9.320090] x13: 3038326262316266 x12: 3063666666666666=20
[    9.325405] x11: 28207478656e2065 x10: 0000000000000111=20
[    9.330721] x9 : 0000000000000085 x8 : 66666666663d7665=20
[    9.336036] x7 : 727028202e296c6c x6 : ffffff8008c7a014=20
[    9.341352] x5 : 0000000000000000 x4 : 0000000000000000=20
[    9.346667] x3 : 0000000000000000 x2 : 0000000000040800=20
[    9.351981] x1 : 0000000000000000 x0 : 0000000000000075=20
[    9.357295]=20
[    9.358781] ---[ end trace 88c54cfbe4adcee2 ]---
[    9.363388] Call trace:
[    9.365831] Exception stack(0xffffffc0f68df810 to 0xffffffc0f68df940)
[    9.372259] f800:                                   ffffffc0f6a5cc38 000=
0008000000000
[    9.380076] f820: ffffffc0f68dfa00 ffffff8008391534 0000000060000145 fff=
fff80081007fc
[    9.387892] f840: ffffff8008c799e0 0000000008b97670 ffffffc0f68df8f0 fff=
fff8008100c28
[    9.395707] f860: ffffffc0f68df950 ffffff80087bfe28 ffffffc0f6944858 fff=
fff8000fed068
[    9.403522] f880: 0000000000000025 ffffffc0f88f4610 ffffffc0f88f4600 fff=
fffc0f8eecb90
[    9.411337] f8a0: 0000000000000124 ffffff8000fed1d0 ffffff8008cf34c8 000=
0000000000000
[    9.419152] f8c0: ffffff8008c7c3c0 0000000000040800 0000000000000075 000=
0000000000000
[    9.426967] f8e0: 0000000000040800 0000000000000000 0000000000000000 000=
0000000000000
[    9.434782] f900: ffffff8008c7a014 727028202e296c6c 66666666663d7665 000=
0000000000085
[    9.442597] f920: 0000000000000111 28207478656e2065 3063666666666666 303=
8326262316266
[    9.450414] [<ffffff8008391534>] __list_add+0x94/0xe0
[    9.455462] [<ffffff800846e44c>] devices_kset_move_last+0x54/0xa8
[    9.461547] [<ffffff8008472b50>] driver_probe_device+0x278/0x440
[    9.467544] [<ffffff8008472e3c>] __driver_attach+0x124/0x128
[    9.473194] [<ffffff80084700c0>] bus_for_each_dev+0x88/0xe8
[    9.478758] [<ffffff8008472120>] driver_attach+0x30/0x40
[    9.484061] [<ffffff8008471b28>] bus_add_driver+0x250/0x2c0
[    9.489624] [<ffffff8008473998>] driver_register+0x68/0x100
[    9.495188] [<ffffff80084d74b0>] i2c_register_driver+0x40/0xb0
[    9.501020] [<ffffff8000ff0018>] lp855x_driver_init+0x18/0x1000 [lp855x_=
bl]
[    9.507972] [<ffffff8008083b4c>] do_one_initcall+0x5c/0x170
[    9.513536] [<ffffff80081b22e0>] do_init_module+0x68/0x1e0
[    9.519014] [<ffffff8008136d10>] load_module+0x1fc0/0x25c8
[    9.524491] [<ffffff80081375f0>] SyS_finit_module+0x108/0x120
[    9.530226] [<ffffff80080836f0>] el0_svc_naked+0x24/0x28
[    9.703334] VDD_LCD_1V8_DIS: supplied by VDD_1V8
[    9.780456] AVDD_DSI_CSI_1V2: supplied by AVDD_SYS_1V2
[    9.879604] VDD_CAM_HV: Bringing 3100000uV into 2800000-2800000uV
[    9.945296] VDD_RTC: Bringing 1000000uV into 850000-850000uV
[    9.968799] VDD_TS_HV: Bringing 3100000uV into 3300000-3300000uV
[   10.036719] VDD_TS_1V8: Bringing 2800000uV into 1800000-1800000uV
[   10.216428] systemd[1]: apt-daily.timer: Adding 10h 52min 17.000370s ran=
dom time.
[=1B[0;32m  OK  =1B[0m] Started Raise network interfaces.
[   10.266531] 0-002c supply power not found, using dummy regulator
[   10.273538] lp855x 0-002c: failed to read 0x00
[   10.278024] lp855x 0-002c: pre init device err: -121
[   10.283005] lp855x 0-002c: device config err: -121
[   10.288198] sdhci-tegra 700b0000.sdhci: Got CD GPIO
[=1B[0;32m  OK  =1B[0m] Reached target Network.
         Starting Permit User Sessions...
[   10.343487] mmc1: Unknown controller version (3). You may experience pro=
blems.
         Starting OpenBSD Secure Shell server...
[   10.378771] lp855x: probe of 0-002c failed with error -121
[   10.452774] mmc1: SDHCI controller on 700b0000.sdhci [700b0000.sdhci] us=
ing ADMA 64-bit
[   10.496037] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[   10.502691] [drm] No driver support for vblank timestamp query.
[   10.518983] mmc1: host does not support reading read-only switch, assumi=
ng write-enable
[   10.574747] mmc1: new high speed SDHC card at address aaaa
[   10.611261] mmcblk1: mmc1:aaaa SS32G 29.7 GiB=20
[   10.638058]  mmcblk1: p1
[=1B[0;32m  OK  =1B[0m] Started OpenBSD Secure Shell server.
[=1B[0;32m  OK  =1B[0m] Started Permit User Sessions.
[   10.678545] drm drm: fb0:  frame buffer device
[=1B[0;32m  OK  =1B[0m] Started Login Service.
[   10.694918] [drm] Initialized tegra 0.0.0 20120330 on minor 0
[=1B[0;32m  OK  =1B[0m] Started Getty on[   10.706658] list_del corruption.=
 prev->next should be ffffffc0fb3360c8, but was           (null)
 tty1.
[   10.718371] ------------[ cut here ]------------
[   10.723622] WARNING: CPU: 0 PID: 45 at /home/tbm/debian/a/linux-4.8~rc3/=
lib/list_debug.c:59 __list_del_entry+0xa8/0xc8
[   10.734296] Modules linked in: panel_simple(+) max77620_regulator lp855x=
_bl aes_ce_blk ablk_helper cryptd aes_ce_cipher ghash_ce sha2_ce sha1_ce te=
gra_drm pwm_tegra i2c_tegra drm_kms_helper drm syscopyarea sysfillrect sysi=
mgblt fb_sys_fops cfbfillrect cfbimgblt cfbcopyarea fb host1x autofs4 ext4 =
crc16 jbd2 crc32c_generic fscrypto ecb mbcache xhci_tegra xhci_hcd fixed sd=
hci_tegra usbcore sdhci_pltfm sdhci phy_tegra_xusb usb_common
[   10.772682]=20
[   10.774176] CPU: 0 PID: 45 Comm: kworker/u2:1 Tainted: G        W       =
4.8.0-rc3-arm64 #1 Debian 4.8~rc3-1~exp1
[   10.784331] Hardware name: NVIDIA Jetson TX1 Developer Kit (DT)
[   10.790247] Workqueue: deferwq deferred_probe_work_func
[   10.795470] task: ffffffc0fa679080 task.stack: ffffffc0fa704000
[   10.801381] PC is at __list_del_entry+0xa8/0xc8
[   10.805903] LR is at __list_del_entry+0xa8/0xc8
[   10.810424] pc : [<ffffff8008391628>] lr : [<ffffff8008391628>] pstate: =
60000145
[   10.817804] sp : ffffffc0fa707d00
[   10.821110] x29: ffffffc0fa707d00 x28: ffffffc0fa677c00=20
[   10.826428] x27: 0000000000000000 x26: ffffff8008c50572=20
[   10.831745] x25: 0000000000000001 x24: ffffff8008c03000=20
[   10.837062] x23: ffffff80087dd7a8 x22: ffffff8008c66ba0=20
[   10.842378] x21: ffffffc0fb336010 x20: ffffff8008c03dc8=20
[   10.847693] x19: ffffffc0fb3360c8 x18: 0000000000000006=20
[   10.853008] x17: 0000007fb0f149a0 x16: ffffff8008234838=20
[   10.858323] x15: ffffff8008c79f9d x14: 2020202020736177=20
[   10.863638] x13: 20747562202c3863 x12: 3036333362663063=20
[   10.868953] x11: 6666666666662065 x10: 0000000000000160=20
[   10.874269] x9 : 0000000000000064 x8 : 657270202e6e6f69=20
[   10.879584] x7 : 74707572726f6320 x6 : ffffff8008c79ff3=20
[   10.884899] x5 : 0000000000000000 x4 : 0000000000000000=20
[   10.890214] x3 : 0000000000000000 x2 : 0000000000040800=20
[   10.895529] x1 : 0000000000000000 x0 : 0000000000000054=20
[   10.900843]=20
[   10.902330] ---[ end trace 88c54cfbe4adcee3 ]---
[   10.906937] Call trace:
[   10.909380] Exception stack(0xffffffc0fa707b10 to 0xffffffc0fa707c40)
[   10.915808] 7b00:                                   ffffffc0fb3360c8 000=
0008000000000
[   10.923624] 7b20: ffffffc0fa707d00 ffffff8008391628 0000000060000145 fff=
fff80081007fc
[   10.931440] 7b40: ffffff8008c799e0 0000000008b97670 ffffffc0fa707bf0 fff=
fff8008100c28
[   10.939255] 7b60: ffffffc0fa707c50 ffffff80087bff18 ffffffc0fb336010 fff=
fff8008c66ba0
[   10.947070] 7b80: ffffff80087dd7a8 ffffff8008c03000 0000000000000001 fff=
fff8008c50572
[   10.954885] 7ba0: 0000000000000000 ffffffc0fa677c00 ffffffc0f68c8480 000=
0000000000000
[   10.962700] 7bc0: ffffff8008c7c3c0 0000000000040800 0000000000000054 000=
0000000000000
[   10.970514] 7be0: 0000000000040800 0000000000000000 0000000000000000 000=
0000000000000
[   10.978329] 7c00: ffffff8008c79ff3 74707572726f6320 657270202e6e6f69 000=
0000000000064
[   10.986144] 7c20: 0000000000000160 6666666666662065 3036333362663063 207=
47562202c3863
[   10.993960] [<ffffff8008391628>] __list_del_entry+0xa8/0xc8
[   10.999527] [<ffffff8008483a10>] device_pm_move_last+0x28/0x98
[   11.005350] [<ffffff8008471d00>] deferred_probe_work_func+0x80/0xe8
[   11.011608] [<ffffff80080bf20c>] process_one_work+0x14c/0x3f0
[   11.017343] [<ffffff80080bf50c>] worker_thread+0x5c/0x450
[   11.022733] [<ffffff80080c5f9c>] kthread+0xec/0x100
[   11.027604] [<ffffff8008083690>] ret_from_fork+0x10/0x40
[=1B[0;32m  OK  =1B[0m] Started Serial Getty on ttyS0.
[=1B[0;32m  OK  =1B[0m] Reached target Login Prompts.
[=1B[0;32m  OK  =1B[0m] Reached target Multi-User System.
[=1B[0;32m  OK  =1B[0m] Reached target Graphical Interface.
         Starting Update UTMP about System Runlevel Changes...
[=1B[0;32m  OK  =1B[0m] Started Update UTMP about System Runlevel Changes.
=0D
Debian GNU/Linux stretch/sid tx1 ttyS0

--7JfCtLOvnd9MIVvH--
