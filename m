From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: [Nouveau] [PATCH 1/6] make RAM device optional
Date: Fri, 23 Jan 2015 10:27:08 -0800
Message-ID: <CAKb7Uvj9n4vfPmvxCODyRBZbNoLcvwUkT9HJEpyHxqM1g_t=Lw@mail.gmail.com>
References: <1422003238-14572-1-git-send-email-acourbot@nvidia.com>
	<1422003238-14572-2-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1422003238-14572-2-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Jan 23, 2015 at 12:53 AM, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> Having a RAM device does not make sense for chips like GK20A which have
> no dedicated video memory. The dummy RAM device that we used so far
> works as a temporary band-aid, but in the long-term it is desirable for
> the driver to be able to work without any kind of VRAM.
>
> This patch adds a few conditionals in places where a RAM device was
> assumed to be present and allows some more objects to be allocated from
> the TT domain, allowing Nouveau to handle GPUs for which
> pfb->ram == NULL.
>
> Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drm/nouveau/nouveau_display.c         |  9 ++++++++-
>  drm/nouveau/nouveau_ttm.c             |  3 +++
>  drm/nouveau/nv84_fence.c              |  7 +++++--
>  drm/nouveau/nvkm/engine/device/base.c |  9 ++++++---
>  drm/nouveau/nvkm/subdev/clk/base.c    |  2 +-
>  drm/nouveau/nvkm/subdev/fb/base.c     | 26 ++++++++++++++++++--------
>  drm/nouveau/nvkm/subdev/ltc/gf100.c   | 14 ++++++++++----
>  7 files changed, 51 insertions(+), 19 deletions(-)
>
> diff --git a/drm/nouveau/nvkm/subdev/ltc/gf100.c b/drm/nouveau/nvkm/subdev/ltc/gf100.c
> index 8e7cc62..ceaa104 100644
> --- a/drm/nouveau/nvkm/subdev/ltc/gf100.c
> +++ b/drm/nouveau/nvkm/subdev/ltc/gf100.c
> @@ -170,8 +174,10 @@ gf100_ltc_init_tag_ram(struct nvkm_fb *pfb, struct nvkm_ltc_priv *priv)
>         tag_size += tag_align;
>         tag_size  = (tag_size + 0xfff) >> 12; /* round up */
>
> -       ret = nvkm_mm_tail(&pfb->vram, 1, 1, tag_size, tag_size, 1,
> -                          &priv->tag_ram);
> +       if (pfb->ram)
> +               ret = nvkm_mm_tail(&pfb->vram, 1, 1, tag_size, tag_size, 1,
> +                                  &priv->tag_ram);
> +       ret = -1;

Was there supposed to be an else somewhere in there?

>         if (ret) {
>                 priv->num_tags = 0;
>         } else {
> --
> 2.2.2
>
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
