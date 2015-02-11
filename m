From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: [Nouveau] [PATCH v2 2/6] instmem/gk20a: move memory allocation to instmem
Date: Wed, 11 Feb 2015 02:55:47 -0500
Message-ID: <CAKb7UvjSrOqw9mTJhdOEeWhyX2cLAj9LrFaV6oEg2Q2etE66Eg@mail.gmail.com>
References: <1423639301-27304-1-git-send-email-acourbot@nvidia.com>
	<1423639301-27304-3-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1423639301-27304-3-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Feb 11, 2015 at 2:21 AM, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> +static int
> +gk20a_instmem_fini(struct nvkm_object *object, bool suspend)
> +{
> +       struct gk20a_instmem_priv *priv = (void *)object;
> +       priv->addr = ~0ULL;
> +       return nvkm_instmem_fini(&priv->base, suspend);
> +}
> +
> +static int
> +gk20a_instmem_ctor(struct nvkm_object *parent, struct nvkm_object *engine,
> +                  struct nvkm_oclass *oclass, void *data, u32 size,
> +                  struct nvkm_object **pobject)
> +{
> +       struct gk20a_instmem_priv *priv;
> +       int ret;
> +
> +       ret = nvkm_instmem_create(parent, engine, oclass, &priv);
> +       *pobject = nv_object(priv);
> +       if (ret)
> +               return ret;
> +
> +       spin_lock_init(&priv->lock);
> +
> +       return 0;
> +}
> +
> +struct nvkm_oclass *
> +gk20a_instmem_oclass = &(struct nvkm_instmem_impl) {
> +       .base.handle = NV_SUBDEV(INSTMEM, 0xea),
> +       .base.ofuncs = &(struct nvkm_ofuncs) {
> +               .ctor = gk20a_instmem_ctor,
> +               .dtor = _nvkm_instmem_dtor,
> +               .init = _nvkm_instmem_init,
> +               .fini = gk20a_instmem_fini,
> +       },
> +       .instobj = &gk20a_instobj_oclass.base,
> +}.base;

Minor point, but you could just reuse the nv50 functions here, instead
of redefining them (and get rid of gk20a_instmem_priv). Your call...
not like it's a ton of code being duplicated, and it would require
exposing the nv50_instmem_priv stuff.

Also, I know you're just copy/pasting the nv50 code for the instmem
stuff... but that open-coded ALIGN() is really painful to look at.

  -ilia
