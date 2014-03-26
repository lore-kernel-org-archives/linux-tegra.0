From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 08/12] drm/nouveau/graph: enable when using external firmware
Date: Wed, 26 Mar 2014 14:21:43 +1000
Message-ID: <CACAvsv5yEbMWZnxgyhmY1r3Kp9PU8vXg2BcT4ZMJe7Ti9cHBUw@mail.gmail.com>
References: <1395650554-31925-1-git-send-email-acourbot@nvidia.com>
	<1395650554-31925-9-git-send-email-acourbot@nvidia.com>
	<20140324225802.GG17218@mithrandir>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140324225802.GG17218@mithrandir>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Mar 25, 2014 at 8:58 AM, Thierry Reding
<thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Mon, Mar 24, 2014 at 05:42:30PM +0900, Alexandre Courbot wrote:
> [...]
>> diff --git a/drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c b/drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c
>> index 6ef8bf181b2d..f997a18f5760 100644
>> --- a/drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c
>> +++ b/drivers/gpu/drm/nouveau/core/engine/graph/nvc0.c
>> @@ -1133,10 +1133,14 @@ nvc0_graph_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
>>       struct nvc0_graph_oclass *oclass = (void *)bclass;
>>       struct nouveau_device *device = nv_device(parent);
>>       struct nvc0_graph_priv *priv;
>> +     bool use_fw;
>
> Perhaps "ext_fw" or "use_ext_fw" would be more accurate.
>
>>       int ret, i;
>>
>> +     use_fw = nouveau_boolopt(device->cfgopt, "NvGrUseFW", false);
>> +
>>       ret = nouveau_graph_create(parent, engine, bclass,
>> -                                (oclass->fecs.ucode != NULL), &priv);
>> +                                (oclass->fecs.ucode != NULL) || use_fw,
>> +                                &priv);
>
> Or perhaps a more intuitive way would be to name the variable "enable"
> and have something like:
>
>         if (!nouveau_boolopt(device->cfgopt, "NvGrUseFW", false))
>                 enable = oclass->fecs.ucode != NULL;
>         else
>                 enable = true;
>
>         ret = nouveau_graph_create(parent, engine, bclass, enable, &priv);
>         ...
Agreed, this looks a lot nicer.

>
> Thierry
>
> _______________________________________________
> dri-devel mailing list
> dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel
>
