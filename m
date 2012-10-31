From: Evade Flow <evadeflow-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Flash Yocto-built kernel on Tegra2 T20?
Date: Wed, 31 Oct 2012 14:29:45 -0400
Message-ID: <CAMAb8ZNts=SB2rhD8BU+_wAQ84S3tOzwGazr5hnTveMt-BdwGA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

I've inherited a Tegra2 T20-based system that I'd like to flash a new
kernel to. I built this kernel using OpenEmbedded/Yocto, and the kernel
sources from:

  - http://nv-tegra.nvidia.com/gitweb/?p=linux-2.6.git;a=summary


When I try to flash this kernel using the same command that has always
been used for this system, I get absolutely no output to the serial
console when I attempt to boot. It's like the bootloader (quickboot[?])
is jumping to the wrong address and getting lost.

Can anyone give me a hint as to what the problem might be, and how I can
flash this new kernel? I've never used quickboot before and the docs for
this system have long since been lost, so I'm kind of flying blind
here... `:-}

In case it's helpful, the output from flashing the 'old' kernel is
appended below. (This is a 'straight', non-Android Linux build for an
infotainment system, by the way...)


NVidia_flashing_utilities_Production_1.0% sudo ./burnflash.sh -F -r sda1 -c \
>      "init=/bin/systemd default.target=multi-user.target \
dquote>       console=ttyS0,57600" -S 13
burnflash.sh for p852 board
Root device set to sda1.
If board is not ON, power it by moving switch S6 to ON position,
then press the power button S4 for at least 2 seconds, then release it.
Press Enter to continue

Install "Force Recovery" jumper (J42) , then press and release
the Reset Switch (S5).
Press Enter to continue

Flashing the bootloader...
Creating Boot Image...
Boot Image Created successfully
Nvflash version 17.0018 started
^CError while flashing bootloader, exiting...
NVidia_flashing_utilities_Production_1.0% sudo ./burnflash.sh -F -r sda1 -c \
     "init=/bin/systemd default.target=multi-user.target \
      console=ttyS0,57600" -S 13
burnflash.sh for p852 board
Root device set to sda1.
If board is not ON, power it by moving switch S6 to ON position,
then press the power button S4 for at least 2 seconds, then release it.
Press Enter to continue

Install "Force Recovery" jumper (J42) , then press and release
the Reset Switch (S5).
Press Enter to continue

Flashing the bootloader...
Creating Boot Image...
Boot Image Created successfully
Nvflash version 17.0018 started
rcm version 0X20001
System Information:
   chip name: t20
   chip id: 0x20 major: 1 minor: 2
   chip sku: 0x8
   chip uid: 0x170061c241e02617
   macrovision: disabled
   hdcp: enabled
   sbk burned: false
   dk burned: false
   boot device: nand
   operating mode: 3
   device config strap: 0
   device config fuse: 0
   sdram config strap: 0

sending file: ./p852_12MHz_H5PS1G83EFR-S5I_333MHz_1GB_nand_MT29F4G08ABADA.bct
- 4080/4080 bytes sent
./p852_12MHz_H5PS1G83EFR-S5I_333MHz_1GB_nand_MT29F4G08ABADA.bct sent
successfully
odm data: 0x3b0c0105
downloading bootloader -- load address: 0x108000 entry point: 0x108000
sending file: burnflash.bin
| 949720/949720 bytes sent
burnflash.bin sent successfully
waiting for bootloader to initialize
bootloader downloaded successfully
setting device: 1 0
creating partition: BCT
creating partition: PT
creating partition: STAGE1_RECOVERY
creating partition: STAGE2_RECOVERY
creating partition: STAGE1_PRIMARY
creating partition: STAGE2_PRIMARY
creating partition: KERNEL_RECOVERY
creating partition: KERNEL_PRIMARY
creating partition: ENV
creating partition: APP
Formatting partition 2 BCT please wait.. done!
Formatting partition 3 PT please wait.. done!
Formatting partition 4 STAGE1_RECOVERY please wait.. done!
Formatting partition 5 STAGE2_RECOVERY please wait.. done!
Formatting partition 6 STAGE1_PRIMARY please wait.. done!
Formatting partition 7 STAGE2_PRIMARY please wait.. done!
Formatting partition 8 KERNEL_RECOVERY please wait.. done!
Formatting partition 9 KERNEL_PRIMARY please wait.. done!
Formatting partition 10 ENV please wait.. done!
Formatting partition 11 APP please wait.. done!
done!
sending file: quickboot1.bin
- 62128/62128 bytes sent
quickboot1.bin sent successfully
sending file: cpu_stage2.bin
- 31399/31399 bytes sent
cpu_stage2.bin sent successfully
sending file: quickboot1.bin
- 62128/62128 bytes sent
quickboot1.bin sent successfully
sending file: cpu_stage2.bin
- 31399/31399 bytes sent
cpu_stage2.bin sent successfully
sending file: loadimg.img
/ 3667968/3667968 bytes sent
loadimg.img sent successfully
sending file: loadimg.img
/ 3667968/3667968 bytes sent
loadimg.img sent successfully
Flashed the Bootloader successfully.
To boot, remove "Force Recovery" jumper (J42) and reset the board.
Flashed the kernel successfully

To boot, remove "Force Recovery" jumper (J42) and reset the board.
