From: Steev Klimaszewski <steev-4jv++OSWV9OTkO8mciVlQg@public.gmane.org>
Subject: Re: Issue with a SOYO monitor and Trimslice
Date: Mon, 11 Nov 2013 05:49:42 -0600
Message-ID: <CAKCjkJaGvW80ycb_oh62_0WXUS0k8HJ=rMaPO+Gad_ZYAxbR_g@mail.gmail.com>
References: <CAKCjkJY4nYte00jj-f78G_cohXuXSw-krrubJh1dgANtvRhJkA@mail.gmail.com>
	<20131111094625.GJ3884@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131111094625.GJ3884-AwZRO8vwLAwmlAP/+Wk3EA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Nov 11, 2013 at 3:46 AM, Thierry Reding
<thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Sun, Sep 22, 2013 at 06:26:11AM -0500, Steev Klimaszewski wrote:
> Hi Steev,
>
> I just remembered this thread from a while ago. There were some patches
> to fix DVI support that will be merged into 3.13. You can find them in
> the drm/for-next branch here:
>
>         http://cgit.freedesktop.org/tegra/linux
>
> Specifically:
>
>         http://cgit.freedesktop.org/tegra/linux/commit/?h=drm/for-next&id=9f1591231aa72edd2cdad507520ad4088682262a
>
> I'm not sure if it fixes the issue that you were seeing, but it might be
> worth a try.
>
> Thierry

Hi Thierry,

Sadly, it doesn't seem to have changed anything.  What I did here was:

git clone git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
cd linux
git remote add nvidia git://anongit.freedesktop.org/tegra/linux
git fetch --all
git merge nvidia/drm/for-next
Edited the files that had conflicts which were all in i915 so for this
use case, i'm pretty sure it's fine that I ignored what the proper
solution should be
make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- tegra_defconfig
make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- -j8
... modules_install to the root partition of the sdcard
copied the dtb and zImage to boot partition of the sdcard
popped the sdcard in to the Trimslice

my boot.scr file looks like:

setenv bootargs rootfstype=ext4 drm.debug=0xf root=/dev/mmcblk0p2
rootwait console=ttyS0,115200n8;
ext2load mmc 0:1 ${loadaddr} zImage;
ext2load mmc 0:1 ${fdt_high} tegra20-trimslice.dtb;
bootz ${loadaddr} - ${fdt_high}

and dmesg | grep drm is:

