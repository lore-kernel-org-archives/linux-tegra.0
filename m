From: Steev Klimaszewski <steev-4jv++OSWV9OTkO8mciVlQg@public.gmane.org>
Subject: Re: Issue with a SOYO monitor and Trimslice
Date: Mon, 23 Sep 2013 06:28:41 -0500
Message-ID: <CAKCjkJZBA8ppfB11niLSbAhWfUWz6UiQkAaNYnDsntfHJUWtMg@mail.gmail.com>
References: <CAKCjkJY4nYte00jj-f78G_cohXuXSw-krrubJh1dgANtvRhJkA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKCjkJY4nYte00jj-f78G_cohXuXSw-krrubJh1dgANtvRhJkA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

After talking with Thierry on IRC more, it was mentioned that the
warning I was seeing wasn't in the log I sent.  When using modesetting
0.3.0 (Debian Wheezy) the following occurs:

on startx

[  100.793758] [drm:drm_crtc_helper_set_config],
[  100.793770] [drm:drm_crtc_helper_set_config], [CRTC:3] [FB:29]
#connectors=1 (x y) (0 0)
[  100.793850] [drm:drm_crtc_helper_set_config],
[CONNECTOR:9:HDMI-A-1] to [CRTC:3]
[  100.793860] [drm:drm_framebuffer_reference], FB ID: 29
[  100.793866] [drm:drm_framebuffer_unreference], FB ID: 29
[  100.825639] [drm:drm_stub_open],
[  100.825658] [drm:drm_open_helper], pid = 2389, minor = 0
[  100.825689] [drm:drm_setup],
[  100.825719] [drm:drm_release], open_count = 1
[  100.825733] [drm:drm_release], pid = 2389, device = 0xe200, open_count = 1
[  100.825757] [drm:drm_lastclose],
[  100.825772] [drm:drm_crtc_helper_set_config],
[  100.825782] [drm:drm_crtc_helper_set_config], [CRTC:3] [FB:29]
#connectors=1 (x y) (0 0)
[  100.825864] [drm:drm_crtc_helper_set_config],
[CONNECTOR:9:HDMI-A-1] to [CRTC:3]
[  100.825879] [drm:drm_framebuffer_reference], FB ID: 29
[  100.825889] [drm:drm_framebuffer_unreference], FB ID: 29
[  100.825899] [drm:drm_crtc_helper_set_config],
[  100.825907] [drm:drm_crtc_helper_set_config], [CRTC:6] [NOFB]
[  100.825919] [drm:drm_framebuffer_reference], FB ID: 29
[  100.825928] [drm:drm_framebuffer_unreference], FB ID: 29
[  100.825939] [drm:drm_lastclose], driver lastclose completed
[  100.825952] [drm:drm_lastclose], lastclose completed
[  100.826350] vgaarb: this pci device is not a vga device
[  100.833225] [drm:drm_stub_open],
[  100.833244] [drm:drm_open_helper], pid = 2389, minor = 0
[  100.833273] [drm:drm_setup],
[  100.833375] [drm:drm_ioctl], pid=2389, dev=0xe200, auth=1, DRM_IOCTL_GET_CAP
[  100.833428] [drm:drm_ioctl], pid=2389, dev=0xe200, auth=1,
DRM_IOCTL_MODE_GETRESOURCES
[  100.833450] [drm:drm_mode_getresources], CRTC[2] CONNECTORS[1] ENCODERS[1]
[  100.833487] [drm:drm_ioctl], pid=2389, dev=0xe200, auth=1,
DRM_IOCTL_MODE_GETRESOURCES
[  100.833504] [drm:drm_mode_getresources], CRTC[2] CONNECTORS[1] ENCODERS[1]
[  100.833570] [drm:drm_ioctl], pid=2389, dev=0xe200, auth=1,
DRM_IOCTL_MODE_CREATE_DUMB
[  100.833601] tegra-host1x 50000000.host1x: failed to allocate buffer
with size 0
[  100.841621] [drm:drm_ioctl], ret = -12
[  100.842082] [drm:drm_ioctl], pid=2389, dev=0xe200, auth=1, DRM_IOCTL_GET_CAP
[  100.842176] [drm:drm_ioctl], pid=2389, dev=0xe200, auth=1, DRM_IOCTL_GET_CAP
[  100.842224] [drm:drm_ioctl], pid=2389, dev=0xe200, auth=1,
DRM_IOCTL_MODE_GETRESOURCES
[  100.842245] [drm:drm_mode_getresources], CRTC[2] CONNECTORS[1] ENCODERS[1]
[  100.842264] [drm:drm_ioctl], pid=2389, dev=0xe200, auth=1,
DRM_IOCTL_MODE_GETRESOURCES
[  100.842279] [drm:drm_mode_getresources], CRTC[2] CONNECTORS[1] ENCODERS[1]
[  100.842362] [drm:drm_ioctl], pid=2389, dev=0xe200, auth=1,
DRM_IOCTL_MODE_GETCRTC
[  100.842414] [drm:drm_ioctl], pid=2389, dev=0xe200, auth=1,
DRM_IOCTL_MODE_GETCRTC
[  100.842450] [drm:drm_ioctl], pid=2389, dev=0xe200, auth=1,
DRM_IOCTL_MODE_GETCONNECTOR
[  100.842465] [drm:drm_mode_getconnector], [CONNECTOR:9:?]
[  100.842480] [drm:drm_helper_probe_single_connector_modes],
[CONNECTOR:9:HDMI-A-1]
[  100.855511] [drm:drm_helper_probe_single_connector_modes],
[CONNECTOR:9:HDMI-A-1] probed modes :
[  100.855529] [drm:drm_mode_debug_printmodeline], Modeline
12:"1680x1050" 60 146200 1680 1784 1960 2240 1050 1053 1059 1089 0x48
0xa
[  100.855549] [drm:drm_mode_debug_printmodeline], Modeline
14:"1280x1024" 75 135000 1280 1296 1440 1688 1024 1025 1028 1066 0x40
0x5
[  100.855566] [drm:drm_mode_debug_printmodeline], Modeline
13:"1280x1024" 60 108000 1280 1328 1440 1688 1024 1025 1028 1066 0x40
0x5
[  100.855583] [drm:drm_mode_debug_printmodeline], Modeline
16:"1440x900" 75 136750 1440 1536 1688 1936 900 903 909 942 0x40 0x6
[  100.855600] [drm:drm_mode_debug_printmodeline], Modeline
15:"1440x900" 60 88750 1440 1488 1520 1600 900 903 909 926 0x40 0x9
[  100.855616] [drm:drm_mode_debug_printmodeline], Modeline
24:"1024x768" 75 78800 1024 1040 1136 1312 768 769 772 800 0x40 0x5
[  100.855632] [drm:drm_mode_debug_printmodeline], Modeline
25:"1024x768" 70 75000 1024 1048 1184 1328 768 771 777 806 0x40 0xa
[  100.855649] [drm:drm_mode_debug_printmodeline], Modeline
26:"1024x768" 60 65000 1024 1048 1184 1344 768 771 777 806 0x40 0xa
[  100.855665] [drm:drm_mode_debug_printmodeline], Modeline
27:"800x600" 75 49500 800 816 896 1056 600 601 604 625 0x40 0x5
[  100.855681] [drm:drm_mode_debug_printmodeline], Modeline
28:"800x600" 72 50000 800 856 976 1040 600 637 643 666 0x40 0x5
[  100.855697] [drm:drm_mode_debug_printmodeline], Modeline
17:"800x600" 60 40000 800 840 968 1056 600 601 605 628 0x40 0x5
[  100.855713] [drm:drm_mode_debug_printmodeline], Modeline
18:"800x600" 56 36000 800 824 896 1024 600 601 603 625 0x40 0x5
[  100.855729] [drm:drm_mode_debug_printmodeline], Modeline
19:"640x480" 75 31500 640 656 720 840 480 481 484 500 0x40 0xa
[  100.855745] [drm:drm_mode_debug_printmodeline], Modeline
20:"640x480" 73 31500 640 664 704 832 480 489 491 520 0x40 0xa
[  100.855761] [drm:drm_mode_debug_printmodeline], Modeline
21:"640x480" 60 25200 640 656 752 800 480 490 492 525 0x40 0xa
[  100.855778] [drm:drm_mode_debug_printmodeline], Modeline
22:"720x400" 70 28320 720 738 846 900 400 412 414 449 0x40 0x6
[  100.855821] [drm:drm_ioctl], pid=2389, dev=0xe200, auth=1,
DRM_IOCTL_MODE_GETCONNECTOR
[  100.855838] [drm:drm_mode_getconnector], [CONNECTOR:9:?]
[  100.855913] [drm:drm_ioctl], pid=2389, dev=0xe200, auth=1,
DRM_IOCTL_MODE_GETENCODER
[  100.856122] [drm:drm_ioctl], pid=2389, dev=0xe200, auth=1,
DRM_IOCTL_MODE_GETPROPERTY
[  100.856151] [drm:drm_ioctl], pid=2389, dev=0xe200, auth=1,
DRM_IOCTL_MODE_GETPROPERTY
[  100.856186] [drm:drm_ioctl], pid=2389, dev=0xe200, auth=1,
DRM_IOCTL_MODE_GETPROPERTY
[  100.856210] [drm:drm_ioctl], pid=2389, dev=0xe200, auth=1,
DRM_IOCTL_MODE_GETPROPERTY
[  100.856322] [drm:drm_ioctl], pid=2389, dev=0xe200, auth=1,
DRM_IOCTL_MODE_GETCONNECTOR
[  100.856342] [drm:drm_mode_getconnector], [CONNECTOR:9:?]
[  100.856357] [drm:drm_helper_probe_single_connector_modes],
[CONNECTOR:9:HDMI-A-1]
[  100.869867] [drm:drm_helper_probe_single_connector_modes],
[CONNECTOR:9:HDMI-A-1] probed modes :
[  100.869885] [drm:drm_mode_debug_printmodeline], Modeline
12:"1680x1050" 60 146200 1680 1784 1960 2240 1050 1053 1059 1089 0x48
0xa
[  100.869904] [drm:drm_mode_debug_printmodeline], Modeline
14:"1280x1024" 75 135000 1280 1296 1440 1688 1024 1025 1028 1066 0x40
0x5
[  100.869921] [drm:drm_mode_debug_printmodeline], Modeline
13:"1280x1024" 60 108000 1280 1328 1440 1688 1024 1025 1028 1066 0x40
0x5
[  100.869938] [drm:drm_mode_debug_printmodeline], Modeline
16:"1440x900" 75 136750 1440 1536 1688 1936 900 903 909 942 0x40 0x6
[  100.869954] [drm:drm_mode_debug_printmodeline], Modeline
15:"1440x900" 60 88750 1440 1488 1520 1600 900 903 909 926 0x40 0x9
[  100.869971] [drm:drm_mode_debug_printmodeline], Modeline
24:"1024x768" 75 78800 1024 1040 1136 1312 768 769 772 800 0x40 0x5
[  100.869987] [drm:drm_mode_debug_printmodeline], Modeline
25:"1024x768" 70 75000 1024 1048 1184 1328 768 771 777 806 0x40 0xa
[  100.870003] [drm:drm_mode_debug_printmodeline], Modeline
26:"1024x768" 60 65000 1024 1048 1184 1344 768 771 777 806 0x40 0xa
[  100.870020] [drm:drm_mode_debug_printmodeline], Modeline
27:"800x600" 75 49500 800 816 896 1056 600 601 604 625 0x40 0x5
[  100.870036] [drm:drm_mode_debug_printmodeline], Modeline
28:"800x600" 72 50000 800 856 976 1040 600 637 643 666 0x40 0x5
[  100.870052] [drm:drm_mode_debug_printmodeline], Modeline
17:"800x600" 60 40000 800 840 968 1056 600 601 605 628 0x40 0x5
[  100.870068] [drm:drm_mode_debug_printmodeline], Modeline
18:"800x600" 56 36000 800 824 896 1024 600 601 603 625 0x40 0x5
[  100.870084] [drm:drm_mode_debug_printmodeline], Modeline
19:"640x480" 75 31500 640 656 720 840 480 481 484 500 0x40 0xa
[  100.870100] [drm:drm_mode_debug_printmodeline], Modeline
20:"640x480" 73 31500 640 664 704 832 480 489 491 520 0x40 0xa
[  100.870116] [drm:drm_mode_debug_printmodeline], Modeline
21:"640x480" 60 25200 640 656 752 800 480 490 492 525 0x40 0xa
[  100.870132] [drm:drm_mode_debug_printmodeline], Modeline
22:"720x400" 70 28320 720 738 846 900 400 412 414 449 0x40 0x6
[  100.870165] [drm:drm_ioctl], pid=2389, dev=0xe200, auth=1,
DRM_IOCTL_MODE_GETCONNECTOR
[  100.870181] [drm:drm_mode_getconnector], [CONNECTOR:9:?]
[  100.870235] [drm:drm_ioctl], pid=2389, dev=0xe200, auth=1,
DRM_IOCTL_MODE_GETPROPERTY
[  100.870257] [drm:drm_ioctl], pid=2389, dev=0xe200, auth=1,
DRM_IOCTL_MODE_GETPROPERTY
[  100.870305] [drm:drm_ioctl], pid=2389, dev=0xe200, auth=1,
DRM_IOCTL_MODE_GETPROPBLOB
[  100.870326] [drm:drm_ioctl], pid=2389, dev=0xe200, auth=1,
DRM_IOCTL_MODE_GETPROPBLOB
[  100.870349] [drm:drm_ioctl], pid=2389, dev=0xe200, auth=1,
DRM_IOCTL_MODE_GETPROPERTY
[  100.870371] [drm:drm_ioctl], pid=2389, dev=0xe200, auth=1,
DRM_IOCTL_MODE_GETPROPERTY
[  100.888222] vgaarb: this pci device is not a vga device
[  100.893578] [drm:drm_ioctl], pid=2389, dev=0xe200, auth=1,
DRM_IOCTL_SET_MASTER
[  100.893603] [drm:drm_ioctl], pid=2389, dev=0xe200, auth=1,
DRM_IOCTL_MODE_CREATE_DUMB
[  100.910271] [drm:drm_ioctl], pid=2389, dev=0xe200, auth=1,
DRM_IOCTL_MODE_CREATE_DUMB
[  100.910708] [drm:drm_ioctl], pid=2389, dev=0xe200, auth=1,
DRM_IOCTL_MODE_CREATE_DUMB
[  100.917590] [drm:drm_ioctl], pid=2389, dev=0xe200, auth=1,
DRM_IOCTL_MODE_GETPROPERTY
[  100.917621] [drm:drm_ioctl], pid=2389, dev=0xe200, auth=1,
DRM_IOCTL_MODE_GETPROPERTY
[  100.917645] [drm:drm_ioctl], pid=2389, dev=0xe200, auth=1,
DRM_IOCTL_MODE_GETPROPERTY
[  100.917668] [drm:drm_ioctl], pid=2389, dev=0xe200, auth=1,
DRM_IOCTL_MODE_GETPROPERTY
[  100.918501] [drm:drm_ioctl], pid=2389, dev=0xe200, auth=1,
DRM_IOCTL_SET_MASTER
[  100.918545] [drm:drm_ioctl], pid=2389, dev=0xe200, auth=1,
DRM_IOCTL_MODE_ADDFB
[  100.918574] [drm:drm_framebuffer_reference], FB ID: 30
[  100.918586] [drm:drm_mode_addfb], [FB:30]
[  100.918696] [drm:drm_ioctl], pid=2389, dev=0xe200, auth=1,
DRM_IOCTL_MODE_SETGAMMA
[  100.918720] [drm:drm_ioctl], ret = -38
[  100.918767] [drm:drm_ioctl], pid=2389, dev=0xe200, auth=1,
DRM_IOCTL_MODE_SETCRTC
[  100.918786] [drm:drm_mode_setcrtc], [CRTC:3]
[  100.918801] [drm:drm_framebuffer_reference], FB ID: 30
[  100.918878] [drm:drm_mode_setcrtc], [CONNECTOR:9:HDMI-A-1]
[  100.918892] [drm:drm_crtc_helper_set_config],
[  100.918902] [drm:drm_crtc_helper_set_config], [CRTC:3] [FB:30]
#connectors=1 (x y) (0 0)
[  100.918984] [drm:drm_crtc_helper_set_config],
[CONNECTOR:9:HDMI-A-1] to [CRTC:3]
[  100.918997] [drm:drm_crtc_helper_set_config], attempting to set
mode from userspace
[  100.919006] [drm:drm_mode_debug_printmodeline], Modeline
31:"1680x1050" 0 146200 1680 1784 1960 2240 1050 1053 1059 1089 0x0
0xa
[  100.919034] [drm:drm_crtc_helper_set_mode], [CRTC:3]
[  100.939091] [drm:drm_vblank_get], enabling vblank on crtc 0, ret: 0
[  100.939110] [drm:drm_update_vblank_count], enabling vblank
interrupts on crtc 0, missed 0
[  100.939147] [drm:tegra_crtc_setup_clk], rate: 292000000, div: 1
[  100.939165] ------------[ cut here ]------------
[  100.943789] WARNING: CPU: 1 PID: 2389 at
drivers/gpu/host1x/drm/dc.c:575 tegra_dc_format+0x5c/0xb8()
[  100.953100] unsupported pixel format 875710290, using default
[  100.958944] Modules linked in: dm_crypt dm_mod rt2800usb rt2800lib
rt2x00usb rt2x00lib mac80211 cfg80211 rfkill snd_soc_tegra_trimslice
r8169 snd_soc_tegra_utils mii snd_soc_tlv320aic23 snd_soc_tegra20_i2s
snd_soc_tegra_pcm snd_soc_tegra20_das regmap_mmio
[  100.981823] CPU: 1 PID: 2389 Comm: Xorg Not tainted 3.12.0-rc1+ #6
[  100.988065] [<c0015b48>] (unwind_backtrace+0x0/0xf8) from
[<c0011988>] (show_stack+0x10/0x14)
[  100.996606] [<c0011988>] (show_stack+0x10/0x14) from [<c047286c>]
(dump_stack+0x80/0xc4)
[  101.004738] [<c047286c>] (dump_stack+0x80/0xc4) from [<c00255d8>]
(warn_slowpath_common+0x64/0x88)
[  101.013720] [<c00255d8>] (warn_slowpath_common+0x64/0x88) from
[<c0025690>] (warn_slowpath_fmt+0x30/0x40)
[  101.023325] [<c0025690>] (warn_slowpath_fmt+0x30/0x40) from
[<c0274fc0>] (tegra_dc_format+0x5c/0xb8)
[  101.032477] [<c0274fc0>] (tegra_dc_format+0x5c/0xb8) from
[<c02754c8>] (tegra_crtc_mode_set+0x308/0x3a4)
[  101.041981] [<c02754c8>] (tegra_crtc_mode_set+0x308/0x3a4) from
[<c02508a8>] (drm_crtc_helper_set_mode+0x2d0/0x4e4)
[  101.052434] [<c02508a8>] (drm_crtc_helper_set_mode+0x2d0/0x4e4)
from [<c02513e0>] (drm_crtc_helper_set_config+0x804/0x978)
[  101.063516] [<c02513e0>] (drm_crtc_helper_set_config+0x804/0x978)
from [<c025f9d8>] (drm_mode_set_config_internal+0x54/0xd0)
[  101.074755] [<c025f9d8>] (drm_mode_set_config_internal+0x54/0xd0)
from [<c026183c>] (drm_mode_setcrtc+0xcc/0x500)
[  101.085113] [<c026183c>] (drm_mode_setcrtc+0xcc/0x500) from
[<c0254ff8>] (drm_ioctl+0x460/0x53c)
[  101.093931] [<c0254ff8>] (drm_ioctl+0x460/0x53c) from [<c00e5da8>]
(do_vfs_ioctl+0x80/0x5a4)
[  101.102426] [<c00e5da8>] (do_vfs_ioctl+0x80/0x5a4) from
[<c00e6304>] (SyS_ioctl+0x38/0x60)
[  101.110723] [<c00e6304>] (SyS_ioctl+0x38/0x60) from [<c000e700>]
(ret_fast_syscall+0x0/0x30)
[  101.119218] ---[ end trace c89e8f7e5431f942 ]---
[  101.123831] ------------[ cut here ]------------
[  101.128500] WARNING: CPU: 0 PID: 2389 at
drivers/gpu/host1x/drm/dc.c:306 tegra_dc_setup_window+0x6d4/0x800()
[  101.138349] Modules linked in: dm_crypt dm_mod rt2800usb rt2800lib
rt2x00usb rt2x00lib mac80211 cfg80211 rfkill snd_soc_tegra_trimslice
r8169 snd_soc_tegra_utils mii snd_soc_tlv320aic23 snd_soc_tegra20_i2s
snd_soc_tegra_pcm snd_soc_tegra20_das regmap_mmio
[  101.161633] CPU: 0 PID: 2389 Comm: Xorg Tainted: G        W    3.12.0-rc1+ #6
[  101.168886] [<c0015b48>] (unwind_backtrace+0x0/0xf8) from
[<c0011988>] (show_stack+0x10/0x14)
[  101.177477] [<c0011988>] (show_stack+0x10/0x14) from [<c047286c>]
(dump_stack+0x80/0xc4)
[  101.185601] [<c047286c>] (dump_stack+0x80/0xc4) from [<c00255d8>]
(warn_slowpath_common+0x64/0x88)
[  101.194613] [<c00255d8>] (warn_slowpath_common+0x64/0x88) from
[<c0025618>] (warn_slowpath_null+0x1c/0x24)
[  101.204321] [<c0025618>] (warn_slowpath_null+0x1c/0x24) from
[<c0274e38>] (tegra_dc_setup_window+0x6d4/0x800)
[  101.214268] [<c0274e38>] (tegra_dc_setup_window+0x6d4/0x800) from
[<c02754f8>] (tegra_crtc_mode_set+0x338/0x3a4)
[  101.224496] [<c02754f8>] (tegra_crtc_mode_set+0x338/0x3a4) from
[<c02508a8>] (drm_crtc_helper_set_mode+0x2d0/0x4e4)
[  101.234981] [<c02508a8>] (drm_crtc_helper_set_mode+0x2d0/0x4e4)
from [<c02513e0>] (drm_crtc_helper_set_config+0x804/0x978)
[  101.246093] [<c02513e0>] (drm_crtc_helper_set_config+0x804/0x978)
from [<c025f9d8>] (drm_mode_set_config_internal+0x54/0xd0)
[  101.257367] [<c025f9d8>] (drm_mode_set_config_internal+0x54/0xd0)
from [<c026183c>] (drm_mode_setcrtc+0xcc/0x500)
[  101.267686] [<c026183c>] (drm_mode_setcrtc+0xcc/0x500) from
[<c0254ff8>] (drm_ioctl+0x460/0x53c)
[  101.276572] [<c0254ff8>] (drm_ioctl+0x460/0x53c) from [<c00e5da8>]
(do_vfs_ioctl+0x80/0x5a4)
[  101.285067] [<c00e5da8>] (do_vfs_ioctl+0x80/0x5a4) from
[<c00e6304>] (SyS_ioctl+0x38/0x60)
[  101.293392] [<c00e6304>] (SyS_ioctl+0x38/0x60) from [<c000e700>]
(ret_fast_syscall+0x0/0x30)
[  101.301879] ---[ end trace c89e8f7e5431f943 ]---
[  101.306499] [drm:drm_crtc_helper_set_mode], [ENCODER:10:TMDS-10]
set [MODE:31:1680x1050]
[  101.308428] [drm:drm_calc_timestamping_constants], crtc 3: hwmode:
htotal 2240, vtotal 1089, vdisplay 1050
[  101.308447] [drm:drm_calc_timestamping_constants], crtc 3: clock
146200 kHz framedur 16685088 linedur 15321, pixeldur 6
[  101.308466] [drm:drm_crtc_helper_set_config], Setting connector
DPMS state to on
[  101.308478] [drm:drm_crtc_helper_set_config],
[CONNECTOR:9:HDMI-A-1] set DPMS on
[  101.308496] [drm:drm_framebuffer_reference], FB ID: 30
[  101.308507] [drm:drm_framebuffer_unreference], FB ID: 29
[  101.308516] [drm:drm_framebuffer_unreference], FB ID: 30
[  101.308664] [drm:drm_ioctl], pid=2389, dev=0xe200, auth=1,
DRM_IOCTL_MODE_SETPROPERTY
[  101.308692] [drm:drm_ioctl], pid=2389, dev=0xe200, auth=1,
DRM_IOCTL_MODE_SETCRTC
[  101.308708] [drm:drm_mode_setcrtc], [CRTC:6]
[  101.308718] [drm:drm_crtc_helper_set_config],
[  101.308726] [drm:drm_crtc_helper_set_config], [CRTC:6] [NOFB]
[  101.308736] [drm:drm_framebuffer_reference], FB ID: 30
[  101.308746] [drm:drm_framebuffer_unreference], FB ID: 30
[  101.441433] [drm:drm_ioctl], pid=2389, dev=0xe200, auth=1,
DRM_IOCTL_MODE_SETGAMMA
[  101.441464] [drm:drm_ioctl], ret = -38
[  101.441480] [drm:drm_ioctl], pid=2389, dev=0xe200, auth=1,
DRM_IOCTL_MODE_SETCRTC
[  101.441496] [drm:drm_mode_setcrtc], [CRTC:3]
[  101.441508] [drm:drm_framebuffer_reference], FB ID: 30
[  101.441535] [drm:drm_mode_setcrtc], [CONNECTOR:9:HDMI-A-1]
[  101.441546] [drm:drm_crtc_helper_set_config],
[  101.441555] [drm:drm_crtc_helper_set_config], [CRTC:3] [FB:30]
#connectors=1 (x y) (0 0)
[  101.441638] [drm:drm_crtc_helper_set_config],
[CONNECTOR:9:HDMI-A-1] to [CRTC:3]
[  101.441654] [drm:drm_framebuffer_reference], FB ID: 30
[  101.441664] [drm:drm_framebuffer_unreference], FB ID: 30
[  101.441673] [drm:drm_framebuffer_unreference], FB ID: 30
[  101.441692] [drm:drm_ioctl], pid=2389, dev=0xe200, auth=1,
DRM_IOCTL_MODE_SETPROPERTY
[  101.441714] [drm:drm_ioctl], pid=2389, dev=0xe200, auth=1,
DRM_IOCTL_MODE_SETCRTC
[  101.441729] [drm:drm_mode_setcrtc], [CRTC:6]
[  101.441738] [drm:drm_crtc_helper_set_config],
[  101.441745] [drm:drm_crtc_helper_set_config], [CRTC:6] [NOFB]
[  101.441758] [drm:drm_framebuffer_reference], FB ID: 30
[  101.441766] [drm:drm_framebuffer_unreference], FB ID: 30
[  101.442355] [drm:drm_ioctl], pid=2389, dev=0xe200, auth=1,
DRM_IOCTL_MODE_MAP_DUMB
[  101.442402] [drm:drm_vm_open_locked], 0xb6a63000,0x00004000
[  101.442425] [drm:drm_ioctl], pid=2389, dev=0xe200, auth=1,
DRM_IOCTL_MODE_MAP_DUMB
[  101.442450] [drm:drm_vm_open_locked], 0xb6a5f000,0x00004000
[  101.442469] [drm:drm_ioctl], pid=2389, dev=0xe200, auth=1,
DRM_IOCTL_MODE_MAP_DUMB
[  101.442492] [drm:drm_vm_open_locked], 0xb6106000,0x0050c000
[  101.635424] [drm:drm_vm_open_locked], 0xb6106000,0x0050c000
[  101.635669] [drm:drm_vm_open_locked], 0xb6a5f000,0x00004000
[  101.635684] [drm:drm_vm_open_locked], 0xb6a63000,0x00004000
[  101.638325] [drm:drm_vm_close_locked], 0xb6106000,0x0050c000
[  101.638362] [drm:drm_vm_close_locked], 0xb6a5f000,0x00004000
[  101.638372] [drm:drm_vm_close_locked], 0xb6a63000,0x00004000
[  101.872145] [drm:drm_ioctl], pid=2389, dev=0xe200, auth=1,
DRM_IOCTL_MODE_SETPROPERTY
[  101.872412] [drm:drm_ioctl], pid=2389, dev=0xe200, auth=1,
DRM_IOCTL_MODE_DIRTYFB
[  101.872435] [drm:drm_framebuffer_reference], FB ID: 30
[  101.872456] [drm:drm_framebuffer_unreference], FB ID: 30
[  101.872467] [drm:drm_ioctl], ret = -38
[  104.436270] [drm:drm_ioctl], pid=2389, dev=0xe200, auth=1,
DRM_IOCTL_MODE_CURSOR
[  104.436301] [drm:drm_ioctl], ret = -6
[  104.436347] [drm:drm_ioctl], pid=2389, dev=0xe200, auth=1,
DRM_IOCTL_MODE_CURSOR
[  104.436363] [drm:drm_ioctl], ret = -6
[  104.436390] [drm:drm_ioctl], pid=2389, dev=0xe200, auth=1,
DRM_IOCTL_MODE_CURSOR
[  104.436404] [drm:drm_ioctl], ret = -14
[  104.436415] [drm:drm_ioctl], pid=2389, dev=0xe200, auth=1,
DRM_IOCTL_MODE_CURSOR
[  104.436428] [drm:drm_ioctl], ret = -6

