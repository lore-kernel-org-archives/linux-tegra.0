From: Nuno Santos <nuno.m.santos-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: NVFlash hangs when flashing U-Boot on Tegra2 board
Date: Mon, 23 Jul 2012 08:45:09 +0000 (UTC)
Message-ID: <loom.20120723T101555-779@post.gmane.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi

I have a Tegra2 based board (Harmony) running Linux. It is currently booting 
using the fastboot.bin bootloader shipped with NVIDIA's SDK Developer Kit, but 
I need to replace it for U-Boot, because U-Boot is open source.

So far I've been able to successfully deploy U-Boot on the device using nvflash 
and U-Boot actually runs. However, nvflash hangs waiting for the bootloader to 
finish initializing and therefore flashing won't happen. Apparently nvflash is 
expecting the bootloader to follow some protocol, which U-Boot apparently
is not aware of.

I'd really appreciate any help on this and I'm sorry in advance if this is not
the right forum to publish this question. It has been really hard to find 
information on the web about this. Furthermore, I haven't been able to find
nvflash source code anywhere, which could help tremendously to investigate
what's going on; if at least someone could point me to where I can download
I'd be deeply grateful.

So, this is what I'm using to flash the bootloader:

sudo ./nvflash --bct flash.bct --setbct --configfile flash.cfg --create 
    --bl u-boot-dtb.bin --go

(I've updated the file name of the bootloader in flash.cfg, but apparently it 
doen't affect the outcome)

The output is this:

----------------------------------------
Nvflash v1.1.54599 started
rcm version 0X20001
System Information:
   chip name: t20
   chip id: 0x20 major: 1 minor: 2
   chip sku: 0x8
   chip uid: 0x161c10c541006317
   macrovision: disabled
   hdcp: enabled
   sbk burned: false
   dk burned: false
   boot device: nand
   operating mode: 3
   device config strap: 0
   device config fuse: 0
   sdram config strap: 0

sending file: flash.bct
- 4080/4080 bytes sent
flash.bct sent successfully
odm data: 0x300d8011
downloading bootloader -- load address: 0x108000 entry point: 0x108000
sending file: u-boot-dtb.bin
/ 244122/244122 bytes sent
fastboot.bin sent successfully
waiting for bootloader to initialize
----------------------------------------

And it hangs while U-Boot has actually started executing in the device. If I
reset the board, nvflash  unblocks and prints out the following output:

----------------------------------------
usb read error (71): Protocol error
bootloader failed NvError 0x0
command failure: bootloader download failed 
----------------------------------------


Many thanks in advance!
--Nuno
