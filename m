From: Marcel Ziswiler <marcel-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org>
Subject: Re: Oops on Tegra30 with CPU Process: 1
Date: Mon, 21 Apr 2014 01:24:06 +0200
Message-ID: <53545716.8040506@ziswiler.com>
References: <53440884.7010304@ziswiler.com> <534C3422.1050004@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <534C3422.1050004-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 04/14/2014 09:16 PM, Stephen Warren wrote:
> On 04/08/2014 08:32 AM, Marcel Ziswiler wrote:
>> Hi there
>>
>> I have the following Toradex Colibri T30 modules with different ATE =
prog
>> versions, Tegra30 SKUs as well as CPU process numbers:
>>
>> Colibri T30 V1.1B (working)
>>
>> [    0.000000] fuse_speedo_calib: ATE prog ver 3.6
>> [    0.000000] Tegra30: CPU Speedo ID 2, Soc Speedo ID 2
>> [    0.000000] Tegra Revision: A03 SKU: 129 CPU Process: 2 Core Proc=
ess: 0
>>
>> Colibri T30 V1.1C (below crash)
>>
>> [    0.000000] fuse_speedo_calib: ATE prog ver 3.7
>> [    0.000000] Tegra30: CPU Speedo ID 2, Soc Speedo ID 2
>> [    0.000000] Tegra Revision: A03 SKU: 129 CPU Process: 1 Core Proc=
ess: 0
>
> I /think/ that if you run the following command in U-Boot before boot=
ing
> the kernel:
>
> i2c mw 0x60 3 0x46
>
> ... that may solve the problem (assuming the kernel doesn't explicitl=
y
> reprogram the regulator for VDD CORE during boot).
>
> (you might need to adjust "3" to match whatever I2C bus the TPS62631 =
is
> attached to; "i2c dev N; i2c probe" for various N might help find it)=
=2E
>
> That command changes the TPS62361's regulator output from 1.16V (HW
> default I believe) to 1.2V, which I believe is the necessary minimum
> voltage for a 1.0V VDD_CPU, which is what at least mainline U-Boot se=
ts up.
>
> Let me know if that works for you.
>
> BTW, I'd be interested to know where exactly the crash you quoted occ=
urs
> within the overall boot process.

=46ull crash log as follows:

U-Boot 2011.06-00004-gccd521c (Mar 17 2014 - 09:48:16)

TEGRA3
DRAM:  1 GiB
MMC:   Tegra2 SD/MMC: 0, Tegra2 SD/MMC: 1
mmc_reset: power control =3D 0F, host control =3D 00
Board: Toradex Colibri T30
Net:   Net Initialization Skipped
No ethernet found.
Hit any key to stop autoboot:  0
Colibri T30 #
Colibri T30 # enterrcm
Entering RCM...

U-Boot SPL 2014.01-g2e87078 (Mar 21 2014 - 16:35:31)


U-Boot 2014.01-g2e87078 (Mar 21 2014 - 16:35:31)

TEGRA30
Board: Toradex Colibri T30
I2C:   ready
DRAM:  1 GiB
MMC:   Tegra SD/MMC: 0, Tegra SD/MMC: 1
*** Warning - bad CRC, using default environment

In:    serial
Out:   serial
Err:   serial
Net:   Net Initialization Skipped
No ethernet found.
Hit any key to stop autoboot:  0
Tegra30 (Colibri T30) # usb start
(Re)start USB...
USB0:   USB EHCI 1.00
scanning bus 0 for devices... 2 USB Device(s) found
USB1:   USB EHCI 1.00
scanning bus 1 for devices... 2 USB Device(s) found
USB2:   USB EHCI 1.00
scanning bus 2 for devices... 1 USB Device(s) found
        scanning usb for storage devices... 0 Storage Device(s) found
        scanning usb for ethernet devices...
Warning: asx0 using MAC address from net device
1 Ethernet Device(s) found
Tegra30 (Colibri T30) # dhcp
Waiting for Ethernet connection... done.
BOOTP broadcast 1
*** Unhandled DHCP Option in OFFER/ACK: 19
*** Unhandled DHCP Option in OFFER/ACK: 19
DHCP client bound to address 192.168.10.205
*** Warning: no boot file name; using 'C0A80ACD.img'
Using asx0 device
TFTP from server 192.168.10.1; our IP address is 192.168.10.205
=46ilename 'C0A80ACD.img'.
Load address: 0x80408000
Loading: *
TFTP error: 'File not found' (1)
Not retrying...
Tegra30 (Colibri T30) # tftpboot ${kernel_addr_r} zImage-3.14.0-tegra
Using asx0 device
TFTP from server 192.168.10.1; our IP address is 192.168.10.205
=46ilename 'zImage-3.14.0-tegra'.
Load address: 0x81000000
Loading: ##############################################################=
###
          #############################################################=
####
          #############################################################=
####
          #############################################################=
####
          #############################
          2.8 MiB/s
done
Bytes transferred =3D 4242232 (40bb38 hex)
Tegra30 (Colibri T30) # tftpboot ${fdt_addr_r} tegra30-colibri.dtb
Using asx0 device
TFTP from server 192.168.10.1; our IP address is 192.168.10.205
=46ilename 'tegra30-colibri.dtb'.
Load address: 0x82000000
Loading: ##
          2.3 MiB/s
done
Bytes transferred =3D 21543 (5427 hex)
Tegra30 (Colibri T30) # setenv bootargs 'root=3D/dev/mmcblk0p1 rw,noati=
me=20
rootfsty
pe=3Dext3 rootwait gpt gpt_sector=3D0xa001 console=3DttyS0,115200n8'
Tegra30 (Colibri T30) # bootz ${kernel_addr_r} - ${fdt_addr_r}
Kernel image @ 0x81000000 [ 0x000000 - 0x40bb38 ]
## Flattened Device Tree blob at 82000000
    Booting using the fdt blob at 0x82000000
    Loading Device Tree to 8fff7000, end 8ffff426 ... OK

Starting kernel ...

