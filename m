From: Steev Klimaszewski <steev-4jv++OSWV9OTkO8mciVlQg@public.gmane.org>
Subject: Issue with a SOYO monitor and Trimslice
Date: Sun, 22 Sep 2013 06:26:11 -0500
Message-ID: <CAKCjkJY4nYte00jj-f78G_cohXuXSw-krrubJh1dgANtvRhJkA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi all,

Was talking on IRC in #tegra and it was suggested that I email here as
a reminder to tagr (Sorry, I don't know your real name!)

When I boot Linus' tree (3.12-rc1 at commit
c43a3855f41a25330326570d8e8d54e9927b3f56 ) my monitor, which has only
dvi and vga input, simply shows a box that states "Out of Range".  I
am able to ssh into the machine, and run startx (using the modesetting
driver) and then use xrandr to change the resolution from 1680x1050 to
something like 1024x768. However, in dmesg with drm.debug=0xf I see
the following:

[    1.044566] [drm] Initialized drm 1.1.0 20060810
[    1.051787] [drm:drm_platform_init],
[    1.051795] [drm:drm_get_platform_dev],
[    1.051837] [drm:drm_get_minor],
[    1.052139] [drm:drm_get_minor], new minor assigned 64
[    1.052148] [drm:drm_get_minor],
[    1.052411] [drm:drm_get_minor], new minor assigned 0
[    1.052980] [drm:drm_sysfs_connector_add], adding "HDMI-A-1" to sysfs
[    1.053108] [drm:drm_sysfs_hotplug_event], generating hotplug event
[    1.053193] [drm] Supports vblank timestamp caching Rev 1 (10.10.2010).
[    1.059814] [drm] No driver support for vblank timestamp query.
[    1.065734] [drm:drm_helper_probe_single_connector_modes],
[CONNECTOR:9:HDMI-A-1]
[    1.078585] [drm:drm_helper_probe_single_connector_modes],
[CONNECTOR:9:HDMI-A-1] probed modes :
[    1.078595] [drm:drm_mode_debug_printmodeline], Modeline
12:"1680x1050" 60 146200 1680 1784 1960 2240 1050 1053 1059 1089 0x48
0xa
[    1.078607] [drm:drm_mode_debug_printmodeline], Modeline
14:"1280x1024" 75 135000 1280 1296 1440 1688 1024 1025 1028 1066 0x40
0x5
[    1.078618] [drm:drm_mode_debug_printmodeline], Modeline
13:"1280x1024" 60 108000 1280 1328 1440 1688 1024 1025 1028 1066 0x40
0x5
[    1.078628] [drm:drm_mode_debug_printmodeline], Modeline
16:"1440x900" 75 136750 1440 1536 1688 1936 900 903 909 942 0x40 0x6
[    1.078638] [drm:drm_mode_debug_printmodeline], Modeline
15:"1440x900" 60 88750 1440 1488 1520 1600 900 903 909 926 0x40 0x9
[    1.078647] [drm:drm_mode_debug_printmodeline], Modeline
24:"1024x768" 75 78800 1024 1040 1136 1312 768 769 772 800 0x40 0x5
[    1.078657] [drm:drm_mode_debug_printmodeline], Modeline
25:"1024x768" 70 75000 1024 1048 1184 1328 768 771 777 806 0x40 0xa
[    1.078666] [drm:drm_mode_debug_printmodeline], Modeline
26:"1024x768" 60 65000 1024 1048 1184 1344 768 771 777 806 0x40 0xa
[    1.078676] [drm:drm_mode_debug_printmodeline], Modeline
27:"800x600" 75 49500 800 816 896 1056 600 601 604 625 0x40 0x5
[    1.078685] [drm:drm_mode_debug_printmodeline], Modeline
28:"800x600" 72 50000 800 856 976 1040 600 637 643 666 0x40 0x5
[    1.078695] [drm:drm_mode_debug_printmodeline], Modeline
17:"800x600" 60 40000 800 840 968 1056 600 601 605 628 0x40 0x5
[    1.078704] [drm:drm_mode_debug_printmodeline], Modeline
18:"800x600" 56 36000 800 824 896 1024 600 601 603 625 0x40 0x5
[    1.078714] [drm:drm_mode_debug_printmodeline], Modeline
19:"640x480" 75 31500 640 656 720 840 480 481 484 500 0x40 0xa
[    1.078723] [drm:drm_mode_debug_printmodeline], Modeline
20:"640x480" 73 31500 640 664 704 832 480 489 491 520 0x40 0xa
[    1.078733] [drm:drm_mode_debug_printmodeline], Modeline
21:"640x480" 60 25200 640 656 752 800 480 490 492 525 0x40 0xa
[    1.078742] [drm:drm_mode_debug_printmodeline], Modeline
22:"720x400" 70 28320 720 738 846 900 400 412 414 449 0x40 0x6
[    1.078752] [drm:drm_setup_crtcs],
[    1.078760] [drm:drm_enable_connectors], connector 9 enabled? yes
[    1.078767] [drm:drm_target_preferred], looking for cmdline mode on
connector 9
[    1.078773] [drm:drm_target_preferred], looking for preferred mode
on connector 9
[    1.078778] [drm:drm_target_preferred], found mode 1680x1050
[    1.078783] [drm:drm_setup_crtcs], picking CRTCs for 4096x4096 config
[    1.078791] [drm:drm_setup_crtcs], desired mode 1680x1050 set on crtc 3
[    1.090114] [drm:drm_framebuffer_reference], FB ID: 29
[    1.091245] [drm:drm_crtc_helper_set_config],
[    1.091252] [drm:drm_crtc_helper_set_config], [CRTC:3] [FB:29]
#connectors=1 (x y) (0 0)
[    1.091296] [drm:drm_crtc_helper_set_config], crtc has no fb, full mode set
[    1.091299] [drm:drm_crtc_helper_set_config], modes are different,
full mode set
[    1.091307] [drm:drm_mode_debug_printmodeline], Modeline 0:"" 0 0 0
0 0 0 0 0 0 0 0x0 0x0
[    1.091316] [drm:drm_mode_debug_printmodeline], Modeline
23:"1680x1050" 60 146200 1680 1784 1960 2240 1050 1053 1059 1089 0x48
0xa
[    1.091320] [drm:drm_crtc_helper_set_config], encoder changed, full
mode switch
[    1.091323] [drm:drm_crtc_helper_set_config], crtc changed, full mode switch
[    1.091328] [drm:drm_crtc_helper_set_config],
[CONNECTOR:9:HDMI-A-1] to [CRTC:3]
[    1.091332] [drm:drm_crtc_helper_set_config], attempting to set
mode from userspace
[    1.091340] [drm:drm_mode_debug_printmodeline], Modeline
23:"1680x1050" 60 146200 1680 1784 1960 2240 1050 1053 1059 1089 0x48
0xa
[    1.091350] [drm:drm_crtc_helper_set_mode], [CRTC:3]
[    1.111389] [drm:drm_vblank_get], enabling vblank on crtc 0, ret: 0
[    1.111395] [drm:drm_update_vblank_count], enabling vblank
interrupts on crtc 0, missed 0
[    1.113432] [drm:tegra_crtc_setup_clk], rate: 292000000, div: 1
[    1.113448] [drm:drm_crtc_helper_set_mode], [ENCODER:10:TMDS-10]
set [MODE:23:1680x1050]
[    1.115491] tegra-hdmi 54280000.hdmi: cannot set audio to 44100 at
146200000 pclk
[    1.115511] [drm:drm_calc_timestamping_constants], crtc 3: hwmode:
htotal 2240, vtotal 1089, vdisplay 1050
[    1.115517] [drm:drm_calc_timestamping_constants], crtc 3: clock
146200 kHz framedur 16685088 linedur 15321, pixeldur 6
[    1.115523] [drm:drm_crtc_helper_set_config], Setting connector
DPMS state to on
[    1.115527] [drm:drm_crtc_helper_set_config],
[CONNECTOR:9:HDMI-A-1] set DPMS on
[    1.115534] [drm:drm_framebuffer_reference], FB ID: 29
[    1.115537] [drm:drm_crtc_helper_set_config],
[    1.115541] [drm:drm_crtc_helper_set_config], [CRTC:6] [NOFB]
[    1.115544] [drm:drm_framebuffer_reference], FB ID: 29
[    1.115547] [drm:drm_framebuffer_unreference], FB ID: 29
[    1.115624] [drm:drm_crtc_helper_set_config],
[    1.115630] [drm:drm_crtc_helper_set_config], [CRTC:3] [FB:29]
#connectors=1 (x y) (0 0)
[    1.115674] [drm:drm_crtc_helper_set_config],
[CONNECTOR:9:HDMI-A-1] to [CRTC:3]
[    1.115680] [drm:drm_framebuffer_reference], FB ID: 29
[    1.115683] [drm:drm_framebuffer_unreference], FB ID: 29
[    1.134304] Console: switching to colour frame buffer device 210x65
[    1.134315] [drm:drm_crtc_helper_set_config],
[    1.134320] [drm:drm_crtc_helper_set_config], [CRTC:3] [FB:29]
#connectors=1 (x y) (0 0)
[    1.134364] [drm:drm_crtc_helper_set_config],
[CONNECTOR:9:HDMI-A-1] to [CRTC:3]
[    1.134369] [drm:drm_framebuffer_reference], FB ID: 29
[    1.134373] [drm:drm_framebuffer_unreference], FB ID: 29
[    1.165563] tegra-host1x 50000000.host1x: fb0:  frame buffer device
[    1.171829] tegra-host1x 50000000.host1x: registered panic notifier
[    1.178096] [drm] Initialized tegra 0.0.0 20120330 on minor 0

