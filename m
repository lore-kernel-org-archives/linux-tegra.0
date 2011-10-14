From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: Adding board support
Date: Fri, 14 Oct 2011 12:20:11 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF173BE1A33E@HQMAIL01.nvidia.com>
References: <20111014054945.GA32399@avionic-0098.mockup.avionic-design.de>
 <74CDBE0F657A3D45AFBB94109FB122FF173BE1A290@HQMAIL01.nvidia.com>
 <20111014185847.GA916@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20111014185847.GA916-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Thierry Reding wrote at Friday, October 14, 2011 12:59 PM:
> * Stephen Warren wrote:
> > Thierry Reding wrote at Thursday, October 13, 2011 11:50 PM:
...
> > > Another question concerns testing. So far I've always booted a modified
> > > U-Boot (from Vibrante 1.1) to allow booting with an initial ramdisk (loaded
> > > from SD/MMC) as payload for fastboot/quickboot. What are other people using?
> >
> > Personally, I've recently switched to using mainline U-Boot on almost all my
> > boards (Harmony, Seaboard, Ventana). Maybe I'll add TrimSlice support there
> > too. Note that this relies on a number of patches that have been posted to
> > the U-Boot mailing list, but not yet checked into their repos. This completely
> > bypasses fastboot; Tegra's boot ROM runs U-Boot directly instead of fastboot.
> 
> I was hoping that somebody had gotten this to work. Would you mind sharing
> the script that you use? All the scripts I've seen so far create some boot
> image (using a tool named mkbootimg) that contains U-Boot.
> 
> U-Boot mainline support is another point on my TODO list. Getting the latest
> mainline code with the patches you mention (I assume you are referring to the
> patch series by Simon Glass and Tom Warren) to work would be a good step in
> that direction.

I branched from: git://git.denx.de/u-boot.git master at commit
0841ca90f22d73b0ea4642ef1ce33d879bb2f3ff.

I applied the following:

http://patchwork.ozlabs.org/patch/115862/
http://patchwork.ozlabs.org/patch/115864/
http://patchwork.ozlabs.org/patch/115865/
http://patchwork.ozlabs.org/patch/115860/
http://patchwork.ozlabs.org/patch/115863/
http://patchwork.ozlabs.org/patch/115861/

http://patchwork.ozlabs.org/patch/119321/
http://patchwork.ozlabs.org/patch/119322/
http://patchwork.ozlabs.org/patch/119323/
http://patchwork.ozlabs.org/patch/119324/
http://patchwork.ozlabs.org/patch/119325/

http://patchwork.ozlabs.org/patch/118184/

I applied the following to hack the default environment so I could boot from
SD cards layed out how mine are; you'll probably need to tweak this a bunch:

diff --git a/include/configs/tegra2-common.h b/include/configs/tegra2-common.h
index 07546a4..f30f569 100644
--- a/include/configs/tegra2-common.h
+++ b/include/configs/tegra2-common.h
@@ -104,9 +104,19 @@
 
 /* Environment information */
 #define CONFIG_EXTRA_ENV_SETTINGS \
-       "console=ttyS0,115200n8\0" \
-       "mem=" TEGRA2_SYSMEM "\0" \
-       "smpflag=smp\0" \
+       "bootcmd=run usb0_boot ; run usb1_boot ; run mmc1_boot ; run mmc0_boot\0" \
+       "bootdelay=2\0" \
+       "loadaddr=0x00500000\0" \
+       "scriptaddr=0x408000\0" \
+       "script_img=/u-boot/boot.scr.uimg\0" \
+       "mmc0_boot=setenv devnum 0; run mmc_boot;\0" \
+       "mmc1_boot=setenv devnum 1; run mmc_boot;\0" \
+       "usb0_boot=usb start 0; run usb_boot;\0" \
+       "usb1_boot=usb start 1; run usb_boot;\0" \
+       "scr_boot=fatload ${devtype} ${devnum}:c ${scriptaddr} ${script_img};source ${scriptaddr};read ${devtype} ${devnum}:${kernelpart} ${scriptaddr} 0 10;source ${scriptaddr};\0" \
+       "mmc_boot=mmc dev ${devnum};setenv devtype mmc;setenv devname mmcblk${devnum}p;run scr_boot;\0" \
+       "usb_boot=setenv devtype usb;setenv devnum 0;setenv devname sda;run scr_boot;\0" \
+       "platform_extras=lp0_vec=0x2000@0x1C406000 kcrashmem=0x100000@0x02000000 mem=384M@0M nvmem=128M@384M mem=511M@512M\0" \
 
 #define CONFIG_LOADADDR                0x408000        /* def. location for kernel */
 #define CONFIG_BOOTDELAY       2               /* -1 to disable auto boot */

In order to actually use the resultant u-boot.bin, it's pretty simple if you
already have nvflash working with burn fastboot.

1) Edit flash.cfg (or whatever config file you pass to nvflash to define
The partitions and their content) and replace the filename entry in the
EBT partition with u-boot.bin.

2) I personally remove all the partition entries in flash.cfg except for
BCT, PT, EBT. This will avoid nvflash flashing your Android/... filesystem.
If you want your filesystem in the same flash, don't do this.

Then, run nvflash just like you would normally.

> Have you done any testing with the NVIDIA binary blobs when booting this way?
> The latest information I have from our NVIDIA contacts is that fastboot or
> quickboot are required, for some reason, to make HW accelerated video
> decoding and 3D rendering work.

It's possible the binary drivers accidentally rely on the bootloader
having configured some piece of HW.

However, in general, the bootloader product you use shouldn't affect
whether the binary drivers work.

In particular, the binary drivers certainly work after the ChromeOS
U-Boot boots a board.

Coincidentally, right before seeing your email, I just tried mainline
U-Boot on Seaboard with our Linux4Tegra alpha 1 release, and while X
started, I couldn't see anything on screen. This did previously work
with some old version of ChromeOS's U-Boot. So, there's certainly some
missing HW initialization somewhere.

BTW, you might also want to take a look at NVIDIA's web forums:

http://developer.nvidia.com/beta-forum

While I'm personally happy to answer your questions here, (I work for
a group dedicated to making general Linux support on Tegra) you may find
more people aimed at this kind of support on those forums. I'm not
active on those forums though.

I hope this all helps!

-- 
nvpublic