Uncompressing Linux... done, booting the kernel.
[    0.000000] Booting Linux on physical CPU 0x0
[    0.000000] Initializing cgroup subsys cpu
[    0.000000] Initializing cgroup subsys cpuacct
[    0.000000] Linux version 3.14.0-dirty (sumo@sumo-PORTEGE-R700) (gcc=
=20
version
4.7.2 20120910 (prerelease) (crosstool-NG linaro-1.13.1-2012.09-2012092=
1=20
- Linar
o GCC 2012.09) ) #1 SMP PREEMPT Tue Apr 1 10:26:28 CEST 2014
[    0.000000] CPU: ARMv7 Processor [412fc099] revision 9 (ARMv7),=20
cr=3D10c5387d
[    0.000000] CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing=20
instructio
n cache
[    0.000000] Machine model: Toradex Colibri T30
[    0.000000] cma: CMA: reserved 16 MiB at ae800000
[    0.000000] Memory policy: Data cache writealloc
[    0.000000] fuse_speedo_calib: ATE prog ver 3.7
[    0.000000] Tegra30: CPU Speedo ID 2, Soc Speedo ID 2
[    0.000000] Tegra Revision: A03 SKU: 129 CPU Process: 1 Core Process=
: 0
[    0.000000] L310 cache controller enabled
[    0.000000] l2x0: 8 ways, CACHE_ID 0x410000c7, AUX_CTRL 0x7e480001,=20
Cache siz
e: 1024 kB
[    0.000000] PERCPU: Embedded 8 pages/cpu @edfc2000 s9152 r8192 d1542=
4=20
u32768
[    0.000000] Built 1 zonelists in Zone order, mobility grouping on.=20
Total pag
es: 260624
[    0.000000] Kernel command line: root=3D/dev/mmcblk0p1 rw,noatime=20
rootfstype=3Dex
t3 rootwait gpt gpt_sector=3D0xa001 console=3DttyS0,115200n8
[    0.000000] PID hash table entries: 4096 (order: 2, 16384 bytes)
[    0.000000] Dentry cache hash table entries: 131072 (order: 7, 52428=
8=20
bytes)
[    0.000000] Inode-cache hash table entries: 65536 (order: 6, 262144=20
bytes)
[    0.000000] Memory: 1014284K/1048576K available (5768K kernel code,=20
318K rwda
ta, 1968K rodata, 248K init, 340K bss, 34292K reserved, 270336K highmem=
)
[    0.000000] Virtual kernel memory layout:
[    0.000000]     vector  : 0xffff0000 - 0xffff1000   (   4 kB)
[    0.000000]     fixmap  : 0xfff00000 - 0xfffe0000   ( 896 kB)
[    0.000000]     vmalloc : 0xf0000000 - 0xff000000   ( 240 MB)
[    0.000000]     lowmem  : 0xc0000000 - 0xef800000   ( 760 MB)
[    0.000000]     pkmap   : 0xbfe00000 - 0xc0000000   (   2 MB)
[    0.000000]     modules : 0xbf000000 - 0xbfe00000   (  14 MB)
[    0.000000]       .text : 0xc0008000 - 0xc0796408   (7738 kB)
[    0.000000]       .init : 0xc0797000 - 0xc07d53c0   ( 249 kB)
[    0.000000]       .data : 0xc07d6000 - 0xc08258a0   ( 319 kB)
[    0.000000]        .bss : 0xc08258ac - 0xc087ac58   ( 341 kB)
[    0.000000] Preemptible hierarchical RCU implementation.
[    0.000000] NR_IRQS:16 nr_irqs:16 16
[    0.000014] sched_clock: 32 bits at 1000kHz, resolution 1000ns, wrap=
s=20
every 2
147483648000ns
[    0.000576] Console: colour dummy device 80x30
[    0.000607] Calibrating delay loop... 2786.91 BogoMIPS (lpj=3D139345=
92)
[    0.059933] pid_max: default: 32768 minimum: 301
[    0.060294] Mount-cache hash table entries: 2048 (order: 1, 8192 byt=
es)
[    0.060301] Mountpoint-cache hash table entries: 2048 (order: 1, 819=
2=20
bytes)
[    0.070826] Initializing cgroup subsys debug
[    0.070843] Initializing cgroup subsys freezer
[    0.070901] CPU: Testing write buffer coherency: ok
[    0.071292] CPU0: thread -1, cpu 0, socket 0, mpidr 80000000
[    0.071353] Setting up static identity map for 0x805779c0 - 0x80577a=
58
[    0.131323] CPU1: Booted secondary processor
[    0.189998] CPU1: thread -1, cpu 1, socket 0, mpidr 80000001
[    0.211280] CPU2: Booted secondary processor
[    0.269997] CPU2: thread -1, cpu 2, socket 0, mpidr 80000002
[    0.291243] CPU3: Booted secondary processor
[    0.349997] CPU3: thread -1, cpu 3, socket 0, mpidr 80000003
[    0.350064] Brought up 4 CPUs
[    0.350080] SMP: Total of 4 processors activated.
[    0.350087] CPU: All CPU(s) started in SVC mode.
[    0.350982] devtmpfs: initialized
[    0.362125] VFP support v0.3: implementor 41 architecture 3 part 30=20
variant 9
  rev 4
[    0.362700] pinctrl core: initialized pinctrl subsystem
[    0.363324] regulator-dummy: no parameters
[    0.364601] NET: Registered protocol family 16
[    0.366941] DMA: preallocated 256 KiB pool for atomic coherent=20
allocations
[    0.368034] cpuidle: using governor ladder
[    0.368040] cpuidle: using governor menu
[    0.380237] No ATAGs?
[    0.380261] hw-breakpoint: found 5 (+1 reserved) breakpoint and 1=20
watchpoint
registers.
[    0.380268] hw-breakpoint: maximum watchpoint size is 4 bytes.
[    0.381253] tegra30-pinctrl 70000868.pinmux: invalid group=20
"uart2_rxd" for fu
nction "uartb"
[    0.381288] tegra30-pinctrl 70000868.pinmux: does not have pin group=
=20
uart2_rx
d
[    0.381294] tegra30-pinctrl 70000868.pinmux: could not map group=20
config for "
uart2_rxd"
[    0.381304] tegra30-pinctrl 70000868.pinmux: invalid group=20
"uart2_txd" for fu
nction "uartb"
[    0.381320] tegra30-pinctrl 70000868.pinmux: does not have pin group=
=20
uart2_tx
d
[    0.381325] tegra30-pinctrl 70000868.pinmux: could not map group=20
config for "
uart2_txd"
[    0.396102] bio: create slab <bio-0> at 0
[    0.397441] 3v3: 3300 mV
[    0.397792] 5v0: 5000 mV
[    0.398168] usb1_vbus: 5000 mV
[    0.398234] usb1_vbus: supplied by 5v0
[    0.398593] usb3_vbus: 5000 mV
[    0.398654] usb3_vbus: supplied by 5v0
[    0.399914] vgaarb: loaded
[    0.401015] SCSI subsystem initialized
[    0.401605] usbcore: registered new interface driver usbfs
[    0.401734] usbcore: registered new interface driver hub
[    0.401905] usbcore: registered new device driver usb
[    0.409999] vdd_1v8_gen: 1800 mV
[    0.410126] vdd_1v8_gen: supplied by 3v3
[    0.419990] vddio_ddr_1v35: 1350 mV
[    0.420085] vddio_ddr_1v35: supplied by 3v3
[    0.429992] vdd_cpu,vdd_sys: 1000 mV
[    0.439988] en_3v3: 3300 mV
[    0.440080] en_3v3: supplied by vdd_1v8_gen
[    0.449990] vdd_rtc: 1200 mV
[    0.450084] vdd_rtc: supplied by 3v3
[    0.459988] avdd_vdac: 2800 mV
[    0.460096] avdd_vdac: supplied by 3v3
[    0.461184] avdd_plle: 1100 mV
[    0.461273] avdd_plle: supplied by vdd_1v8_gen
[    0.469992] avdd_pll: 1200 mV
[    0.470100] avdd_pll: supplied by vdd_1v8_gen
[    0.479989] vdd_ddr_hs: 1000 mV
[    0.480080] vdd_ddr_hs: supplied by vdd_1v8_gen
[    0.481730] tps62362-vout: 900 <--> 1400 mV at 1200 mV
[    0.481979] Linux video capture interface: v2.00
[    0.482731] platform 7000f010.iommu: Driver tegra-smmu requests prob=
e=20
deferra
l
[    0.483050] Advanced Linux Sound Architecture Driver Initialized.
[    0.484144] Bluetooth: Core ver 2.18
[    0.484210] NET: Registered protocol family 31
[    0.484215] Bluetooth: HCI device and connection manager initialized
[    0.484232] Bluetooth: HCI socket layer initialized
[    0.484248] Bluetooth: L2CAP socket layer initialized
[    0.484285] Bluetooth: SCO socket layer initialized
[    0.484905] cfg80211: Calling CRDA to update world regulatory domain
[    0.485466] Switched to clocksource timer_us
[    0.502680] NET: Registered protocol family 2
[    0.503408] TCP established hash table entries: 8192 (order: 3, 3276=
8=20
bytes)
[    0.503474] TCP bind hash table entries: 8192 (order: 4, 65536 bytes=
)
[    0.503556] TCP: Hash tables configured (established 8192 bind 8192)
[    0.504071] TCP: reno registered
[    0.504084] UDP hash table entries: 512 (order: 2, 16384 bytes)
[    0.504148] UDP-Lite hash table entries: 512 (order: 2, 16384 bytes)
[    0.504533] NET: Registered protocol family 1
[    0.505189] RPC: Registered named UNIX socket transport module.
[    0.505195] RPC: Registered udp transport module.
[    0.505199] RPC: Registered tcp transport module.
[    0.505203] RPC: Registered tcp NFSv4.1 backchannel transport module=
=2E
[    0.506993] hw perfevents: enabled with ARMv7 Cortex-A9 PMU driver, =
7=20
counter
s available
[    0.509143] futex hash table entries: 1024 (order: 4, 65536 bytes)
[    0.510784] bounce pool size: 64 pages
[    0.511967] squashfs: version 4.0 (2009/01/31) Phillip Lougher
[    0.512665] msgmni has been set to 1485
[    0.513845] io scheduler noop registered (default)
[    0.522509] tegra-apbdma 6000a000.dma: Tegra20 APB DMA driver=20
register 32 cha
nnels
[    0.523201] Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
[    0.525872] 70006000.serial: ttyS0 at MMIO 0x70006000 (irq =3D 68,=20
base_baud =3D
25500000) is a Tegra
[    1.242845] console [ttyS0] enabled
[    1.247139] 70006040.serial: ttyTHS1 at MMIO 0x70006040 (irq =3D 69,=
=20
base_baud
=3D 0) is a TEGRA_UART
[    1.256767] 70006300.serial: ttyTHS3 at MMIO 0x70006300 (irq =3D 122=
,=20
base_baud
  =3D 0) is a TEGRA_UART