[   80.824626] [drm:drm_crtc_helper_set_config],
[   80.824638] [drm:drm_crtc_helper_set_config], [CRTC:3] [FB:29]
#connectors=1 (x y) (0 0)
[   80.824720] [drm:drm_crtc_helper_set_config],
[CONNECTOR:9:HDMI-A-1] to [CRTC:3]
[   80.824730] [drm:drm_framebuffer_reference], FB ID: 29
[   80.824736] [drm:drm_framebuffer_unreference], FB ID: 29

run startx

[  839.591574] [drm:drm_stub_open],
[  839.591591] [drm:drm_open_helper], pid = 2419, minor = 0
[  839.591617] [drm:drm_setup],
[  839.591642] [drm:drm_release], open_count = 1
[  839.591653] [drm:drm_release], pid = 2419, device = 0xe200, open_count = 1
[  839.591672] [drm:drm_lastclose],
[  839.591685] [drm:drm_crtc_helper_set_config],
[  839.591692] [drm:drm_crtc_helper_set_config], [CRTC:3] [FB:29]
#connectors=1 (x y) (0 0)
[  839.591760] [drm:drm_crtc_helper_set_config],
[CONNECTOR:9:HDMI-A-1] to [CRTC:3]
[  839.591773] [drm:drm_framebuffer_reference], FB ID: 29
[  839.591781] [drm:drm_framebuffer_unreference], FB ID: 29
[  839.591789] [drm:drm_crtc_helper_set_config],
[  839.591796] [drm:drm_crtc_helper_set_config], [CRTC:6] [NOFB]
[  839.591805] [drm:drm_framebuffer_reference], FB ID: 29
[  839.591812] [drm:drm_framebuffer_unreference], FB ID: 29
[  839.591820] [drm:drm_lastclose], driver lastclose completed
[  839.591829] [drm:drm_lastclose], lastclose completed
[  839.592114] vgaarb: this pci device is not a vga device
[  839.597430] [drm:drm_stub_open],
[  839.597443] [drm:drm_open_helper], pid = 2419, minor = 0
[  839.597465] [drm:drm_setup],
[  839.597540] [drm:drm_ioctl], pid=2419, dev=0xe200, auth=1, DRM_IOCTL_GET_CAP
[  839.597583] [drm:drm_ioctl], pid=2419, dev=0xe200, auth=1,
DRM_IOCTL_MODE_GETRESOURCES
[  839.597602] [drm:drm_mode_getresources], CRTC[2] CONNECTORS[1] ENCODERS[1]
[  839.597631] [drm:drm_ioctl], pid=2419, dev=0xe200, auth=1,
DRM_IOCTL_MODE_GETRESOURCES
[  839.597645] [drm:drm_mode_getresources], CRTC[2] CONNECTORS[1] ENCODERS[1]
[  839.597697] [drm:drm_ioctl], pid=2419, dev=0xe200, auth=1,
DRM_IOCTL_MODE_CREATE_DUMB
[  839.597723] tegra-host1x 50000000.host1x: failed to allocate buffer
with size 0
[  839.606660] [drm:drm_ioctl], ret = -12
[  839.607045] [drm:drm_ioctl], pid=2419, dev=0xe200, auth=1, DRM_IOCTL_GET_CAP
[  839.607122] [drm:drm_ioctl], pid=2419, dev=0xe200, auth=1, DRM_IOCTL_GET_CAP
[  839.607157] [drm:drm_ioctl], pid=2419, dev=0xe200, auth=1,
DRM_IOCTL_MODE_GETRESOURCES
[  839.607175] [drm:drm_mode_getresources], CRTC[2] CONNECTORS[1] ENCODERS[1]
[  839.607190] [drm:drm_ioctl], pid=2419, dev=0xe200, auth=1,
DRM_IOCTL_MODE_GETRESOURCES
[  839.607203] [drm:drm_mode_getresources], CRTC[2] CONNECTORS[1] ENCODERS[1]
[  839.607273] [drm:drm_ioctl], pid=2419, dev=0xe200, auth=1,
DRM_IOCTL_MODE_GETCRTC
[  839.607307] [drm:drm_ioctl], pid=2419, dev=0xe200, auth=1,
DRM_IOCTL_MODE_GETCRTC
[  839.607336] [drm:drm_ioctl], pid=2419, dev=0xe200, auth=1,
DRM_IOCTL_MODE_GETCONNECTOR
[  839.607348] [drm:drm_mode_getconnector], [CONNECTOR:9:?]
[  839.607359] [drm:drm_helper_probe_single_connector_modes],
[CONNECTOR:9:HDMI-A-1]
[  839.620302] [drm:drm_helper_probe_single_connector_modes],
[CONNECTOR:9:HDMI-A-1] probed modes :
[  839.620317] [drm:drm_mode_debug_printmodeline], Modeline
12:"1680x1050" 60 146200 1680 1784 1960 2240 1050 1053 1059 1089 0x48
0xa
[  839.620332] [drm:drm_mode_debug_printmodeline], Modeline
14:"1280x1024" 75 135000 1280 1296 1440 1688 1024 1025 1028 1066 0x40
0x5
[  839.620347] [drm:drm_mode_debug_printmodeline], Modeline
13:"1280x1024" 60 108000 1280 1328 1440 1688 1024 1025 1028 1066 0x40
0x5
[  839.620360] [drm:drm_mode_debug_printmodeline], Modeline
16:"1440x900" 75 136750 1440 1536 1688 1936 900 903 909 942 0x40 0x6
[  839.620373] [drm:drm_mode_debug_printmodeline], Modeline
15:"1440x900" 60 88750 1440 1488 1520 1600 900 903 909 926 0x40 0x9
[  839.620386] [drm:drm_mode_debug_printmodeline], Modeline
24:"1024x768" 75 78800 1024 1040 1136 1312 768 769 772 800 0x40 0x5
[  839.620399] [drm:drm_mode_debug_printmodeline], Modeline
25:"1024x768" 70 75000 1024 1048 1184 1328 768 771 777 806 0x40 0xa
[  839.620412] [drm:drm_mode_debug_printmodeline], Modeline
26:"1024x768" 60 65000 1024 1048 1184 1344 768 771 777 806 0x40 0xa
[  839.620424] [drm:drm_mode_debug_printmodeline], Modeline
27:"800x600" 75 49500 800 816 896 1056 600 601 604 625 0x40 0x5
[  839.620437] [drm:drm_mode_debug_printmodeline], Modeline
28:"800x600" 72 50000 800 856 976 1040 600 637 643 666 0x40 0x5
[  839.620450] [drm:drm_mode_debug_printmodeline], Modeline
17:"800x600" 60 40000 800 840 968 1056 600 601 605 628 0x40 0x5
[  839.620463] [drm:drm_mode_debug_printmodeline], Modeline
18:"800x600" 56 36000 800 824 896 1024 600 601 603 625 0x40 0x5
[  839.620475] [drm:drm_mode_debug_printmodeline], Modeline
19:"640x480" 75 31500 640 656 720 840 480 481 484 500 0x40 0xa
[  839.620488] [drm:drm_mode_debug_printmodeline], Modeline
20:"640x480" 73 31500 640 664 704 832 480 489 491 520 0x40 0xa
[  839.620501] [drm:drm_mode_debug_printmodeline], Modeline
21:"640x480" 60 25200 640 656 752 800 480 490 492 525 0x40 0xa
[  839.620513] [drm:drm_mode_debug_printmodeline], Modeline
22:"720x400" 70 28320 720 738 846 900 400 412 414 449 0x40 0x6
[  839.620550] [drm:drm_ioctl], pid=2419, dev=0xe200, auth=1,
DRM_IOCTL_MODE_GETCONNECTOR
[  839.620563] [drm:drm_mode_getconnector], [CONNECTOR:9:?]
[  839.620621] [drm:drm_ioctl], pid=2419, dev=0xe200, auth=1,
DRM_IOCTL_MODE_GETENCODER
[  839.620784] [drm:drm_ioctl], pid=2419, dev=0xe200, auth=1,
DRM_IOCTL_MODE_GETPROPERTY
[  839.620806] [drm:drm_ioctl], pid=2419, dev=0xe200, auth=1,
DRM_IOCTL_MODE_GETPROPERTY
[  839.620832] [drm:drm_ioctl], pid=2419, dev=0xe200, auth=1,
DRM_IOCTL_MODE_GETPROPERTY
[  839.620850] [drm:drm_ioctl], pid=2419, dev=0xe200, auth=1,
DRM_IOCTL_MODE_GETPROPERTY
[  839.620930] [drm:drm_ioctl], pid=2419, dev=0xe200, auth=1,
DRM_IOCTL_MODE_GETCONNECTOR
[  839.620945] [drm:drm_mode_getconnector], [CONNECTOR:9:?]
[  839.620956] [drm:drm_helper_probe_single_connector_modes],
[CONNECTOR:9:HDMI-A-1]
[  839.633853] [drm:drm_helper_probe_single_connector_modes],
[CONNECTOR:9:HDMI-A-1] probed modes :
[  839.633867] [drm:drm_mode_debug_printmodeline], Modeline
12:"1680x1050" 60 146200 1680 1784 1960 2240 1050 1053 1059 1089 0x48
0xa
[  839.633882] [drm:drm_mode_debug_printmodeline], Modeline
14:"1280x1024" 75 135000 1280 1296 1440 1688 1024 1025 1028 1066 0x40
0x5
[  839.633896] [drm:drm_mode_debug_printmodeline], Modeline
13:"1280x1024" 60 108000 1280 1328 1440 1688 1024 1025 1028 1066 0x40
0x5
[  839.633909] [drm:drm_mode_debug_printmodeline], Modeline
16:"1440x900" 75 136750 1440 1536 1688 1936 900 903 909 942 0x40 0x6
[  839.633922] [drm:drm_mode_debug_printmodeline], Modeline
15:"1440x900" 60 88750 1440 1488 1520 1600 900 903 909 926 0x40 0x9
[  839.633935] [drm:drm_mode_debug_printmodeline], Modeline
24:"1024x768" 75 78800 1024 1040 1136 1312 768 769 772 800 0x40 0x5
[  839.633947] [drm:drm_mode_debug_printmodeline], Modeline
25:"1024x768" 70 75000 1024 1048 1184 1328 768 771 777 806 0x40 0xa
[  839.633960] [drm:drm_mode_debug_printmodeline], Modeline
26:"1024x768" 60 65000 1024 1048 1184 1344 768 771 777 806 0x40 0xa
[  839.633973] [drm:drm_mode_debug_printmodeline], Modeline
27:"800x600" 75 49500 800 816 896 1056 600 601 604 625 0x40 0x5
[  839.633985] [drm:drm_mode_debug_printmodeline], Modeline
28:"800x600" 72 50000 800 856 976 1040 600 637 643 666 0x40 0x5
[  839.633998] [drm:drm_mode_debug_printmodeline], Modeline
17:"800x600" 60 40000 800 840 968 1056 600 601 605 628 0x40 0x5
[  839.634011] [drm:drm_mode_debug_printmodeline], Modeline
18:"800x600" 56 36000 800 824 896 1024 600 601 603 625 0x40 0x5
[  839.634023] [drm:drm_mode_debug_printmodeline], Modeline
19:"640x480" 75 31500 640 656 720 840 480 481 484 500 0x40 0xa
[  839.634036] [drm:drm_mode_debug_printmodeline], Modeline
20:"640x480" 73 31500 640 664 704 832 480 489 491 520 0x40 0xa
[  839.634048] [drm:drm_mode_debug_printmodeline], Modeline
21:"640x480" 60 25200 640 656 752 800 480 490 492 525 0x40 0xa
[  839.634061] [drm:drm_mode_debug_printmodeline], Modeline
22:"720x400" 70 28320 720 738 846 900 400 412 414 449 0x40 0x6
[  839.634085] [drm:drm_ioctl], pid=2419, dev=0xe200, auth=1,
DRM_IOCTL_MODE_GETCONNECTOR
[  839.634097] [drm:drm_mode_getconnector], [CONNECTOR:9:?]
[  839.634137] [drm:drm_ioctl], pid=2419, dev=0xe200, auth=1,
DRM_IOCTL_MODE_GETPROPERTY
[  839.634154] [drm:drm_ioctl], pid=2419, dev=0xe200, auth=1,
DRM_IOCTL_MODE_GETPROPERTY
[  839.634189] [drm:drm_ioctl], pid=2419, dev=0xe200, auth=1,
DRM_IOCTL_MODE_GETPROPBLOB
[  839.634206] [drm:drm_ioctl], pid=2419, dev=0xe200, auth=1,
DRM_IOCTL_MODE_GETPROPBLOB
[  839.634223] [drm:drm_ioctl], pid=2419, dev=0xe200, auth=1,
DRM_IOCTL_MODE_GETPROPERTY
[  839.634240] [drm:drm_ioctl], pid=2419, dev=0xe200, auth=1,
DRM_IOCTL_MODE_GETPROPERTY
[  839.648436] vgaarb: this pci device is not a vga device
[  839.653836] [drm:drm_ioctl], pid=2419, dev=0xe200, auth=1,
DRM_IOCTL_SET_MASTER
[  839.653857] [drm:drm_ioctl], pid=2419, dev=0xe200, auth=1,
DRM_IOCTL_MODE_CREATE_DUMB
[  839.663252] [drm:drm_ioctl], pid=2419, dev=0xe200, auth=1,
DRM_IOCTL_MODE_CREATE_DUMB
[  839.663546] [drm:drm_ioctl], pid=2419, dev=0xe200, auth=1,
DRM_IOCTL_MODE_CREATE_DUMB
[  839.670188] [drm:drm_ioctl], pid=2419, dev=0xe200, auth=1,
DRM_IOCTL_MODE_GETPROPERTY
[  839.670213] [drm:drm_ioctl], pid=2419, dev=0xe200, auth=1,
DRM_IOCTL_MODE_GETPROPERTY
[  839.670232] [drm:drm_ioctl], pid=2419, dev=0xe200, auth=1,
DRM_IOCTL_MODE_GETPROPERTY
[  839.670250] [drm:drm_ioctl], pid=2419, dev=0xe200, auth=1,
DRM_IOCTL_MODE_GETPROPERTY
[  839.670668] [drm:drm_ioctl], pid=2419, dev=0xe200, auth=1,
DRM_IOCTL_SET_MASTER
[  839.670703] [drm:drm_ioctl], pid=2419, dev=0xe200, auth=1,
DRM_IOCTL_MODE_ADDFB
[  839.670726] [drm:drm_framebuffer_reference], FB ID: 30
[  839.670736] [drm:drm_mode_addfb], [FB:30]
[  839.670834] [drm:drm_ioctl], pid=2419, dev=0xe200, auth=1,
DRM_IOCTL_MODE_SETGAMMA
[  839.670852] [drm:drm_ioctl], ret = -38
[  839.670880] [drm:drm_ioctl], pid=2419, dev=0xe200, auth=1,
DRM_IOCTL_MODE_SETCRTC
[  839.670893] [drm:drm_mode_setcrtc], [CRTC:3]
[  839.670902] [drm:drm_framebuffer_reference], FB ID: 30
[  839.670922] [drm:drm_mode_setcrtc], [CONNECTOR:9:HDMI-A-1]
[  839.670931] [drm:drm_crtc_helper_set_config],
[  839.670939] [drm:drm_crtc_helper_set_config], [CRTC:3] [FB:30]
#connectors=1 (x y) (0 0)
[  839.671006] [drm:drm_crtc_helper_set_config],
[CONNECTOR:9:HDMI-A-1] to [CRTC:3]
[  839.671015] [drm:drm_crtc_helper_set_config], attempting to set
mode from userspace
[  839.671023] [drm:drm_mode_debug_printmodeline], Modeline
31:"1680x1050" 0 146200 1680 1784 1960 2240 1050 1053 1059 1089 0x0
0xa
[  839.671043] [drm:drm_crtc_helper_set_mode], [CRTC:3]
[  839.689489] [drm:drm_vblank_get], enabling vblank on crtc 0, ret: 0
[  839.689504] [drm:drm_update_vblank_count], enabling vblank
interrupts on crtc 0, missed 0
[  839.689542] [drm:tegra_crtc_setup_clk], rate: 292000000, div: 1
[  839.689565] [drm:drm_crtc_helper_set_mode], [ENCODER:10:TMDS-10]
set [MODE:31:1680x1050]
[  839.691716] [drm:drm_calc_timestamping_constants], crtc 3: hwmode:
htotal 2240, vtotal 1089, vdisplay 1050
[  839.691730] [drm:drm_calc_timestamping_constants], crtc 3: clock
146200 kHz framedur 16685088 linedur 15321, pixeldur 6
[  839.691745] [drm:drm_crtc_helper_set_config], Setting connector
DPMS state to on
[  839.691754] [drm:drm_crtc_helper_set_config],
[CONNECTOR:9:HDMI-A-1] set DPMS on
[  839.691768] [drm:drm_framebuffer_reference], FB ID: 30
[  839.691777] [drm:drm_framebuffer_unreference], FB ID: 29
[  839.691785] [drm:drm_framebuffer_unreference], FB ID: 30
[  839.691824] [drm:drm_ioctl], pid=2419, dev=0xe200, auth=1,
DRM_IOCTL_MODE_SETPROPERTY
[  839.691843] [drm:drm_ioctl], pid=2419, dev=0xe200, auth=1,
DRM_IOCTL_MODE_SETCRTC
[  839.691855] [drm:drm_mode_setcrtc], [CRTC:6]
[  839.691863] [drm:drm_crtc_helper_set_config],
[  839.691965] [drm:drm_crtc_helper_set_config], [CRTC:6] [NOFB]
[  839.691975] [drm:drm_framebuffer_reference], FB ID: 30
[  839.691983] [drm:drm_framebuffer_unreference], FB ID: 30
[  839.840216] [drm:drm_ioctl], pid=2419, dev=0xe200, auth=1,
DRM_IOCTL_MODE_SETGAMMA
[  839.840257] [drm:drm_ioctl], ret = -38
[  839.840279] [drm:drm_ioctl], pid=2419, dev=0xe200, auth=1,
DRM_IOCTL_MODE_SETCRTC
[  839.840301] [drm:drm_mode_setcrtc], [CRTC:3]
[  839.840317] [drm:drm_framebuffer_reference], FB ID: 30
[  839.840353] [drm:drm_mode_setcrtc], [CONNECTOR:9:HDMI-A-1]
[  839.840369] [drm:drm_crtc_helper_set_config],
[  839.840381] [drm:drm_crtc_helper_set_config], [CRTC:3] [FB:30]
#connectors=1 (x y) (0 0)
[  839.840491] [drm:drm_crtc_helper_set_config],
[CONNECTOR:9:HDMI-A-1] to [CRTC:3]
[  839.840512] [drm:drm_framebuffer_reference], FB ID: 30
[  839.840525] [drm:drm_framebuffer_unreference], FB ID: 30
[  839.840538] [drm:drm_framebuffer_unreference], FB ID: 30
[  839.840566] [drm:drm_ioctl], pid=2419, dev=0xe200, auth=1,
DRM_IOCTL_MODE_SETPROPERTY
[  839.840596] [drm:drm_ioctl], pid=2419, dev=0xe200, auth=1,
DRM_IOCTL_MODE_SETCRTC
[  839.840617] [drm:drm_mode_setcrtc], [CRTC:6]
[  839.840630] [drm:drm_crtc_helper_set_config],
[  839.840641] [drm:drm_crtc_helper_set_config], [CRTC:6] [NOFB]
[  839.840657] [drm:drm_framebuffer_reference], FB ID: 30
[  839.840669] [drm:drm_framebuffer_unreference], FB ID: 30
[  839.841446] [drm:drm_ioctl], pid=2419, dev=0xe200, auth=1,
DRM_IOCTL_MODE_MAP_DUMB
[  839.841508] [drm:drm_vm_open_locked], 0xb6a80000,0x00004000
[  839.841539] [drm:drm_ioctl], pid=2419, dev=0xe200, auth=1,
DRM_IOCTL_MODE_MAP_DUMB
[  839.841572] [drm:drm_vm_open_locked], 0xb6a7c000,0x00004000
[  839.841598] [drm:drm_ioctl], pid=2419, dev=0xe200, auth=1,
DRM_IOCTL_MODE_MAP_DUMB
[  839.841630] [drm:drm_vm_open_locked], 0xb62d1000,0x0035e000
[  840.116367] [drm:drm_vm_open_locked], 0xb62d1000,0x0035e000
[  840.116719] [drm:drm_vm_open_locked], 0xb6a7c000,0x00004000
[  840.116742] [drm:drm_vm_open_locked], 0xb6a80000,0x00004000
[  840.120297] [drm:drm_vm_close_locked], 0xb62d1000,0x0035e000
[  840.120352] [drm:drm_vm_close_locked], 0xb6a7c000,0x00004000
[  840.120367] [drm:drm_vm_close_locked], 0xb6a80000,0x00004000
[  840.367755] [drm:drm_ioctl], pid=2419, dev=0xe200, auth=1,
DRM_IOCTL_MODE_SETPROPERTY
[  840.369049] [drm:drm_ioctl], pid=2419, dev=0xe200, auth=1,
DRM_IOCTL_MODE_DIRTYFB
[  840.369068] [drm:drm_framebuffer_reference], FB ID: 30
[  840.369080] [drm:drm_framebuffer_unreference], FB ID: 30
[  840.369089] [drm:drm_ioctl], ret = -38
[  842.754377] [drm:drm_ioctl], pid=2419, dev=0xe200, auth=1,
DRM_IOCTL_MODE_CURSOR
[  842.754403] [drm:drm_ioctl], ret = -6
[  842.754438] [drm:drm_ioctl], pid=2419, dev=0xe200, auth=1,
DRM_IOCTL_MODE_CURSOR
[  842.754449] [drm:drm_ioctl], ret = -6
[  842.754470] [drm:drm_ioctl], pid=2419, dev=0xe200, auth=1,
DRM_IOCTL_MODE_CURSOR
[  842.754482] [drm:drm_ioctl], ret = -14
[  842.754491] [drm:drm_ioctl], pid=2419, dev=0xe200, auth=1,
DRM_IOCTL_MODE_CURSOR
[  842.754501] [drm:drm_ioctl], ret = -6
[  843.406867] [drm:drm_ioctl], pid=2419, dev=0xe200, auth=1,
DRM_IOCTL_MODE_GETCONNECTOR
[  843.406888] [drm:drm_mode_getconnector], [CONNECTOR:9:?]
[  843.406900] [drm:drm_helper_probe_single_connector_modes],
[CONNECTOR:9:HDMI-A-1]
[  843.419908] [drm:drm_helper_probe_single_connector_modes],
[CONNECTOR:9:HDMI-A-1] probed modes :
[  843.419925] [drm:drm_mode_debug_printmodeline], Modeline
12:"1680x1050" 60 146200 1680 1784 1960 2240 1050 1053 1059 1089 0x48
0xa
[  843.419938] [drm:drm_mode_debug_printmodeline], Modeline
14:"1280x1024" 75 135000 1280 1296 1440 1688 1024 1025 1028 1066 0x40
0x5
[  843.419949] [drm:drm_mode_debug_printmodeline], Modeline
13:"1280x1024" 60 108000 1280 1328 1440 1688 1024 1025 1028 1066 0x40
0x5
[  843.419960] [drm:drm_mode_debug_printmodeline], Modeline
16:"1440x900" 75 136750 1440 1536 1688 1936 900 903 909 942 0x40 0x6
[  843.419971] [drm:drm_mode_debug_printmodeline], Modeline
15:"1440x900" 60 88750 1440 1488 1520 1600 900 903 909 926 0x40 0x9
[  843.419982] [drm:drm_mode_debug_printmodeline], Modeline
24:"1024x768" 75 78800 1024 1040 1136 1312 768 769 772 800 0x40 0x5
[  843.419993] [drm:drm_mode_debug_printmodeline], Modeline
25:"1024x768" 70 75000 1024 1048 1184 1328 768 771 777 806 0x40 0xa
[  843.420003] [drm:drm_mode_debug_printmodeline], Modeline
26:"1024x768" 60 65000 1024 1048 1184 1344 768 771 777 806 0x40 0xa
[  843.420014] [drm:drm_mode_debug_printmodeline], Modeline
27:"800x600" 75 49500 800 816 896 1056 600 601 604 625 0x40 0x5
[  843.420024] [drm:drm_mode_debug_printmodeline], Modeline
28:"800x600" 72 50000 800 856 976 1040 600 637 643 666 0x40 0x5
[  843.420035] [drm:drm_mode_debug_printmodeline], Modeline
17:"800x600" 60 40000 800 840 968 1056 600 601 605 628 0x40 0x5
[  843.420046] [drm:drm_mode_debug_printmodeline], Modeline
18:"800x600" 56 36000 800 824 896 1024 600 601 603 625 0x40 0x5
[  843.420056] [drm:drm_mode_debug_printmodeline], Modeline
19:"640x480" 75 31500 640 656 720 840 480 481 484 500 0x40 0xa
[  843.420067] [drm:drm_mode_debug_printmodeline], Modeline
20:"640x480" 73 31500 640 664 704 832 480 489 491 520 0x40 0xa
[  843.420078] [drm:drm_mode_debug_printmodeline], Modeline
21:"640x480" 60 25200 640 656 752 800 480 490 492 525 0x40 0xa
[  843.420088] [drm:drm_mode_debug_printmodeline], Modeline
22:"720x400" 70 28320 720 738 846 900 400 412 414 449 0x40 0x6
[  843.420127] [drm:drm_ioctl], pid=2419, dev=0xe200, auth=1,
DRM_IOCTL_MODE_GETCONNECTOR
[  843.420138] [drm:drm_mode_getconnector], [CONNECTOR:9:?]
[  843.420178] [drm:drm_ioctl], pid=2419, dev=0xe200, auth=1,
DRM_IOCTL_MODE_GETPROPERTY
[  843.420193] [drm:drm_ioctl], pid=2419, dev=0xe200, auth=1,
DRM_IOCTL_MODE_GETPROPERTY
[  843.420249] [drm:drm_ioctl], pid=2419, dev=0xe200, auth=1,
DRM_IOCTL_MODE_GETPROPBLOB
[  843.420263] [drm:drm_ioctl], pid=2419, dev=0xe200, auth=1,
DRM_IOCTL_MODE_GETPROPBLOB
[  843.420277] [drm:drm_ioctl], pid=2419, dev=0xe200, auth=1,
DRM_IOCTL_MODE_GETPROPERTY
[  843.420292] [drm:drm_ioctl], pid=2419, dev=0xe200, auth=1,
DRM_IOCTL_MODE_GETPROPERTY
[  844.699485] [drm:vblank_disable_fn], disabling vblank on crtc 0

