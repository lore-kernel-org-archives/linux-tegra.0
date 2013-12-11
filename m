From: Liviu Dudau <liviu-I3yL/QOVVjH10XsdtD+oqA@public.gmane.org>
Subject: Trimslice Barebone fails to detect HDMI connection, no DDC i2c
 channel present
Date: Wed, 11 Dec 2013 21:49:11 +0000
Message-ID: <20131211214911.GA24176@bart.dudau.co.uk>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="NU0Ex4SbNnrxsi6C"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--NU0Ex4SbNnrxsi6C
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello,

Prompted by a discussion on G+, here is a report of an issue I'm seeing
with mainline kernel (commit 78fd82238d0e57).

The kernel fails to detect the DDC i2c interface (on Trimslice that's
on Tegra2 I2C-0 interface), so I'm getting no output on the HDMI
interface (that's the only output port on the Barebone version).

I'm attaching the kernel log together with a run of i2cdetect on
all the possible busses. The only patch that I am carrying vs
mainline is:

diff --git a/drivers/gpu/drm/tegra/output.c b/drivers/gpu/drm/tegra/output.c
index 2cb0065..38c3a0a 100644
--- a/drivers/gpu/drm/tegra/output.c
+++ b/drivers/gpu/drm/tegra/output.c
@@ -19,8 +19,14 @@ static int tegra_connector_get_modes(struct drm_connector *connector)
 
        if (output->edid)
                edid = kmemdup(output->edid, sizeof(*edid), GFP_KERNEL);
-       else if (output->ddc)
+       else if (output->ddc) {
                edid = drm_get_edid(connector, output->ddc);
+               printk(KERN_INFO "drm_get_edid: %p\n", edid);
+       }
+
+       if (edid)
+               print_hex_dump(KERN_ERR, " \t", DUMP_PREFIX_NONE, 16, 1,
+                       edid, EDID_LENGTH, false);
 
        drm_mode_connector_update_edid_property(connector, edid);
 
@@ -225,6 +231,7 @@ int tegra_output_probe(struct tegra_output *output)
                output->connector.polled = DRM_CONNECTOR_POLL_HPD;
        }
 
+       dev_info(output->dev, "output_probe returned 0\n");
        return 0;
 }


Thanks,
Liviu

--NU0Ex4SbNnrxsi6C
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment; filename="trimslice-ddc.log"
Content-Transfer-Encoding: quoted-printable


resetting ...

U-Boot SPL 2014.01-rc1-dirty (Nov 26 2013 - 22:29:37)


U-Boot 2014.01-rc1-dirty (Nov 26 2013 - 22:29:37)

TEGRA20
Board: Compulab Trimslice
I2C:   ready
DRAM:  1 GiB
MMC:   Tegra SD/MMC: 0, Tegra SD/MMC: 1
SF: Detected W25Q80BL with page size 256 Bytes, erase size 4 KiB, total 1 M=
iB
In:    serial
Out:   serial
Err:   serial
Net:   Net Initialization Skipped
No ethernet found.
Hit any key to stop autoboot:  2 =08=08=08 0=20
Tegra20 (TrimSlice) # printenv
arch=3Darm
baudrate=3D115200
board=3Dtrimslice
bootargs=3Dconsole=3DttyS0,115200n8 earlyprintk debug verbose root=3D/dev/m=
mcblk0p1 rootwait drm.debug=3D0xf
bootcmd=3Dext2load mmc 1 ${fdt_addr_r} /boot/${soc}-${board}.dtb; fdt addr =
${fdt_addr_r}; fdt resize; fdt set /chosen bootargs "${bootargs}"; ext2load=
 mmc 1 ${kernel_addr_r} /boot/zImage; bootz ${kernel_addr_r} - ${fdt_addr_r}
bootdelay=3D2
cpu=3Darmv7
fdt_addr_r=3D0x00300000
fdtaddr=3D300000
filesize=3D45ac
kernel_addr_r=3D0x00080000
loadaddr=3D0x00408000
ramdisk_addr_r=3D0x1000000
soc=3Dtegra20
stderr=3Dserial
stdin=3Dserial
stdout=3Dserial
vendor=3Dcompulab

Environment size: 616/8188 bytes
Tegra20 (TrimSlice) # boot
17836 bytes read in 150 ms (115.2 KiB/s)
2227104 bytes read in 302 ms (7 MiB/s)
Kernel image @ 0x080000 [ 0x000000 - 0x21fba0 ]
## Flattened Device Tree blob at 00300000
   Booting using the fdt blob at 0x300000
   reserving fdt memory region: addr=3D300000 size=3D5000
   Loading Device Tree to 0fff8000, end 0fffffff ... OK

Starting kernel ...

Uncompressing Linux... done, booting the kernel.
Booting Linux on physical CPU 0x0
Linux version 3.13.0-rc3-00145-g78fd822-dirty (dliviu@bart) (gcc version 4.=
8.0 (Gentoo 4.8.0 p1.3, pie-0.5.5) ) #34 SMP PREEMPT Wed Dec 11 02:57:59 GM=
T 2013
CPU: ARMv7 Processor [411fc090] revision 0 (ARMv7), cr=3D10c5387d
CPU: PIPT / VIPT nonaliasing data cache, VIPT aliasing instruction cache
Machine model: Compulab TrimSlice board
bootconsole [earlycon0] enabled
cma: CMA: reserved 16 MiB at 3f000000
Memory policy: Data cache writealloc
On node 0 totalpages: 262144
free_area_init_node: node 0, pgdat 806a9c40, node_mem_map 80710000
  Normal zone: 2048 pages used for memmap
  Normal zone: 0 pages reserved
  Normal zone: 262144 pages, LIFO batch:31
Tegra20 Soc Speedo ID 1
Tegra Revision: A03 prime SKU: 8 CPU Process: 1 Core Process: 1
L310 cache controller enabled
l2x0: 8 ways, CACHE_ID 0x410000c4, AUX_CTRL 0x7e480001, Cache size: 1024 kB
PERCPU: Embedded 9 pages/cpu @80f1d000 s12672 r8192 d16000 u36864
pcpu-alloc: s12672 r8192 d16000 u36864 alloc=3D9*4096
pcpu-alloc: [0] 0 [0] 1=20
Built 1 zonelists in Zone order, mobility grouping on.  Total pages: 260096
Kernel command line: console=3DttyS0,115200n8 earlyprintk debug verbose roo=
t=3D/dev/mmcblk0p1 rootwait drm.debug=3D0xf
PID hash table entries: 4096 (order: 2, 16384 bytes)
Dentry cache hash table entries: 131072 (order: 7, 524288 bytes)
Inode-cache hash table entries: 65536 (order: 6, 262144 bytes)
Memory: 1015792K/1048576K available (4677K kernel code, 344K rwdata, 1404K =
rodata, 384K init, 382K bss, 32784K reserved)
Virtual kernel memory layout:
    vector  : 0xffff0000 - 0xffff1000   (   4 kB)
    fixmap  : 0xfff00000 - 0xfffe0000   ( 896 kB)
    vmalloc : 0xc0800000 - 0xff000000   (1000 MB)
    lowmem  : 0x80000000 - 0xc0000000   (1024 MB)
    modules : 0x7f000000 - 0x80000000   (  16 MB)
      .text : 0x80008000 - 0x805f8aa0   (6083 kB)
      .init : 0x805f9000 - 0x80659180   ( 385 kB)
      .data : 0x8065a000 - 0x806b029c   ( 345 kB)
       .bss : 0x806b029c - 0x8070fd24   ( 383 kB)
SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D2, Nodes=3D1
Preemptible hierarchical RCU implementation.
	RCU restricting CPUs from NR_CPUS=3D8 to nr_cpu_ids=3D2.