[    1.266376] [drm] Initialized drm 1.1.0 20060810
[    1.275130] [drm] Supports vblank timestamp caching Rev 2 (21.10.201=
3).
[    1.281781] [drm] No driver support for vblank timestamp query.
[    1.287745] host1x drm: No connectors reported connected with modes
[    1.294004] [drm] Cannot find any crtc or sizes - going 1024x768
[    1.315264] Console: switching to colour frame buffer device 128x48
[    1.327297] host1x drm: fb0:  frame buffer device
[    1.331987] host1x drm: registered panic notifier
[    1.336691] [drm] Initialized tegra 0.0.0 20120330 on minor 0
[    1.350281] loop: module loaded
[    1.356718] pegasus: v0.9.3 (2013/04/25), Pegasus/Pegasus II USB=20
Ethernet dri
ver
[    1.364216] usbcore: registered new interface driver pegasus
[    1.370013] usbcore: registered new interface driver asix
[    1.375505] usbcore: registered new interface driver ax88179_178a
[    1.381690] usbcore: registered new interface driver cdc_ether
[    1.387650] usbcore: registered new interface driver smsc75xx
[    1.393514] usbcore: registered new interface driver smsc95xx
[    1.399351] usbcore: registered new interface driver net1080
[    1.405090] usbcore: registered new interface driver cdc_subset
[    1.411099] usbcore: registered new interface driver zaurus
[    1.416817] usbcore: registered new interface driver cdc_ncm
[    1.422500] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driv=
er
[    1.429020] ehci-pci: EHCI PCI platform driver
[    1.433549] tegra-ehci: Tegra EHCI driver
[    1.437740] platform 7d000000.usb: Driver tegra-ehci requests probe=20
deferral
[    1.444845] platform 7d004000.usb: Driver tegra-ehci requests probe=20
deferral
[    1.451961] platform 7d008000.usb: Driver tegra-ehci requests probe=20
deferral
[    1.459332] usbcore: registered new interface driver cdc_acm
[    1.464976] cdc_acm: USB Abstract Control Model driver for USB modem=
s=20
and ISD
N adapters
[    1.473069] usbcore: registered new interface driver cdc_wdm
[    1.478872] usbcore: registered new interface driver usb-storage
[    1.486163] tegra-phy 7d004000.usb-phy: no vbus regulator
[    1.492308] mousedev: PS/2 mouse device common for all mice
[    1.499657] tegra_rtc 7000e000.rtc: rtc core: registered 7000e000.rt=
c=20
as rtc0
[    1.506861] tegra_rtc 7000e000.rtc: Tegra internal Real Time Clock
[    1.521663] tps65910-rtc tps65910-rtc: rtc core: registered=20
tps65910-rtc as r
tc1
[    1.530084] sdhci: Secure Digital Host Controller Interface driver
[    1.536261] sdhci: Copyright(c) Pierre Ossman
[    1.540603] sdhci-pltfm: SDHCI platform and OF driver helper
[    1.546641] sdhci-tegra 78000200.sdhci: Got CD GPIO #23.
[    1.552986] mmc0: no vqmmc regulator found
[    1.557086] mmc0: no vmmc regulator found
[    1.561083] mmc0: Invalid maximum block size, assuming 512 bytes
[    1.605481] mmc0: SDHCI controller on 78000200.sdhci [78000200.sdhci=
]=20
using A
DMA
[    1.616018] mmc1: no vqmmc regulator found
[    1.620102] mmc1: no vmmc regulator found
[    1.624098] mmc1: Invalid maximum block size, assuming 512 bytes
[    1.675477] mmc1: SDHCI controller on 78000600.sdhci [78000600.sdhci=
]=20
using A
DMA
[    1.683592] usbcore: registered new interface driver usbhid
[    1.691189] usbhid: USB HID core driver
[    1.706474] TCP: cubic registered
[    1.710002] NET: Registered protocol family 10
[    1.717127] mip6: Mobile IPv6
[    1.720088] sit: IPv6 over IPv4 tunneling driver
[    1.726974] NET: Registered protocol family 17
[    1.731440] NET: Registered protocol family 15
[    1.736626] Bluetooth: RFCOMM socket layer initialized
[    1.741767] Bluetooth: RFCOMM ver 1.11
[    1.745527] Bluetooth: BNEP (Ethernet Emulation) ver 1.3
[    1.750836] Bluetooth: BNEP socket layer initialized
[    1.755796] Bluetooth: HIDP (Human Interface Emulation) ver 1.2
[    1.761710] Bluetooth: HIDP socket layer initialized
[    1.767660] Registering SWP/SWPB emulation handler
[    1.773198] regulator-dummy: disabling
[    1.780119] tegra-ehci 7d000000.usb: EHCI Host Controller
[    1.785559] tegra-ehci 7d000000.usb: new USB bus registered, assigne=
d=20
bus num
ber 1
[    1.793556] tegra-ehci 7d000000.usb: irq 52, io mem 0x7d000000
[    1.815484] tegra-ehci 7d000000.usb: USB 2.0 started, EHCI 1.00
[    1.823037] hub 1-0:1.0: USB hub found
[    1.826842] hub 1-0:1.0: 1 port detected
[    1.831515] tegra-ehci 7d004000.usb: EHCI Host Controller
[    1.831905] mmc1: new high speed MMC card at address 0001
[    1.833007] mmcblk0: mmc1:0001 HYNIX  1.68 GiB
[    1.833295] mmcblk0boot0: mmc1:0001 HYNIX  partition 1 1.00 MiB
[    1.833563] mmcblk0boot1: mmc1:0001 HYNIX  partition 2 1.00 MiB
[    1.833801] mmcblk0rpmb: mmc1:0001 HYNIX  partition 3 1.00 MiB
[    1.864509] tegra-ehci 7d004000.usb: new USB bus registered, assigne=
d=20
bus num
ber 2
[    1.868545] Primary GPT is invalid, using alternate GPT.
[    1.868555]  mmcblk0: p1
[    1.880336] tegra-ehci 7d004000.usb: irq 53, io mem 0x7d004000
[    1.889842]  mmcblk0boot1: unknown partition table
[    1.897658]  mmcblk0boot0: unknown partition table
[    1.905510] tegra-ehci 7d004000.usb: USB 2.0 started, EHCI 1.00
[    1.912577] hub 2-0:1.0: USB hub found
[    1.916383] hub 2-0:1.0: 1 port detected
[    1.921086] tegra-ehci 7d008000.usb: EHCI Host Controller
[    1.926538] tegra-ehci 7d008000.usb: new USB bus registered, assigne=
d=20
bus num
ber 3
[    1.934432] tegra-ehci 7d008000.usb: irq 129, io mem 0x7d008000
[    1.955481] tegra-ehci 7d008000.usb: USB 2.0 started, EHCI 1.00
[    1.962882] hub 3-0:1.0: USB hub found
[    1.966668] hub 3-0:1.0: 1 port detected
[    1.972286] input: gpio-keys.2 as /devices/soc0/gpio-keys.2/input/in=
put0
[    1.979871] tegra_rtc 7000e000.rtc: setting system clock to=20
1970-01-01 00:00:
34 UTC (34)
[    1.996991] ALSA device list:
[    1.999959]   No soundcards found.
[    2.010889] EXT3-fs (mmcblk0p1): mounted filesystem with writeback=20
data mode
[    2.018039] VFS: Mounted root (ext3 filesystem) readonly on device 1=
79:1.
[    2.018393] kjournald starting.  Commit interval 5 seconds
[    2.032842] devtmpfs: mounted
[    2.036100] Freeing unused kernel memory: 248K (c0797000 - c07d5000)
[    2.235526] usb 2-1: new high-speed USB device number 2 using tegra-=
ehci
[    2.386225] systemd[1]: systemd 199 running in system mode. (+PAM=20
-LIBWRAP -A
UDIT -SELINUX +IMA +SYSVINIT -LIBCRYPTSETUP -GCRYPT +ACL +XZ)

