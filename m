From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Nouveau] [PATCH] drm/gk20a/fb: fix NULL dereference
Date: Sat, 10 May 2014 09:49:29 +1000
Message-ID: <CACAvsv7vB_xgnOESk_Oy0SmwF8kK+6gGP-+TCSNSiXzguCLB=g@mail.gmail.com>
References: <1399622268-16940-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1399622268-16940-1-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, May 9, 2014 at 5:57 PM, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> gk20a_ram_put() can be called with a NULL nouveau_mem in case of error.
> Handle that case the way is it done in other RAM drivers.
Got it, thanks!

>
> Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/gpu/drm/nouveau/core/subdev/fb/ramgk20a.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/nouveau/core/subdev/fb/ramgk20a.c b/drivers/gpu/drm/nouveau/core/subdev/fb/ramgk20a.c
> index 403c88f07b99..7effd1a63458 100644
> --- a/drivers/gpu/drm/nouveau/core/subdev/fb/ramgk20a.c
> +++ b/drivers/gpu/drm/nouveau/core/subdev/fb/ramgk20a.c
> @@ -36,6 +36,8 @@ gk20a_ram_put(struct nouveau_fb *pfb, struct nouveau_mem **pmem)
>         int i;
>
>         *pmem = NULL;
> +       if (unlikely(mem == NULL))
> +               return;
>
>         for (i = 0; i < mem->size; i++) {
>                 struct page *page;
> --
> 1.9.2
>
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
