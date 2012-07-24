From: Nuno Santos <nuno.m.santos-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Linux hangs on Tegra 2 / U-Boot board
Date: Tue, 24 Jul 2012 13:32:59 +0000 (UTC)
Message-ID: <loom.20120724T152735-115@post.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi

As I explained in a previous post, I have a Tegra2 based board (Harmony=
)
and (thanks to your help) I successfully managed to flash and boot U-Bo=
ot.

However, I=E2=80=99ve been trying to boot Linux from U-Boot but to no a=
vail. Once the
device runs U-boot, I load a Linux image into memory over TFTP, run the
command =E2=80=9Cbootm=E2=80=9D, and then Linux immediately hangs after=
 printing message
=E2=80=9CStarting kernel ...".

I=E2=80=99ve tried multiple suggestions I=E2=80=99ve seen online: defin=
ing linux console
boot in the =E2=80=9Cbootargs=E2=80=9D parameter in case it is a consol=
e misconfiguration,
recompile the kernel with CONFIG_DEBUG_LL to diagnose the problem, and =
check
the machine id (by providing machine id 0xAAB in the environment var
=E2=80=9Cmachid=E2=80=9D). In all these attempts there is no change wha=
tsoever in the output.

I=E2=80=99d be really grateful if someone could give me a hand on this.=
 So, here=E2=80=99s
the details.

1. I=E2=80=99m using the kernel from git://nv-tegra.nvidia.com/linux-2.=
6.git,
pulled today and configured as indicated in the doc (make tegra_defconf=
ig);
the compilation also creates a uImage for U-Boot. I=E2=80=99m using the=
 latest version
of U-Boot, compiled locally using the standard procedure.

2. First, I flash U-boot and boot the device. U-boot looks for the boot=
strap
scripts on several locations and it fails (as it would be expected). At=
 this
point the current environment variables are:

----------------------------------------
Tegra2 (Harmony) # printenv
arch=3Darm
baudrate=3D115200
board=3Dharmony
boot_fstypes=3Dext2  fat
boot_prefixes=3D/ /boot/
boot_scripts=3Dboot.scr.uimg boot.scr
boot_targets=3Dmmc1 mmc0 usb0 dhcp
bootcmd=3Dfor target in ${boot_targets}; do run bootcmd_${target}; done
bootcmd_dhcp=3Drun usb_init; if dhcp ${scriptaddr} boot.scr.uimg; then =
source
        ${scriptaddr}; fi
bootcmd_mmc0=3Dsetenv devnum 0; run mmc_boot;
bootcmd_mmc1=3Dsetenv devnum 1; run mmc_boot;
bootcmd_usb0=3Dsetenv devnum 0; run usb_boot;
bootdelay=3D2
bootfile=3D;
cpu=3Darmv7
devnum=3D0
devtype=3Dusb
ethact=3Dsms0
fdt_high=3D01100000
fdt_load=3D0x01000000
loadaddr=3D0x408000
mmc_boot=3Dsetenv devtype mmc; if mmc dev ${devnum}; then run scan_boot=
; fi
rootpart=3D1
scan_boot=3Decho Scanning ${devtype} ${devnum}...; for fs in ${boot_fst=
ypes};
        do for prefix in ${boot_prefixes}; do for script in ${boot_scri=
pts};
        do run script_boot; done; done; done;
script_boot=3Dif ${fs}load ${devtype} ${devnum}:${rootpart} ${scriptadd=
r}
        ${prefix}${script}; then echo ${script} found! Executing ...;so=
urce
        ${scriptaddr};fi;
scriptaddr=3D0x400000
soc=3Dtegra2
stderr=3Dserial
stdin=3Dserial
stdout=3Dserial
usb_boot=3Dsetenv devtype usb; run usb_init; if usb dev ${devnum}; then=
=20
        run scan_boot; fi
usb_init=3Dif ${usb_need_init}; then set usb_need_init false; usb start=
 0; fi
usb_need_init=3Dfalse
vendor=3Dnvidia
----------------------------------------

3. Then, I define some vars to tell U-boot how to fetch the uImage remo=
tely.=20
Here=E2=80=99s the sequence of commands:

----------------------------------------
Tegra2 (Harmony) # setenv autoload no
Tegra2 (Harmony) # dhcp
Waiting for Ethernet connection... done.
BOOTP broadcast 1
BOOTP broadcast 2
*** Unhandled DHCP Option in OFFER/ACK: 252
=2E..
*** Unhandled DHCP Option in OFFER/ACK: 52
DHCP client bound to address <my-device-ip>
Tegra2 (Harmony) # setenv serverip <my-host-ip>
Tegra2 (Harmony) # setenv bootfile uImage
Tegra2 (Harmony) # setenv bootargs "mem=3D1024M console=3DttyS0,115200n=
8
        root=3D/dev/sda1 rw rootwait"
----------------------------------------

4. Next, I tell u-boot to load the uImage file:

----------------------------------------
Tegra2 (Harmony) # tftpboot
Waiting for Ethernet connection... done.
Using sms0 device
TFTP from server <my-host-ip>; our IP address is <my-device-ip>
=46ilename 'uImage'.
Load address: 0x408000
Loading: EHCI timed out on TD - token=3D0x8008d80
T #################################################################
         ##############################################################=
###
         ##############################################################=
###
         ##############################################################=
###
         ##############################################################=
###
         ##############################################################=
###
         ##############################################################=
###
         ##############################################################=
###
         ##############################################################=
###
         ##############################################################=
###
         ##########################################
done
Bytes transferred =3D 3540180 (3604d4 hex)
----------------------------------------

5. And then tell it to boot the kernel from memory:

----------------------------------------
Tegra2 (Harmony) # bootm
## Booting kernel from Legacy Image at 00408000 ...
   Image Name:   Linux-2.6.36.3
   Image Type:   ARM Linux Kernel Image (uncompressed)
   Data Size:    3540116 Bytes =3D 3.4 MiB
   Load Address: 00008000
   Entry Point:  00008000
   Verifying Checksum ... OK
   Loading Kernel Image ... OK
OK

Starting kernel ...
----------------------------------------

And then it hangs here. When I compile the kernel with the debug flag, =
I see
no additional output. I=E2=80=99ve also tried to load uImage to a diffe=
rent address
without any changes.

Many thanks in advance!
--Nuno