Still shows Out of Range.

Setting the mode via xrandr -d :0 --output HDMI-0 --mode 1280x1024
gives me a working display, although there is slight corruption along
the right border of the screen.

Then running xrand -d :0 --output HDMI-0 --mode 1680x1050 goes back to
"Out of Range"
and the following is in dmesg (after a dmesg -c)

[ 1278.580836] [drm:drm_ioctl], pid=2419, dev=0xe200, auth=1,
DRM_IOCTL_MODE_GETCONNECTOR
[ 1278.580862] [drm:drm_mode_getconnector], [CONNECTOR:9:?]
[ 1278.580880] [drm:drm_helper_probe_single_connector_modes],
[CONNECTOR:9:HDMI-A-1]
[ 1278.593961] [drm:drm_helper_probe_single_connector_modes],
[CONNECTOR:9:HDMI-A-1] probed modes :
[ 1278.593978] [drm:drm_mode_debug_printmodeline], Modeline
12:"1680x1050" 60 146200 1680 1784 1960 2240 1050 1053 1059 1089 0x48
0xa
[ 1278.593997] [drm:drm_mode_debug_printmodeline], Modeline
14:"1280x1024" 75 135000 1280 1296 1440 1688 1024 1025 1028 1066 0x40
0x5
[ 1278.594014] [drm:drm_mode_debug_printmodeline], Modeline
13:"1280x1024" 60 108000 1280 1328 1440 1688 1024 1025 1028 1066 0x40
0x5
[ 1278.594030] [drm:drm_mode_debug_printmodeline], Modeline
16:"1440x900" 75 136750 1440 1536 1688 1936 900 903 909 942 0x40 0x6
[ 1278.594046] [drm:drm_mode_debug_printmodeline], Modeline
15:"1440x900" 60 88750 1440 1488 1520 1600 900 903 909 926 0x40 0x9
[ 1278.594062] [drm:drm_mode_debug_printmodeline], Modeline
24:"1024x768" 75 78800 1024 1040 1136 1312 768 769 772 800 0x40 0x5
[ 1278.594078] [drm:drm_mode_debug_printmodeline], Modeline
25:"1024x768" 70 75000 1024 1048 1184 1328 768 771 777 806 0x40 0xa
[ 1278.594094] [drm:drm_mode_debug_printmodeline], Modeline
26:"1024x768" 60 65000 1024 1048 1184 1344 768 771 777 806 0x40 0xa
[ 1278.594110] [drm:drm_mode_debug_printmodeline], Modeline
27:"800x600" 75 49500 800 816 896 1056 600 601 604 625 0x40 0x5
[ 1278.594126] [drm:drm_mode_debug_printmodeline], Modeline
28:"800x600" 72 50000 800 856 976 1040 600 637 643 666 0x40 0x5
[ 1278.594142] [drm:drm_mode_debug_printmodeline], Modeline
17:"800x600" 60 40000 800 840 968 1056 600 601 605 628 0x40 0x5
[ 1278.594157] [drm:drm_mode_debug_printmodeline], Modeline
18:"800x600" 56 36000 800 824 896 1024 600 601 603 625 0x40 0x5
[ 1278.594173] [drm:drm_mode_debug_printmodeline], Modeline
19:"640x480" 75 31500 640 656 720 840 480 481 484 500 0x40 0xa
[ 1278.594189] [drm:drm_mode_debug_printmodeline], Modeline
20:"640x480" 73 31500 640 664 704 832 480 489 491 520 0x40 0xa
[ 1278.594205] [drm:drm_mode_debug_printmodeline], Modeline
21:"640x480" 60 25200 640 656 752 800 480 490 492 525 0x40 0xa
[ 1278.594221] [drm:drm_mode_debug_printmodeline], Modeline
22:"720x400" 70 28320 720 738 846 900 400 412 414 449 0x40 0x6
[ 1278.594257] [drm:drm_ioctl], pid=2419, dev=0xe200, auth=1,
DRM_IOCTL_MODE_GETCONNECTOR
[ 1278.594272] [drm:drm_mode_getconnector], [CONNECTOR:9:?]
[ 1278.594325] [drm:drm_ioctl], pid=2419, dev=0xe200, auth=1,
DRM_IOCTL_MODE_GETPROPERTY
[ 1278.594346] [drm:drm_ioctl], pid=2419, dev=0xe200, auth=1,
DRM_IOCTL_MODE_GETPROPERTY
[ 1278.594370] [drm:drm_ioctl], pid=2419, dev=0xe200, auth=1,
DRM_IOCTL_MODE_GETPROPBLOB
[ 1278.594388] [drm:drm_ioctl], pid=2419, dev=0xe200, auth=1,
DRM_IOCTL_MODE_GETPROPBLOB
[ 1278.594409] [drm:drm_ioctl], pid=2419, dev=0xe200, auth=1,
DRM_IOCTL_MODE_GETPROPERTY
[ 1278.594430] [drm:drm_ioctl], pid=2419, dev=0xe200, auth=1,
DRM_IOCTL_MODE_GETPROPERTY
[ 1278.600629] [drm:drm_ioctl], pid=2419, dev=0xe200, auth=1,
DRM_IOCTL_MODE_CREATE_DUMB
[ 1278.618871] [drm:drm_ioctl], pid=2419, dev=0xe200, auth=1,
DRM_IOCTL_MODE_ADDFB
[ 1278.618922] [drm:drm_framebuffer_reference], FB ID: 30
[ 1278.618939] [drm:drm_mode_addfb], [FB:30]
[ 1278.618955] [drm:drm_ioctl], pid=2419, dev=0xe200, auth=1,
DRM_IOCTL_MODE_MAP_DUMB
[ 1278.619008] [drm:drm_vm_open_locked], 0xb62d1000,0x0035e000
[ 1278.619218] [drm:drm_ioctl], pid=2419, dev=0xe200, auth=1,
DRM_IOCTL_MODE_SETGAMMA
[ 1278.619245] [drm:drm_ioctl], ret = -38
[ 1278.619265] [drm:drm_ioctl], pid=2419, dev=0xe200, auth=1,
DRM_IOCTL_MODE_SETCRTC
[ 1278.619285] [drm:drm_mode_setcrtc], [CRTC:3]
[ 1278.619299] [drm:drm_framebuffer_reference], FB ID: 30
[ 1278.619331] [drm:drm_mode_setcrtc], [CONNECTOR:9:HDMI-A-1]
[ 1278.619346] [drm:drm_crtc_helper_set_config],
[ 1278.619357] [drm:drm_crtc_helper_set_config], [CRTC:3] [FB:30]
#connectors=1 (x y) (0 0)
[ 1278.619529] [drm:drm_crtc_helper_set_config],
[CONNECTOR:9:HDMI-A-1] to [CRTC:3]
[ 1278.619570] [drm:drm_framebuffer_reference], FB ID: 30
[ 1278.619606] [drm:drm_framebuffer_unreference], FB ID: 31
[ 1278.619645] [drm:drm_framebuffer_unreference], FB ID: 30
[ 1278.619689] [drm:drm_ioctl], pid=2419, dev=0xe200, auth=1,
DRM_IOCTL_MODE_SETPROPERTY
[ 1278.619720] [drm:drm_ioctl], pid=2419, dev=0xe200, auth=1,
DRM_IOCTL_MODE_RMFB
[ 1278.619742] [drm:__drm_framebuffer_unreference], FB ID: 0
[ 1278.619755] [drm:drm_framebuffer_unreference], FB ID: 0
[ 1278.619917] [drm:drm_vm_close_locked], 0xb5ae8000,0x00280000
[ 1278.619941] [drm:drm_ioctl], pid=2419, dev=0xe200, auth=1,
DRM_IOCTL_MODE_DESTROY_DUMB
[ 1278.648089] [drm:drm_ioctl], pid=2419, dev=0xe200, auth=1,
DRM_IOCTL_MODE_SETGAMMA
[ 1278.648132] [drm:drm_ioctl], ret = -38
[ 1278.648154] [drm:drm_ioctl], pid=2419, dev=0xe200, auth=1,
DRM_IOCTL_MODE_SETCRTC
[ 1278.648176] [drm:drm_mode_setcrtc], [CRTC:3]
[ 1278.648193] [drm:drm_framebuffer_reference], FB ID: 30
[ 1278.648228] [drm:drm_mode_setcrtc], [CONNECTOR:9:HDMI-A-1]
[ 1278.648243] [drm:drm_crtc_helper_set_config],
[ 1278.648254] [drm:drm_crtc_helper_set_config], [CRTC:3] [FB:30]
#connectors=1 (x y) (0 0)
[ 1278.648361] [drm:drm_crtc_helper_set_config], modes are different,
full mode set
[ 1278.648374] [drm:drm_mode_debug_printmodeline], Modeline 30:"" 0
135000 1280 1296 1440 1688 1024 1025 1028 1066 0x0 0x5
[ 1278.648397] [drm:drm_mode_debug_printmodeline], Modeline 31:"" 0
146200 1680 1784 1960 2240 1050 1053 1059 1089 0x0 0xa
[ 1278.648423] [drm:drm_crtc_helper_set_config],
[CONNECTOR:9:HDMI-A-1] to [CRTC:3]
[ 1278.648438] [drm:drm_crtc_helper_set_config], attempting to set
mode from userspace
[ 1278.648450] [drm:drm_mode_debug_printmodeline], Modeline 31:"" 0
146200 1680 1784 1960 2240 1050 1053 1059 1089 0x0 0xa
[ 1278.648484] [drm:drm_crtc_helper_set_mode], [CRTC:3]
[ 1278.668032] [drm:drm_vblank_get], enabling vblank on crtc 0, ret: 0
[ 1278.668058] [drm:drm_update_vblank_count], enabling vblank
interrupts on crtc 0, missed 0
[ 1278.669115] [drm:tegra_crtc_setup_clk], rate: 292000000, div: 1
[ 1278.669153] [drm:drm_crtc_helper_set_mode], [ENCODER:10:TMDS-10]
set [MODE:31:]
[ 1278.670530] [drm:drm_calc_timestamping_constants], crtc 3: hwmode:
htotal 2240, vtotal 1089, vdisplay 1050
[ 1278.670554] [drm:drm_calc_timestamping_constants], crtc 3: clock
146200 kHz framedur 16685088 linedur 15321, pixeldur 6
[ 1278.670578] [drm:drm_crtc_helper_set_config], Setting connector
DPMS state to on
[ 1278.670593] [drm:drm_crtc_helper_set_config],
[CONNECTOR:9:HDMI-A-1] set DPMS on
[ 1278.670722] [drm:drm_framebuffer_reference], FB ID: 30
[ 1278.670740] [drm:drm_framebuffer_unreference], FB ID: 30
[ 1278.670754] [drm:drm_framebuffer_unreference], FB ID: 30
[ 1278.670814] [drm:drm_ioctl], pid=2419, dev=0xe200, auth=1,
DRM_IOCTL_MODE_SETPROPERTY


The monitor is a SOYO DYLM2284 22".

-- 
This e-mail and any attachments are for the sole use of the intended 
recipients(s) and may be confidential. Use of any Pwnie Express product 
signifies your agreement to the Rapid Focus Security EULA<http://pwnieexpress.com/pdfs/RFSEULA.pdf>and is subject to export controls under the U.S. Commerce Department's 
Export Administration Regulations ("EAR").