[    0.000000] Kernel command line: rootfstype=ext4 drm.debug=0xf
root=/dev/mmcblk0p2 rootwait console=ttyS0,115200n8
[    1.085836] [drm] Initialized drm 1.1.0 20060810
[    1.093550] [drm:drm_get_minor],
[    1.093860] [drm:drm_get_minor], new minor assigned 64
[    1.093869] [drm:drm_get_minor],
[    1.094135] [drm:drm_get_minor], new minor assigned 0
[    1.094446] [drm:drm_sysfs_connector_add], adding "HDMI-A-1" to sysfs
[    1.094566] [drm:drm_sysfs_hotplug_event], generating hotplug event
[    1.094666] [drm] Supports vblank timestamp caching Rev 1 (10.10.2010).
[    1.101298] [drm] No driver support for vblank timestamp query.
[    1.107254] [drm:drm_helper_probe_single_connector_modes],
[CONNECTOR:9:HDMI-A-1]
[    1.120101] [drm:drm_helper_probe_single_connector_modes],
[CONNECTOR:9:HDMI-A-1] probed modes :
[    1.120111] [drm:drm_mode_debug_printmodeline], Modeline
12:"1680x1050" 60 146200 1680 1784 1960 2240 1050 1053 1059 1089 0x48
0xa
[    1.120123] [drm:drm_mode_debug_printmodeline], Modeline
14:"1280x1024" 75 135000 1280 1296 1440 1688 1024 1025 1028 1066 0x40
0x5
[    1.120133] [drm:drm_mode_debug_printmodeline], Modeline
13:"1280x1024" 60 108000 1280 1328 1440 1688 1024 1025 1028 1066 0x40
0x5
[    1.120143] [drm:drm_mode_debug_printmodeline], Modeline
16:"1440x900" 75 136750 1440 1536 1688 1936 900 903 909 942 0x40 0x6
[    1.120153] [drm:drm_mode_debug_printmodeline], Modeline
15:"1440x900" 60 88750 1440 1488 1520 1600 900 903 909 926 0x40 0x9
[    1.120162] [drm:drm_mode_debug_printmodeline], Modeline
24:"1024x768" 75 78800 1024 1040 1136 1312 768 769 772 800 0x40 0x5
[    1.120172] [drm:drm_mode_debug_printmodeline], Modeline
25:"1024x768" 70 75000 1024 1048 1184 1328 768 771 777 806 0x40 0xa
[    1.120182] [drm:drm_mode_debug_printmodeline], Modeline
26:"1024x768" 60 65000 1024 1048 1184 1344 768 771 777 806 0x40 0xa
[    1.120191] [drm:drm_mode_debug_printmodeline], Modeline
27:"800x600" 75 49500 800 816 896 1056 600 601 604 625 0x40 0x5
[    1.120201] [drm:drm_mode_debug_printmodeline], Modeline
28:"800x600" 72 50000 800 856 976 1040 600 637 643 666 0x40 0x5
[    1.120211] [drm:drm_mode_debug_printmodeline], Modeline
17:"800x600" 60 40000 800 840 968 1056 600 601 605 628 0x40 0x5
[    1.120221] [drm:drm_mode_debug_printmodeline], Modeline
18:"800x600" 56 36000 800 824 896 1024 600 601 603 625 0x40 0x5
[    1.120230] [drm:drm_mode_debug_printmodeline], Modeline
19:"640x480" 75 31500 640 656 720 840 480 481 484 500 0x40 0xa
[    1.120240] [drm:drm_mode_debug_printmodeline], Modeline
20:"640x480" 73 31500 640 664 704 832 480 489 491 520 0x40 0xa
[    1.120249] [drm:drm_mode_debug_printmodeline], Modeline
21:"640x480" 60 25200 640 656 752 800 480 490 492 525 0x40 0xa
[    1.120259] [drm:drm_mode_debug_printmodeline], Modeline
22:"720x400" 70 28320 720 738 846 900 400 412 414 449 0x40 0x6
[    1.120268] [drm:drm_setup_crtcs],
[    1.120277] [drm:drm_enable_connectors], connector 9 enabled? yes
[    1.120284] [drm:drm_target_preferred], looking for cmdline mode on
connector 9
[    1.120290] [drm:drm_target_preferred], looking for preferred mode
on connector 9
[    1.120297] [drm:drm_target_preferred], found mode 1680x1050
[    1.120302] [drm:drm_setup_crtcs], picking CRTCs for 4096x4096 config
[    1.120311] [drm:drm_setup_crtcs], desired mode 1680x1050 set on crtc 3
[    1.131548] [drm:drm_framebuffer_reference], FB ID: 29
[    1.132660] [drm:drm_crtc_helper_set_config],
[    1.132666] [drm:drm_crtc_helper_set_config], [CRTC:3] [FB:29]
#connectors=1 (x y) (0 0)
[    1.132714] [drm:drm_crtc_helper_set_config], crtc has no fb, full mode set
[    1.132718] [drm:drm_crtc_helper_set_config], modes are different,
full mode set
[    1.132726] [drm:drm_mode_debug_printmodeline], Modeline 0:"" 0 0 0
0 0 0 0 0 0 0 0x0 0x0
[    1.132734] [drm:drm_mode_debug_printmodeline], Modeline
23:"1680x1050" 60 146200 1680 1784 1960 2240 1050 1053 1059 1089 0x48
0xa
[    1.132738] [drm:drm_crtc_helper_set_config], encoder changed, full
mode switch
[    1.132741] [drm:drm_crtc_helper_set_config], crtc changed, full mode switch
[    1.132746] [drm:drm_crtc_helper_set_config],
[CONNECTOR:9:HDMI-A-1] to [CRTC:3]
[    1.132750] [drm:drm_crtc_helper_set_config], attempting to set
mode from userspace
[    1.132757] [drm:drm_mode_debug_printmodeline], Modeline
23:"1680x1050" 60 146200 1680 1784 1960 2240 1050 1053 1059 1089 0x48
0xa
[    1.132767] [drm:drm_crtc_helper_set_mode], [CRTC:3]
[    1.152805] [drm:drm_vblank_get], enabling vblank on crtc 0, ret: 0
[    1.152811] [drm:drm_update_vblank_count], enabling vblank
interrupts on crtc 0, missed 0
[    1.154849] [drm:tegra_crtc_setup_clk], rate: 292000000, div: 1
[    1.154864] [drm:drm_crtc_helper_set_mode], [ENCODER:10:TMDS-10]
set [MODE:23:1680x1050]
[    1.156918] [drm:drm_calc_timestamping_constants], crtc 3: hwmode:
htotal 2240, vtotal 1089, vdisplay 1050
[    1.156924] [drm:drm_calc_timestamping_constants], crtc 3: clock
146200 kHz framedur 16685088 linedur 15321, pixeldur 6
[    1.156930] [drm:drm_crtc_helper_set_config], Setting connector
DPMS state to on
[    1.156935] [drm:drm_crtc_helper_set_config],
[CONNECTOR:9:HDMI-A-1] set DPMS on
[    1.156947] [drm:drm_framebuffer_reference], FB ID: 29
[    1.156950] [drm:drm_crtc_helper_set_config],
[    1.156953] [drm:drm_crtc_helper_set_config], [CRTC:6] [NOFB]
[    1.156959] [drm:drm_framebuffer_reference], FB ID: 29
[    1.156963] [drm:drm_framebuffer_unreference], FB ID: 29
[    1.157039] [drm:drm_crtc_helper_set_config],
[    1.157044] [drm:drm_crtc_helper_set_config], [CRTC:3] [FB:29]
#connectors=1 (x y) (0 0)
[    1.157088] [drm:drm_crtc_helper_set_config],
[CONNECTOR:9:HDMI-A-1] to [CRTC:3]
[    1.157093] [drm:drm_framebuffer_reference], FB ID: 29
[    1.157097] [drm:drm_framebuffer_unreference], FB ID: 29
[    1.175729] [drm:drm_crtc_helper_set_config],
[    1.175734] [drm:drm_crtc_helper_set_config], [CRTC:3] [FB:29]
#connectors=1 (x y) (0 0)
[    1.175778] [drm:drm_crtc_helper_set_config],
[CONNECTOR:9:HDMI-A-1] to [CRTC:3]
[    1.175783] [drm:drm_framebuffer_reference], FB ID: 29
[    1.175786] [drm:drm_framebuffer_unreference], FB ID: 29
[    1.199512] host1x drm: fb0:  frame buffer device
[    1.204203] host1x drm: registered panic notifier
[    1.208914] [drm] Initialized tegra 0.0.0 20120330 on minor 0
[    6.165512] [drm:vblank_disable_fn], disabling vblank on crtc 0
[   81.504478] [drm:drm_crtc_helper_set_config],
[   81.504486] [drm:drm_crtc_helper_set_config], [CRTC:3] [FB:29]
#connectors=1 (x y) (0 0)
[   81.504544] [drm:drm_crtc_helper_set_config],
[CONNECTOR:9:HDMI-A-1] to [CRTC:3]
[   81.504550] [drm:drm_framebuffer_reference], FB ID: 29
[   81.504554] [drm:drm_framebuffer_unreference], FB ID: 29

And Out of Range still shows up on the screen.

This is with an HDMI -> DVI cable plugged in to the HDMI port.  When
plugged in to the DVI-D port, the drm subsystem doesn't even see it.

Are there any plans to enable the actual DVI-D port on the Trimslice?

-- 
This e-mail and any attachments are for the sole use of the intended 
recipients(s) and may be confidential. Use of any Pwnie Express product 
signifies your agreement to the Rapid Focus Security EULA<http://pwnieexpress.com/pdfs/RFSEULA.pdf>and is subject to export controls under the U.S. Commerce Department's 
Export Administration Regulations ("EAR").