NR_IRQS:16 nr_irqs:16 16
sched_clock: 32 bits at 1000kHz, resolution 1000ns, wraps every 21474836480=
00ns
Console: colour dummy device 80x30
Calibrating delay loop... 1991.60 BogoMIPS (lpj=3D3317760)
pid_max: default: 32768 minimum: 301
Mount-cache hash table entries: 512
CPU: Testing write buffer coherency: ok
ftrace: allocating 16328 entries in 48 pages
CPU0: thread -1, cpu 0, socket 0, mpidr 80000000
Setting up static identity map for 0x435270 - 0x435308
CPU1: Booted secondary processor
CPU1: thread -1, cpu 1, socket 0, mpidr 80000001
Brought up 2 CPUs
SMP: Total of 2 processors activated.
CPU: All CPU(s) started in SVC mode.
devtmpfs: initialized
VFP support v0.3: implementor 41 architecture 3 part 30 variant 9 rev 1
pinctrl core: initialized pinctrl subsystem
reg-dummy reg-dummy: no of_node; not parsing pinctrl DT
regulator-dummy: no parameters
NET: Registered protocol family 16
DMA: preallocated 256 KiB pool for atomic coherent allocations
cpuidle: using governor ladder
cpuidle: using governor menu
hw-breakpoint: found 5 (+1 reserved) breakpoint and 1 watchpoint registers.
hw-breakpoint: maximum watchpoint size is 4 bytes.
tegra20-pinctrl 70000014.pinmux: try to register 318 pins ...
pinctrl core: registered pin 0 (VI_GP6 PA0) on 70000014.pinmux
pinctrl core: registered pin 1 (UART3_CTS_N PA1) on 70000014.pinmux
pinctrl core: registered pin 2 (DAP2_FS PA2) on 70000014.pinmux
pinctrl core: registered pin 3 (DAP2_SCLK PA3) on 70000014.pinmux
pinctrl core: registered pin 4 (DAP2_DIN PA4) on 70000014.pinmux
pinctrl core: registered pin 5 (DAP2_DOUT PA5) on 70000014.pinmux
pinctrl core: registered pin 6 (SDIO3_CLK PA6) on 70000014.pinmux
pinctrl core: registered pin 7 (SDIO3_CMD PA7) on 70000014.pinmux
pinctrl core: registered pin 8 (GMI_AD17 PB0) on 70000014.pinmux
pinctrl core: registered pin 9 (GMI_AD18 PB1) on 70000014.pinmux
pinctrl core: registered pin 10 (LCD_PWR0 PB2) on 70000014.pinmux
pinctrl core: registered pin 11 (LCD_PCLK PB3) on 70000014.pinmux
pinctrl core: registered pin 12 (SDIO3_DAT3 PB4) on 70000014.pinmux
pinctrl core: registered pin 13 (SDIO3_DAT2 PB5) on 70000014.pinmux
pinctrl core: registered pin 14 (SDIO3_DAT1 PB6) on 70000014.pinmux
pinctrl core: registered pin 15 (SDIO3_DAT0 PB7) on 70000014.pinmux
pinctrl core: registered pin 16 (UART3_RTS_N PC0) on 70000014.pinmux
pinctrl core: registered pin 17 (LCD_PWR1 PC1) on 70000014.pinmux
pinctrl core: registered pin 18 (UART2_TXD PC2) on 70000014.pinmux
pinctrl core: registered pin 19 (UART2_RXD PC3) on 70000014.pinmux
pinctrl core: registered pin 20 (GEN1_I2C_SCL PC4) on 70000014.pinmux
pinctrl core: registered pin 21 (GEN1_I2C_SDA PC5) on 70000014.pinmux
pinctrl core: registered pin 22 (LCD_PWR2 PC6) on 70000014.pinmux
pinctrl core: registered pin 23 (GMI_WP_N PC7) on 70000014.pinmux
pinctrl core: registered pin 24 (SDIO3_DAT5 PD0) on 70000014.pinmux
pinctrl core: registered pin 25 (SDIO3_DAT4 PD1) on 70000014.pinmux
pinctrl core: registered pin 26 (VI_GP5 PD2) on 70000014.pinmux
pinctrl core: registered pin 27 (SDIO3_DAT6 PD3) on 70000014.pinmux
pinctrl core: registered pin 28 (SDIO3_DAT7 PD4) on 70000014.pinmux
pinctrl core: registered pin 29 (VI_D1 PD5) on 70000014.pinmux
pinctrl core: registered pin 30 (VI_VSYNC PD6) on 70000014.pinmux
pinctrl core: registered pin 31 (VI_HSYNC PD7) on 70000014.pinmux
pinctrl core: registered pin 32 (LCD_D0 PE0) on 70000014.pinmux
pinctrl core: registered pin 33 (LCD_D1 PE1) on 70000014.pinmux
pinctrl core: registered pin 34 (LCD_D2 PE2) on 70000014.pinmux
pinctrl core: registered pin 35 (LCD_D3 PE3) on 70000014.pinmux
pinctrl core: registered pin 36 (LCD_D4 PE4) on 70000014.pinmux
pinctrl core: registered pin 37 (LCD_D5 PE5) on 70000014.pinmux
pinctrl core: registered pin 38 (LCD_D6 PE6) on 70000014.pinmux
pinctrl core: registered pin 39 (LCD_D7 PE7) on 70000014.pinmux
pinctrl core: registered pin 40 (LCD_D8 PF0) on 70000014.pinmux
pinctrl core: registered pin 41 (LCD_D9 PF1) on 70000014.pinmux
pinctrl core: registered pin 42 (LCD_D10 PF2) on 70000014.pinmux
pinctrl core: registered pin 43 (LCD_D11 PF3) on 70000014.pinmux
pinctrl core: registered pin 44 (LCD_D12 PF4) on 70000014.pinmux
pinctrl core: registered pin 45 (LCD_D13 PF5) on 70000014.pinmux
pinctrl core: registered pin 46 (LCD_D14 PF6) on 70000014.pinmux
pinctrl core: registered pin 47 (LCD_D15 PF7) on 70000014.pinmux
pinctrl core: registered pin 48 (GMI_AD0 PG0) on 70000014.pinmux
pinctrl core: registered pin 49 (GMI_AD1 PG1) on 70000014.pinmux
pinctrl core: registered pin 50 (GMI_AD2 PG2) on 70000014.pinmux
pinctrl core: registered pin 51 (GMI_AD3 PG3) on 70000014.pinmux
pinctrl core: registered pin 52 (GMI_AD4 PG4) on 70000014.pinmux
pinctrl core: registered pin 53 (GMI_AD5 PG5) on 70000014.pinmux
pinctrl core: registered pin 54 (GMI_AD6 PG6) on 70000014.pinmux
pinctrl core: registered pin 55 (GMI_AD7 PG7) on 70000014.pinmux
pinctrl core: registered pin 56 (GMI_AD8 PH0) on 70000014.pinmux
pinctrl core: registered pin 57 (GMI_AD9 PH1) on 70000014.pinmux
pinctrl core: registered pin 58 (GMI_AD10 PH2) on 70000014.pinmux
pinctrl core: registered pin 59 (GMI_AD11 PH3) on 70000014.pinmux
pinctrl core: registered pin 60 (GMI_AD12 PH4) on 70000014.pinmux
pinctrl core: registered pin 61 (GMI_AD13 PH5) on 70000014.pinmux
pinctrl core: registered pin 62 (GMI_AD14 PH6) on 70000014.pinmux
pinctrl core: registered pin 63 (GMI_AD15 PH7) on 70000014.pinmux
pinctrl core: registered pin 64 (GMI_HIOW_N PI0) on 70000014.pinmux
pinctrl core: registered pin 65 (GMI_HIOR_N PI1) on 70000014.pinmux
pinctrl core: registered pin 66 (GMI_CS5_N PI2) on 70000014.pinmux
pinctrl core: registered pin 67 (GMI_CS6_N PI3) on 70000014.pinmux
pinctrl core: registered pin 68 (GMI_RST_N PI4) on 70000014.pinmux
pinctrl core: registered pin 69 (GMI_IORDY PI5) on 70000014.pinmux
pinctrl core: registered pin 70 (GMI_CS7_N PI6) on 70000014.pinmux
pinctrl core: registered pin 71 (GMI_WAIT PI7) on 70000014.pinmux
pinctrl core: registered pin 72 (GMI_CS0_N PJ0) on 70000014.pinmux
pinctrl core: registered pin 73 (LCD_DE PJ1) on 70000014.pinmux
pinctrl core: registered pin 74 (GMI_CS1_N PJ2) on 70000014.pinmux
pinctrl core: registered pin 75 (LCD_HSYNC PJ3) on 70000014.pinmux
pinctrl core: registered pin 76 (LCD_VSYNC PJ4) on 70000014.pinmux
pinctrl core: registered pin 77 (UART2_CTS_N PJ5) on 70000014.pinmux
pinctrl core: registered pin 78 (UART2_RTS_N PJ6) on 70000014.pinmux
pinctrl core: registered pin 79 (GMI_AD16 PJ7) on 70000014.pinmux
pinctrl core: registered pin 80 (GMI_ADV_N PK0) on 70000014.pinmux
pinctrl core: registered pin 81 (GMI_CLK PK1) on 70000014.pinmux
pinctrl core: registered pin 82 (GMI_CS4_N PK2) on 70000014.pinmux
pinctrl core: registered pin 83 (GMI_CS2_N PK3) on 70000014.pinmux
pinctrl core: registered pin 84 (GMI_CS3_N PK4) on 70000014.pinmux
pinctrl core: registered pin 85 (SPDIF_OUT PK5) on 70000014.pinmux
pinctrl core: registered pin 86 (SPDIF_IN PK6) on 70000014.pinmux
pinctrl core: registered pin 87 (GMI_AD19 PK7) on 70000014.pinmux
pinctrl core: registered pin 88 (VI_D2 PL0) on 70000014.pinmux
pinctrl core: registered pin 89 (VI_D3 PL1) on 70000014.pinmux
pinctrl core: registered pin 90 (VI_D4 PL2) on 70000014.pinmux
pinctrl core: registered pin 91 (VI_D5 PL3) on 70000014.pinmux
pinctrl core: registered pin 92 (VI_D6 PL4) on 70000014.pinmux
pinctrl core: registered pin 93 (VI_D7 PL5) on 70000014.pinmux
pinctrl core: registered pin 94 (VI_D8 PL6) on 70000014.pinmux
pinctrl core: registered pin 95 (VI_D9 PL7) on 70000014.pinmux
pinctrl core: registered pin 96 (LCD_D16 PM0) on 70000014.pinmux
pinctrl core: registered pin 97 (LCD_D17 PM1) on 70000014.pinmux
pinctrl core: registered pin 98 (LCD_D18 PM2) on 70000014.pinmux
pinctrl core: registered pin 99 (LCD_D19 PM3) on 70000014.pinmux
pinctrl core: registered pin 100 (LCD_D20 PM4) on 70000014.pinmux
pinctrl core: registered pin 101 (LCD_D21 PM5) on 70000014.pinmux
pinctrl core: registered pin 102 (LCD_D22 PM6) on 70000014.pinmux
pinctrl core: registered pin 103 (LCD_D23 PM7) on 70000014.pinmux
pinctrl core: registered pin 104 (DAP1_FS PN0) on 70000014.pinmux
pinctrl core: registered pin 105 (DAP1_DIN PN1) on 70000014.pinmux
pinctrl core: registered pin 106 (DAP1_DOUT PN2) on 70000014.pinmux
pinctrl core: registered pin 107 (DAP1_SCLK PN3) on 70000014.pinmux
pinctrl core: registered pin 108 (LCD_CS0_N PN4) on 70000014.pinmux
pinctrl core: registered pin 109 (LCD_SDOUT PN5) on 70000014.pinmux
pinctrl core: registered pin 110 (LCD_DC0 PN6) on 70000014.pinmux
pinctrl core: registered pin 111 (HDMI_INT_N PN7) on 70000014.pinmux
pinctrl core: registered pin 112 (ULPI_DATA7 PO0) on 70000014.pinmux
pinctrl core: registered pin 113 (ULPI_DATA0 PO1) on 70000014.pinmux
pinctrl core: registered pin 114 (ULPI_DATA1 PO2) on 70000014.pinmux
pinctrl core: registered pin 115 (ULPI_DATA2 PO3) on 70000014.pinmux
pinctrl core: registered pin 116 (ULPI_DATA3 PO4) on 70000014.pinmux
pinctrl core: registered pin 117 (ULPI_DATA4 PO5) on 70000014.pinmux
pinctrl core: registered pin 118 (ULPI_DATA5 PO6) on 70000014.pinmux
pinctrl core: registered pin 119 (ULPI_DATA6 PO7) on 70000014.pinmux
pinctrl core: registered pin 120 (DAP3_FS PP0) on 70000014.pinmux
pinctrl core: registered pin 121 (DAP3_DIN PP1) on 70000014.pinmux
pinctrl core: registered pin 122 (DAP3_DOUT PP2) on 70000014.pinmux
pinctrl core: registered pin 123 (DAP3_SCLK PP3) on 70000014.pinmux
pinctrl core: registered pin 124 (DAP4_FS PP4) on 70000014.pinmux
pinctrl core: registered pin 125 (DAP4_DIN PP5) on 70000014.pinmux
pinctrl core: registered pin 126 (DAP4_DOUT PP6) on 70000014.pinmux
pinctrl core: registered pin 127 (DAP4_SCLK PP7) on 70000014.pinmux
pinctrl core: registered pin 128 (KB_COL0 PQ0) on 70000014.pinmux
pinctrl core: registered pin 129 (KB_COL1 PQ1) on 70000014.pinmux
pinctrl core: registered pin 130 (KB_COL2 PQ2) on 70000014.pinmux
pinctrl core: registered pin 131 (KB_COL3 PQ3) on 70000014.pinmux
pinctrl core: registered pin 132 (KB_COL4 PQ4) on 70000014.pinmux
pinctrl core: registered pin 133 (KB_COL5 PQ5) on 70000014.pinmux
pinctrl core: registered pin 134 (KB_COL6 PQ6) on 70000014.pinmux
pinctrl core: registered pin 135 (KB_COL7 PQ7) on 70000014.pinmux
pinctrl core: registered pin 136 (KB_ROW0 PR0) on 70000014.pinmux
pinctrl core: registered pin 137 (KB_ROW1 PR1) on 70000014.pinmux
pinctrl core: registered pin 138 (KB_ROW2 PR2) on 70000014.pinmux
pinctrl core: registered pin 139 (KB_ROW3 PR3) on 70000014.pinmux
pinctrl core: registered pin 140 (KB_ROW4 PR4) on 70000014.pinmux
pinctrl core: registered pin 141 (KB_ROW5 PR5) on 70000014.pinmux
pinctrl core: registered pin 142 (KB_ROW6 PR6) on 70000014.pinmux
pinctrl core: registered pin 143 (KB_ROW7 PR7) on 70000014.pinmux
pinctrl core: registered pin 144 (KB_ROW8 PS0) on 70000014.pinmux
pinctrl core: registered pin 145 (KB_ROW9 PS1) on 70000014.pinmux
pinctrl core: registered pin 146 (KB_ROW10 PS2) on 70000014.pinmux
pinctrl core: registered pin 147 (KB_ROW11 PS3) on 70000014.pinmux
pinctrl core: registered pin 148 (KB_ROW12 PS4) on 70000014.pinmux
pinctrl core: registered pin 149 (KB_ROW13 PS5) on 70000014.pinmux
pinctrl core: registered pin 150 (KB_ROW14 PS6) on 70000014.pinmux
pinctrl core: registered pin 151 (KB_ROW15 PS7) on 70000014.pinmux
pinctrl core: registered pin 152 (VI_PCLK PT0) on 70000014.pinmux
pinctrl core: registered pin 153 (VI_MCLK PT1) on 70000014.pinmux
pinctrl core: registered pin 154 (VD_D10 PT2) on 70000014.pinmux
pinctrl core: registered pin 155 (VI_D11 PT3) on 70000014.pinmux
pinctrl core: registered pin 156 (VI_D0 PT4) on 70000014.pinmux
pinctrl core: registered pin 157 (GEN2_I2C_SCL PT5) on 70000014.pinmux
pinctrl core: registered pin 158 (GEN2_I2C_SDA PT6) on 70000014.pinmux
pinctrl core: registered pin 159 (GMI_DPD PT7) on 70000014.pinmux
pinctrl core: registered pin 160 (PU0) on 70000014.pinmux
pinctrl core: registered pin 161 (PU1) on 70000014.pinmux
pinctrl core: registered pin 162 (PU2) on 70000014.pinmux
pinctrl core: registered pin 163 (PU3) on 70000014.pinmux
pinctrl core: registered pin 164 (PU4) on 70000014.pinmux
pinctrl core: registered pin 165 (PU5) on 70000014.pinmux
pinctrl core: registered pin 166 (PU6) on 70000014.pinmux
pinctrl core: registered pin 167 (JTAG_RTCK PU7) on 70000014.pinmux
pinctrl core: registered pin 168 (PV0) on 70000014.pinmux
pinctrl core: registered pin 169 (PV1) on 70000014.pinmux
pinctrl core: registered pin 170 (PV2) on 70000014.pinmux
pinctrl core: registered pin 171 (PV3) on 70000014.pinmux
pinctrl core: registered pin 172 (PV4) on 70000014.pinmux
pinctrl core: registered pin 173 (PV5) on 70000014.pinmux
pinctrl core: registered pin 174 (PV6) on 70000014.pinmux
pinctrl core: registered pin 175 (LCD_DC1 PV7) on 70000014.pinmux
pinctrl core: registered pin 176 (LCD_CS1_N PW0) on 70000014.pinmux
pinctrl core: registered pin 177 (LCD_M1 PW1) on 70000014.pinmux
pinctrl core: registered pin 178 (SPI2_CS1_N PW2) on 70000014.pinmux
pinctrl core: registered pin 179 (SPI2_CS2_N PW3) on 70000014.pinmux
pinctrl core: registered pin 180 (DAP_MCLK1 PW4) on 70000014.pinmux
pinctrl core: registered pin 181 (DAP_MCLK2 PW5) on 70000014.pinmux
pinctrl core: registered pin 182 (UART3_TXD PW6) on 70000014.pinmux
pinctrl core: registered pin 183 (UART3_RXD PW7) on 70000014.pinmux
pinctrl core: registered pin 184 (SPI2_MOSI PX0) on 70000014.pinmux
pinctrl core: registered pin 185 (SPI2_MISO PX1) on 70000014.pinmux
pinctrl core: registered pin 186 (SPI2_SCK PX2) on 70000014.pinmux
pinctrl core: registered pin 187 (SPI2_CS0_N PX3) on 70000014.pinmux
pinctrl core: registered pin 188 (SPI1_MOSI PX4) on 70000014.pinmux
pinctrl core: registered pin 189 (SPI1_SCK PX5) on 70000014.pinmux
pinctrl core: registered pin 190 (SPI1_CS0_N PX6) on 70000014.pinmux
pinctrl core: registered pin 191 (SPI1_MISO PX7) on 70000014.pinmux
pinctrl core: registered pin 192 (ULPI_CLK PY0) on 70000014.pinmux
pinctrl core: registered pin 193 (ULPI_DIR PY1) on 70000014.pinmux
pinctrl core: registered pin 194 (ULPI_NXT PY2) on 70000014.pinmux
pinctrl core: registered pin 195 (ULPI_STP PY3) on 70000014.pinmux
pinctrl core: registered pin 196 (SDIO1_DAT3 PY4) on 70000014.pinmux
pinctrl core: registered pin 197 (SDIO1_DAT2 PY5) on 70000014.pinmux
pinctrl core: registered pin 198 (SDIO1_DAT1 PY6) on 70000014.pinmux
pinctrl core: registered pin 199 (SDIO1_DAT0 PY7) on 70000014.pinmux
pinctrl core: registered pin 200 (SDIO1_CLK PZ0) on 70000014.pinmux
pinctrl core: registered pin 201 (SDIO1_CMD PZ1) on 70000014.pinmux
pinctrl core: registered pin 202 (LCD_SDIN PZ2) on 70000014.pinmux
pinctrl core: registered pin 203 (LCD_WR_N PZ3) on 70000014.pinmux
pinctrl core: registered pin 204 (LCD_SCK PZ4) on 70000014.pinmux
pinctrl core: registered pin 205 (SYS_CLK_REQ PZ5) on 70000014.pinmux
pinctrl core: registered pin 206 (PWR_I2C_SCL PZ6) on 70000014.pinmux
pinctrl core: registered pin 207 (PWR_I2C_SDA PZ7) on 70000014.pinmux
pinctrl core: registered pin 208 (GMI_AD20 PAA0) on 70000014.pinmux
pinctrl core: registered pin 209 (GMI_AD21 PAA1) on 70000014.pinmux
pinctrl core: registered pin 210 (GMI_AD22 PAA2) on 70000014.pinmux
pinctrl core: registered pin 211 (GMI_AD23 PAA3) on 70000014.pinmux
pinctrl core: registered pin 212 (GMI_AD24 PAA4) on 70000014.pinmux
pinctrl core: registered pin 213 (GMI_AD25 PAA5) on 70000014.pinmux
pinctrl core: registered pin 214 (GMI_AD26 PAA6) on 70000014.pinmux
pinctrl core: registered pin 215 (GMI_AD27 PAA7) on 70000014.pinmux
pinctrl core: registered pin 216 (LED_BLINK PBB0) on 70000014.pinmux
pinctrl core: registered pin 217 (VI_GP0 PBB1) on 70000014.pinmux
pinctrl core: registered pin 218 (CAM_I2C_SCL PBB2) on 70000014.pinmux
pinctrl core: registered pin 219 (CAM_I2C_SDA PBB3) on 70000014.pinmux
pinctrl core: registered pin 220 (VI_GP3 PBB4) on 70000014.pinmux
pinctrl core: registered pin 221 (VI_GP4 PBB5) on 70000014.pinmux
pinctrl core: registered pin 222 (PBB6) on 70000014.pinmux
pinctrl core: registered pin 223 (PBB7) on 70000014.pinmux
pinctrl core: registered pin 254 (CRT_HSYNC) on 70000014.pinmux
pinctrl core: registered pin 255 (CRT_VSYNC) on 70000014.pinmux
pinctrl core: registered pin 256 (DDC_SCL) on 70000014.pinmux
pinctrl core: registered pin 257 (DDC_SDA) on 70000014.pinmux
pinctrl core: registered pin 258 (OWC) on 70000014.pinmux
pinctrl core: registered pin 259 (CORE_PWR_REQ) on 70000014.pinmux
pinctrl core: registered pin 260 (CPU_PWR_REQ) on 70000014.pinmux
pinctrl core: registered pin 261 (PWR_INT_N) on 70000014.pinmux
pinctrl core: registered pin 262 (CLK_32_K_IN) on 70000014.pinmux
pinctrl core: registered pin 263 (DDR_COMP_PD) on 70000014.pinmux
pinctrl core: registered pin 264 (DDR_COMP_PU) on 70000014.pinmux
pinctrl core: registered pin 265 (DDR_A0) on 70000014.pinmux
pinctrl core: registered pin 266 (DDR_A1) on 70000014.pinmux
pinctrl core: registered pin 267 (DDR_A2) on 70000014.pinmux
pinctrl core: registered pin 268 (DDR_A3) on 70000014.pinmux
pinctrl core: registered pin 269 (DDR_A4) on 70000014.pinmux
pinctrl core: registered pin 270 (DDR_A5) on 70000014.pinmux
pinctrl core: registered pin 271 (DDR_A6) on 70000014.pinmux
pinctrl core: registered pin 272 (DDR_A7) on 70000014.pinmux
pinctrl core: registered pin 273 (DDR_A8) on 70000014.pinmux
pinctrl core: registered pin 274 (DDR_A9) on 70000014.pinmux
pinctrl core: registered pin 275 (DDR_A10) on 70000014.pinmux
pinctrl core: registered pin 276 (DDR_A11) on 70000014.pinmux
pinctrl core: registered pin 277 (DDR_A12) on 70000014.pinmux
pinctrl core: registered pin 278 (DDR_A13) on 70000014.pinmux
pinctrl core: registered pin 279 (DDR_A14) on 70000014.pinmux
pinctrl core: registered pin 280 (DDR_CAS_N) on 70000014.pinmux
pinctrl core: registered pin 281 (DDR_BA0) on 70000014.pinmux
pinctrl core: registered pin 282 (DDR_BA1) on 70000014.pinmux
pinctrl core: registered pin 283 (DDR_BA2) on 70000014.pinmux
pinctrl core: registered pin 284 (DDR_DQS0P) on 70000014.pinmux
pinctrl core: registered pin 285 (DDR_DQS0N) on 70000014.pinmux
pinctrl core: registered pin 286 (DDR_DQS1P) on 70000014.pinmux
pinctrl core: registered pin 287 (DDR_DQS1N) on 70000014.pinmux
pinctrl core: registered pin 288 (DDR_DQS2P) on 70000014.pinmux
pinctrl core: registered pin 289 (DDR_DQS2N) on 70000014.pinmux
pinctrl core: registered pin 290 (DDR_DQS3P) on 70000014.pinmux
pinctrl core: registered pin 291 (DDR_DQS3N) on 70000014.pinmux
pinctrl core: registered pin 292 (DDR_CKE0) on 70000014.pinmux
pinctrl core: registered pin 293 (DDR_CKE1) on 70000014.pinmux
pinctrl core: registered pin 294 (DDR_CLK) on 70000014.pinmux
pinctrl core: registered pin 295 (DDR_CLK_N) on 70000014.pinmux
pinctrl core: registered pin 296 (DDR_DM0) on 70000014.pinmux
pinctrl core: registered pin 297 (DDR_DM1) on 70000014.pinmux
pinctrl core: registered pin 298 (DDR_DM2) on 70000014.pinmux
pinctrl core: registered pin 299 (DDR_DM3) on 70000014.pinmux
pinctrl core: registered pin 300 (DDR_ODT) on 70000014.pinmux
pinctrl core: registered pin 301 (DDR_QUSE0) on 70000014.pinmux
pinctrl core: registered pin 302 (DDR_QUSE1) on 70000014.pinmux
pinctrl core: registered pin 303 (DDR_QUSE2) on 70000014.pinmux
pinctrl core: registered pin 304 (DDR_QUSE3) on 70000014.pinmux
pinctrl core: registered pin 305 (DDR_RAS_N) on 70000014.pinmux
pinctrl core: registered pin 306 (DDR_WE_N) on 70000014.pinmux
pinctrl core: registered pin 307 (DDR_DQ0) on 70000014.pinmux
pinctrl core: registered pin 308 (DDR_DQ1) on 70000014.pinmux
pinctrl core: registered pin 309 (DDR_DQ2) on 70000014.pinmux
pinctrl core: registered pin 310 (DDR_DQ3) on 70000014.pinmux
pinctrl core: registered pin 311 (DDR_DQ4) on 70000014.pinmux
pinctrl core: registered pin 312 (DDR_DQ5) on 70000014.pinmux
pinctrl core: registered pin 313 (DDR_DQ6) on 70000014.pinmux
pinctrl core: registered pin 314 (DDR_DQ7) on 70000014.pinmux
pinctrl core: registered pin 315 (DDR_DQ8) on 70000014.pinmux
pinctrl core: registered pin 316 (DDR_DQ9) on 70000014.pinmux
pinctrl core: registered pin 317 (DDR_DQ10) on 70000014.pinmux
pinctrl core: registered pin 318 (DDR_DQ11) on 70000014.pinmux
pinctrl core: registered pin 319 (DDR_DQ12) on 70000014.pinmux
pinctrl core: registered pin 320 (DDR_DQ13) on 70000014.pinmux
pinctrl core: registered pin 321 (DDR_DQ14) on 70000014.pinmux
pinctrl core: registered pin 322 (DDR_DQ15) on 70000014.pinmux
pinctrl core: registered pin 323 (DDR_DQ16) on 70000014.pinmux
pinctrl core: registered pin 324 (DDR_DQ17) on 70000014.pinmux
pinctrl core: registered pin 325 (DDR_DQ18) on 70000014.pinmux
pinctrl core: registered pin 326 (DDR_DQ19) on 70000014.pinmux
pinctrl core: registered pin 327 (DDR_DQ20) on 70000014.pinmux
pinctrl core: registered pin 328 (DDR_DQ21) on 70000014.pinmux
pinctrl core: registered pin 329 (DDR_DQ22) on 70000014.pinmux
pinctrl core: registered pin 330 (DDR_DQ23) on 70000014.pinmux
pinctrl core: registered pin 331 (DDR_DQ24) on 70000014.pinmux
pinctrl core: registered pin 332 (DDR_DQ25) on 70000014.pinmux
pinctrl core: registered pin 333 (DDR_DQ26) on 70000014.pinmux
pinctrl core: registered pin 334 (DDR_DQ27) on 70000014.pinmux
pinctrl core: registered pin 335 (DDR_DQ28) on 70000014.pinmux
pinctrl core: registered pin 336 (DDR_DQ29) on 70000014.pinmux
pinctrl core: registered pin 337 (DDR_DQ30) on 70000014.pinmux
pinctrl core: registered pin 338 (DDR_DQ31) on 70000014.pinmux
pinctrl core: registered pin 339 (DDR_CS0_N) on 70000014.pinmux
pinctrl core: registered pin 340 (DDR_CS1_N) on 70000014.pinmux
pinctrl core: registered pin 341 (SYS_RESET) on 70000014.pinmux
pinctrl core: registered pin 342 (JTAG_TRST_N) on 70000014.pinmux
pinctrl core: registered pin 343 (JTAG_TDO) on 70000014.pinmux
pinctrl core: registered pin 344 (JTAG_TMS) on 70000014.pinmux
pinctrl core: registered pin 345 (JTAG_TCK) on 70000014.pinmux
pinctrl core: registered pin 346 (JTAG_TDI) on 70000014.pinmux
pinctrl core: registered pin 347 (TEST_MODE_EN) on 70000014.pinmux
pinctrl core: add 230 pinmux maps
tegra20-pinctrl 70000014.pinmux: found group selector 0 for ata
tegra20-pinctrl 70000014.pinmux: found group selector 1 for atb
tegra20-pinctrl 70000014.pinmux: found group selector 20 for gma
tegra20-pinctrl 70000014.pinmux: found group selector 2 for atc
tegra20-pinctrl 70000014.pinmux: found group selector 21 for gmb
tegra20-pinctrl 70000014.pinmux: found group selector 3 for atd
tegra20-pinctrl 70000014.pinmux: found group selector 4 for ate
tegra20-pinctrl 70000014.pinmux: found group selector 24 for gme
tegra20-pinctrl 70000014.pinmux: found group selector 80 for pta
tegra20-pinctrl 70000014.pinmux: found group selector 5 for cdev1
tegra20-pinctrl 70000014.pinmux: found group selector 6 for cdev2
tegra20-pinctrl 70000014.pinmux: found group selector 7 for crtp
tegra20-pinctrl 70000014.pinmux: found group selector 8 for csus
tegra20-pinctrl 70000014.pinmux: found group selector 9 for dap1
tegra20-pinctrl 70000014.pinmux: found group selector 10 for dap2
tegra20-pinctrl 70000014.pinmux: found group selector 11 for dap3
tegra20-pinctrl 70000014.pinmux: found group selector 12 for dap4
tegra20-pinctrl 70000014.pinmux: found group selector 13 for ddc
tegra20-pinctrl 70000014.pinmux: found group selector 14 for dta
tegra20-pinctrl 70000014.pinmux: found group selector 15 for dtb
tegra20-pinctrl 70000014.pinmux: found group selector 16 for dtc
tegra20-pinctrl 70000014.pinmux: found group selector 17 for dtd
tegra20-pinctrl 70000014.pinmux: found group selector 18 for dte
tegra20-pinctrl 70000014.pinmux: found group selector 19 for dtf
tegra20-pinctrl 70000014.pinmux: found group selector 22 for gmc
tegra20-pinctrl 70000014.pinmux: found group selector 23 for gmd
tegra20-pinctrl 70000014.pinmux: found group selector 25 for gpu
tegra20-pinctrl 70000014.pinmux: found group selector 26 for gpu7
tegra20-pinctrl 70000014.pinmux: found group selector 27 for gpv
tegra20-pinctrl 70000014.pinmux: found group selector 86 for slxa
tegra20-pinctrl 70000014.pinmux: found group selector 89 for slxk
tegra20-pinctrl 70000014.pinmux: found group selector 28 for hdint
tegra20-pinctrl 70000014.pinmux: found group selector 29 for i2cp
tegra20-pinctrl 70000014.pinmux: found group selector 30 for irrx
tegra20-pinctrl 70000014.pinmux: found group selector 31 for irtx
tegra20-pinctrl 70000014.pinmux: found group selector 32 for kbca
tegra20-pinctrl 70000014.pinmux: found group selector 33 for kbcb
tegra20-pinctrl 70000014.pinmux: found group selector 34 for kbcc
tegra20-pinctrl 70000014.pinmux: found group selector 35 for kbcd
tegra20-pinctrl 70000014.pinmux: found group selector 36 for kbce
tegra20-pinctrl 70000014.pinmux: found group selector 37 for kbcf
tegra20-pinctrl 70000014.pinmux: found group selector 38 for lcsn
tegra20-pinctrl 70000014.pinmux: found group selector 39 for ld0
tegra20-pinctrl 70000014.pinmux: found group selector 40 for ld1
tegra20-pinctrl 70000014.pinmux: found group selector 41 for ld2
tegra20-pinctrl 70000014.pinmux: found group selector 42 for ld3
tegra20-pinctrl 70000014.pinmux: found group selector 43 for ld4
tegra20-pinctrl 70000014.pinmux: found group selector 44 for ld5
tegra20-pinctrl 70000014.pinmux: found group selector 45 for ld6
tegra20-pinctrl 70000014.pinmux: found group selector 46 for ld7
tegra20-pinctrl 70000014.pinmux: found group selector 47 for ld8
tegra20-pinctrl 70000014.pinmux: found group selector 48 for ld9
tegra20-pinctrl 70000014.pinmux: found group selector 49 for ld10
tegra20-pinctrl 70000014.pinmux: found group selector 50 for ld11
tegra20-pinctrl 70000014.pinmux: found group selector 51 for ld12
tegra20-pinctrl 70000014.pinmux: found group selector 52 for ld13
tegra20-pinctrl 70000014.pinmux: found group selector 53 for ld14
tegra20-pinctrl 70000014.pinmux: found group selector 54 for ld15
tegra20-pinctrl 70000014.pinmux: found group selector 55 for ld16
tegra20-pinctrl 70000014.pinmux: found group selector 56 for ld17
tegra20-pinctrl 70000014.pinmux: found group selector 57 for ldc
tegra20-pinctrl 70000014.pinmux: found group selector 58 for ldi
tegra20-pinctrl 70000014.pinmux: found group selector 59 for lhp0
tegra20-pinctrl 70000014.pinmux: found group selector 60 for lhp1
tegra20-pinctrl 70000014.pinmux: found group selector 61 for lhp2
tegra20-pinctrl 70000014.pinmux: found group selector 62 for lhs
tegra20-pinctrl 70000014.pinmux: found group selector 63 for lm0
tegra20-pinctrl 70000014.pinmux: found group selector 64 for lm1
tegra20-pinctrl 70000014.pinmux: found group selector 65 for lpp
tegra20-pinctrl 70000014.pinmux: found group selector 66 for lpw0
tegra20-pinctrl 70000014.pinmux: found group selector 67 for lpw1
tegra20-pinctrl 70000014.pinmux: found group selector 68 for lpw2
tegra20-pinctrl 70000014.pinmux: found group selector 69 for lsc0
tegra20-pinctrl 70000014.pinmux: found group selector 70 for lsc1
tegra20-pinctrl 70000014.pinmux: found group selector 71 for lsck
tegra20-pinctrl 70000014.pinmux: found group selector 72 for lsda
tegra20-pinctrl 70000014.pinmux: found group selector 73 for lsdi
tegra20-pinctrl 70000014.pinmux: found group selector 74 for lspi
tegra20-pinctrl 70000014.pinmux: found group selector 75 for lvp0
tegra20-pinctrl 70000014.pinmux: found group selector 76 for lvp1
tegra20-pinctrl 70000014.pinmux: found group selector 77 for lvs
tegra20-pinctrl 70000014.pinmux: found group selector 78 for owc
tegra20-pinctrl 70000014.pinmux: found group selector 102 for uac
tegra20-pinctrl 70000014.pinmux: found group selector 79 for pmc
tegra20-pinctrl 70000014.pinmux: found group selector 81 for rm
tegra20-pinctrl 70000014.pinmux: found group selector 82 for sdb
tegra20-pinctrl 70000014.pinmux: found group selector 83 for sdc
tegra20-pinctrl 70000014.pinmux: found group selector 84 for sdd
tegra20-pinctrl 70000014.pinmux: found group selector 85 for sdio1
tegra20-pinctrl 70000014.pinmux: found group selector 87 for slxc
tegra20-pinctrl 70000014.pinmux: found group selector 88 for slxd
tegra20-pinctrl 70000014.pinmux: found group selector 90 for spdi
tegra20-pinctrl 70000014.pinmux: found group selector 91 for spdo
tegra20-pinctrl 70000014.pinmux: found group selector 92 for spia
tegra20-pinctrl 70000014.pinmux: found group selector 93 for spib
tegra20-pinctrl 70000014.pinmux: found group selector 94 for spic
tegra20-pinctrl 70000014.pinmux: found group selector 95 for spid
tegra20-pinctrl 70000014.pinmux: found group selector 96 for spie
tegra20-pinctrl 70000014.pinmux: found group selector 97 for spif
tegra20-pinctrl 70000014.pinmux: found group selector 98 for spig
tegra20-pinctrl 70000014.pinmux: found group selector 99 for spih
tegra20-pinctrl 70000014.pinmux: found group selector 100 for uaa
tegra20-pinctrl 70000014.pinmux: found group selector 101 for uab
tegra20-pinctrl 70000014.pinmux: found group selector 106 for uda
tegra20-pinctrl 70000014.pinmux: found group selector 103 for uad
tegra20-pinctrl 70000014.pinmux: found group selector 104 for uca
tegra20-pinctrl 70000014.pinmux: found group selector 105 for ucb
tegra20-pinctrl 70000014.pinmux: found group selector 0 for ata
tegra20-pinctrl 70000014.pinmux: found group selector 2 for atc
tegra20-pinctrl 70000014.pinmux: found group selector 3 for atd
tegra20-pinctrl 70000014.pinmux: found group selector 4 for ate
tegra20-pinctrl 70000014.pinmux: found group selector 7 for crtp
tegra20-pinctrl 70000014.pinmux: found group selector 10 for dap2
tegra20-pinctrl 70000014.pinmux: found group selector 11 for dap3
tegra20-pinctrl 70000014.pinmux: found group selector 12 for dap4
tegra20-pinctrl 70000014.pinmux: found group selector 14 for dta
tegra20-pinctrl 70000014.pinmux: found group selector 15 for dtb
tegra20-pinctrl 70000014.pinmux: found group selector 16 for dtc
tegra20-pinctrl 70000014.pinmux: found group selector 17 for dtd
tegra20-pinctrl 70000014.pinmux: found group selector 18 for dte
tegra20-pinctrl 70000014.pinmux: found group selector 21 for gmb
tegra20-pinctrl 70000014.pinmux: found group selector 24 for gme
tegra20-pinctrl 70000014.pinmux: found group selector 29 for i2cp
tegra20-pinctrl 70000014.pinmux: found group selector 80 for pta
tegra20-pinctrl 70000014.pinmux: found group selector 87 for slxc
tegra20-pinctrl 70000014.pinmux: found group selector 88 for slxd
tegra20-pinctrl 70000014.pinmux: found group selector 90 for spdi
tegra20-pinctrl 70000014.pinmux: found group selector 91 for spdo
tegra20-pinctrl 70000014.pinmux: found group selector 106 for uda
tegra20-pinctrl 70000014.pinmux: found group selector 1 for atb
tegra20-pinctrl 70000014.pinmux: found group selector 5 for cdev1
tegra20-pinctrl 70000014.pinmux: found group selector 6 for cdev2
tegra20-pinctrl 70000014.pinmux: found group selector 9 for dap1
tegra20-pinctrl 70000014.pinmux: found group selector 20 for gma
tegra20-pinctrl 70000014.pinmux: found group selector 22 for gmc
tegra20-pinctrl 70000014.pinmux: found group selector 23 for gmd
tegra20-pinctrl 70000014.pinmux: found group selector 25 for gpu
tegra20-pinctrl 70000014.pinmux: found group selector 26 for gpu7
tegra20-pinctrl 70000014.pinmux: found group selector 27 for gpv
tegra20-pinctrl 70000014.pinmux: found group selector 85 for sdio1
tegra20-pinctrl 70000014.pinmux: found group selector 86 for slxa
tegra20-pinctrl 70000014.pinmux: found group selector 89 for slxk
tegra20-pinctrl 70000014.pinmux: found group selector 102 for uac
tegra20-pinctrl 70000014.pinmux: found group selector 107 for ck32
tegra20-pinctrl 70000014.pinmux: found group selector 108 for ddrc
tegra20-pinctrl 70000014.pinmux: found group selector 109 for pmca
tegra20-pinctrl 70000014.pinmux: found group selector 110 for pmcb
tegra20-pinctrl 70000014.pinmux: found group selector 111 for pmcc
tegra20-pinctrl 70000014.pinmux: found group selector 112 for pmcd
tegra20-pinctrl 70000014.pinmux: found group selector 113 for pmce
tegra20-pinctrl 70000014.pinmux: found group selector 114 for xm2c
tegra20-pinctrl 70000014.pinmux: found group selector 115 for xm2d
tegra20-pinctrl 70000014.pinmux: found group selector 8 for csus
tegra20-pinctrl 70000014.pinmux: found group selector 92 for spia
tegra20-pinctrl 70000014.pinmux: found group selector 93 for spib
tegra20-pinctrl 70000014.pinmux: found group selector 95 for spid
tegra20-pinctrl 70000014.pinmux: found group selector 97 for spif
tegra20-pinctrl 70000014.pinmux: found group selector 13 for ddc
tegra20-pinctrl 70000014.pinmux: found group selector 19 for dtf
tegra20-pinctrl 70000014.pinmux: found group selector 81 for rm
tegra20-pinctrl 70000014.pinmux: found group selector 83 for sdc
tegra20-pinctrl 70000014.pinmux: found group selector 84 for sdd
tegra20-pinctrl 70000014.pinmux: found group selector 28 for hdint
tegra20-pinctrl 70000014.pinmux: found group selector 38 for lcsn
tegra20-pinctrl 70000014.pinmux: found group selector 57 for ldc
tegra20-pinctrl 70000014.pinmux: found group selector 64 for lm1
tegra20-pinctrl 70000014.pinmux: found group selector 67 for lpw1
tegra20-pinctrl 70000014.pinmux: found group selector 70 for lsc1
tegra20-pinctrl 70000014.pinmux: found group selector 71 for lsck
tegra20-pinctrl 70000014.pinmux: found group selector 72 for lsda
tegra20-pinctrl 70000014.pinmux: found group selector 73 for lsdi
tegra20-pinctrl 70000014.pinmux: found group selector 75 for lvp0
tegra20-pinctrl 70000014.pinmux: found group selector 79 for pmc
tegra20-pinctrl 70000014.pinmux: found group selector 30 for irrx
tegra20-pinctrl 70000014.pinmux: found group selector 31 for irtx
tegra20-pinctrl 70000014.pinmux: found group selector 32 for kbca
tegra20-pinctrl 70000014.pinmux: found group selector 33 for kbcb
tegra20-pinctrl 70000014.pinmux: found group selector 34 for kbcc
tegra20-pinctrl 70000014.pinmux: found group selector 35 for kbcd
tegra20-pinctrl 70000014.pinmux: found group selector 36 for kbce
tegra20-pinctrl 70000014.pinmux: found group selector 37 for kbcf
tegra20-pinctrl 70000014.pinmux: found group selector 78 for owc
tegra20-pinctrl 70000014.pinmux: found group selector 94 for spic
tegra20-pinctrl 70000014.pinmux: found group selector 96 for spie
tegra20-pinctrl 70000014.pinmux: found group selector 98 for spig
tegra20-pinctrl 70000014.pinmux: found group selector 99 for spih
tegra20-pinctrl 70000014.pinmux: found group selector 100 for uaa
tegra20-pinctrl 70000014.pinmux: found group selector 101 for uab
tegra20-pinctrl 70000014.pinmux: found group selector 103 for uad
tegra20-pinctrl 70000014.pinmux: found group selector 104 for uca
tegra20-pinctrl 70000014.pinmux: found group selector 105 for ucb
tegra20-pinctrl 70000014.pinmux: found group selector 117 for lc
tegra20-pinctrl 70000014.pinmux: found group selector 116 for ls
tegra20-pinctrl 70000014.pinmux: found group selector 39 for ld0
tegra20-pinctrl 70000014.pinmux: found group selector 40 for ld1
tegra20-pinctrl 70000014.pinmux: found group selector 41 for ld2
tegra20-pinctrl 70000014.pinmux: found group selector 42 for ld3
tegra20-pinctrl 70000014.pinmux: found group selector 43 for ld4
tegra20-pinctrl 70000014.pinmux: found group selector 44 for ld5
tegra20-pinctrl 70000014.pinmux: found group selector 45 for ld6
tegra20-pinctrl 70000014.pinmux: found group selector 46 for ld7
tegra20-pinctrl 70000014.pinmux: found group selector 47 for ld8
tegra20-pinctrl 70000014.pinmux: found group selector 48 for ld9
tegra20-pinctrl 70000014.pinmux: found group selector 49 for ld10
tegra20-pinctrl 70000014.pinmux: found group selector 50 for ld11
tegra20-pinctrl 70000014.pinmux: found group selector 51 for ld12
tegra20-pinctrl 70000014.pinmux: found group selector 52 for ld13
tegra20-pinctrl 70000014.pinmux: found group selector 53 for ld14
tegra20-pinctrl 70000014.pinmux: found group selector 54 for ld15
tegra20-pinctrl 70000014.pinmux: found group selector 55 for ld16
tegra20-pinctrl 70000014.pinmux: found group selector 56 for ld17
tegra20-pinctrl 70000014.pinmux: found group selector 58 for ldi
tegra20-pinctrl 70000014.pinmux: found group selector 59 for lhp0
tegra20-pinctrl 70000014.pinmux: found group selector 60 for lhp1
tegra20-pinctrl 70000014.pinmux: found group selector 61 for lhp2
tegra20-pinctrl 70000014.pinmux: found group selector 62 for lhs
tegra20-pinctrl 70000014.pinmux: found group selector 63 for lm0
tegra20-pinctrl 70000014.pinmux: found group selector 65 for lpp
tegra20-pinctrl 70000014.pinmux: found group selector 66 for lpw0
tegra20-pinctrl 70000014.pinmux: found group selector 68 for lpw2
tegra20-pinctrl 70000014.pinmux: found group selector 69 for lsc0
tegra20-pinctrl 70000014.pinmux: found group selector 74 for lspi
tegra20-pinctrl 70000014.pinmux: found group selector 76 for lvp1
tegra20-pinctrl 70000014.pinmux: found group selector 77 for lvs
tegra20-pinctrl 70000014.pinmux: found group selector 82 for sdb
tegra20-pinctrl 70000014.pinmux: found group selector 118 for ld17_0
tegra20-pinctrl 70000014.pinmux: found group selector 119 for ld19_18
tegra20-pinctrl 70000014.pinmux: found group selector 120 for ld21_20
tegra20-pinctrl 70000014.pinmux: found group selector 121 for ld23_22
tegra20-pinctrl 70000014.pinmux: found group selector 97 for spif
tegra20-pinctrl 70000014.pinmux: request pin 67 (GMI_CS6_N PI3) for 7000001=
4.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 70 (GMI_CS7_N PI6) for 7000001=
4.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 68 (GMI_RST_N PI4) for 7000001=
4.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 66 (GMI_CS5_N PI2) for 7000001=
4.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 159 (GMI_DPD PT7) for 70000014=
=2Epinmux
tegra20-pinctrl 70000014.pinmux: request pin 208 (GMI_AD20 PAA0) for 700000=
14.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 209 (GMI_AD21 PAA1) for 700000=
14.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 210 (GMI_AD22 PAA2) for 700000=
14.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 211 (GMI_AD23 PAA3) for 700000=
14.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 69 (GMI_IORDY PI5) for 7000001=
4.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 71 (GMI_WAIT PI7) for 70000014=
=2Epinmux
tegra20-pinctrl 70000014.pinmux: request pin 80 (GMI_ADV_N PK0) for 7000001=
4.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 81 (GMI_CLK PK1) for 70000014.=
pinmux
tegra20-pinctrl 70000014.pinmux: request pin 83 (GMI_CS2_N PK3) for 7000001=
4.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 84 (GMI_CS3_N PK4) for 7000001=
4.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 82 (GMI_CS4_N PK2) for 7000001=
4.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 48 (GMI_AD0 PG0) for 70000014.=
pinmux
tegra20-pinctrl 70000014.pinmux: request pin 49 (GMI_AD1 PG1) for 70000014.=
pinmux
tegra20-pinctrl 70000014.pinmux: request pin 50 (GMI_AD2 PG2) for 70000014.=
pinmux
tegra20-pinctrl 70000014.pinmux: request pin 51 (GMI_AD3 PG3) for 70000014.=
pinmux
tegra20-pinctrl 70000014.pinmux: request pin 52 (GMI_AD4 PG4) for 70000014.=
pinmux
tegra20-pinctrl 70000014.pinmux: request pin 53 (GMI_AD5 PG5) for 70000014.=
pinmux
tegra20-pinctrl 70000014.pinmux: request pin 54 (GMI_AD6 PG6) for 70000014.=
pinmux
tegra20-pinctrl 70000014.pinmux: request pin 55 (GMI_AD7 PG7) for 70000014.=
pinmux
tegra20-pinctrl 70000014.pinmux: request pin 64 (GMI_HIOW_N PI0) for 700000=
14.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 65 (GMI_HIOR_N PI1) for 700000=
14.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 23 (GMI_WP_N PC7) for 70000014=
=2Epinmux
tegra20-pinctrl 70000014.pinmux: request pin 56 (GMI_AD8 PH0) for 70000014.=
pinmux
tegra20-pinctrl 70000014.pinmux: request pin 57 (GMI_AD9 PH1) for 70000014.=
pinmux
tegra20-pinctrl 70000014.pinmux: request pin 58 (GMI_AD10 PH2) for 70000014=
=2Epinmux
tegra20-pinctrl 70000014.pinmux: request pin 59 (GMI_AD11 PH3) for 70000014=
=2Epinmux
tegra20-pinctrl 70000014.pinmux: request pin 60 (GMI_AD12 PH4) for 70000014=
=2Epinmux
tegra20-pinctrl 70000014.pinmux: request pin 61 (GMI_AD13 PH5) for 70000014=
=2Epinmux
tegra20-pinctrl 70000014.pinmux: request pin 62 (GMI_AD14 PH6) for 70000014=
=2Epinmux
tegra20-pinctrl 70000014.pinmux: request pin 63 (GMI_AD15 PH7) for 70000014=
=2Epinmux
tegra20-pinctrl 70000014.pinmux: request pin 212 (GMI_AD24 PAA4) for 700000=
14.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 213 (GMI_AD25 PAA5) for 700000=
14.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 214 (GMI_AD26 PAA6) for 700000=
14.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 215 (GMI_AD27 PAA7) for 700000=
14.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 157 (GEN2_I2C_SCL PT5) for 700=
00014.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 158 (GEN2_I2C_SDA PT6) for 700=
00014.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 180 (DAP_MCLK1 PW4) for 700000=
14.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 181 (DAP_MCLK2 PW5) for 700000=
14.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 254 (CRT_HSYNC) for 70000014.p=
inmux
tegra20-pinctrl 70000014.pinmux: request pin 255 (CRT_VSYNC) for 70000014.p=
inmux
tegra20-pinctrl 70000014.pinmux: request pin 153 (VI_MCLK PT1) for 70000014=
=2Epinmux
tegra20-pinctrl 70000014.pinmux: request pin 104 (DAP1_FS PN0) for 70000014=
=2Epinmux
tegra20-pinctrl 70000014.pinmux: request pin 105 (DAP1_DIN PN1) for 7000001=
4.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 106 (DAP1_DOUT PN2) for 700000=
14.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 107 (DAP1_SCLK PN3) for 700000=
14.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 2 (DAP2_FS PA2) for 70000014.p=
inmux
tegra20-pinctrl 70000014.pinmux: request pin 3 (DAP2_SCLK PA3) for 70000014=
=2Epinmux
tegra20-pinctrl 70000014.pinmux: request pin 4 (DAP2_DIN PA4) for 70000014.=
pinmux
tegra20-pinctrl 70000014.pinmux: request pin 5 (DAP2_DOUT PA5) for 70000014=
=2Epinmux
tegra20-pinctrl 70000014.pinmux: request pin 120 (DAP3_FS PP0) for 70000014=
=2Epinmux
tegra20-pinctrl 70000014.pinmux: request pin 121 (DAP3_DIN PP1) for 7000001=
4.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 122 (DAP3_DOUT PP2) for 700000=
14.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 123 (DAP3_SCLK PP3) for 700000=
14.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 124 (DAP4_FS PP4) for 70000014=
=2Epinmux
tegra20-pinctrl 70000014.pinmux: request pin 125 (DAP4_DIN PP5) for 7000001=
4.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 126 (DAP4_DOUT PP6) for 700000=
14.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 127 (DAP4_SCLK PP7) for 700000=
14.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 256 (DDC_SCL) for 70000014.pin=
mux
tegra20-pinctrl 70000014.pinmux: request pin 257 (DDC_SDA) for 70000014.pin=
mux
tegra20-pinctrl 70000014.pinmux: request pin 156 (VI_D0 PT4) for 70000014.p=
inmux
tegra20-pinctrl 70000014.pinmux: request pin 29 (VI_D1 PD5) for 70000014.pi=
nmux
tegra20-pinctrl 70000014.pinmux: request pin 154 (VD_D10 PT2) for 70000014.=
pinmux
tegra20-pinctrl 70000014.pinmux: request pin 155 (VI_D11 PT3) for 70000014.=
pinmux
tegra20-pinctrl 70000014.pinmux: request pin 31 (VI_HSYNC PD7) for 70000014=
=2Epinmux
tegra20-pinctrl 70000014.pinmux: request pin 30 (VI_VSYNC PD6) for 70000014=
=2Epinmux
tegra20-pinctrl 70000014.pinmux: request pin 152 (VI_PCLK PT0) for 70000014=
=2Epinmux
tegra20-pinctrl 70000014.pinmux: request pin 88 (VI_D2 PL0) for 70000014.pi=
nmux
tegra20-pinctrl 70000014.pinmux: request pin 89 (VI_D3 PL1) for 70000014.pi=
nmux
tegra20-pinctrl 70000014.pinmux: request pin 90 (VI_D4 PL2) for 70000014.pi=
nmux
tegra20-pinctrl 70000014.pinmux: request pin 91 (VI_D5 PL3) for 70000014.pi=
nmux
tegra20-pinctrl 70000014.pinmux: request pin 92 (VI_D6 PL4) for 70000014.pi=
nmux
tegra20-pinctrl 70000014.pinmux: request pin 93 (VI_D7 PL5) for 70000014.pi=
nmux
tegra20-pinctrl 70000014.pinmux: request pin 94 (VI_D8 PL6) for 70000014.pi=
nmux
tegra20-pinctrl 70000014.pinmux: request pin 95 (VI_D9 PL7) for 70000014.pi=
nmux
tegra20-pinctrl 70000014.pinmux: request pin 217 (VI_GP0 PBB1) for 70000014=
=2Epinmux
tegra20-pinctrl 70000014.pinmux: request pin 220 (VI_GP3 PBB4) for 70000014=
=2Epinmux
tegra20-pinctrl 70000014.pinmux: request pin 221 (VI_GP4 PBB5) for 70000014=
=2Epinmux
tegra20-pinctrl 70000014.pinmux: request pin 26 (VI_GP5 PD2) for 70000014.p=
inmux
tegra20-pinctrl 70000014.pinmux: request pin 0 (VI_GP6 PA0) for 70000014.pi=
nmux
tegra20-pinctrl 70000014.pinmux: request pin 218 (CAM_I2C_SCL PBB2) for 700=
00014.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 219 (CAM_I2C_SDA PBB3) for 700=
00014.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 79 (GMI_AD16 PJ7) for 70000014=
=2Epinmux
tegra20-pinctrl 70000014.pinmux: request pin 8 (GMI_AD17 PB0) for 70000014.=
pinmux
tegra20-pinctrl 70000014.pinmux: request pin 9 (GMI_AD18 PB1) for 70000014.=
pinmux
tegra20-pinctrl 70000014.pinmux: request pin 87 (GMI_AD19 PK7) for 70000014=
=2Epinmux
tegra20-pinctrl 70000014.pinmux: request pin 72 (GMI_CS0_N PJ0) for 7000001=
4.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 74 (GMI_CS1_N PJ2) for 7000001=
4.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 160 (PU0) for 70000014.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 161 (PU1) for 70000014.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 162 (PU2) for 70000014.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 163 (PU3) for 70000014.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 164 (PU4) for 70000014.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 165 (PU5) for 70000014.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 166 (PU6) for 70000014.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 167 (JTAG_RTCK PU7) for 700000=
14.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 172 (PV4) for 70000014.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 173 (PV5) for 70000014.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 174 (PV6) for 70000014.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 25 (SDIO3_DAT4 PD1) for 700000=
14.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 24 (SDIO3_DAT5 PD0) for 700000=
14.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 111 (HDMI_INT_N PN7) for 70000=
014.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 206 (PWR_I2C_SCL PZ6) for 7000=
0014.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 207 (PWR_I2C_SDA PZ7) for 7000=
0014.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 78 (UART2_RTS_N PJ6) for 70000=
014.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 77 (UART2_CTS_N PJ5) for 70000=
014.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 136 (KB_ROW0 PR0) for 70000014=
=2Epinmux
tegra20-pinctrl 70000014.pinmux: request pin 137 (KB_ROW1 PR1) for 70000014=
=2Epinmux
tegra20-pinctrl 70000014.pinmux: request pin 138 (KB_ROW2 PR2) for 70000014=
=2Epinmux
tegra20-pinctrl 70000014.pinmux: request pin 143 (KB_ROW7 PR7) for 70000014=
=2Epinmux
tegra20-pinctrl 70000014.pinmux: request pin 144 (KB_ROW8 PS0) for 70000014=
=2Epinmux
tegra20-pinctrl 70000014.pinmux: request pin 145 (KB_ROW9 PS1) for 70000014=
=2Epinmux
tegra20-pinctrl 70000014.pinmux: request pin 146 (KB_ROW10 PS2) for 7000001=
4.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 147 (KB_ROW11 PS3) for 7000001=
4.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 148 (KB_ROW12 PS4) for 7000001=
4.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 149 (KB_ROW13 PS5) for 7000001=
4.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 150 (KB_ROW14 PS6) for 7000001=
4.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 151 (KB_ROW15 PS7) for 7000001=
4.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 128 (KB_COL0 PQ0) for 70000014=
=2Epinmux
tegra20-pinctrl 70000014.pinmux: request pin 129 (KB_COL1 PQ1) for 70000014=
=2Epinmux
tegra20-pinctrl 70000014.pinmux: request pin 139 (KB_ROW3 PR3) for 70000014=
=2Epinmux
tegra20-pinctrl 70000014.pinmux: request pin 140 (KB_ROW4 PR4) for 70000014=
=2Epinmux
tegra20-pinctrl 70000014.pinmux: request pin 141 (KB_ROW5 PR5) for 70000014=
=2Epinmux
tegra20-pinctrl 70000014.pinmux: request pin 142 (KB_ROW6 PR6) for 70000014=
=2Epinmux
tegra20-pinctrl 70000014.pinmux: request pin 135 (KB_COL7 PQ7) for 70000014=
=2Epinmux
tegra20-pinctrl 70000014.pinmux: request pin 130 (KB_COL2 PQ2) for 70000014=
=2Epinmux
tegra20-pinctrl 70000014.pinmux: request pin 131 (KB_COL3 PQ3) for 70000014=
=2Epinmux
tegra20-pinctrl 70000014.pinmux: request pin 132 (KB_COL4 PQ4) for 70000014=
=2Epinmux
tegra20-pinctrl 70000014.pinmux: request pin 133 (KB_COL5 PQ5) for 70000014=
=2Epinmux
tegra20-pinctrl 70000014.pinmux: request pin 134 (KB_COL6 PQ6) for 70000014=
=2Epinmux
tegra20-pinctrl 70000014.pinmux: request pin 108 (LCD_CS0_N PN4) for 700000=
14.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 32 (LCD_D0 PE0) for 70000014.p=
inmux
tegra20-pinctrl 70000014.pinmux: request pin 33 (LCD_D1 PE1) for 70000014.p=
inmux
tegra20-pinctrl 70000014.pinmux: request pin 34 (LCD_D2 PE2) for 70000014.p=
inmux
tegra20-pinctrl 70000014.pinmux: request pin 35 (LCD_D3 PE3) for 70000014.p=
inmux
tegra20-pinctrl 70000014.pinmux: request pin 36 (LCD_D4 PE4) for 70000014.p=
inmux
tegra20-pinctrl 70000014.pinmux: request pin 37 (LCD_D5 PE5) for 70000014.p=
inmux
tegra20-pinctrl 70000014.pinmux: request pin 38 (LCD_D6 PE6) for 70000014.p=
inmux
tegra20-pinctrl 70000014.pinmux: request pin 39 (LCD_D7 PE7) for 70000014.p=
inmux
tegra20-pinctrl 70000014.pinmux: request pin 40 (LCD_D8 PF0) for 70000014.p=
inmux
tegra20-pinctrl 70000014.pinmux: request pin 41 (LCD_D9 PF1) for 70000014.p=
inmux
tegra20-pinctrl 70000014.pinmux: request pin 42 (LCD_D10 PF2) for 70000014.=
pinmux
tegra20-pinctrl 70000014.pinmux: request pin 43 (LCD_D11 PF3) for 70000014.=
pinmux
tegra20-pinctrl 70000014.pinmux: request pin 44 (LCD_D12 PF4) for 70000014.=
pinmux
tegra20-pinctrl 70000014.pinmux: request pin 45 (LCD_D13 PF5) for 70000014.=
pinmux
tegra20-pinctrl 70000014.pinmux: request pin 46 (LCD_D14 PF6) for 70000014.=
pinmux
tegra20-pinctrl 70000014.pinmux: request pin 47 (LCD_D15 PF7) for 70000014.=
pinmux
tegra20-pinctrl 70000014.pinmux: request pin 96 (LCD_D16 PM0) for 70000014.=
pinmux
tegra20-pinctrl 70000014.pinmux: request pin 97 (LCD_D17 PM1) for 70000014.=
pinmux
tegra20-pinctrl 70000014.pinmux: request pin 110 (LCD_DC0 PN6) for 70000014=
=2Epinmux
tegra20-pinctrl 70000014.pinmux: request pin 102 (LCD_D22 PM6) for 70000014=
=2Epinmux
tegra20-pinctrl 70000014.pinmux: request pin 101 (LCD_D21 PM5) for 70000014=
=2Epinmux
tegra20-pinctrl 70000014.pinmux: request pin 98 (LCD_D18 PM2) for 70000014.=
pinmux
tegra20-pinctrl 70000014.pinmux: request pin 99 (LCD_D19 PM3) for 70000014.=
pinmux
tegra20-pinctrl 70000014.pinmux: request pin 75 (LCD_HSYNC PJ3) for 7000001=
4.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 176 (LCD_CS1_N PW0) for 700000=
14.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 177 (LCD_M1 PW1) for 70000014.=
pinmux
tegra20-pinctrl 70000014.pinmux: request pin 103 (LCD_D23 PM7) for 70000014=
=2Epinmux
tegra20-pinctrl 70000014.pinmux: request pin 10 (LCD_PWR0 PB2) for 70000014=
=2Epinmux
tegra20-pinctrl 70000014.pinmux: request pin 17 (LCD_PWR1 PC1) for 70000014=
=2Epinmux
tegra20-pinctrl 70000014.pinmux: request pin 22 (LCD_PWR2 PC6) for 70000014=
=2Epinmux
tegra20-pinctrl 70000014.pinmux: request pin 11 (LCD_PCLK PB3) for 70000014=
=2Epinmux
tegra20-pinctrl 70000014.pinmux: request pin 203 (LCD_WR_N PZ3) for 7000001=
4.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 204 (LCD_SCK PZ4) for 70000014=
=2Epinmux
tegra20-pinctrl 70000014.pinmux: request pin 109 (LCD_SDOUT PN5) for 700000=
14.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 202 (LCD_SDIN PZ2) for 7000001=
4.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 73 (LCD_DE PJ1) for 70000014.p=
inmux
tegra20-pinctrl 70000014.pinmux: request pin 175 (LCD_DC1 PV7) for 70000014=
=2Epinmux
tegra20-pinctrl 70000014.pinmux: request pin 100 (LCD_D20 PM4) for 70000014=
=2Epinmux
tegra20-pinctrl 70000014.pinmux: request pin 76 (LCD_VSYNC PJ4) for 7000001=
4.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 258 (OWC) for 70000014.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 168 (PV0) for 70000014.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 169 (PV1) for 70000014.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 170 (PV2) for 70000014.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 171 (PV3) for 70000014.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 216 (LED_BLINK PBB0) for 70000=
014.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 205 (SYS_CLK_REQ PZ5) for 7000=
0014.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 259 (CORE_PWR_REQ) for 7000001=
4.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 260 (CPU_PWR_REQ) for 70000014=
=2Epinmux
tegra20-pinctrl 70000014.pinmux: request pin 261 (PWR_INT_N) for 70000014.p=
inmux
tegra20-pinctrl 70000014.pinmux: request pin 20 (GEN1_I2C_SCL PC4) for 7000=
0014.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 21 (GEN1_I2C_SDA PC5) for 7000=
0014.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 7 (SDIO3_CMD PA7) for 70000014=
=2Epinmux
tegra20-pinctrl 70000014.pinmux: request pin 15 (SDIO3_DAT0 PB7) for 700000=
14.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 14 (SDIO3_DAT1 PB6) for 700000=
14.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 13 (SDIO3_DAT2 PB5) for 700000=
14.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 12 (SDIO3_DAT3 PB4) for 700000=
14.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 6 (SDIO3_CLK PA6) for 70000014=
=2Epinmux
tegra20-pinctrl 70000014.pinmux: request pin 200 (SDIO1_CLK PZ0) for 700000=
14.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 201 (SDIO1_CMD PZ1) for 700000=
14.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 199 (SDIO1_DAT0 PY7) for 70000=
014.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 198 (SDIO1_DAT1 PY6) for 70000=
014.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 197 (SDIO1_DAT2 PY5) for 70000=
014.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 196 (SDIO1_DAT3 PY4) for 70000=
014.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 27 (SDIO3_DAT6 PD3) for 700000=
14.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 28 (SDIO3_DAT7 PD4) for 700000=
14.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 86 (SPDIF_IN PK6) for 70000014=
=2Epinmux
tegra20-pinctrl 70000014.pinmux: request pin 85 (SPDIF_OUT PK5) for 7000001=
4.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 184 (SPI2_MOSI PX0) for 700000=
14.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 185 (SPI2_MISO PX1) for 700000=
14.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 187 (SPI2_CS0_N PX3) for 70000=
014.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 186 (SPI2_SCK PX2) for 7000001=
4.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 188 (SPI1_MOSI PX4) for 700000=
14.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 190 (SPI1_CS0_N PX6) for 70000=
014.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 189 (SPI1_SCK PX5) for 7000001=
4.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 191 (SPI1_MISO PX7) for 700000=
14.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 178 (SPI2_CS1_N PW2) for 70000=
014.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 179 (SPI2_CS2_N PW3) for 70000=
014.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 113 (ULPI_DATA0 PO1) for 70000=
014.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 114 (ULPI_DATA1 PO2) for 70000=
014.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 115 (ULPI_DATA2 PO3) for 70000=
014.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 116 (ULPI_DATA3 PO4) for 70000=
014.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 117 (ULPI_DATA4 PO5) for 70000=
014.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 118 (ULPI_DATA5 PO6) for 70000=
014.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 119 (ULPI_DATA6 PO7) for 70000=
014.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 112 (ULPI_DATA7 PO0) for 70000=
014.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 192 (ULPI_CLK PY0) for 7000001=
4.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 193 (ULPI_DIR PY1) for 7000001=
4.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 194 (ULPI_NXT PY2) for 7000001=
4.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 195 (ULPI_STP PY3) for 7000001=
4.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 19 (UART2_RXD PC3) for 7000001=
4.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 18 (UART2_TXD PC2) for 7000001=
4.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 183 (UART3_RXD PW7) for 700000=
14.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 182 (UART3_TXD PW6) for 700000=
14.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 1 (UART3_CTS_N PA1) for 700000=
14.pinmux
tegra20-pinctrl 70000014.pinmux: request pin 16 (UART3_RTS_N PC0) for 70000=
014.pinmux
tegra20-pinctrl 70000014.pinmux: failed to lookup the sleep state
tegra20-pinctrl 70000014.pinmux: Probed Tegra pinctrl driver
bio: create slab <bio-0> at 0
avdd_hdmi: 3300 mV=20
avdd_hdmi_pll: 1800 mV=20
tegra20-pinctrl 70000014.pinmux: request pin 170 (PV2) for Tegra GPIOs:170
usb1_vbus: 5000 mV=20
pci_clk: 3300 mV=20
pci_vdd: 1050 mV=20
Switched to clocksource timer_us
NET: Registered protocol family 2
TCP established hash table entries: 8192 (order: 3, 32768 bytes)
TCP bind hash table entries: 8192 (order: 4, 65536 bytes)
TCP: Hash tables configured (established 8192 bind 8192)
TCP: reno registered
UDP hash table entries: 512 (order: 2, 16384 bytes)
UDP-Lite hash table entries: 512 (order: 2, 16384 bytes)
PCI: CLS 0 bytes, default 64
hw perfevents: enabled with ARMv7 Cortex-A9 PMU driver, 7 counters available
tegra-emc 7000f400.memory-controller: no tables provided, using 666000 kHz =
emc, 333000 kHz mem
alarmtimer alarmtimer: no of_node; not parsing pinctrl DT
msgmni has been set to 2015
Block layer SCSI generic (bsg) driver version 0.4 loaded (major 252)
io scheduler noop registered
io scheduler deadline registered
io scheduler cfq registered (default)
tegra-pcie 80003000.pcie-controller: dual-mode configuration
tegra-pcie 80003000.pcie-controller: probing port 0, using 2 lanes
tegra-pcie 80003000.pcie-controller: PCI host bridge to bus 0000:00
pci_bus 0000:00: root bus resource [mem 0xa0000000-0xa7ffffff]
pci_bus 0000:00: root bus resource [mem 0xa8000000-0xbfffffff pref]
pci_bus 0000:00: root bus resource [bus 00-ff]
pci_bus 0000:00: root bus resource [io  0x1000-0xffff]
pci 0000:00:01.0: [10de:0bf0] type 01 class 0x060000
pci 0000:00:01.0: PME# supported from D0 D1 D2 D3hot D3cold
PCI: bus0: Fast back to back transfers disabled
pci 0000:00:01.0: bridge configuration invalid ([bus 00-00]), reconfiguring
pci 0000:01:00.0: [10ec:8168] type 00 class 0x020000
pci 0000:01:00.0: reg 0x10: [io  0x0000-0x00ff]
pci 0000:01:00.0: reg 0x18: [mem 0x00000000-0x00000fff 64bit pref]
pci 0000:01:00.0: reg 0x20: [mem 0x00000000-0x00003fff 64bit pref]
pci 0000:01:00.0: reg 0x30: [mem 0x00000000-0x0001ffff pref]
pci 0000:01:00.0: supports D1 D2
pci 0000:01:00.0: PME# supported from D0 D1 D2 D3hot D3cold
PCI: bus1: Fast back to back transfers disabled
pci_bus 0000:01: busn_res: [bus 01-ff] end is updated to 01
Disabling cpuidle LP2 state, since PCIe IRQs are in use
pci 0000:00:01.0: BAR 15: assigned [mem 0xa8000000-0xa80fffff pref]
pci 0000:00:01.0: BAR 13: assigned [io  0x1000-0x1fff]
pci 0000:01:00.0: BAR 6: assigned [mem 0xa8000000-0xa801ffff pref]
pci 0000:01:00.0: BAR 4: assigned [mem 0xa8020000-0xa8023fff 64bit pref]
pci 0000:01:00.0: BAR 2: assigned [mem 0xa8024000-0xa8024fff 64bit pref]
pci 0000:01:00.0: BAR 0: assigned [io  0x1000-0x10ff]
pci 0000:00:01.0: PCI bridge to [bus 01]
pci 0000:00:01.0:   bridge window [io  0x1000-0x1fff]
pci 0000:00:01.0:   bridge window [mem 0xa8000000-0xa80fffff pref]
pci 0000:00:01.0: nv_msi_ht_cap_quirk didn't locate host bridge
pcie_pme 0000:00:01.0:pcie01: no of_node; not parsing pinctrl DT
pcieport 0000:00:01.0: Signaling PME through PCIe PME interrupt
pci 0000:01:00.0: Signaling PME through PCIe PME interrupt
pcie_pme 0000:00:01.0:pcie01: service driver pcie_pme loaded
tegra-apbdma 6000a000.dma: Tegra20 APB DMA driver register 16 channels
Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
serial8250 serial8250: no of_node; not parsing pinctrl DT
Serial: IMX driver
70006000.serial: ttyS0 at MMIO 0x70006000 (irq =3D 68, base_baud =3D 135000=
00) is a Tegra
console [ttyS0] enabled
console [ttyS0] enabled
bootconsole [earlycon0] disabled
bootconsole [earlycon0] disabled
[drm] Initialized drm 1.1.0 20060810
tegra20-pinctrl 70000014.pinmux: request pin 111 (HDMI_INT_N PN7) for Tegra=
 GPIOs:111