Welcome to The =EF=BF=BD=EF=88=85ngstr=EF=BF=BD=C3=B6m Distribution!

[    2.420926] systemd[1]: Failed to insert module 'autofs4'
[    2.427892] systemd[1]: Set hostname to <colibri-t30>.
[    2.444737] random: systemd urandom read with 38 bits of entropy=20
available
[    2.617929] systemd[1]: Starting Forward Password Requests to Wall=20
Directory
Watch.
[    2.626305] systemd[1]: Started Forward Password Requests to Wall=20
Directory W
atch.
[    2.633907] systemd[1]: Expecting device dev-ttyS0.device...
          Expecting device dev-ttyS0.device...
[    2.655592] systemd[1]: Starting Remote File Systems.
[  OK  ] Reached target Remote File Systems.
[    2.675546] systemd[1]: Reached target Remote File Systems.
[    2.681146] systemd[1]: Starting Syslog Socket.
[  OK  ] Listening on Syslog Socket.
[    2.705551] systemd[1]: Listening on Syslog Socket.
[    2.710463] systemd[1]: Starting Delayed Shutdown Socket.
[  OK  ] Listening on Delayed Shutdown Socket.
[    2.730614] asix 2-1:1.0 eth0: register 'asix' at usb-7d004000.usb-1=
,=20
ASIX AX
88772B USB 2.0 Ethernet, 00:0e:c6:87:72:01
[    2.741501] systemd[1]: Listening on Delayed Shutdown Socket.
[    2.747317] systemd[1]: Starting /dev/initctl Compatibility Named Pi=
pe.
[  OK  ] Listening on /dev/initctl Compatibility Named Pipe.
[    2.775536] systemd[1]: Listening on /dev/initctl Compatibility Name=
d=20
Pipe.
[    2.782567] systemd[1]: Starting Dispatch Password Requests to=20
Console Direct
ory Watch.
[    2.791032] systemd[1]: Started Dispatch Password Requests to Consol=
e=20
Directo
ry Watch.
[    2.799004] systemd[1]: Starting Paths.
[  OK  ] Reached target Paths.
[    2.815532] systemd[1]: Reached target Paths.
[    2.820176] systemd[1]: Starting udev Kernel Socket.
[  OK  ] Listening on udev Kernel Socket.
[    2.845537] systemd[1]: Listening on udev Kernel Socket.
[    2.851050] systemd[1]: Starting udev Control Socket.
[  OK  ] Listening on ude[    2.856556] usb 3-1: new high-speed USB=20
device numbe
r 2 using tegra-ehci
v Control Socket.
[    2.885534] systemd[1]: Listening on udev Control Socket.
[    2.890987] systemd[1]: Starting Journal Socket.
[  OK  ] Listening on Journal Socket.
[    2.915537] systemd[1]: Listening on Journal Socket.
[    2.925774] systemd[1]: Started Load Kernel Modules.
[    2.930834] systemd[1]: Mounted Huge Pages File System.
[    2.936153] systemd[1]: Mounted Configuration File System.
[    2.945609] systemd[1]: Starting Apply Kernel Variables...
          Starting Apply Kernel Variables...
[    2.968455] systemd[1]: Starting udev Kernel Device Manager...
          Starting udev Kernel Device Manager...
[    2.998599] systemd[1]: Starting udev Coldplug all Devices...
          Starting udev Coldplug all Devices...
[    3.017661] hub 3-1:1.0: USB hub found
[    3.021574] hub 3-1:1.0: 4 ports detected
[    3.028668] systemd[1]: Mounted FUSE Control File System.
[    3.034184] systemd[1]: Starting Set the USB gadget to RNDIS...
          Starting Set the USB gadget to RNDIS...
