From: "S.J.R. van Schaik" <stephan-zGZ7W/ttz6xN8Ch2cx6nig@public.gmane.org>
Subject: building nv-uboot for nyan-big.
Date: Mon, 03 Nov 2014 10:42:06 +0000
Message-ID: <54575BFE.2010108@synkhronix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Dear D.G. Reid,

I've presented my problem to a few other people on the #linux-exynos 
channel, and they have directed me to you.

Recently, I have received my Acer Chromebook 13 CB5-311-T28J (a.k.a. 
nyan-big). However, since there doesn't seem to be any documentation 
yet. I'll pretty much presume that the instructions are similar to those 
for previous boards. So what I am mostly interested in is acquiring a 
working binary blob of nv u-boot, that I can then use to boot a Linux 
distribution of choice. For the Samsung Chromebook XE303C12 (a.k.a. 
snow), this was easy to do since the board was well documented and a nv 
u-boot binary blob was readily available. Later on, when the Samsung 
Chromebook XE503C32 (a.k.a. peach-pi) got released, the documentation 
was scarce and at the time that I was experimenting with that particular 
board, no nv u-boot binaries were available.

As a result of that I have done some research to figure out how to build 
a working nv u-boot binary, and working instructions can be found on the 
linux-exynos wiki [1]. However, when I tried to apply them to the snow 
and spring boards, by selecting a different branch and a different 
u-boot configuration, those attempts were of no success. Of course those 
boards are out of the scope of this particular e-mail, but the past few 
days, the same scenario has occurred for the nyan-big board. So, let's 
walk through those steps for clarity sake:

First, I cloned the repositories containing both u-boot and the vboot 
reference implementation for nyan. I'll assume that nyan is the branch I 
want, considering there is no branch for nyan-big, and considering the 
base board is named venice2.

git clone 
https://chromium.googlesource.com/chromiumos/platform/vboot_reference -b 
firmware-nyan-5771.B
git clone 
https://chromium.googlesource.com/chromiumos/third_party/u-boot -b 
firmware-nyan-5771.B

After cloning these repositories, I simply entered the u-boot 
repository, configured it for chromeos_venice2 and started to build it all:

VBOOT_SOURCE=~/chromeos/vboot_reference DEV_TREE_SEPARATE=1 USE_STDINT=1 
VBOOT_DEBUG=1 QEMU_ARCH= WERROR=y make O=build/ BUILD_FACTORY_IMAGE=1 
distclean
VBOOT_SOURCE=~/chromeos/vboot_reference DEV_TREE_SEPARATE=1 USE_STDINT=1 
VBOOT_DEBUG=1 QEMU_ARCH= WERROR=y make O=build/ BUILD_FACTORY_IMAGE=1 
chromeos_venice2_config
VBOOT_SOURCE=~/chromeos/vboot_reference DEV_TREE_SEPARATE=1 USE_STDINT=1 
VBOOT_DEBUG=1 QEMU_ARCH= WERROR=y make O=build/ BUILD_FACTORY_IMAGE=1 all

The u-boot.bin binary seems to build fine. However, the problem is 
similar to the snow and spring boards, where I can't seem to build the 
DTB-files. The cause for this seems to be that tegra124.dtsi cannot be 
found, despite it being present in arch/arm/dts. I am not entirely sure 
whether I can tell DTC what the include paths should be. It may be 
useful to know that I am using dtc-1.4.0 here.

You may be wondering why I am using these particular instructions. Well, 
these are the instructions I have derived from the u-boot ebuild in the 
ChromiumOS overlay, and they have worked successfully for the peach-pi 
board, as mentioned before. I hope that these instructions can be 
generaised in such a fashion that they can be used for the other boards 
as well, without having to rely on setting up a separate chroot 
environment (as I already should have a working environment considering 
I am running Gentoo on my other chromebooks).

I'd like to thank you for your time, and I hope you can guide me in the 
right direction. Maybe you already have a working nv u-boot binary, and 
could save me some time here. Although, having working instructions here 
would be nice as well.


Yours faithfully,
   S.J.R. van Schaik.

1. 
http://linux-exynos.org/wiki/ARM_Chromebook/Building_u-boot#Building_U-Boot_for_Peach_Pi.2FPit
