From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: [Nouveau] [PATCH v2 1/6] make RAM device optional
Date: Wed, 11 Feb 2015 02:40:08 -0500
Message-ID: <CAKb7Uvgs3_JYp1wWzFF3rcTDCz2Tgx0h2v_6Xfzoki01RrChmg@mail.gmail.com>
References: <1423639301-27304-1-git-send-email-acourbot@nvidia.com>
	<1423639301-27304-2-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1423639301-27304-2-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Feb 11, 2015 at 2:21 AM, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> @@ -150,7 +151,10 @@ gf100_ltc_init_tag_ram(struct nvkm_fb *pfb, struct nvkm_ltc_priv *priv)
>         int ret;
>
>         /* tags for 1/4 of VRAM should be enough (8192/4 per GiB of VRAM) */
> -       priv->num_tags = (pfb->ram->size >> 17) / 4;
> +       if (pfb->ram)
> +               priv->num_tags = (pfb->ram->size >> 17) / 4;
> +       else
> +               priv->num_tags = (1 << 17);
>         if (priv->num_tags > (1 << 17))
>                 priv->num_tags = 1 << 17; /* we have 17 bits in PTE */
>         priv->num_tags = (priv->num_tags + 63) & ~63; /* round up to 64 */
> @@ -170,8 +174,11 @@ gf100_ltc_init_tag_ram(struct nvkm_fb *pfb, struct nvkm_ltc_priv *priv)
>         tag_size += tag_align;
>         tag_size  = (tag_size + 0xfff) >> 12; /* round up */
>
> -       ret = nvkm_mm_tail(&pfb->vram, 1, 1, tag_size, tag_size, 1,
> -                          &priv->tag_ram);
> +       if (pfb->ram)
> +               ret = nvkm_mm_tail(&pfb->vram, 1, 1, tag_size, tag_size, 1,
> +                                  &priv->tag_ram);
> +       else
> +               ret = -1;
>         if (ret) {
>                 priv->num_tags = 0;
>         } else {

Seems like you could just avoid a lot of this and just start the
function out with

if (!pfb->ram) {
    priv->num_tags = 0; (is that even necessary? the object is
probably kzalloc'd)
    ret = nouveau_mm_init(&priv->tags, 0, 0, 1);
    return ret;
}

That's essentially what happens, no? Perhaps you could go a step
further and teach the base code about uninitialized tags mm, but that
may not be worth it.

  -ilia
