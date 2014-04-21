From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: [Nouveau] [PATCH v2 09/10] drm/nouveau: support GK20A in nouveau_accel_init()
Date: Mon, 21 Apr 2014 14:07:56 -0400
Message-ID: <CAKb7Uvg4kOfsE0gd4zLcwjShc4eVgVKA7zQM2r1aeatOybm8NQ@mail.gmail.com>
References: <1398060142-7937-1-git-send-email-acourbot@nvidia.com>
	<1398060142-7937-10-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1398060142-7937-10-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Apr 21, 2014 at 2:02 AM, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> Skip the creation of a software channel for GK20A as software methods
> are not yet supported.

How is GK20A different from a nvc0+ card that lacks PDISPLAY (like all
the 3D Controller ones, and I guess even some that come up as VGA
controller in PCI but don't have any outputs in their VBIOS)? i.e.
what's wrong with just doing the same thing that GK1xx does? Note that
there are sw methods that don't deal with display as well.

  -ilia

>
> Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/gpu/drm/nouveau/nouveau_drm.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
> index ddd83756b9a2..5b46148ffd32 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> @@ -208,6 +208,10 @@ nouveau_accel_init(struct nouveau_drm *drm)
>                 return;
>         }
>
> +       /* Need to figure out how to handle sw for gk20a */
> +       if (device->chipset == 0xea)
> +               goto skip_sw_init;
> +
>         ret = nouveau_object_new(nv_object(drm), NVDRM_CHAN, NVDRM_NVSW,
>                                  nouveau_abi16_swclass(drm), NULL, 0, &object);
>         if (ret == 0) {
> @@ -234,6 +238,7 @@ nouveau_accel_init(struct nouveau_drm *drm)
>                 return;
>         }
>
> +skip_sw_init:
>         if (device->card_type < NV_C0) {
>                 ret = nouveau_gpuobj_new(drm->device, NULL, 32, 0, 0,
>                                         &drm->notify);
> --
> 1.9.2
>
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