[    3.058361] systemd[1]: Starting Journal Service...
          Starting Journal Service...
[  OK  ] Started Journal Service.
[    3.086137] systemd-udevd[80]: starting version 199
[    3.095677] systemd[1]: Started Journal Service.
[    3.100543] systemd[1]: Mounted POSIX Message Queue File System.
[    3.106875] systemd[1]: Set up automount Arbitrary Executable File=20
=46ormats Fi
le System Automount Point.
[    3.168817] systemd[1]: Started Set Up Additional Binary Formats.
[    3.175017] systemd[1]: Starting Swap.
[  OK  ] Reached target Swap.
[    3.198797] systemd[1]: Reached target Swap.
[    3.203744] systemd[1]: Mounting Temporary Directory...
          Mounting Temporary Directory...
[    3.242588] systemd[1]: Starting File System Check on Root Device...
          Starting File System Check on Root Device...
[  OK  ] Started udev Kernel Device Manager.
[    3.285657] systemd[1]: Started udev Kernel Device Manager.
[  OK  ] Started Apply Kernel Variables.
[   3.306574] systemd[1]: Started Apply Kernel Variables.
[  OK  ] Started Set the USB gadget to RNDIS.
[  OK  ] Mounted Temporary Directory.
[    3.368624] systemd-journald[84]: Assertion 'm' failed at=20
/home/tegradev/oe-c
ore/build/out-eglibc/work/armv7ahf-vfp-neon-angstrom-linux-gnueabi/syst=
emd/1_199
-r7/systemd-199/src/journal/mmap-cache.c:557, function=20
mmap_cache_close_fd(). Ab
orting.
[    3.394065] systemd[1]: Unit systemd-journald.service entered failed=
=20
state
[    3.401760] systemd[1]: systemd-journald.service holdoff time over,=20
schedulin
g restart.
[  OK  ] Stopped Trigger [    3.410170] systemd[1]: Stopping Journal=20
Service...
=46lushing of Journal to Persistent Storag[    3.418580] systemd[1]:=20
Starting Jour
nal Service...
e.
          Stopping Journal Service...
[  OK  ] Stopped Jour[    3.429476] systemd[1]: Started Journal Service=
=2E
nal Service.
          Starting Journal Service...
