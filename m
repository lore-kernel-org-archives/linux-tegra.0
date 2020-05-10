From: =?UTF-8?B?TWlsYW4gQnXFoWth?= <milan.buska-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: tegra-host1x - crash after boot
Date: Sun, 10 May 2020 12:03:38 +0200
Message-ID: <CAFCWPPKL9FxuGXMd9J_sm+eFYnoqt3i8KdVhc4vQGNQe=e_JDw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Good day.

This is a bug in my system or in the kernel.


INIT: version 2.96 booting
The system is coming up.  Please wait.
[    8.699456] udevd[167]: starting version 3.2.9
[    8.713802] udevd[168]: starting eudev-3.2.9
[    8.720717] scsi 0:0:0:0: Direct-Access     Kingston DataTraveler
3.0 PMAP PQ: 0 ANSI: 6
[    8.731028] sd 0:0:0:0: [sda] 30277632 512-byte logical blocks:
(15.5 GB/14.4 GiB)
[    8.742137] sd 0:0:0:0: [sda] Write Protect is off
[    8.748454] sd 0:0:0:0: [sda] Write cache: disabled, read cache:
enabled, doesn't support DPO or FUA
[    8.831387] tegra-host1x 13e00000.host1x: Adding to iommu group 6
[    8.842994] tegra-hda 3510000.hda: Adding to iommu group 7
[    8.848819] tegra-xudc 3550000.usb: Adding to iommu group 8
[    8.872093] mousedev: PS/2 mouse device common for all mice
[    8.886474] input: jetson-tx2-hda HDMI/DP,pcm=3 as
/devices/platform/3510000.hda/sound/card0/input6
[    8.896001]  sda: sda1
[    8.896944] input: jetson-tx2-hda HDMI/DP,pcm=7 as
/devices/platform/3510000.hda/sound/card0/input7
[    8.910596] sd 0:0:0:0: [sda] Attached SCSI removable disk
[    8.938033] at24 6-0050: 256 byte 24c02 EEPROM, read-only
[    8.946665] at24 6-0057: 256 byte 24c02 EEPROM, read-only
[    8.984839] dwc-eth-dwmac 2490000.ethernet: Adding to iommu group 9
[    8.994168] Unable to handle kernel NULL pointer dereference at
virtual address 0000000000000140
[    8.994838] dwc-eth-dwmac 2490000.ethernet: no reset control found
[    9.002990] Mem abort info:
[    9.003006]   ESR = 0x96000004
[    9.015056]   EC = 0x25: DABT (current EL), IL = 32 bits
[    9.020363]   SET = 0, FnV = 0
[    9.022792] dwc-eth-dwmac 2490000.ethernet: User ID: 0x10, Synopsys ID: 0x41
[    9.023415]   EA = 0, S1PTW = 0
[    9.023417] Data abort info:
[    9.023418]   ISV = 0, ISS = 0x00000004
[    9.023420]   CM = 0, WnR = 0
[    9.023423] user pgtable: 4k pages, 48-bit VAs, pgdp=0000000269926000
[    9.023424] [0000000000000140] pgd=0000000000000000, p4d=0000000000000000
[    9.023429] Internal error: Oops: 96000004 [#1] PREEMPT SMP
[    9.023431] Modules linked in: tegra_drm(+) dwmac_dwc_qos_eth(+)
cec stmmac_platform drm_kms_helper stmmac at24 drm tegra_bpmp_thermal
mdio_xpcs snd_hda_codec_hdmi mousedev tegra_xudc snd_hda_tegra
snd_hda_c1
[    9.023450] CPU: 5 PID: 170 Comm: udevd Tainted: G S
5.7.0-rc4-next-20200508 #1
[    9.023451] Hardware name: NVIDIA Jetson TX2 Developer Kit (DT)
[    9.023454] pstate: 20000005 (nzCv daif -PAN -UAO BTYPE=--)
[    9.023461] pc : __iommu_probe_device+0x30/0x1b8
[    9.023470] lr : iommu_probe_device+0x28/0x158
[    9.030784] dwc-eth-dwmac 2490000.ethernet:  DWMAC4/5
[    9.033648] sp : ffff80001446b920
[    9.033649] x29: ffff80001446b920 x28: ffff0001e8a28818
[    9.033652] x27: ffff0001e8a28808 x26: ffff0001e9964080
[    9.033654] x25: ffff0001e99648e0 x24: 0000000000000000
[    9.033656] x23: ffff0001f4e37390 x22: 0000000000000000
[    9.033658] x21: ffff800011a39000 x20: ffff0001e8a28818
[    9.033661] x19: ffff0001e8a28818 x18: ffffffffffffffff
[    9.033662] x17: 00000000000000c0 x16: fffffe00076b1a48
[    9.033664] x15: ffff800011a39948 x14: ffff0001e996091c
[    9.033666] x13: 0000000000000040 x12: 0000000000000018
[    9.033668] x11: 0000000000000003 x10: 0101010101010101
[    9.033670] x9 : fffffffffffffffb x8 : 7f7f7f7f7f7f7f7f
[    9.033672] x7 : fefefeff646c606d x6 : 1e001e0ce4adeef5
[    9.033674] x5 : 756e2d640c1e001e x4 : 8080808000000000
[    9.033676] x3 : 830b9b4b216b73a8 x2 : ffff800008dcd030
[    9.033678] x1 : ffff800008dcd030 x0 : ffff0001e2c5e580
[    9.033680] Call trace:
[    9.033684]  __iommu_probe_device+0x30/0x1b8
[    9.033686]  iommu_probe_device+0x28/0x158
[    9.033689]  of_iommu_configure+0x200/0x218
[    9.033694]  of_dma_configure+0xd8/0x208
[    9.033708]  host1x_attach_driver+0x164/0x320 [host1x]
[    9.033716]  host1x_driver_register_full+0x84/0xe8 [host1x]
[    9.033739]  host1x_drm_init+0x34/0x1000 [tegra_drm]
[    9.036786] dwc-eth-dwmac 2490000.ethernet: DMA HW capability
register supported
[    9.040435]  do_one_initcall+0x60/0x1c0
[    9.040439]  do_init_module+0x58/0x1d0
[    9.040441]  load_module+0x1eb8/0x2310
[    9.040443]  __do_sys_finit_module+0xdc/0xf8
[    9.040445]  __arm64_sys_finit_module+0x20/0x30
[    9.040448]  el0_svc_common.constprop.3+0x68/0x170
[    9.040451]  do_el0_svc+0x24/0x90
[    9.040453]  el0_sync_handler+0x13c/0x1a8
[    9.040455]  el0_sync+0x158/0x180
[    9.040460] Code: f9417400 f9403261 f9404c36 b4000b00 (f940a2c0)
[    9.040463] ---[ end trace a171a8cb8951077a ]---

Best regards

-- 

Remember, no question is too stupid and no problem too small
       -- We've all been beginners
