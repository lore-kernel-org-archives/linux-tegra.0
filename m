From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Nouveau] [PATCH v2 0/6] Improve GK20A support, introduce GM20B,
 firmware paths
Date: Thu, 25 Jun 2015 09:59:03 +1000
Message-ID: <CACAvsv75o33C10+5QjVPnjCJyYRrPNXhaHXSkbXK-vBDFXUZqg@mail.gmail.com>
References: <1435040166-25651-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1435040166-25651-1-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Andy Ritger <aritger-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Aaron Plattner <aplattner-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Allen Martin <AMartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Ken Adams <KAdams-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 23 June 2015 at 16:16, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> Second version of this patchset. Not many changes since first version - I hope
> this means the changes are not too controversial.
>
> Changes since v1:
> - Removed lookup for previous FW files in "nouveau/"
> - Went back to using request_firmware() since we only try to load one file
Hey Alex,

I've merged this in my tree as-is for the moment, hopefully to go to
Linus for the next merge window.  If there's any changes from you guys
on how you want the firmware to be handled, it'd be nice to have those
made concrete before then :)

Thanks,
Ben.

>
> Original cover letter follows:
>
> GM20B is the GPU of the upcoming Tegra X1 SoC. This series adds initial support
> for it, based on a rework of the already-supported GK20A. It also introduces
> support for NVIDIA-provided firmware files, which is why I have added a few
> NVIDIA people who are relevant to this discussion.
>
> The first patch adds support for loading the FECS and GPCCS firmwares from
> firmware files officially released by NVIDIA. As you know such firmwares will
> soon become a necessity for newer GPUs because some falcons will require signed
> firmware to operate. In addition there is no reverse-engineered version of the
> GK20A firmwares yet, so since an external file is needed anyway, it may as well
> be provided officially. NVIDIA plans to release firmwares as one file per binary
> to keep things simple. The layout will be nvidia/<gpu>/<firmware>.bin, so for
> GK20A FECS/GPCCS we have:
>
> nvidia/gk20a/fecs_inst.bin (aka fuc409c)
> nvidia/gk20a/fecs_data.bin (aka fuc409d)
> nvidia/gk20a/gpccs_inst.bin (aka fuc41ac)
> nvidia/gk20a/gpccs_data.bin (aka fuc41ad)
>
> All firmware files listed in this patchset are clean for release, and I am just
> waiting for a community ack of the layout to send a patch to linux-firmware.
>
> The second patch reworks existing GK20A support to make it closer to what our
> nvgpu driver does. Support so far was heavily based on GK104, which somehow made
> me feel uneasy - and quite scared after I looked more closely at what nvgpu
> does. In particular the GK104 MMIO bundles differed significantly from what
> nvgpu does. This change aligns things and (probably less significant, but still
> safer) reorders the initialization sequence to match the one of nvgpu.
>
> You will note that the MMIO bundles now come as firmware files of their own. I
> am not sure the community will be pleased with an increase of firmware files,
> however the rationale for this is as follows:
> - These initialization sequences are related to the firmwares, so it makes sense
>   to distribute them under the same medium
> - If NVIDIA needs to update the firmwares for some reason, it can atomically
>   update the MMIO bundles and provide a coherent set, instead of having to
>   introduce versioning into the firmware and driver
> - For IP reasons, I as an NVIDIA employee cannot extract these register
>   sequences and link them into Nouveau
> - These are just a bunch of register address/value pairs anyway
>
> The new firmware files introduced are:
>
> nvidia/gk20a/sw_nonctx.bin (gr_pack_mmio)
> nvidia/gk20a/sw_ctx.bin (grctx_pack_hub, grctx_pack_gpc, grctx_pack_zcull,
>                          grctx_pack_tpc, grctx_pack_ppc)
> nvidia/gk20a/sw_bundle_init.bin (grctx_pack_icmd)
> nvidia/gk20a/sw_method_init.bin (grctx_pack_mthd)
>
> Third patch is trivial and adds the GM20B FIFO device.
>
> Fourth patch adds GM20B GR based on the reworked GK20A support. GM20B will rely
> on the same firmware files as GK20A (also clean for release). Note that this is
> not full support yet for released devices, which will require secure boot. This
> will be my focus once this patchset is merged (Deepak got a working version,
> but there is still a lot of work to do on it before it is upstreamable).
>
> The last two patches recognize GM20B at the device and platform level. Nothing
> really exciting.
>
> I hope the addition of firmware files will not become too controversial. If it
> does, I have good arguments to support it. ;) Besides the GK20A rework that
> probably few people care about, the point is the addition of a basic layout for
> the firmwares that NVIDIA will officially release to finally support secure
> boot, and I would like to make sure we get this right.
>
> Alexandre Courbot (6):
>   gr: use NVIDIA-provided external firmwares
>   gr/gk20a: use same initialization sequence as nvgpu
>   fifo: add GM20B fifo
>   gr: add GM20B support
>   device: recognize GM20B
>   platform: recognize GM20B
>
>  drm/nouveau/include/nvkm/engine/fifo.h |   1 +
>  drm/nouveau/include/nvkm/engine/gr.h   |   1 +
>  drm/nouveau/nouveau_platform.c         |   1 +
>  drm/nouveau/nvkm/engine/device/gm100.c |  20 ++
>  drm/nouveau/nvkm/engine/fifo/Kbuild    |   1 +
>  drm/nouveau/nvkm/engine/fifo/gk104.h   |   4 +
>  drm/nouveau/nvkm/engine/fifo/gm204.c   |   2 +-
>  drm/nouveau/nvkm/engine/fifo/gm20b.c   |  34 ++++
>  drm/nouveau/nvkm/engine/gr/Kbuild      |   2 +
>  drm/nouveau/nvkm/engine/gr/ctxgf100.h  |   7 +
>  drm/nouveau/nvkm/engine/gr/ctxgk20a.c  |  65 +++++--
>  drm/nouveau/nvkm/engine/gr/ctxgm107.c  |   2 +-
>  drm/nouveau/nvkm/engine/gr/ctxgm204.c  |   4 +-
>  drm/nouveau/nvkm/engine/gr/ctxgm20b.c  | 110 +++++++++++
>  drm/nouveau/nvkm/engine/gr/gf100.c     |  35 ++--
>  drm/nouveau/nvkm/engine/gr/gf100.h     |  18 ++
>  drm/nouveau/nvkm/engine/gr/gk20a.c     | 336 +++++++++++++++++++++++++++++++--
>  drm/nouveau/nvkm/engine/gr/gk20a.h     |  35 ++++
>  drm/nouveau/nvkm/engine/gr/gm20b.c     |  84 +++++++++
>  19 files changed, 716 insertions(+), 46 deletions(-)
>  create mode 100644 drm/nouveau/nvkm/engine/fifo/gm20b.c
>  create mode 100644 drm/nouveau/nvkm/engine/gr/ctxgm20b.c
>  create mode 100644 drm/nouveau/nvkm/engine/gr/gk20a.h
>  create mode 100644 drm/nouveau/nvkm/engine/gr/gm20b.c
>
> --
> 2.4.4
>
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
