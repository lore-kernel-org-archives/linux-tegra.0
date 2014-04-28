From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v3 6/9] drm/nouveau/graph: enable when using
 external firmware
Date: Mon, 28 Apr 2014 12:10:27 +1000
Message-ID: <CACAvsv51Ju_ZqJfNU5GzzEmDzf2Fr6Xr_5yGRtfqOQRVTgvDPg@mail.gmail.com>
References: <1398410396-23338-1-git-send-email-acourbot@nvidia.com>
 <1398410396-23338-7-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1398410396-23338-7-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Apr 25, 2014 at 5:19 PM, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> nvc0_graph_ctor() would only let the graphics engine be enabled if its
> oclass has a proper microcode linked to it. This prevents GR from being
> enabled at all on chips that rely exclusively on external firmware, even
> though such a use-case is valid.
>
> Relax the conditions enabling the GR engine to also include the case
> where an external firmware has also been loaded.
I'm happy to take this patch as-is.  I do wonder if we should do
something like this though:

if (nouveau_boolopt(device->cfgopt, "NvGrUseFW", oclass->fecs.ucode == NULL))

Which will automatically switch to external firmware if there's no
internal implementation available.

Thoughts?  This could be a separate patch even, if preferred.

Thanks,
Ben.

>
> Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c b/drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c
> index f3c7329da0a0..e5b75f189988 100644
> --- a/drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c
> +++ b/drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c
> @@ -1259,10 +1259,13 @@ nvc0_graph_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
>         struct nvc0_graph_oclass *oclass = (void *)bclass;
>         struct nouveau_device *device = nv_device(parent);
>         struct nvc0_graph_priv *priv;
> +       bool use_ext_fw, enable;
>         int ret, i;
>
> -       ret = nouveau_graph_create(parent, engine, bclass,
> -                                  (oclass->fecs.ucode != NULL), &priv);
> +       use_ext_fw = nouveau_boolopt(device->cfgopt, "NvGrUseFW", false);
> +       enable = use_ext_fw || oclass->fecs.ucode != NULL;
> +
> +       ret = nouveau_graph_create(parent, engine, bclass, enable, &priv);
>         *pobject = nv_object(priv);
>         if (ret)
>                 return ret;
> @@ -1272,7 +1275,7 @@ nvc0_graph_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
>
>         priv->base.units = nvc0_graph_units;
>
> -       if (nouveau_boolopt(device->cfgopt, "NvGrUseFW", false)) {
> +       if (use_ext_fw) {
>                 nv_info(priv, "using external firmware\n");
>                 if (nvc0_graph_ctor_fw(priv, "fuc409c", &priv->fuc409c) ||
>                     nvc0_graph_ctor_fw(priv, "fuc409d", &priv->fuc409d) ||
> --
> 1.9.2
>
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
