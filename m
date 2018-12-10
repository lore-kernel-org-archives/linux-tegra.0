From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Subject: Re: TK1: DRM, Nouveau and VIC
Date: Mon, 10 Dec 2018 15:20:19 +0000
Message-ID: <49ea16ae9b500551a68b001ed7ce064b2591fd04.camel@toradex.com>
References: <0c2db0d1c102a4f5a441f8e5a90f6793f329ada7.camel@toradex.com>
 <20181210102147.GF15154@ulmo> <20181210110056.GL15154@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181210110056.GL15154@ulmo>
Content-Language: en-US
Content-ID: <500A99CD3F46CC42A60D7CDCA4B1A63E@eurprd05.prod.outlook.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "bskeggs@redhat.com" <bskeggs@redhat.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "mperttunen@nvidia.com" <mperttunen@nvidia.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "jonathanh@nvidia.com" <jonathanh@nvidia.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-tegra@vger.kernel.org

Hi Thierry

On Mon, 2018-12-10 at 12:00 +0100, Thierry Reding wrote:
> On Mon, Dec 10, 2018 at 11:21:47AM +0100, Thierry Reding wrote:
> > On Sat, Dec 08, 2018 at 02:54:45PM +0000, Marcel Ziswiler wrote:
> > > Hi Thierry et al.
> > > 
> > > I noticed that since commit 3dde5a2342cd ("ARM: tegra: Add VIC on
> > > Tegra124") graphics on Apalis TK1 is broken. During boot it fails
> > > loading the vic firmware:
> > > 
> > > [    1.595824] tegra-vic 54340000.vic: Direct firmware load for
> > > nvidia/tegra124/vic03_ucode.bin failed with error -2
> > > [    1.606140] tegra-vic: probe of 54340000.vic failed with error
> > > -2
> > > 
> > > Subsequently Tegra HDMI seems to fail completely:
> > > 
> > > [    2.379860] tegra-hdmi 54280000.hdmi: failed to get PLL
> > > regulator
> > > 
> > > And finally, Nouveau even crashes:
> > > 
> > > [    8.241115] nouveau 57000000.gpu: Linked as a consumer to
> > > regulator.31
> > > [    8.247889] nouveau 57000000.gpu: NVIDIA GK20A (0ea000a1)
> > > [    8.253396] nouveau 57000000.gpu: imem: using IOMMU
> > > [    8.270210] Unable to handle kernel NULL pointer dereference
> > > at
> > > virtual address 0000006c
> > > [    8.278340] pgd = (ptrval)
> > > [    8.281250] [0000006c] *pgd=00000000
> > > [    8.284944] Internal error: Oops: 5 [#1] PREEMPT SMP ARM
> > > [    8.290260] Modules linked in: nouveau(+) ttm
> > > [    8.294625] CPU: 2 PID: 203 Comm: systemd-udevd Not tainted
> > > 4.20.0-
> > > rc5-next-20181207-00008-g85b0f8e25f86-dirty #110
> > > [    8.305055] Hardware name: NVIDIA Tegra SoC (Flattened Device
> > > Tree)
> > > [    8.311331] PC is at drm_plane_register_all+0x18/0x50
> > > [    8.316373] LR is at drm_modeset_register_all+0xc/0x70
> > > [    8.321513] pc : [<c056200c>]    lr : [<c0564cc8>]    psr:
> > > a0060013
> > > [    8.327768] sp : ed527c70  ip : ecc43ec0  fp : 00000000
> > > [    8.332993] r10: 00000016  r9 : ecc43e80  r8 : 00000000
> > > [    8.338209] r7 : bf182c80  r6 : 00000000  r5 : ed61b24c  r4 :
> > > fffffffc
> > > [    8.344735] r3 : 0002f000  r2 : ffffffff  r1 : 2e124000  r0 :
> > > ed61b000
> > > [    8.351260] Flags: NzCv  IRQs on  FIQs on  Mode SVC_32  ISA
> > > ARM  Segment none
> > > [    8.358383] Control: 10c5387d  Table: ad64c06a  DAC: 00000051
> > > [    8.364127] Process systemd-udevd (pid: 203, stack limit =
> > > 0x(ptrval))
> > > [    8.370654] Stack: (0xed527c70 to 0xed528000)
> > > [    8.375004] 7c60:                                     ed61b000
> > > ed61b000 00000000 c0564cc8
> > > [    8.383177] 7c80: ed61b000 00000000 00000000 c054b5b8 00000001
> > > 00000001 ffffffff ffffffff
> > > [    8.391355] 7ca0: ed527cc0 c0f08c48 ed61b000 00000000 00000000
> > > 00000000 bf180c5c bf0dc900
> > > [    8.399531] 7cc0: eda29208 5dfe844b 00000000 ee9f2a10 00000000
> > > bf180c5c 00000000 c05a9328
> > > [    8.407695] 7ce0: c1006828 ee9f2a10 c100682c 00000000 00000000
> > > c05a744c ee9f2a10 bf180c5c
> > > [    8.415871] 7d00: ee9f2a44 c05a77a8 00000000 c0f08c48 bf182980
> > > c05a769c eefd14d0 c05a77a8
> > > [    8.424048] 7d20: 00000000 ee9f2a10 bf180c5c ee9f2a44 c05a77a8
> > > 00000000 c0f08c48 bf182980
> > > [    8.432226] 7d40: 00000000 c05a7884 ee9ebfb4 c0f08c48 bf180c5c
> > > c05a5790 00000000 ee88135c
> > > [    8.440405] 7d60: ee9ebfb4 5dfe844b c0f71168 bf180c5c ee379e80
> > > c0f71168 00000000 c05a692c
> > > [    8.448570] 7d80: bf15dc00 bf180ac8 ffffe000 bf180c5c bf180ac8
> > > ffffe000 bf1aa000 c05a84a0
> > > [    8.456746] 7da0: bf182b80 bf180ac8 ffffe000 bf1aa170 c0fbd220
> > > c0f08c48 ffffe000 c0102ed0
> > > [    8.464924] 7dc0: ed53f4c0 006000c0 c01b3d98 0000000c 60000113
> > > bf182980 00000040 c02592d0
> > > [    8.473102] 7de0: eda60200 2e124000 ee800000 006000c0 006000c0
> > > c01b3d98 0000000c c025a8cc
> > > [    8.481281] 7e00: c024ce54 a0000113 bf182980 5dfe844b bf182980
> > > 00000002 ed53f4c0 00000002
> > > [    8.489459] 7e20: eceba000 c01b3dd4 c0f08c48 bf182980 00000000
> > > ed527f40 00000002 eceb9fc0
> > > [    8.497625] 7e40: 00000002 c01b61a4 bf18298c 00007fff bf182980
> > > c01b2f88 00000000 c01b279c
> > > [    8.505800] 7e60: bf1829c8 bf182a80 bf182b6c bf182ab0 c0b03ab0
> > > c0d58964 c0ca726c c0ca7278
> > > [    8.513978] 7e80: c0ca72d0 c0f08c48 00000000 c02654a0 00000000
> > > 00000000 ffffe000 bf000000
> > > [    8.522157] 7ea0: 00000000 00000000 00000000 00000000 00000000
> > > 00000000 6e72656b 00006c65
> > > [    8.530336] 7ec0: 00000000 00000000 00000000 00000000 00000000
> > > 00000000 00000000 00000000
> > > [    8.538502] 7ee0: 00000000 00000000 00000000 00000000 00000000
> > > 5dfe844b 7fffffff c0f08c48
> > > [    8.546677] 7f00: 00000000 0000000f b6f761cc c0101204 ed526000
> > > 0000017b 004a3270 c01b66a4
> > > [    8.554855] 7f20: 7fffffff 00000000 00000003 00000001 004a3270
> > > f0ced000 06e8994c 00000000
> > > [    8.563032] 7f40: f0e37f3a f0e50a40 f0ced000 06e8994c f7b75f9c
> > > f7b75d34 f63e62dc 0016b000
> > > [    8.571209] 7f60: 0017f6f0 00000000 00000000 00000000 00050a48
> > > 0000003b 0000003c 00000023
> > > [    8.579388] 7f80: 00000000 00000014 00000000 5dfe844b 00000000
> > > 004c0ec0 00000000 00000001
> > > [    8.587554] 7fa0: 0000017b c0101000 004c0ec0 00000000 0000000f
> > > b6f761cc 00000000 00020000
> > > [    8.595730] 7fc0: 004c0ec0 00000000 00000001 0000017b 0048e114
> > > 00000000 00000000 004a3270
> > > [    8.603908] 7fe0: bea8f990 bea8f980 b6f71269 b6e9f6c0 400d0010
> > > 0000000f 00000000 00000000
> > > [    8.612096] [<c056200c>] (drm_plane_register_all) from
> > > [<c0564cc8>]
> > > (drm_modeset_register_all+0xc/0x70)  
> > > [    8.621499] [<c0564cc8>] (drm_modeset_register_all) from
> > > [<c054b5b8>] (drm_dev_register+0x168/0x1c4)
> > > [    8.630855] [<c054b5b8>] (drm_dev_register) from [<bf0dc900>]
> > > (nouveau_platform_probe+0x6c/0x88 [nouveau])
> > > [    8.640739] [<bf0dc900>] (nouveau_platform_probe [nouveau])
> > > from
> > > [<c05a9328>] (platform_drv_probe+0x48/0x98)
> > > [    8.650574] [<c05a9328>] (platform_drv_probe) from
> > > [<c05a744c>]
> > > (really_probe+0x1e0/0x2cc)
> > > [    8.658827] [<c05a744c>] (really_probe) from [<c05a769c>]
> > > (driver_probe_device+0x60/0x16c)
> > > [    8.667096] [<c05a769c>] (driver_probe_device) from
> > > [<c05a7884>]
> > > (__driver_attach+0xdc/0xe0)
> > > [    8.675543] [<c05a7884>] (__driver_attach) from [<c05a5790>]
> > > (bus_for_each_dev+0x74/0xb4)
> > > [    8.683729] [<c05a5790>] (bus_for_each_dev) from [<c05a692c>]
> > > (bus_add_driver+0x1c0/0x204)
> > > [    8.692004] [<c05a692c>] (bus_add_driver) from [<c05a84a0>]
> > > (driver_register+0x74/0x108)
> > > [    8.700324] [<c05a84a0>] (driver_register) from [<bf1aa170>]
> > > (nouveau_drm_init+0x170/0x1000 [nouveau])   
> > > [    8.709857] [<bf1aa170>] (nouveau_drm_init [nouveau]) from
> > > [<c0102ed0>] (do_one_initcall+0x54/0x284)
> > > [    8.718980] [<c0102ed0>] (do_one_initcall) from [<c01b3dd4>]
> > > (do_init_module+0x64/0x214)
> > > [    8.727079] [<c01b3dd4>] (do_init_module) from [<c01b61a4>]
> > > (load_module+0x21b8/0x246c)
> > > [    8.735094] [<c01b61a4>] (load_module) from [<c01b66a4>]
> > > (sys_finit_module+0xc4/0xdc)
> > > [    8.742937] [<c01b66a4>] (sys_finit_module) from [<c0101000>]
> > > (ret_fast_syscall+0x0/0x54)
> > > [    8.751114] Exception stack(0xed527fa8 to 0xed527ff0)
> > > [    8.756157] 7fa0:                   004c0ec0 00000000 0000000f
> > > b6f761cc 00000000 00020000
> > > [    8.764333] 7fc0: 004c0ec0 00000000 00000001 0000017b 0048e114
> > > 00000000 00000000 004a3270
> > > [    8.772510] 7fe0: bea8f990 bea8f980 b6f71269 b6e9f6c0
> > > [    8.777556] Code: e5b5424c e1550004 0a00000c e2444004
> > > (e5943070)
> > > [    8.784011] ---[ end trace ad8c21587c118655 ]---
> > > 
> > > Of course my root file system does include resp. vic firmware:
> > > 
> > > 7ef01d2e3f507c91ca79584e89edcc64  /lib/firmware/nvidia/tegra124/v
> > > ic03_u
> > > code.bin
> > > 
> > > If I bake that one into the kernel binary, Nouveau still crashes
> > > like
> > > above albeit VIC loading and Tegra DRM now at least showing
> > > something
> > > on HDMI.
> > 
> > Yeah, this is a fairly common pitfall. The general rule of thumb is
> > that
> > the firmware has to live on the same medium as the module. So if
> > you've
> > built Tegra DRM as a loadable kernel module and installed it in the
> > root
> > filesystem, then that's where your firmware file also needs to be.
> > If
> > the driver is built-in (or a loadable module installed in the
> > initial
> > ramdisk), then the firmware needs to be in the initial ramdisk (or
> > built
> > into the kernel image itself). That's somewhat annoying, but it is
> > what
> > it is. At least it's logical.
> > 
> > > Just reverting above mentioned commit still leaves Nouveau
> > > crashing.
> > > 
> > > This has been observed using latest next-20181207.
> > > 
> > > Does anybody know what exactly is going on and how exactly one
> > > may get
> > > graphics working again as before?
> > 
> > So this is something that should be fixed by this:
> > 
> > 	https://patchwork.freedesktop.org/patch/260547/
> > 
> > And there's another patch that fixes a subsequent crash when you
> > actually start to use the GPU:
> > 
> > 	https://patchwork.freedesktop.org/patch/263588/
> > 
> > It'd be great if you could apply both and verify that they fix the
> > crash
> > for you. If so, can you provide a Tested-by? Both were Cc'ed to
> > linux-tegra, so you should have a copy to reply to. If not, let me
> > know
> > and I can bounce it.
> > 
> > Ben, can you pick up the two patches above? They're kind of high-
> > priority because they fix issues that crept into v4.20-rc1, so
> > should
> > ideally be fixed before v4.20 final.
> 
> Actually, it looks as if only the last patch is needed, since it
> superseeds the first. The second one calls drm_mode_config_init() via
> nouveau_display_create() and nouveau_drm_device_init(), making the
> first patch obsolete.
> 
> There's more confirmation here:
> 
> 	
> https://lists.freedesktop.org/archives/nouveau/2018-December/031636.html
> 
> So Ben, correction, please only apply:
> 
> 	https://patchwork.freedesktop.org/patch/263587/

Yes, that fixes it and I sent my tested-by. Thanks!

> Preferably in time for v4.20 final.

BTW: During testing I was also brave enough to try rmmodding nouveau
which unfortunately also seems to fail:

root@apalis-tk1-mainline:~# rmmod nouveau
[ 3044.432527] [TTM] Finalizing pool allocator
[ 3044.440007] [TTM] Zone  kernel: Used memory at exit: 0 kiB
[ 3044.445631] [TTM] Zone highmem: Used memory at exit: 0 kiB
[ 3044.452841] Unable to handle kernel NULL pointer dereference at
virtual address 0000038a
[ 3044.461167] pgd = 537c0ac4
[ 3044.463891] [0000038a] *pgd=fb95b835
[ 3044.467487] Internal error: Oops: 17 [#1] PREEMPT SMP ARM
[ 3044.472901] Modules linked in: nouveau(-) btusb btrtl btbcm btintel
tegra_drm xhci_tegra host1x iova ttm
[ 3044.482415] CPU: 3 PID: 616 Comm: rmmod Not tainted 4.20.0-rc6-next-
20181210-00001-gd70a977fd0d5-dirty #115
[ 3044.492176] Hardware name: NVIDIA Tegra SoC (Flattened Device Tree)
[ 3044.498455] PC is at pci_disable_device+0x8/0xd4
[ 3044.503165] LR is at nouveau_drm_device_remove+0x50/0x7c [nouveau]
[ 3044.509350] pc : [<c048d05c>]    lr : [<bf254820>]    psr: 60000113
[ 3044.515638] sp : ee3abedc  ip : ed625000  fp : 00000001
[ 3044.520879] r10: 00000081  r9 : ee3aa000  r8 : ee9eb834
[ 3044.526107] r7 : ed624000  r6 : 00000000  r5 : c0f08c48  r4 :
00000000
[ 3044.532649] r3 : 5dfe844b  r2 : 5dfe844b  r1 : 2e135000  r0 :
00000000
[ 3044.539181] Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA
ARM  Segment none
[ 3044.546333] Control: 10c5387d  Table: acbc006a  DAC: 00000051
[ 3044.552098] Process rmmod (pid: 616, stack limit = 0xfc4e79a2)
[ 3044.557934] Stack: (0xee3abedc to 0xee3ac000)
[ 3044.562304]
bec0:                                                                ed
62d400
[ 3044.570503] bee0: c0f08c48 bf254820 eda76808 5dfe844b ee9f1c8c
ee9f1c10 ee9f1c10 bf2f9c5c
[ 3044.578701] bf00: ee9eb800 bf255914 ee9f1c10 c056aba8 ee9f1c10
ee9f1c44 bf2f9c5c c05693bc
[ 3044.587298] bf20: ee9f1c10 bf2f9c5c 0001f10c 00000800 c0101204
c05694cc bf2f9c5c bf2fb980
[ 3044.596316] bf40: 0001f10c c056829c c0f08c48 c01b3c34 76756f6e
00756165 00000000 00000000
[ 3044.605356] bf60: c0f08c48 ec415000 00000002 5dfe844b 00000001
c0141c10 ec415000 ec415000
[ 3044.614431] bf80: ed67c100 5dfe844b 00000000 5dfe844b 00000000
00000002 bebb5ba8 00000000
[ 3044.623529] bfa0: 00000081 c0101000 00000002 bebb5ba8 0001f10c
00000800 0000000a 00000000
[ 3044.632631] bfc0: 00000002 bebb5ba8 00000000 00000081 bebb5e9b
0001f0d0 bebb5d8c 00000001
[ 3044.641739] bfe0: b6e74730 bebb5b64 00012bdf b6e7473c 600d0010
0001f10c 00000000 00000000
[ 3044.650884] [<c048d05c>] (pci_disable_device) from [<ee9f1c8c>]
(0xee9f1c8c)
[ 3044.658410] Code: eafffff0 ebf25973 e92d4030 e1a04000 (e5d0338a) 
[ 3044.665141] ---[ end trace 810af3dad648a902 ]---
Segmentation fault

Looks like with pci_disable_device() it may take a rather strange
path...

> Thanks,
> Thierry

Cheers

Marcel
