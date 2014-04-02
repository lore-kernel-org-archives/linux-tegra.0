From: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 04/12] drm/nouveau/bar/nvc0: support chips without BAR3
Date: Wed, 2 Apr 2014 22:47:28 +0900
Message-ID: <CAAVeFuKUu-oN-sMEcvcZVTuhcz9dZVauvca7T1_iN5=qkU7Zcg@mail.gmail.com>
References: <1395650554-31925-1-git-send-email-acourbot@nvidia.com>
 <1395650554-31925-5-git-send-email-acourbot@nvidia.com> <20140324221051.GC17218@mithrandir>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140324221051.GC17218@mithrandir>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Mar 25, 2014 at 7:10 AM, Thierry Reding
<thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Mon, Mar 24, 2014 at 05:42:26PM +0900, Alexandre Courbot wrote:
> [...]
>> diff --git a/drivers/gpu/drm/nouveau/core/subdev/bar/nvc0.c b/drivers/gpu/drm/nouveau/core/subdev/bar/nvc0.c
> [...]
>>  static int
>> -nvc0_bar_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
>> -           struct nouveau_oclass *oclass, void *data, u32 size,
>> -           struct nouveau_object **pobject)
>> +nvc0_bar_init_vm(struct nvc0_bar_priv *priv, int nr, int bar)
>>  {
> [...]
>> -     /* BAR3 */
>>       ret = nouveau_gpuobj_new(nv_object(priv), NULL, 0x1000, 0, 0,
>> -                             &priv->bar[0].mem);
>> -     mem = priv->bar[0].mem;
>> +                             &priv->bar[nr].mem);
>> +     mem = priv->bar[nr].mem;
>>       if (ret)
>>               return ret;
>>
>>       ret = nouveau_gpuobj_new(nv_object(priv), NULL, 0x8000, 0, 0,
>> -                             &priv->bar[0].pgd);
>> +                             &priv->bar[nr].pgd);
>>       if (ret)
>>               return ret;
> [...]
>> +static int
>> +nvc0_bar_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
>> +           struct nouveau_oclass *oclass, void *data, u32 size,
>> +           struct nouveau_object **pobject)
>> +{
> [...]
>> +     /* BAR3 */
>> +     if (has_bar3) {
>> +             ret = nvc0_bar_init_vm(priv, 0, 3);
> [...]
>> +     /* BAR1 */
>> +     ret = nvc0_bar_init_vm(priv, 1, 1);
>>       if (ret)
>>               return ret;
>
> The calls to nvc0_bar_init_vm() are somewhat confusing in my opinion. It
> is hard to see from the invocation what these numbers mean and therefore
> distinguish which parameter is which.
>
> Perhaps a slightly more readable way would be to pass in a pointer to a
> structure as second parameter instead of the index into an array. So
> it'd look somewhat like this:
>
>         if (has_bar3) {
>                 ret = nvc0_bar_init_vm(priv, &priv->bar[0], 3);
>                 ...
>         }
>         ...
>         ret = nvc0_bar_init_vm(priv, &priv->bar[1], 1);
>         ...
>
> Unfortunately that would require a new type to be created for the bar[]
> structures, so it'd be slightly more intrusive.

These types are local to nvc0.c anyway, so I don't think it would
hurt. And you are right that the code would become more readable as a
result, passing array indexes as arguments is not a common practice
(and should not be).

Alex.