tegra-hdmi 54280000.hdmi: output_probe returned 0
[drm:drm_get_minor],=20
[drm:drm_get_minor], new minor assigned 64
[drm:drm_get_minor],=20
[drm:drm_get_minor], new minor assigned 0
[drm:drm_sysfs_connector_add], adding "HDMI-A-1" to sysfs
[drm:drm_sysfs_hotplug_event], generating hotplug event
[drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[drm] No driver support for vblank timestamp query.
[drm:drm_helper_probe_single_connector_modes], [CONNECTOR:9:HDMI-A-1]
drm_get_edid:   (null)
[drm:drm_helper_probe_single_connector_modes], [CONNECTOR:9:HDMI-A-1] probe=
d modes :
[drm:drm_mode_debug_printmodeline], Modeline 15:"1024x768" 60 65000 1024 10=
48 1184 1344 768 771 777 806 0x40 0xa
[drm:drm_mode_debug_printmodeline], Modeline 13:"800x600" 60 40000 800 840 =
968 1056 600 601 605 628 0x40 0x5
[drm:drm_mode_debug_printmodeline], Modeline 12:"800x600" 56 36000 800 824 =
896 1024 600 601 603 625 0x40 0x5
[drm:drm_mode_debug_printmodeline], Modeline 14:"848x480" 60 33750 848 864 =
976 1088 480 486 494 517 0x40 0x5
[drm:drm_mode_debug_printmodeline], Modeline 11:"640x480" 60 25175 640 656 =
752 800 480 489 492 525 0x40 0xa
[drm:drm_setup_crtcs],=20
[drm:drm_enable_connectors], connector 9 enabled? yes
[drm:drm_target_preferred], looking for cmdline mode on connector 9
[drm:drm_target_preferred], looking for preferred mode on connector 9
[drm:drm_target_preferred], found mode 1024x768
[drm:drm_setup_crtcs], picking CRTCs for 4096x4096 config
[drm:drm_setup_crtcs], desired mode 1024x768 set on crtc 3
[drm:drm_framebuffer_reference], FB ID: 17
host1x drm: fb0:  frame buffer device
host1x drm: registered panic notifier
[drm] Initialized tegra 0.0.0 20120330 on minor 0
tegra_rtc 7000e000.rtc: rtc core: registered 7000e000.rtc as rtc0
tegra_rtc 7000e000.rtc: Tegra internal Real Time Clock
i2c /dev entries driver
tegra20-pinctrl 70000014.pinmux: request pin 191 (SPI1_MISO PX7) for Tegra =
GPIOs:191
sdhci: Secure Digital Host Controller Interface driver
sdhci: Copyright(c) Pierre Ossman
sdhci-pltfm: SDHCI platform and OF driver helper
sdhci-tegra c8000000.sdhci: dummy supplies not allowed
mmc0: no vqmmc regulator found
sdhci-tegra c8000000.sdhci: dummy supplies not allowed
mmc0: no vmmc regulator found
mmc0: Invalid maximum block size, assuming 512 bytes
mmc0: SDHCI controller on c8000000.sdhci [c8000000.sdhci] using ADMA
tegra20-pinctrl 70000014.pinmux: request pin 121 (DAP3_DIN PP1) for Tegra G=
PIOs:121
sdhci-tegra c8000600.sdhci: Got CD GPIO #121.
tegra20-pinctrl 70000014.pinmux: request pin 122 (DAP3_DOUT PP2) for Tegra =
GPIOs:122
sdhci-tegra c8000600.sdhci: Got WP GPIO #122.
sdhci-tegra c8000600.sdhci: dummy supplies not allowed
mmc1: no vqmmc regulator found
sdhci-tegra c8000600.sdhci: dummy supplies not allowed
mmc1: no vmmc regulator found
mmc1: Invalid maximum block size, assuming 512 bytes
mmc1: SDHCI controller on c8000600.sdhci [c8000600.sdhci] using ADMA
ledtrig-cpu: registered to indicate activity on CPUs
hidraw: raw HID events driver (C) Jiri Kosina
oprofile-perf oprofile-perf.0: no of_node; not parsing pinctrl DT
oprofile: using arm/armv7-ca9
Registering SWP/SWPB emulation handler
tegra_rtc 7000e000.rtc: setting system clock to 1970-01-01 19:19:36 UTC (69=
576)
mmc0: host does not support reading read-only switch. assuming write-enable.
mmc0: new high speed SDHC card at address 1234
mmcblk mmc0:1234: no of_node; not parsing pinctrl DT
mmcblk0: mmc0:1234 SA04G 3.68 GiB=20
 mmcblk0: p1
EXT4-fs (mmcblk0p1): couldn't mount as ext3 due to feature incompatibilities
EXT4-fs (mmcblk0p1): couldn't mount as ext2 due to feature incompatibilities
EXT4-fs (mmcblk0p1): INFO: recovery required on readonly filesystem
EXT4-fs (mmcblk0p1): write access will be enabled during recovery
mmc1: new high speed SD card at address e624
mmcblk mmc1:e624: no of_node; not parsing pinctrl DT
mmcblk1: mmc1:e624 SD02G 1.89 GiB=20
 mmcblk1: p1
EXT4-fs (mmcblk0p1): recovery complete
EXT4-fs (mmcblk0p1): mounted filesystem with ordered data mode. Opts: (null)
VFS: Mounted root (ext4 filesystem) readonly on device 179:1.
devtmpfs: mounted
Freeing unused kernel memory: 384K (805f9000 - 80659000)
NET: Registered protocol family 1
EXT4-fs (mmcblk0p1): re-mounted. Opts: data=3Dordered
Starting logging: OK
modprobe: 'kernel/drivers/regulator/fixed.ko': unknown symbol in module or =
invalid parameter
r8169 0000:01:00.0: no of_node; not parsing pinctrl DT
r8169 Gigabit Ethernet driver 2.3LK-NAPI loaded
PCI: enabling device 0000:01:00.0 (0140 -> 0143)
r8169 0000:01:00.0 eth0: RTL8168d/8111d at 0xc083e000, 00:01:c0:0b:fb:48, X=
ID 081000c0 IRQ 385
r8169 0000:01:00.0 eth0: jumbo features [frames: 9200 bytes, tx checksummin=
g: ko]
Initializing random number generator... random: dd urandom read with 88 bit=
s of entropy available
done.
Starting system message bus: done
Starting network...
r8169 0000:01:00.0 eth0: link down
r8169 0000:01:00.0 eth0: link down
udhcpc (v1.21.1) started
grep: /etc/resolv.conf: No such file or directory
NET: Registered protocol family 17
Sending discover...
r8169 0000:01:00.0 eth0: link up
Sending discover...
Sending select for 192.168.14.98...
Lease of 192.168.14.98 obtained, lease time 43200
deleting routers
route: SIOCDELRT: No such process
adding dns 192.168.14.5
Starting dropbear sshd: random: nonblocking pool is initialized
NET: Registered protocol family 10
OK
Starting mpd: OK
Starting input-event-daemon: input-event-daemon: open(/dev/input/event0): N=
o such file or directory
done
Starting TVHeadend daemon: OK

Welcome to LVNX
trimslice login: root
Password:
# i2cdetect -y 0
     0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
00:          -- -- -- -- -- -- -- -- -- -- -- -- --
10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
50: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
70: -- -- -- -- -- -- -- --
# i2cdetect -y 1
     0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
00:          -- -- -- -- -- -- -- -- -- -- -- -- --
10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
50: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
70: -- -- -- -- -- -- -- --
# i2cdetect -y 2
     0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
00:          -- -- -- -- -- -- -- -- -- -- -- -- --
10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
50: -- -- -- -- -- -- 56 -- -- -- -- -- -- -- -- --
60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
70: -- -- -- -- -- -- -- --
# uname -a
Linux trimslice 3.13.0-rc3-00145-g78fd822-dirty #34 SMP PREEMPT Wed Dec 11 =
02:57:59 GMT 2013 armv7l GNU/Linux
#

--NU0Ex4SbNnrxsi6C--
