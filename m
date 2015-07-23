From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber-l3A5Bk7waGM@public.gmane.org>
Subject: Re: [U-Boot] [PATCH 0/2] ARM: tegra: enable GPU DT node
Date: Thu, 23 Jul 2015 19:51:42 +0200
Message-ID: <55B129AE.7080209@suse.de>
References: <1436427181-23904-1-git-send-email-acourbot@nvidia.com>
 <55B0D427.2000704@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <55B0D427.2000704-l3A5Bk7waGM@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Am 23.07.2015 um 13:46 schrieb Andreas F=E4rber:
> Salut Alexandre,
>=20
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
>=20
> Tested-by: Andreas F=E4rber <afaerber-l3A5Bk7waGM@public.gmane.org>
>=20
> I've tested this patchset on v2015.07 with 4.2.0-rc3-00115-gc5dfd65 -
> with these two patches I get a console login on HDMI again.
>=20
> However, I'm still having trouble with X11... Should that be working
> with linux.git? (haven't tried linux-next.git yet)

Not much better with next-20150723, it finds the IOMMU now but otherwis=
e
mostly unchanged:

[    2.843264] [drm] Initialized drm 1.1.0 20060810
[    2.850224] tegra-hdmi 54280000.hdmi: failed to get HDMI regulator
[...]
[    6.310099] [drm] not a PCI device; no HDMI
[    6.314401] nouveau  [  DEVICE][57000000.gpu] BOOT0  : 0x0ea000a1
[    6.320540] nouveau  [  DEVICE][57000000.gpu] Chipset: GK20A (NVEA)
[    6.326847] nouveau  [  DEVICE][57000000.gpu] Family : NVE0
[    6.366513] nouveau  [ INSTMEM][57000000.gpu] using IOMMU
[    6.372805] nouveau  [    VOLT][57000000.gpu] The default voltage is
1000000uV
[    6.380046] nouveau  [    VOLT][57000000.gpu] GPU voltage: 1015000uv
[    6.386400] nouveau  [     CLK][57000000.gpu] parent clock rate: 12 =
Mhz
[    6.394768] nouveau  [     CLK][57000000.gpu] --: core 198 MHz
[    6.494884] nouveau  [  PGRAPH][57000000.gpu] using external firmwar=
e
[    6.501553] nouveau 57000000.gpu: Direct firmware load for
nouveau/nvea_fuc409c failed with error -2
[    6.510923] nouveau 57000000.gpu: Direct firmware load for
nouveau/fuc409c failed with error -2
[    6.519661] nouveau E[  PGRAPH][57000000.gpu] failed to load fuc409c
[    6.526664] [TTM] Zone  kernel: Available graphics memory: 373640 ki=
B
[    6.533201] [TTM] Zone highmem: Available graphics memory: 1032584 k=
iB
[    6.539797] [TTM] Initializing pool allocator
[    6.544232] [TTM] Initializing DMA pool allocator
[    6.549118] nouveau  [     DRM] VRAM: 0 MiB
[    6.553295] nouveau  [     DRM] GART: 1048576 MiB
[    6.649608] nouveau E[   PFIFO][57000000.gpu] unsupported engines
0x00000030
[    6.729044] nouveau E[     DRM] failed to create ce channel, -22
[    6.825300] nouveau E[   PFIFO][57000000.gpu] unsupported engines
0x00000001
[    6.904234] nouveau E[     DRM] failed to create kernel channel, -22
[    6.910976] +5V_HDMI_CON: supplied by +5V_SYS
[    6.915525] +1.05V_RUN_AVDD_HDMI_PLL: supplied by +1.05V_RUN
[    6.921424] +3.3V_RUN: supplied by +3.3V_SYS
[    6.925762] +3.3V_AVDD_HDMI_AP_GATED: supplied by +3.3V_RUN
[    6.934748] [drm] Supports vblank timestamp caching Rev 2 (21.10.201=
3).
[    6.941397] [drm] No driver support for vblank timestamp query.
[    7.020224] Console: switching to colour frame buffer device 160x64
[    7.038895] drm drm: fb0:  frame buffer device
[    7.066961] [drm] Initialized tegra 0.0.0 20120330 on minor 1

Regards,
Andreas

--=20
SUSE Linux GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Felix Imend=F6rffer, Jane Smithard, Dilip Upmanyu, Graham Norton; H=
RB
21284 (AG N=FCrnberg)
