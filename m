From: Mikko Perttunen <mikko.perttunen-/1wQRMveznE@public.gmane.org>
Subject: Re: [U-Boot] [PATCH 0/2] ARM: tegra: enable GPU DT node
Date: Thu, 23 Jul 2015 21:49:15 +0300
Message-ID: <55B1372B.608@kapsi.fi>
References: <1436427181-23904-1-git-send-email-acourbot@nvidia.com>
 <55B0D427.2000704@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55B0D427.2000704-l3A5Bk7waGM@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 07/23/2015 02:46 PM, Andreas F=E4rber wrote:
> Salut Alexandre,
>
> Am 09.07.2015 um 09:32 schrieb Alexandre Courbot:
>> Tegra124 requires the bootloader to perform VPR initialization, othe=
rwise the
>> GPU cannot be used by the system. Since using the GPU without that
>> initialization results in a hang, the GPU DT node is left disabled, =
and it is
>> the task of the bootloader to enable it after ensuring it is safe to=
 use the
>> GPU.
>>
>> VPR init is already performed since patch df3443dfa449, but the devi=
ce tree was
>> left untouched. This patch series performs this last step and prepar=
es the GPU
>> intialization code to receive more code for newer chips.
>
> Tested-by: Andreas F=E4rber <afaerber-l3A5Bk7waGM@public.gmane.org>
>
> I've tested this patchset on v2015.07 with 4.2.0-rc3-00115-gc5dfd65 -
> with these two patches I get a console login on HDMI again.
>
> However, I'm still having trouble with X11... Should that be working
> with linux.git? (haven't tried linux-next.git yet)

X11 with nouveau shouldn't be working (unless there has been significan=
t=20
work I'm not aware of since the last time I tested). However, it should=
=20
work with the modesetting driver, just without acceleration. To test if=
=20
nouveau works, you'll want to use something
that allows buffer sharing between tegradrm and nouveau like=20
http://github.com/gnurou/kmscube.

>
> Among other errors, it seems that nouveau is looking for firmware
> nouveau/nvea_fuc409c and nouveau/fuc409c - who should be providing th=
at?
> It's not in linux-firmware.git [1], and I see no /dev/mmcblk0p* to ch=
eck
> whether the original system has such a file (which I doubt, given the
> nouveau naming). It then falls back to the tegra drm iiuc.

Based on a quick google search, looks like you'll have to pick these=20
files up from this commit:
http://git.baserock.org/cgi-bin/cgit.cgi/delta/linux.git/commit/?h=3Dba=
serock/james/linux-tegra-3.15&id=3D2deb0fa

a strange state of things, indeed.. :)

I guess you could also extract them from the files in linux-firmware.

Mikko

>
> With -rc2 I've seen the system freeze, with -rc3 just not behaving as
> expected when starting X (with ssh/serial remaining usable).
>
> [    2.841626] [drm] Initialized drm 1.1.0 20060810
> [    2.846621] 57000000.gpu supply vdd not found, using dummy regulat=
or
> [    2.853089] nouveau 57000000.gpu: cannot initialize IOMMU MM
> [    2.860518] [drm] not a PCI device; no HDMI
> [    2.864814] nouveau  [  DEVICE][57000000.gpu] BOOT0  : 0x0ea000a1
> [    2.870932] nouveau  [  DEVICE][57000000.gpu] Chipset: GK20A (NVEA=
)
> [    2.877211] nouveau  [  DEVICE][57000000.gpu] Family : NVE0
> [    2.916829] nouveau  [ INSTMEM][57000000.gpu] using DMA API
> [    2.923392] nouveau  [    VOLT][57000000.gpu] The default voltage =
is
> -22uV
> [    2.930297] nouveau  [     CLK][57000000.gpu] parent clock rate: 1=
2 Mhz
> [    2.938662] nouveau  [     CLK][57000000.gpu] --: core 198 MHz
> [    3.037837] nouveau  [  PGRAPH][57000000.gpu] using external firmw=
are
> [    3.044493] nouveau 57000000.gpu: Direct firmware load for
> nouveau/nvea_fuc409c failed with error -2
> [    3.053843] nouveau 57000000.gpu: Direct firmware load for
> nouveau/fuc409c failed with error -2
> [    3.062549] nouveau E[  PGRAPH][57000000.gpu] failed to load fuc40=
9c
> [    3.069497] [TTM] Zone  kernel: Available graphics memory: 373624 =
kiB
> [    3.075927] [TTM] Zone highmem: Available graphics memory: 1032568=
 kiB
> [    3.082480] [TTM] Initializing pool allocator
> [    3.086923] [TTM] Initializing DMA pool allocator
> [    3.091737] nouveau  [     DRM] VRAM: 0 MiB
> [    3.095914] nouveau  [     DRM] GART: 1048576 MiB
> [    3.191777] nouveau E[   PFIFO][57000000.gpu] unsupported engines
> 0x00000030
> [    3.269831] nouveau E[     DRM] failed to create ce channel, -22
> [    3.365874] nouveau E[   PFIFO][57000000.gpu] unsupported engines
> 0x00000001
> [    3.443902] nouveau E[     DRM] failed to create kernel channel, -=
22
> [    3.452322] tegra-hdmi 54280000.hdmi: failed to get HDMI regulator
> [...]
> [    6.817669] +5V_HDMI_CON: supplied by +5V_SYS
> [    6.822215] +1.05V_RUN_AVDD_HDMI_PLL: supplied by +1.05V_RUN
> [    6.828102] +3.3V_RUN: supplied by +3.3V_SYS
> [    6.832438] +3.3V_AVDD_HDMI_AP_GATED: supplied by +3.3V_RUN
> [    6.841657] [drm] Supports vblank timestamp caching Rev 2 (21.10.2=
013).
> [    6.848317] [drm] No driver support for vblank timestamp query.
> [    6.926989] Console: switching to colour frame buffer device 160x6=
4
> [    6.945437] drm drm: fb0:  frame buffer device
> [    6.949894] drm drm: registered panic notifier
> [    6.976420] [drm] Initialized tegra 0.0.0 20120330 on minor 1
>
> Regards,
> Andreas
>
> [1]
> https://git.kernel.org/cgit/linux/kernel/git/firmware/linux-firmware.=
git/tree
>