[  OK  ] Started Journal Service.
[  OK  ] Started udev Col[    3.449116] systemd-journald[95]: File=20
/run/log/jour
nal/a9759917248e4d19824d58bab81792aa/system.journal corrupted or=20
uncleanly shut
down, renaming and replacing.
dplug all Devices.
[    3.489409] Unable to handle kernel paging request at virtual addres=
s=20
2d7ff000
[    3.489737] Unable to handle kernel paging request at virtual addres=
s=20
2d807000
[    3.489741] pgd =3D ed284000
[    3.489745] [2d807000] *pgd=3D00000000
[    3.489753] Internal error: Oops: 5 [#1] PREEMPT SMP ARM
[    3.489758] Modules linked in:
[    3.489766] CPU: 3 PID: 106 Comm: systemd-udevd Not tainted=20
3.14.0-dirty #1
[    3.489770] task: edb51180 ti: ed27e000 task.ti: ed27e000
[    3.489796] PC is at cpuacct_charge+0x30/0x58
[    3.489800] LR is at cpuacct_charge+0x1c/0x58
[    3.489804] pc : [<c00604f8>]    lr : [<c00604e4>]    psr: a00f0093
[    3.489804] sp : ed27fc50  ip : 2d807000  fp : ed27fd14
[    3.489806] r10: 00000001  r9 : 00000000  r8 : 015ef4be
[    3.489809] r7 : 00000003  r6 : c07def74  r5 : 00000000  r4 : 0004e9=
d0
[    3.489811] r3 : 00000000  r2 : edbe6900  r1 : 00000000  r0 : 02ba26=
90
[    3.489816] Flags: NzCv  IRQs off  FIQs on  Mode SVC_32  ISA ARM=20
Segment user
[    3.489818] Control: 10c5387d  Table: ad28404a  DAC: 00000015
[    3.489824] Process systemd-udevd (pid: 106, stack limit =3D 0xed27e=
240)
[    3.489828] Stack: (0xed27fc50 to 0xed280000)
[    3.489832] fc40:                                     00000000=20
0004e9d0 00000000 edb511c8
[    3.489837] fc60: ed0e4440 c004f944 c0051790 059a4f98 00000000=20
edb511c8 00000001 ed0e4440
[    3.489842] fc80: 00000138 c0051a38 edfdbc40 c057a768 00000001=20
edfdbc88 00000001 edfdbc88
[    3.489847] fca0: 00036718 00000000 edfdbc40 edb5150c 00000001=20
edfdbc40 ed27e000 edfdbc40
[    3.489851] fcc0: edb51180 059a4f98 00000000 059a4f98 00000000=20
00000000 00000000 edb51180
[    3.489856] fce0: ed27fd14 c00482f0 00000001 edfdbc40 ed27fd94=20
edb5150c 00000003 edfdbc40
[    3.489860] fd00: ed27e000 edb51180 c07d4c40 edb51180 ed27fdb4=20
c05734a8 00000127 00000000
[    3.489865] fd20: cfe9d480 00000003 00000002 00000002 0000009f=20
c07d4c40 c07d4c40 c07d4c40
[    3.489869] fd40: 00019000 00000000 00000000 00000000 00000001=20
00000000 ed27fe20 ed552980
[    3.489874] fd60: ed27fda4 c07eb598 ed27e000 ed217dc8 200f0013=20
c07eb598 ed27e000 ed217dc8
[    3.489878] fd80: 200f0013 00000000 ed67a320 c0863580 ee59cf40=20
ed27e000 c07eb59c 200f0013
[    3.489883] fda0: ed27e000 ffffffff c07eb5a0 edb51180 ed27fdc4=20
c0573bb8 00000001 c07eb598
[    3.489888] fdc0: c082a48c c0575e90 c07eb5a0 ed289dc8 edb51180=20
ed27fdc8 ed27fef0 c07eb598
[    3.489893] fde0: 00000001 ed836a08 00000000 00000000 ed1be029=20
ed27e000 ed27fef0 c05760b8
[    3.489897] fe00: ed54c1a8 c0128d24 ed54c1a8 ed27fef8 ed27fe48=20
c00de20c 00000000 c00e85f0
[    3.489902] fe20: ed1be02a ed1be02a ed27fef8 c00de500 ffffff9c=20
00000000 ed07cb40 c00ce8a8
[    3.489907] fe40: 00000000 ed54c1a8 ed026b50 ed54aaa8 000080d0=20
c00d61bc 2a2877e9 00000007
[    3.489911] fe60: ed1be022 c07eab00 ed1be000 ed07cb40 ed27fef0=20
ed27ff74 ed1be000 ed27e000
[    3.489916] fe80: 00000000 00000000 00000000 c00e1918 ed27fea8=20
c0863580 ee5937c0 c00cf658
[    3.489920] fea0: ed026b50 ed67a328 00000000 00000000 ed026b50=20
ed67a328 ed1be000 ed831240
[    3.489925] fec0: ed86cb80 ed27ff74 00000001 ed1be000 ffffff9c=20
c000e8a4 ed27e000 00000000
[    3.489929] fee0: be9ebbcc c00e2150 00000041 c00e2098 ed026b50=20
ed54aaa8 2a2877e9 00000007
[    3.489934] ff00: ed1be022 c07eab00 ed837d50 ed4e3148 ed54c1a8=20
00000011 00000002 0000005c
[    3.489938] ff20: 00000000 00000000 00000006 ed999380 ed999388=20
00000000 00000400 c00ed734
[    3.489943] ff40: 000a0000 000a0000 ed1be000 ffffff9c 00000005=20
00000006 ed1be000 ffffff9c
[    3.489947] ff60: 00000005 c00d433c ed27ff74 00000000 00000000=20
00020000 00000000 00000024
[    3.489952] ff80: 00000100 00000001 be9efe34 00040658 0002ad22=20
00000008 00000005 c000e8a4
[    3.489956] ffa0: 00000000 c000e720 00040658 0002ad22 be9ebc14=20
000a0000 000001b6 000001b6
[    3.489960] ffc0: 00040658 0002ad22 00000008 00000005 00000000=20
0003b040 0003c038 be9ebbcc
[    3.489965] ffe0: 00000000 be9ebb6c b6e1d630 b6e6e51c 600f0010=20
be9ebc14 e18460e1 c8e5acf3
[    3.489988] [<c00604f8>] (cpuacct_charge) from [<c004f944>]=20
(update_curr+0xcc/0x120)
[    3.489993] Unable to handle kernel paging request at virtual addres=
s=20
2d7ef000
[    3.489998] [<c004f944>] (update_curr) from [<c0051a38>]=20
(dequeue_task_fair+0x2a8/0x7ac)
[    3.490000] pgd =3D ed104000
[    3.490009] [<c0051a38>] (dequeue_task_fair) from [<c00482f0>]=20
(dequeue_task+0xb8/0xc0)
[    3.490012] [2d7ef000] *pgd=3D00000000
[    3.490031] [<c00482f0>] (dequeue_task) from [<c05734a8>]=20
(__schedule+0x384/0x67c)
[    3.490040] [<c05734a8>] (__schedule) from [<c0573bb8>]=20
(schedule_preempt_disabled+0x24/0x34)
[    3.490049] [<c0573bb8>] (schedule_preempt_disabled) from=20
[<c0575e90>] (__mutex_lock_slowpath+0x180/0x39c)
[    3.490054] [<c0575e90>] (__mutex_lock_slowpath) from [<c05760b8>]=20
(mutex_lock+0xc/0x24)
[    3.490060] [<c05760b8>] (mutex_lock) from [<c0128d24>]=20
(kernfs_iop_permission+0x20/0x50)
[    3.490078] [<c0128d24>] (kernfs_iop_permission) from [<c00de20c>]=20
(__inode_permission+0x60/0x90)
[    3.490086] [<c00de20c>] (__inode_permission) from [<c00de500>]=20
(link_path_walk+0x5c/0x7cc)
[    3.490093] [<c00de500>] (link_path_walk) from [<c00e1918>]=20
(path_openat+0x8c/0x5c4)
[    3.490101] [<c00e1918>] (path_openat) from [<c00e2150>]=20
(do_filp_open+0x2c/0x80)
[    3.490116] [<c00e2150>] (do_filp_open) from [<c00d433c>]=20
(do_sys_open+0x10c/0x1c8)
[    3.490131] [<c00d433c>] (do_sys_open) from [<c000e720>]=20
(ret_fast_syscall+0x0/0x30)
[    3.490138] Code: e59f602c e5932024 e796c107 e5923040 (e18300dc)
[    3.490145] Internal error: Oops: 5 [#2] PREEMPT SMP ARM
[    3.490147] ---[ end trace 2406b5229141b355 ]---
[    3.490150] Modules linked in:
[    3.490154] note: systemd-udevd[106] exited with preempt_count 2
[    3.490159] CPU: 0 PID: 80 Comm: systemd-udevd Tainted: G      D=20
  3.14.0-dirty #1
[    3.490162] task: ed042c80 ti: ed0a2000 task.ti: ed0a2000
[    3.490168] PC is at cpuacct_charge+0x30/0x58
[    3.490172] LR is at cpuacct_charge+0x1c/0x58
[    3.490175] pc : [<c00604f8>]    lr : [<c00604e4>]    psr: a00f0093
[    3.490175] sp : ed0a3c40  ip : 2d7ef000  fp : ed0a3d04
[    3.490178] r10: 00000001  r9 : 00000000  r8 : 03071f4e
[    3.490180] r7 : 00000000  r6 : c07def74  r5 : 00000000  r4 : 000f17=
48
[    3.490182] r3 : 00000000  r2 : edbe6900  r1 : 00000000  r0 : 038304=
70
[    3.490185] Flags: NzCv  IRQs off  FIQs on  Mode SVC_32  ISA ARM=20
Segment user
[    3.490188] Control: 10c5387d  Table: ad10404a  DAC: 00000015
[    3.490190] Process systemd-udevd (pid: 80, stack limit =3D 0xed0a22=
40)
[    3.490192] Stack: (0xed0a3c40 to 0xed0a4000)
[    3.490198] 3c40: 00000000 000f1748 00000000 ed042cc8 ed0e4680=20
c004f944 c0051790 082845a8
[    3.490203] 3c60: 00000000 ed042cc8 00000001 ed0e4680 00000138=20
c0051a38 000000c1 edbef398
[    3.490207] 3c80: 00000001 edbef3a4 00000000 00000000 00036718=20
00000000 edfc3c40 ed04300c
[    3.490212] 3ca0: 00000001 edfc3c40 ed0a2000 edfc3c40 ed042c80=20
082845a8 00000000 082845a8
[    3.490216] 3cc0: 00000000 00000000 00000000 ed042c80 ed0a3d04=20
c00482f0 00000001 edfc3c40
[    3.490221] 3ce0: 00000000 ed04300c 00000000 edfc3c40 ed0a2000=20
ed042c80 c07d4c40 ed042c80
[    3.490226] 3d00: ed0a3da4 c05734a8 ffffeff4 ffffeff4 00000000=20
ed0a3d7c ed108c00 c0863580
[    3.490230] 3d20: ed0fd140 c07d4c40 c07d4c40 c07d4c40 0000007c=20
00000000 ed0a3e88 be9f755c
[    3.490235] 3d40: 00000000 ed0699f8 600f0013 00000001 00000001=20
00000000 ed0a3e20 ed52fac0
[    3.490239] 3d60: ed0a3da4 c005a78c 00000002 c00995b8 ed11cdd8=20
00000001 ed11ceac 00000000
[    3.490244] 3d80: 00000003 ed0a2000 c07eb59c 200f0013 ed0a2000=20
ffffffff c07eb5a0 ed042c80
[    3.490249] 3da0: ed0a3db4 c0573bb8 00000001 c07eb598 c082a48c=20
c0575e90 c07eb5a0 ed27fdc8
[    3.490253] 3dc0: ed042c80 ed0a3db8 200f0013 c07eb598 ed836b28=20
ed0a3e44 00000001 ed541748
[    3.490257] 3de0: 00000001 ed026b50 ed0a3ef0 c05760b8 ed541748=20
c01293b8 ed0a3e48 ed0a3ef0
[    3.490262] 3e00: ed0a3e44 c00dd9a8 ed0a3e48 00000000 ed210022=20
ed0a3ef8 ed0a3e48 00000000
[    3.490266] 3e20: 00000000 ed210021 ed0a2000 c00de624 ffffff9c=20
00000000 ed056cc0 c00ce8a8
[    3.490271] 3e40: ed0a7840 ed53f768 ed026b50 ed53e508 000080d0=20
c00d61bc abd93a06 00000008
[    3.490276] 3e60: ed210019 c07eab00 ed210000 ed056cc0 ed0a3ef0=20
ed0a3f74 ed210000 ed0a2000
[    3.490280] 3e80: 00000000 00000000 00000000 c00e1918 ed0a3ea8=20
0000002d 00000003 ed11ce48
[    3.490285] 3ea0: ed0a2000 c0575b74 00000000 00000000 00000000=20
0000002d 00000000 c009afd8
[    3.490289] 3ec0: 00000010 ed0a3f74 00000001 ed210000 ffffff9c=20
c000e8a4 ed0a2000 00000000
[    3.490294] 3ee0: be9f5114 c00e2150 00000041 b6f93000 ed026b50=20
ed53e508 abd93a06 00000008
[    3.490298] 3f00: ed210019 c07eab00 ed837d50 ed4e3148 ed53f768=20
00000011 00000002 0000005c
[    3.490303] 3f20: 00000000 00000000 0000000d ed86fa40 ed86fa48=20
00000000 00000400 c00ed734
[    3.490307] 3f40: 000a0000 000a0000 ed210000 ffffff9c 00000005=20
0000000d ed210000 ffffff9c
[    3.490312] 3f60: 00000005 c00d433c 00000000 ed0a7840 ed0a7840=20
00020000 b6f90000 00000024
[    3.490316] 3f80: 00000100 00000001 00000001 0004da10 0002ad22=20
00000008 00000005 c000e8a4
[    3.490320] 3fa0: 00000000 c000e720 0004da10 0002ad22 be9f515c=20
000a0000 000001b6 000001b6
[    3.490325] 3fc0: 0004da10 0002ad22 00000008 00000005 00000000=20
0004e220 0003b040 be9f5114
[    3.490330] 3fe0: 00000000 be9f50b4 b6e1d630 b6e6e51c 600f0010=20
be9f515c ae7f6821 ae7f6c21
[    3.490339] [<c00604f8>] (cpuacct_charge) from [<c004f944>]=20
(update_curr+0xcc/0x120)
[    3.490345] [<c004f944>] (update_curr) from [<c0051a38>]=20
(dequeue_task_fair+0x2a8/0x7ac)
[    3.490353] [<c0051a38>] (dequeue_task_fair) from [<c00482f0>]=20
(dequeue_task+0xb8/0xc0)
[    3.490362] [<c00482f0>] (dequeue_task) from [<c05734a8>]=20
(__schedule+0x384/0x67c)
[    3.490369] [<c05734a8>] (__schedule) from [<c0573bb8>]=20
(schedule_preempt_disabled+0x24/0x34)
[    3.490376] [<c0573bb8>] (schedule_preempt_disabled) from=20
[<c0575e90>] (__mutex_lock_slowpath+0x180/0x39c)
[    3.490381] [<c0575e90>] (__mutex_lock_slowpath) from [<c05760b8>]=20
(mutex_lock+0xc/0x24)
[    3.490388] [<c05760b8>] (mutex_lock) from [<c01293b8>]=20
(kernfs_dop_revalidate+0x28/0xc0)
[    3.490397] [<c01293b8>] (kernfs_dop_revalidate) from [<c00dd9a8>]=20
(lookup_fast+0x264/0x2a0)
[    3.490404] [<c00dd9a8>] (lookup_fast) from [<c00de624>]=20
(link_path_walk+0x180/0x7cc)
[    3.490411] [<c00de624>] (link_path_walk) from [<c00e1918>]=20
(path_openat+0x8c/0x5c4)
[    3.490418] [<c00e1918>] (path_openat) from [<c00e2150>]=20
(do_filp_open+0x2c/0x80)
[    3.490427] [<c00e2150>] (do_filp_open) from [<c00d433c>]=20
(do_sys_open+0x10c/0x1c8)
[    3.490435] [<c00d433c>] (do_sys_open) from [<c000e720>]=20
(ret_fast_syscall+0x0/0x30)
[    3.490440] Code: e59f602c e5932024 e796c107 e5923040 (e18300dc)
[    3.490443] ---[ end trace 2406b5229141b356 ]---
[    3.490447] note: systemd-udevd[80] exited with preempt_count 2
[    4.437984] pgd =3D ed21c000
[    4.440678] [2d7ff000] *pgd=3D00000000
[    4.444249] Internal error: Oops: 5 [#3] PREEMPT SMP ARM
[    4.449544] Modules linked in:
[    4.452593] CPU: 2 PID: 98 Comm: systemd-udevd Tainted: G      D=20
  3.14.0-dirty #1
[    4.460404] task: ed160740 ti: ed218000 task.ti: ed218000
[    4.465795] PC is at cpuacct_charge+0x30/0x58
[    4.470140] LR is at cpuacct_charge+0x1c/0x58
[    4.474483] pc : [<c00604f8>]    lr : [<c00604e4>]    psr: a00f0193
[    4.474483] sp : ed219d58  ip : 2d7ff000  fp : ed219e34
[    4.485933] r10: ed0e4500  r9 : 00000000  r8 : 0243e12b
[    4.491142] r7 : 00000002  r6 : c07def74  r5 : 00000000  r4 : 0001e4=
60
[    4.497651] r3 : 00000000  r2 : edbe6900  r1 : 00000000  r0 : 035a94=
e0
[    4.504160] Flags: NzCv  IRQs off  FIQs on  Mode SVC_32  ISA ARM=20
Segment user
[    4.511363] Control: 10c5387d  Table: ad21c04a  DAC: 00000015
[    4.517091] Process systemd-udevd (pid: 98, stack limit =3D 0xed2182=
40)
[    4.523513] Stack: (0xed219d58 to 0xed21a000)
[    4.527857] 9d40:=20
    00000000 0001e460
[    4.536015] 9d60: 00000000 ed160788 ed0e4500 c004f944 00000005=20
02746323 00000000 00000001
[    4.544172] 9d80: 00000000 ed160d48 000004a8 c0052ad8 00006c00=20
00000000 00000050 00000000
[    4.552330] 9da0: ed0dc000 ed219e34 00000000 c07eb598 ed218000=20
ed27fda8 600f0013 edfd3c40
[    4.560488] 9dc0: 00000000 00000000 ed5beb48 ed5beb98 00036718=20
00000000 ed0912c8 ed160d00
[    4.568647] 9de0: edfd3c40 ed160d00 edfd3c40 edfd3c40 ed0dc000=20
cffbe580 00000000 ed160d00
[    4.576803] 9e00: edfd3c40 00000005 ed0dc000 ed0dc000 ed219e34=20
c0048340 00000100 ed160d00
[    4.584961] 9e20: edfd3c40 c07d4c40 c07def74 00000fff ed219e44=20
c0048e00 00000000 edfd3c40
[    4.593119] 9e40: ed219e54 c0048e8c ed218000 c07d3f00 ed219e74=20
c004add4 c0826488 00000002
[    4.601276] 9e60: c07d3f00 00000000 fe440100 00000fff be9f0904=20
c00145a8 fe44010c c07df0d4
[    4.609433] 9e80: ed219ea0 c00086cc c00ce884 c00ce680 800f0013=20
ffffffff ed219ed4 c0012480
[    4.617590] 9ea0: ed831240 ed0dc000 0000006b 0000006b 00000a73=20
00000000 00001000 ed831240
[    4.625748] 9ec0: 00000fff ed0dc000 ed0dc000 be9f0904 c06c7860=20
ed219ee8 c00ce884 c00ce680
[    4.633906] 9ee0: 800f0013 ffffffff 00000041 00000000 c00de044=20
400f0013 ed831240 ed0dc000
[    4.642064] 9f00: c000e8a4 00000000 00000000 c00ce884 ee591b80=20
c00cf658 ed831240 400f0013
[    4.650222] 9f20: 000000d0 c00de044 c000e8a4 c00cf474 c07defdc=20
000a0000 0002ad22 be9f094c
[    4.658380] 9f40: 00000005 c00de044 000a0000 0002ad22 ffffff9c=20
00000005 c000e8a4 ed218000
[    4.666537] 9f60: 00000000 c00d430c be9f9600 be9f9600 0004d2a8=20
00020000 c0000000 00000024
[    4.674693] 9f80: 00000100 00000001 00000000 0003c038 0002ad22=20
00000008 00000005 c000e8a4
[    4.682851] 9fa0: 00000000 c000e720 0003c038 0002ad22 be9f094c=20
000a0000 000001b6 000001b6
[    4.691007] 9fc0: 0003c038 0002ad22 00000008 00000005 00000000=20
0003b040 0004e488 be9f0904
[    4.699165] 9fe0: 00000000 be9f08a4 b6e1d630 b6e6e51c 600f0010=20
be9f094c a9e02073 148d9a10
[    4.707331] [<c00604f8>] (cpuacct_charge) from [<c004f944>]=20
(update_curr+0xcc/0x120)
[    4.715057] [<c004f944>] (update_curr) from [<c0052ad8>]=20
(enqueue_task_fair+0x5c/0xce8)
[    4.723046] [<c0052ad8>] (enqueue_task_fair) from [<c0048340>]=20
(enqueue_task+0x48/0x4c)
[    4.731035] [<c0048340>] (enqueue_task) from [<c0048e00>]=20
(ttwu_do_activate.constprop.73+0x2c/0x60)
[    4.740061] [<c0048e00>] (ttwu_do_activate.constprop.73) from=20
[<c0048e8c>] (sched_ttwu_pending+0x58/0x70)
[    4.749609] [<c0048e8c>] (sched_ttwu_pending) from [<c004add4>]=20
(scheduler_ipi+0x40/0x10c)
[    4.757858] [<c004add4>] (scheduler_ipi) from [<c00145a8>]=20
(handle_IPI+0xc8/0x160)
[    4.765411] [<c00145a8>] (handle_IPI) from [<c00086cc>]=20
(gic_handle_irq+0x54/0x5c)
[    4.772971] [<c00086cc>] (gic_handle_irq) from [<c0012480>]=20
(__irq_svc+0x40/0x70)
[    4.780433] Exception stack(0xed219ea0 to 0xed219ee8)
[    4.785471] 9ea0: ed831240 ed0dc000 0000006b 0000006b 00000a73=20
00000000 00001000 ed831240
[    4.793629] 9ec0: 00000fff ed0dc000 ed0dc000 be9f0904 c06c7860=20
ed219ee8 c00ce884 c00ce680
[    4.801783] 9ee0: 800f0013 ffffffff
[    4.805266] [<c0012480>] (__irq_svc) from [<c00ce680>]=20
(check_poison_obj+0x3c/0x1d4)
[    4.812992] [<c00ce680>] (check_poison_obj) from [<c00ce884>]=20
(cache_alloc_debugcheck_after.isra.57+0x6c/0x1b8)
[    4.823058] [<c00ce884>] (cache_alloc_debugcheck_after.isra.57) from=
=20
[<c00cf474>] (kmem_cache_alloc+0xa4/0x138)
[    4.833127] [<c00cf474>] (kmem_cache_alloc) from [<c00de044>]=20
(getname_flags+0x20/0x110)
[    4.841202] [<c00de044>] (getname_flags) from [<c00d430c>]=20
(do_sys_open+0xdc/0x1c8)
[    4.848842] [<c00d430c>] (do_sys_open) from [<c000e720>]=20
(ret_fast_syscall+0x0/0x30)
[    4.856566] Code: e59f602c e5932024 e796c107 e5923040 (e18300dc)
[    4.862646] ---[ end trace 2406b5229141b357 ]---
[    4.867249] Kernel panic - not syncing: Fatal exception in interrupt
[    4.873973] CPU1: stopping
[    4.876673] CPU: 1 PID: 0 Comm: swapper/1 Tainted: G      D=20
3.14.0-dirty #1
[    4.884062] [<c0015cc4>] (unwind_backtrace) from [<c0011948>]=20
(show_stack+0x10/0x14)
[    4.891793] [<c0011948>] (show_stack) from [<c05711f4>]=20
(dump_stack+0x80/0xcc)
[    4.899000] [<c05711f4>] (dump_stack) from [<c0014614>]=20
(handle_IPI+0x134/0x160)
[    4.906378] [<c0014614>] (handle_IPI) from [<c00086cc>]=20
(gic_handle_irq+0x54/0x5c)
[    4.913930] [<c00086cc>] (gic_handle_irq) from [<c0012480>]=20
(__irq_svc+0x40/0x70)
[    4.921392] Exception stack(0xed89ff60 to 0xed89ffa8)
[    4.926430] ff60: ed89ffa8 3b9aca00 222fa4b8 00000001 d398d6a8=20
00000000 edfcb088 00000001
[    4.934587] ff80: 00000000 c057a28c 00000001 00000000 fffffff5=20
ed89ffa8 c0071a28 c039229c
[    4.942741] ffa0: 60000113 ffffffff
[    4.946232] [<c0012480>] (__irq_svc) from [<c039229c>]=20
(cpuidle_enter_state+0x50/0xe8)
[    4.954133] [<c039229c>] (cpuidle_enter_state) from [<c03923f0>]=20
(cpuidle_idle_call+0xbc/0x174)
[    4.962813] [<c03923f0>] (cpuidle_idle_call) from [<c000f314>]=20
(arch_cpu_idle+0x8/0x38)
[    4.970806] [<c000f314>] (arch_cpu_idle) from [<c0066ef4>]=20
(cpu_startup_entry+0x60/0x134)
[    4.978968] [<c0066ef4>] (cpu_startup_entry) from [<80008764>]=20
(0x80008764)
[    5.985728] SMP: failed to stop secondary CPUs
[    5.990158] drm_kms_helper: panic occurred, switching back to text=20
console
