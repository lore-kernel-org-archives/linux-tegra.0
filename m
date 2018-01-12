From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Subject: Error handling when vmalloc is too small
Date: Fri, 12 Jan 2018 23:32:32 +0100
Message-ID: <721fa4f9f6cc187bfe128174862de244@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: airlied-cv59FeDIM0c@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Marcel Ziswiler <marcel-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi there,

Error handling seems to be broken when allocating a framebuffer fails
(see below). Observed on a Apalis TK1 (Tegra K1 with 2GB RAM, seems to
allocate 240 MB for vmalloc) using Linux 4.15.0-rc7 connected to a 4K
TV:

[    5.632659] [drm:drm_setup_crtcs]
[    5.636227] [drm:drm_helper_probe_single_connector_modes]
[CONNECTOR:46:HDMI-A-1]
[    5.643811] [drm:drm_helper_probe_single_connector_modes]
[CONNECTOR:46:HDMI-A-1] status updated from unknown to connected
[    5.655003] [drm:drm_sysfs_hotplug_event] generating hotplug event
[    5.919028] [drm:drm_add_display_info] non_desktop set to 0
[    5.924664] [drm:drm_add_display_info] HDMI: DVI dual 0, max TMDS
clock 300000 kHz
[    5.932232] [drm:drm_add_display_info] HDMI-A-1: HDMI sink does deep
color 30.
[    5.939483] [drm:drm_add_display_info] HDMI-A-1: HDMI sink does deep
color 36.
[    5.946736] [drm:drm_add_display_info] HDMI-A-1: Assigning HDMI sink
color depth as 12 bpc.
[    5.955114] [drm:drm_add_display_info] HDMI-A-1: HDMI sink does
YCRCB444 in deep color.
[    5.963147] [drm:drm_add_display_info] HF-VSDB: max TMDS clock 600000
kHz
[    5.969954] [drm:drm_add_display_info] non_desktop set to 0
[    5.975561] [drm:drm_add_display_info] HDMI: DVI dual 0, max TMDS
clock 300000 kHz
[    5.983158] [drm:drm_add_display_info] HDMI-A-1: HDMI sink does deep
color 30.
[    5.990376] [drm:drm_add_display_info] HDMI-A-1: HDMI sink does deep
color 36.
[    5.997626] [drm:drm_add_display_info] HDMI-A-1: Assigning HDMI sink
color depth as 12 bpc.
[    6.006003] [drm:drm_add_display_info] HDMI-A-1: HDMI sink does
YCRCB444 in deep color.
[    6.014035] [drm:drm_add_display_info] HF-VSDB: max TMDS clock 600000
kHz
[    6.021749] [drm:drm_edid_to_eld] ELD monitor LG TV
[    6.026668] [drm:drm_edid_to_eld] HDMI: latency present 0 0, video
latency 0 1, audio latency 128 2
[    6.035740] [drm:drm_edid_to_eld] ELD size 40, SAD count 4
[    6.041893] [drm:drm_mode_debug_printmodeline] Modeline
49:"3840x2160" 60 594000 3840 4016 4104 4400 2160 2168 2178 2250 0x48
0x5
[    6.053568] [drm:drm_mode_prune_invalid] Not using 3840x2160 mode:
NOCLOCK
[    6.060454] [drm:drm_mode_debug_printmodeline] Modeline
62:"3840x2160" 0 594000 3840 4896 4984 5280 2160 2168 2178 2250 0x40 0x5
[    6.072038] [drm:drm_mode_prune_invalid] Not using 3840x2160 mode:
NOCLOCK
[    6.078955] [drm:drm_mode_debug_printmodeline] Modeline
65:"4096x2160" 0 594000 4096 4184 4272 4400 2160 2168 2178 2250 0x40 0x5
[    6.090687] [drm:drm_mode_prune_invalid] Not using 4096x2160 mode:
NOCLOCK
[    6.097607] [drm:drm_mode_debug_printmodeline] Modeline
66:"4096x2160" 0 594000 4096 5064 5152 5280 2160 2168 2178 2250 0x40 0x5
[    6.109192] [drm:drm_mode_prune_invalid] Not using 4096x2160 mode:
NOCLOCK
[    6.116108] [drm:drm_mode_debug_printmodeline] Modeline
69:"1920x1080i" 0 74250 1920 2008 2052 2200 1080 1084 1094 1125 0x40
0x15
[    6.127780] [drm:drm_mode_prune_invalid] Not using 1920x1080i mode:
NO_INTERLACE
[    6.135216] [drm:drm_mode_debug_printmodeline] Modeline
70:"1920x1080i" 0 74250 1920 2448 2492 2640 1080 1084 1094 1125 0x40
0x15
[    6.146887] [drm:drm_mode_prune_invalid] Not using 1920x1080i mode:
NO_INTERLACE
[    6.154323] [drm:drm_mode_debug_printmodeline] Modeline 77:"720x576i"
0 13500 720 732 795 864 576 580 586 625 0x40 0x101a
[    6.165301] [drm:drm_mode_prune_invalid] Not using 720x576i mode:
NO_INTERLACE
[    6.172534] [drm:drm_mode_debug_printmodeline] Modeline
91:"3840x2160" 60 593407 3840 4016 4104 4400 2160 2168 2178 2250 0x40
0x5
[    6.184205] [drm:drm_mode_prune_invalid] Not using 3840x2160 mode:
NOCLOCK
[    6.191089] [drm:drm_mode_debug_printmodeline] Modeline
97:"4096x2160" 60 593407 4096 4184 4272 4400 2160 2168 2178 2250 0x40
0x5
[    6.202761] [drm:drm_mode_prune_invalid] Not using 4096x2160 mode:
NOCLOCK
[    6.209676] [drm:drm_mode_debug_printmodeline] Modeline
99:"1920x1080i" 60 74176 1920 2008 2052 2200 1080 1084 1094 1125 0x40
0x15
[    6.221433] [drm:drm_mode_prune_invalid] Not using 1920x1080i mode:
NO_INTERLACE
[    6.228882] [drm:drm_helper_probe_single_connector_modes]
[CONNECTOR:46:HDMI-A-1] probed modes :
[    6.237701] [drm:drm_mode_debug_printmodeline] Modeline
84:"4096x2160" 30 297000 4096 4184 4272 4400 2160 2168 2178 2250 0x40
0x5
[    6.249379] [drm:drm_mode_debug_printmodeline] Modeline
108:"4096x2160" 30 296703 4096 4184 4272 4400 2160 2168 2178 2250 0x40
0x5
[    6.261143] [drm:drm_mode_debug_printmodeline] Modeline
83:"4096x2160" 25 297000 4096 5064 5152 5280 2160 2168 2178 2250 0x40
0x5
[    6.272822] [drm:drm_mode_debug_printmodeline] Modeline
82:"4096x2160" 24 297000 4096 5116 5204 5500 2160 2168 2178 2250 0x40
0x5
[    6.284500] [drm:drm_mode_debug_printmodeline] Modeline
107:"4096x2160" 24 296703 4096 5116 5204 5500 2160 2168 2178 2250 0x40
0x5
[    6.296265] [drm:drm_mode_debug_printmodeline] Modeline
81:"3840x2160" 30 297000 3840 4016 4104 4400 2160 2168 2178 2250 0x40
0x5
[    6.307944] [drm:drm_mode_debug_printmodeline] Modeline
106:"3840x2160" 30 296703 3840 4016 4104 4400 2160 2168 2178 2250 0x40
0x5
[    6.319708] [drm:drm_mode_debug_printmodeline] Modeline
80:"3840x2160" 25 297000 3840 4896 4984 5280 2160 2168 2178 2250 0x40
0x5
[    6.331385] [drm:drm_mode_debug_printmodeline] Modeline
79:"3840x2160" 24 297000 3840 5116 5204 5500 2160 2168 2178 2250 0x40
0x5
[    6.343062] [drm:drm_mode_debug_printmodeline] Modeline
105:"3840x2160" 24 296703 3840 5116 5204 5500 2160 2168 2178 2250 0x40
0x5
[    6.354826] [drm:drm_mode_debug_printmodeline] Modeline
85:"1920x1080" 120 297000 1920 2008 2052 2200 1080 1084 1089 1125 0x40
0x5
[    6.366590] [drm:drm_mode_debug_printmodeline] Modeline
109:"1920x1080" 120 296703 1920 2008 2052 2200 1080 1084 1089 1125 0x40
0x5
[    6.378439] [drm:drm_mode_debug_printmodeline] Modeline
86:"1920x1080" 100 297000 1920 2448 2492 2640 1080 1084 1089 1125 0x40
0x5
[    6.390202] [drm:drm_mode_debug_printmodeline] Modeline
50:"1920x1080" 60 148500 1920 2008 2052 2200 1080 1084 1089 1125 0x40
0x5
[    6.401879] [drm:drm_mode_debug_printmodeline] Modeline
92:"1920x1080" 60 148352 1920 2008 2052 2200 1080 1084 1089 1125 0x40
0x5
[    6.413557] [drm:drm_mode_debug_printmodeline] Modeline
64:"1920x1080" 50 148500 1920 2448 2492 2640 1080 1084 1089 1125 0x40
0x5
[    6.425234] [drm:drm_mode_debug_printmodeline] Modeline
76:"1920x1080" 30 74250 1920 2008 2052 2200 1080 1084 1089 1125 0x40 0x5
[    6.436825] [drm:drm_mode_debug_printmodeline] Modeline
103:"1920x1080" 30 74176 1920 2008 2052 2200 1080 1084 1089 1125 0x40
0x5
[    6.448502] [drm:drm_mode_debug_printmodeline] Modeline
75:"1920x1080" 25 74250 1920 2448 2492 2640 1080 1084 1089 1125 0x40 0x5
[    6.460092] [drm:drm_mode_debug_printmodeline] Modeline
74:"1920x1080" 24 74250 1920 2558 2602 2750 1080 1084 1089 1125 0x40 0x5
[    6.471682] [drm:drm_mode_debug_printmodeline] Modeline
102:"1920x1080" 24 74176 1920 2558 2602 2750 1080 1084 1089 1125 0x40
0x5
[    6.483359] [drm:drm_mode_debug_printmodeline] Modeline
56:"1280x1024" 60 108000 1280 1328 1440 1688 1024 1025 1028 1066 0x40
0x5
[    6.495035] [drm:drm_mode_debug_printmodeline] Modeline 51:"1360x768"
60 85500 1360 1424 1536 1792 768 771 777 795 0x40 0x5
[    6.506192] [drm:drm_mode_debug_printmodeline] Modeline 55:"1152x864"
60 81579 1152 1216 1336 1520 864 865 868 895 0x0 0x6
[    6.517262] [drm:drm_mode_debug_printmodeline] Modeline 67:"1280x720"
60 74250 1280 1390 1430 1650 720 725 730 750 0x40 0x5
[    6.528419] [drm:drm_mode_debug_printmodeline] Modeline 98:"1280x720"
60 74176 1280 1390 1430 1650 720 725 730 750 0x40 0x5
[    6.539577] [drm:drm_mode_debug_printmodeline] Modeline 68:"1280x720"
50 74250 1280 1720 1760 1980 720 725 730 750 0x40 0x5
[    6.550734] [drm:drm_mode_debug_printmodeline] Modeline 54:"1024x768"
60 65000 1024 1048 1184 1344 768 771 777 806 0x40 0xa
[    6.561892] [drm:drm_mode_debug_printmodeline] Modeline 53:"800x600"
60 40000 800 840 968 1056 600 601 605 628 0x40 0x5
[    6.572702] [drm:drm_mode_debug_printmodeline] Modeline 73:"720x576"
50 27000 720 732 796 864 576 581 586 625 0x40 0xa
[    6.583426] [drm:drm_mode_debug_printmodeline] Modeline 100:"720x480"
60 27027 720 736 798 858 480 489 495 525 0x40 0xa
[    6.594236] [drm:drm_mode_debug_printmodeline] Modeline 71:"720x480"
60 27000 720 736 798 858 480 489 495 525 0x40 0xa
[    6.604960] [drm:drm_mode_debug_printmodeline] Modeline 93:"640x480"
60 25200 640 656 752 800 480 490 492 525 0x40 0xa
[    6.615684] [drm:drm_mode_debug_printmodeline] Modeline 52:"640x480"
60 25175 640 656 752 800 480 490 492 525 0x40 0xa
[    6.626407] [drm:drm_mode_debug_printmodeline] Modeline 59:"720x400"
70 28320 720 738 846 900 400 412 414 449 0x40 0x6
[    6.637127] [drm:drm_setup_crtcs] connector 46 enabled? yes
[    6.642701] [drm:drm_setup_crtcs] looking for cmdline mode on
connector 46
[    6.649606] [drm:drm_setup_crtcs] looking for preferred mode on
connector 46 0
[    6.656855] [drm:drm_setup_crtcs] found mode 4096x2160
[    6.661995] [drm:drm_setup_crtcs] picking CRTCs for 4096x4096 config
[    6.668389] [drm:drm_setup_crtcs] desired mode 4096x2160 set on crtc
32 (0,0)
[    6.675563] [drm:drm_mode_object_get] OBJ ID: 46 (2)
[    7.898152] vmap allocation for size 353898496 failed: use
vmalloc=<size> to increase size
[    7.906540] drm drm: failed to vmap() framebuffer
[    7.911257] [drm:drm_mode_object_put.part.0] OBJ ID: 57 (1)
[    8.195039] [drm:drm_fb_helper_hotplug_event.part.9]
[    8.200096] [drm:drm_setup_crtcs]
[    8.203558] drm drm: failed to set initial configuration: -12
[    8.203677] ------------[ cut here ]------------
[    8.203695] WARNING: CPU: 0 PID: 16 at
kernel/locking/mutex-debug.c:103 mutex_destroy+0x74/0x78
[    8.203700] DEBUG_LOCKS_WARN_ON(mutex_is_locked(lock))
[    8.203705] Modules linked in:
[    8.203719] CPU: 0 PID: 16 Comm: kworker/0:1 Not tainted
4.15.0-rc7-00008-g7c35d04354b7 #37
[    8.203725] Hardware name: NVIDIA Tegra SoC (Flattened Device Tree)
[    8.203738] Workqueue: events deferred_probe_work_func
[    8.203760] [<c0110ff4>] (unwind_backtrace) from [<c010c898>]
(show_stack+0x10/0x14)
[    8.203774] [<c010c898>] (show_stack) from [<c098b790>]
(dump_stack+0x8c/0xa0)
[    8.203787] [<c098b790>] (dump_stack) from [<c01222a4>]
(__warn+0xe0/0xf8)
[    8.203797] [<c01222a4>] (__warn) from [<c01222f4>]
(warn_slowpath_fmt+0x38/0x48)
[    8.203810] [<c01222f4>] (warn_slowpath_fmt) from [<c017850c>]
(mutex_destroy+0x74/0x78)
[    8.203823] [<c017850c>] (mutex_destroy) from [<c04e3484>]
(drm_fb_helper_fini+0xbc/0xec)
[    8.203835] [<c04e3484>] (drm_fb_helper_fini) from [<c050f738>]
(tegra_drm_fb_init+0x74/0xb0)
[    8.203846] [<c050f738>] (tegra_drm_fb_init) from [<c050d72c>]
(tegra_drm_load+0x2a4/0x32c)
[    8.203859] [<c050d72c>] (tegra_drm_load) from [<c04ebc00>]
(drm_dev_register+0x13c/0x1d4)
[    8.203870] [<c04ebc00>] (drm_dev_register) from [<c050d1fc>]
(host1x_drm_probe+0x34/0x58)
[    8.203882] [<c050d1fc>] (host1x_drm_probe) from [<c05769a8>]
(driver_probe_device+0x254/0x32c)
[    8.203896] [<c05769a8>] (driver_probe_device) from [<c0574d48>]
(bus_for_each_drv+0x44/0x94)
[    8.203909] [<c0574d48>] (bus_for_each_drv) from [<c0576674>]
(__device_attach+0xb4/0x118)
[    8.203922] [<c0576674>] (__device_attach) from [<c0575be0>]
(bus_probe_device+0x88/0x90)
[    8.203935] [<c0575be0>] (bus_probe_device) from [<c0573fa0>]
(device_add+0x394/0x598)
[    8.203950] [<c0573fa0>] (device_add) from [<c04c35b8>]
(host1x_subdev_register+0xf0/0x118)
[    8.203964] [<c04c35b8>] (host1x_subdev_register) from [<c04c3b2c>]
(host1x_client_register+0x130/0x14c)
[    8.203978] [<c04c3b2c>] (host1x_client_register) from [<c054170c>]
(tegra_hdmi_probe+0x1e4/0x2d0)
[    8.203990] [<c054170c>] (tegra_hdmi_probe) from [<c0578754>]
(platform_drv_probe+0x50/0xac)
[    8.204001] [<c0578754>] (platform_drv_probe) from [<c05769a8>]
(driver_probe_device+0x254/0x32c)
[    8.204014] [<c05769a8>] (driver_probe_device) from [<c0574d48>]
(bus_for_each_drv+0x44/0x94)
[    8.204027] [<c0574d48>] (bus_for_each_drv) from [<c0576674>]
(__device_attach+0xb4/0x118)
[    8.204040] [<c0576674>] (__device_attach) from [<c0575be0>]
(bus_probe_device+0x88/0x90)
[    8.204053] [<c0575be0>] (bus_probe_device) from [<c0575fe8>]
(deferred_probe_work_func+0x54/0x160)
[    8.204066] [<c0575fe8>] (deferred_probe_work_func) from [<c013db40>]
(process_one_work+0x288/0x6f4)
[    8.204077] [<c013db40>] (process_one_work) from [<c013ef5c>]
(worker_thread+0x234/0x548)
[    8.204089] [<c013ef5c>] (worker_thread) from [<c0144034>]
(kthread+0x160/0x168)
[    8.204103] [<c0144034>] (kthread) from [<c0107d28>]
(ret_from_fork+0x14/0x2c)
[    8.204109] ---[ end trace 819e9d4700a61904 ]---
[    8.204120] [drm:drm_mode_object_put.part.0] OBJ ID: 46 (3)
[    8.204130] [drm:drm_mode_object_put.part.0] OBJ ID: 46 (2)
[    8.498149] Unable to handle kernel paging request at virtual address
6b6b6b6b
[    8.505390] pgd = 8cebd0aa
[    8.508098] [6b6b6b6b] *pgd=00000000
[    8.511685] Internal error: Oops: 5 [#1] PREEMPT SMP ARM
[    8.516994] Modules linked in:
[    8.520059] CPU: 0 PID: 3 Comm: kworker/0:0 Tainted: G        W      
 4.15.0-rc7-00008-g7c35d04354b7 #37
[    8.529614] Hardware name: NVIDIA Tegra SoC (Flattened Device Tree)
[    8.535880] Workqueue: events output_poll_execute
[    8.540591] PC is at drm_setup_crtcs+0x130/0xd90
[    8.545205] LR is at 0x0
[    8.547740] pc : [<c04e3748>]    lr : [<00000000>]    psr: 20000113
[    8.554000] sp : ee8b3e00  ip : ee8b2000  fp : c2ddee00
[    8.559220] r10: c2db8600  r9 : c0f560e4  r8 : 00000001
[    8.564440] r7 : 6b6b6b6b  r6 : 6b6b6b6b  r5 : 00000000  r4 :
00000001
[    8.570961] r3 : 6b6b6b6b  r2 : 6b6b6b6b  r1 : 6b6b6b6b  r0 :
00000000
[    8.577484] Flags: nzCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM 
Segment none
[    8.584612] Control: 10c5387d  Table: 8000406a  DAC: 00000051
[    8.590352] Process kworker/0:0 (pid: 3, stack limit = 0x59b66d66)
[    8.596526] Stack: (0xee8b3e00 to 0xee8b4000)
[    8.600888] 3e00: 00000000 00000000 c14b147a 00000029 00000000
c2dded80 c2dde8c0 c2dded40
[    8.609061] 3e20: 00000004 6b6b6b6b 6b6b6b6b c0c055a0 c04e48d4
eef89d40 c2dd9000 00000001
[    8.617234] 3e40: c2dd9254 c0f08468 00000001 c0185dc4 c0c35600
ee8b3e74 00000001 c0186924
[    8.625405] 3e60: 00000001 ee8b3e74 00000000 c04eb2d0 c0c35600
c0c055a0 c04e48d4 c0c08ac4
[    8.633578] 3e80: ee8b3e90 c0f08468 00000001 c2db8600 c2db86d0
eef89d40 00000000 00000001
[    8.641750] 3ea0: c2dd9254 c0f08468 00000001 c04e48e8 c2dd943c
c2dd9000 eef89d40 c04d4bf4
[    8.649922] 3ec0: c013da40 00000000 00000000 ee8b13e0 eef89d40
c017ba90 00000000 00000000
[    8.658093] 3ee0: eef89d40 c2dd943c ee886900 eef89d40 eef8d100
ee8b3f20 c0fbc134 c0f08468
[    8.666265] 3f00: 00000001 c013db40 00000001 00000000 c013da40
c14b0f7c 00000000 00000000
[    8.674437] 3f20: c14e88b0 c1210b3c 00000000 c0c32ba4 ffffe000
ee886900 eef89d40 ee886918
[    8.682609] 3f40: c0f05900 eef89d74 ffffe000 00000008 eef89d40
c013ed68 c0fbbbe4 00000000
[    8.690781] 3f60: ffffe000 ee886880 ee83db80 00000000 ee8b2000
ee886900 c013ed28 ee8abebc
[    8.698952] 3f80: ee8868b8 c0144034 00000000 ee83db80 c0143ed4
00000000 00000000 00000000
[    8.707124] 3fa0: 00000000 00000000 00000000 c0107d28 00000000
00000000 00000000 00000000
[    8.715294] 3fc0: 00000000 00000000 00000000 00000000 00000000
00000000 00000000 00000000
[    8.723466] 3fe0: 00000000 00000000 00000000 00000000 00000013
00000000 ffffffff 00000008
[    8.731640] [<c04e3748>] (drm_setup_crtcs) from [<c04e48e8>]
(drm_fb_helper_hotplug_event.part.9+0x94/0xb4)
[    8.741374] [<c04e48e8>] (drm_fb_helper_hotplug_event.part.9) from
[<c04d4bf4>] (output_poll_execute+0x8c/0x1a8)
[    8.751540] [<c04d4bf4>] (output_poll_execute) from [<c013db40>]
(process_one_work+0x288/0x6f4)
[    8.760232] [<c013db40>] (process_one_work) from [<c013ed68>]
(worker_thread+0x40/0x548)
[    8.768319] [<c013ed68>] (worker_thread) from [<c0144034>]
(kthread+0x160/0x168)
[    8.775715] [<c0144034>] (kthread) from [<c0107d28>]
(ret_from_fork+0x14/0x2c)
[    8.782936] Code: e1a02007 e1a01006 e7933104 e2844001 (e5930000)
[    8.789063] ---[ end trace 819e9d4700a61905 ]---
[

--
Stefan
