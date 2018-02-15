From: Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>
Subject: Re: How to test new bootloaders on Jetson TX1?
Date: Thu, 15 Feb 2018 09:56:25 +0200
Message-ID: <2089c895-7992-9741-a471-fae5b410d4b7@kapsi.fi>
References: <5ff3ffde-653c-ea50-490c-efcc6dccecc2@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5ff3ffde-653c-ea50-490c-efcc6dccecc2-l3A5Bk7waGM@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, U-Boot <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>
Cc: Alexander Graf <agraf-l3A5Bk7waGM@public.gmane.org>, Mian Yousaf Kaukab <yousaf.kaukab-IBi9RG/b67k@public.gmane.org>, Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Varun Wadekar <vwadekar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Andreas,

In the cboot + U-Boot combination, cboot loads U-Boot from the usual 
kernel partition (LNX or kernel depending on system), so flashing U-Boot 
there should do the trick. I believe this did indeed change in some L4T 
version, so the wiki page needs to be updated. Tom should know more 
about this.

I expect Varun to know the details about ATF, but I'll check if I can 
find some answer myself.

Thanks,
Mikko

On 02/15/2018 03:51 AM, Andreas Färber wrote:
> Hello,
> 
> I would like to test the latest version of U-Boot on the Jetson TX1.
> 
> Unfortunately U-Boot is lacking a README that would explain how to do that:
> 
> http://git.denx.de/?p=u-boot.git;a=tree;f=board/nvidia/p2371-2180;h=097fb9aaec8abd522b7b8382e5c4169f5ea8f691;hb=HEAD
> 
> 
> I understand that the Jetson TK1's Python based
> https://github.com/NVIDIA/tegra-uboot-flasher-scripts
> have never been updated for Tegra X1.
> 
> That leaves L4T Jetson TX1 Driver Package, latest version being R28.1.0.
> 
> Here's what I have tried:
> 
> $ sudo ./flash.sh p2371-2180-devkit mmcblk0p1
> 
> On openSUSE Leap 42.3 this keeps failing the first time:
> 
> copying
> bctfile(/home/andreas/MCU/ARM/JetsonTX1/Linux_for_Tegra/bootloader/t210ref/BCT/P2180_A00_LP4_DSC_204Mhz.cfg)...
> done.
> copying
> bootloader(/home/andreas/MCU/ARM/JetsonTX1/Linux_for_Tegra/bootloader/t210ref/cboot.bin)...
> done.
> 	populating kernel to rootfs... done.
> 	populating initrd to rootfs... done.
> 	populating extlinux.conf.emmc to rootfs... done.
> 	populating
> /home/andreas/MCU/ARM/JetsonTX1/Linux_for_Tegra/kernel/dtb/tegra210-jetson-tx1-p2597-2180-a01-devkit.dtb
> to rootfs... done.
> done.
> Making Boot image... done.
> copying
> bcffile(/home/andreas/MCU/ARM/JetsonTX1/Linux_for_Tegra/bootloader/t210ref/cfg/board_config_p2597-devkit.xml)...
> done.
> Existing
> sosfile(/home/andreas/MCU/ARM/JetsonTX1/Linux_for_Tegra/bootloader/nvtboot_recovery.bin)
> reused.
> copying
> tegraboot(/home/andreas/MCU/ARM/JetsonTX1/Linux_for_Tegra/bootloader/t210ref/nvtboot.bin)...
> done.
> Existing
> bpffile(/home/andreas/MCU/ARM/JetsonTX1/Linux_for_Tegra/bootloader/bpmp.bin)
> reused.
> copying
> wb0boot(/home/andreas/MCU/ARM/JetsonTX1/Linux_for_Tegra/bootloader/t210ref/warmboot.bin)...
> done.
> Existing
> tosfile(/home/andreas/MCU/ARM/JetsonTX1/Linux_for_Tegra/bootloader/tos.img)
> reused.
> Existing
> eksfile(/home/andreas/MCU/ARM/JetsonTX1/Linux_for_Tegra/bootloader/eks.img)
> reused.
> copying
> dtbfile(/home/andreas/MCU/ARM/JetsonTX1/Linux_for_Tegra/kernel/dtb/tegra210-jetson-tx1-p2597-2180-a01-devkit.dtb)...
> done.
> Making system.img...
> /dev/loop0 is not block device. Terminating..
> 
> I have managed to work around that by running sudo losetup -f once.
> 
> That gets me to a:
> 
> U-Boot 2016.07-g0ce7ca2 (Jul 20 2017 - 00:37:03 -0700)
> 
> (where our efiboot command doesn't quite work yet)
> 
> 
> https://elinux.org/Jetson/TX1_Upstream_Kernel
> 
> claims: "The distributed tarball contains a pre-built U-Boot and kernel,
> but these may be replaced with any images you wish to flash, by
> replacing the distributed images in the directory tree."
> and "To flash only the primary bootloader and U-Boot: ./flash.sh -k EBT
> p2371-2180 mmcblk0p1"
> 
> Apparently that's not true anymore (R23.1.1 armhf vs. R28.1.0 aarch64):
> Operation succeeds, but U-Boot is still the old one.
> 
> Possible cause: The EBT partition gets a cboot.bin, not u-boot-dtb.bin.
> 
> If I repeat without -k EBT and with the openSUSE OBS builds of U-Boot
> v2018.01 then again flashing appears to succeed, but boot gets stuck at:
> 
> [0003.260] Starting Bpmp FW
> [0003.263] BPMP-FW Carveout: Base = 0xff2c0000 and Size = 0x40000
> 
> (short of showing the U-Boot banner)
> 
> 
> Also, ATF shows up as:
> 
> NOTICE:  BL31: v1.2(release):cc5fd7c
> NOTICE:  BL31: Built : 00:37:02, Jul 20 2017
> 
> (which is most certainly lacking Jan 2018 Spectre mitigations for CA57)
> 
> Security Bulletin
> http://nvidia.custhelp.com/app/answers/detail/a_id/4616
> announces an R28.2 for later this month, but with t210 in mainline ATF I
> would really like to use my own patched ATF build already.
> 
> https://github.com/ARM-software/arm-trusted-firmware/blob/6f62574767546b11199142b1b577a86571051c40/docs/plat/nvidia-tegra.rst
> doesn't explain how to get the t210 bl31.bin onto a board either.
> 
> 
> https://elinux.org/Jetson_TX1 links to multiple App Notes on a
> non-reachable Nvidia FTP server. I found that replacing ftp with http,
> they can still be reached (dated 2015), but
> http://download.nvidia.com/tegra-public-appnotes/t210-nvtboot-flow.html
> isn't too helpful either, other than giving a rough overview.
> 
> 
> Colleagues have succeeded in loading a U-Boot via RCM into RAM and
> executing from there, but I figure that won't quite work for ATF.
> And it's no permanent solution anyway.
> 
> 
> So could someone please comment on how to perform a minimally-invasive
> update of the individual Open Source firmware components for Jetson TX1?
> 
> Thanks,
> Andreas
> 