And then after running "xrandr -d :0 --output HDMI-0 --mode 1280x1024

[  776.115334] [drm:drm_ioctl], pid=2389, dev=0xe200, auth=1,
DRM_IOCTL_MODE_GETCONNECTOR
[  776.115399] [drm:drm_mode_getconnector], [CONNECTOR:9:?]
[  776.115445] [drm:drm_helper_probe_single_connector_modes],
[CONNECTOR:9:HDMI-A-1]
[  776.129122] [drm:drm_helper_probe_single_connector_modes],
[CONNECTOR:9:HDMI-A-1] probed modes :
[  776.129170] [drm:drm_mode_debug_printmodeline], Modeline
12:"1680x1050" 60 146200 1680 1784 1960 2240 1050 1053 1059 1089 0x48
0xa
[  776.129223] [drm:drm_mode_debug_printmodeline], Modeline
14:"1280x1024" 75 135000 1280 1296 1440 1688 1024 1025 1028 1066 0x40
0x5
[  776.129272] [drm:drm_mode_debug_printmodeline], Modeline
13:"1280x1024" 60 108000 1280 1328 1440 1688 1024 1025 1028 1066 0x40
0x5
[  776.129318] [drm:drm_mode_debug_printmodeline], Modeline
16:"1440x900" 75 136750 1440 1536 1688 1936 900 903 909 942 0x40 0x6
[  776.129363] [drm:drm_mode_debug_printmodeline], Modeline
15:"1440x900" 60 88750 1440 1488 1520 1600 900 903 909 926 0x40 0x9
[  776.129408] [drm:drm_mode_debug_printmodeline], Modeline
24:"1024x768" 75 78800 1024 1040 1136 1312 768 769 772 800 0x40 0x5
[  776.129453] [drm:drm_mode_debug_printmodeline], Modeline
25:"1024x768" 70 75000 1024 1048 1184 1328 768 771 777 806 0x40 0xa
[  776.129497] [drm:drm_mode_debug_printmodeline], Modeline
26:"1024x768" 60 65000 1024 1048 1184 1344 768 771 777 806 0x40 0xa
[  776.129541] [drm:drm_mode_debug_printmodeline], Modeline
27:"800x600" 75 49500 800 816 896 1056 600 601 604 625 0x40 0x5
[  776.129585] [drm:drm_mode_debug_printmodeline], Modeline
28:"800x600" 72 50000 800 856 976 1040 600 637 643 666 0x40 0x5
[  776.129629] [drm:drm_mode_debug_printmodeline], Modeline
17:"800x600" 60 40000 800 840 968 1056 600 601 605 628 0x40 0x5
[  776.129672] [drm:drm_mode_debug_printmodeline], Modeline
18:"800x600" 56 36000 800 824 896 1024 600 601 603 625 0x40 0x5
[  776.129716] [drm:drm_mode_debug_printmodeline], Modeline
19:"640x480" 75 31500 640 656 720 840 480 481 484 500 0x40 0xa
[  776.129760] [drm:drm_mode_debug_printmodeline], Modeline
20:"640x480" 73 31500 640 664 704 832 480 489 491 520 0x40 0xa
[  776.129804] [drm:drm_mode_debug_printmodeline], Modeline
21:"640x480" 60 25200 640 656 752 800 480 490 492 525 0x40 0xa
[  776.129848] [drm:drm_mode_debug_printmodeline], Modeline
22:"720x400" 70 28320 720 738 846 900 400 412 414 449 0x40 0x6
[  776.129939] [drm:drm_ioctl], pid=2389, dev=0xe200, auth=1,
DRM_IOCTL_MODE_GETCONNECTOR
[  776.129981] [drm:drm_mode_getconnector], [CONNECTOR:9:?]
[  776.130123] [drm:drm_ioctl], pid=2389, dev=0xe200, auth=1,
DRM_IOCTL_MODE_GETPROPERTY
[  776.130182] [drm:drm_ioctl], pid=2389, dev=0xe200, auth=1,
DRM_IOCTL_MODE_GETPROPERTY
[  776.130247] [drm:drm_ioctl], pid=2389, dev=0xe200, auth=1,
DRM_IOCTL_MODE_GETPROPBLOB
[  776.130297] [drm:drm_ioctl], pid=2389, dev=0xe200, auth=1,
DRM_IOCTL_MODE_GETPROPBLOB
[  776.130356] [drm:drm_ioctl], pid=2389, dev=0xe200, auth=1,
DRM_IOCTL_MODE_GETPROPERTY
[  776.130415] [drm:drm_ioctl], pid=2389, dev=0xe200, auth=1,
DRM_IOCTL_MODE_GETPROPERTY
[  776.142973] [drm:drm_ioctl], pid=2389, dev=0xe200, auth=1,
DRM_IOCTL_MODE_SETPROPERTY
[  776.152646] [drm:drm_ioctl], pid=2389, dev=0xe200, auth=1,
DRM_IOCTL_MODE_CREATE_DUMB
[  776.183596] [drm:drm_ioctl], pid=2389, dev=0xe200, auth=1,
DRM_IOCTL_MODE_ADDFB
[  776.183771] [drm:drm_framebuffer_reference], FB ID: 31
[  776.183811] [drm:drm_mode_addfb], [FB:31]
[  776.183863] [drm:drm_ioctl], pid=2389, dev=0xe200, auth=1,
DRM_IOCTL_MODE_MAP_DUMB
[  776.183959] [drm:drm_vm_open_locked], 0xb5572000,0x003c0000
[  776.184367] [drm:drm_ioctl], pid=2389, dev=0xe200, auth=1,
DRM_IOCTL_MODE_RMFB
[  776.184421] [drm:__drm_framebuffer_unreference], FB ID: 0
[  776.184458] [drm:drm_crtc_helper_set_config],
[  776.184481] [drm:drm_crtc_helper_set_config], [CRTC:3] [NOFB]
[  776.184516] [drm:drm_framebuffer_unreference], FB ID: 0
[  776.184545] [drm:drm_framebuffer_unreference], FB ID: 0
[  776.185296] [drm:drm_vm_close_locked], 0xb6106000,0x0050c000
[  776.185352] [drm:drm_ioctl], pid=2389, dev=0xe200, auth=1,
DRM_IOCTL_MODE_DESTROY_DUMB
[  776.244733] [drm:drm_ioctl], pid=2389, dev=0xe200, auth=1,
DRM_IOCTL_MODE_SETGAMMA
[  776.244808] [drm:drm_ioctl], ret = -38
[  776.244850] [drm:drm_ioctl], pid=2389, dev=0xe200, auth=1,
DRM_IOCTL_MODE_SETCRTC
[  776.244894] [drm:drm_mode_setcrtc], [CRTC:3]
[  776.244927] [drm:drm_framebuffer_reference], FB ID: 31
[  776.244995] [drm:drm_mode_setcrtc], [CONNECTOR:9:HDMI-A-1]
[  776.245027] [drm:drm_crtc_helper_set_config],
[  776.245051] [drm:drm_crtc_helper_set_config], [CRTC:3] [FB:31]
#connectors=1 (x y) (0 0)
[  776.245266] [drm:drm_crtc_helper_set_config], crtc has no fb, full mode set
[  776.245294] [drm:drm_crtc_helper_set_config], modes are different,
full mode set
[  776.245320] [drm:drm_mode_debug_printmodeline], Modeline
31:"1680x1050" 0 146200 1680 1784 1960 2240 1050 1053 1059 1089 0x0
0xa
[  776.245369] [drm:drm_mode_debug_printmodeline], Modeline 30:"" 0
135000 1280 1296 1440 1688 1024 1025 1028 1066 0x0 0x5
[  776.245418] [drm:drm_crtc_helper_set_config], encoder changed, full
mode switch
[  776.245443] [drm:drm_crtc_helper_set_config], crtc changed, full mode switch
[  776.245470] [drm:drm_crtc_helper_set_config],
[CONNECTOR:9:HDMI-A-1] to [CRTC:3]
[  776.245500] [drm:drm_crtc_helper_set_config], attempting to set
mode from userspace
[  776.245523] [drm:drm_mode_debug_printmodeline], Modeline 30:"" 0
135000 1280 1296 1440 1688 1024 1025 1028 1066 0x0 0x5
[  776.245593] [drm:drm_crtc_helper_set_mode], [CRTC:3]
[  776.265196] [drm:drm_vblank_get], enabling vblank on crtc 0, ret: 0
[  776.265251] [drm:drm_update_vblank_count], enabling vblank
interrupts on crtc 0, missed 0
[  776.266365] [drm:tegra_crtc_setup_clk], rate: 270000000, div: 2
[  776.266413] ------------[ cut here ]------------
[  776.271266] WARNING: CPU: 0 PID: 2389 at
drivers/gpu/host1x/drm/dc.c:575 tegra_dc_format+0x5c/0xb8()
[  776.280434] unsupported pixel format 875710290, using default
[  776.286273] Modules linked in: dm_crypt dm_mod rt2800usb rt2800lib
rt2x00usb rt2x00lib mac80211 cfg80211 rfkill snd_soc_tegra_trimslice
r8169 snd_soc_tegra_utils mii snd_soc_tlv320aic23 snd_soc_tegra20_i2s
snd_soc_tegra_pcm snd_soc_tegra20_das regmap_mmio
[  776.309311] CPU: 0 PID: 2389 Comm: Xorg Tainted: G        W    3.12.0-rc1+ #6
[  776.316619] [<c0015b48>] (unwind_backtrace+0x0/0xf8) from
[<c0011988>] (show_stack+0x10/0x14)
[  776.325337] [<c0011988>] (show_stack+0x10/0x14) from [<c047286c>]
(dump_stack+0x80/0xc4)
[  776.333545] [<c047286c>] (dump_stack+0x80/0xc4) from [<c00255d8>]
(warn_slowpath_common+0x64/0x88)
[  776.342631] [<c00255d8>] (warn_slowpath_common+0x64/0x88) from
[<c0025690>] (warn_slowpath_fmt+0x30/0x40)
[  776.352336] [<c0025690>] (warn_slowpath_fmt+0x30/0x40) from
[<c0274fc0>] (tegra_dc_format+0x5c/0xb8)
[  776.361596] [<c0274fc0>] (tegra_dc_format+0x5c/0xb8) from
[<c02754c8>] (tegra_crtc_mode_set+0x308/0x3a4)
[  776.371410] [<c02754c8>] (tegra_crtc_mode_set+0x308/0x3a4) from
[<c02508a8>] (drm_crtc_helper_set_mode+0x2d0/0x4e4)
[  776.382065] [<c02508a8>] (drm_crtc_helper_set_mode+0x2d0/0x4e4)
from [<c02513e0>] (drm_crtc_helper_set_config+0x804/0x978)
[  776.393440] [<c02513e0>] (drm_crtc_helper_set_config+0x804/0x978)
from [<c025f9d8>] (drm_mode_set_config_internal+0x54/0xd0)
[  776.404925] [<c025f9d8>] (drm_mode_set_config_internal+0x54/0xd0)
from [<c026183c>] (drm_mode_setcrtc+0xcc/0x500)
[  776.415425] [<c026183c>] (drm_mode_setcrtc+0xcc/0x500) from
[<c0254ff8>] (drm_ioctl+0x460/0x53c)
[  776.424272] [<c0254ff8>] (drm_ioctl+0x460/0x53c) from [<c00e5da8>]
(do_vfs_ioctl+0x80/0x5a4)
[  776.432750] [<c00e5da8>] (do_vfs_ioctl+0x80/0x5a4) from
[<c00e6304>] (SyS_ioctl+0x38/0x60)
[  776.441051] [<c00e6304>] (SyS_ioctl+0x38/0x60) from [<c000e700>]
(ret_fast_syscall+0x0/0x30)
[  776.449568] ---[ end trace c89e8f7e5431f944 ]---
[  776.454279] [drm:drm_crtc_helper_set_mode], [ENCODER:10:TMDS-10]
set [MODE:30:]
[  776.456382] [drm:drm_calc_timestamping_constants], crtc 3: hwmode:
htotal 1688, vtotal 1066, vdisplay 1024
[  776.456401] [drm:drm_calc_timestamping_constants], crtc 3: clock
135000 kHz framedur 13328948 linedur 12503, pixeldur 7
[  776.456421] [drm:drm_crtc_helper_set_config], Setting connector
DPMS state to on
[  776.456433] [drm:drm_crtc_helper_set_config],
[CONNECTOR:9:HDMI-A-1] set DPMS on
[  776.456457] [drm:drm_framebuffer_reference], FB ID: 31
[  776.456466] [drm:drm_framebuffer_unreference], FB ID: 31
[  776.456517] [drm:drm_ioctl], pid=2389, dev=0xe200, auth=1,
DRM_IOCTL_MODE_SETPROPERTY

-- 
This e-mail and any attachments are for the sole use of the intended 
recipients(s) and may be confidential. Use of any Pwnie Express product 
signifies your agreement to the Rapid Focus Security EULA<http://pwnieexpress.com/pdfs/RFSEULA.pdf>and is subject to export controls under the U.S. Commerce Department's 
Export Administration Regulations ("EAR").
