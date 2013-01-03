From: Mark Zhang <nvmarkzhang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCHv4 0/8] Support for Tegra 2D hardware
Date: Thu, 03 Jan 2013 10:36:10 +0800
Message-ID: <50E4EE9A.1060406@gmail.com>
References: <1356089964-5265-1-git-send-email-tbergstrom@nvidia.com> <50DAC678.5060601@gmail.com> <50E3FD17.80402@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50E3FD17.80402-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?Terje_Bergstr=F6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org" <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "airlied-cv59FeDIM0c@public.gmane.org" <airlied-cv59FeDIM0c@public.gmane.org>, "dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org" <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 01/02/2013 05:25 PM, Terje Bergstr=F6m wrote:
> On 26.12.2012 11:42, Mark Zhang wrote:
[...]
>=20
>>
>>         if (!de)
>> diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
>> index 07e8813..01ed10d 100644
>> --- a/drivers/gpu/host1x/dev.c
>> +++ b/drivers/gpu/host1x/dev.c
>> @@ -38,6 +38,7 @@
>>
>>  struct host1x *host1x;
>>
>> +/* Called by drm unlocked ioctl function. So do we need a lock here=
? */
>>  void host1x_syncpt_incr_byid(u32 id)
>=20
> No, host1x_syncpt_incr_byid is SMP safe.

Correct. Lock is unnecessary.

>=20
>>  {
>>         struct host1x_syncpt *sp =3D host1x->syncpt + id;
>> @@ -52,6 +53,7 @@ u32 host1x_syncpt_read_byid(u32 id)
>>  }
>>  EXPORT_SYMBOL(host1x_syncpt_read_byid);
>>
>> +/* Called by drm unlocked ioctl function. So do we need a lock here=
? */
>>  int host1x_syncpt_wait_byid(u32 id, u32 thresh, long timeout, u32 *=
value)
>=20
> Same here, SMP safe.
>=20
>>  {
>>         struct host1x_syncpt *sp =3D host1x->syncpt + id;
>> @@ -161,6 +163,8 @@ static int host1x_probe(struct platform_device *=
dev)
>>
>>         err =3D host1x_alloc_resources(host);
>>         if (err) {
>> +               /* We don't have chip_ops right now, so here the
>> +                  error message is somewhat improper */
>>                 dev_err(&dev->dev, "failed to init chip support\n");
>>                 goto fail;
>>         }
>=20
> Actually, alloc_resources only allocates intr->syncpt, so I the code =
to
> host1x_intr_init().
>=20
>> @@ -175,6 +179,14 @@ static int host1x_probe(struct platform_device =
*dev)
>>         if (!host->syncpt)
>>                 goto fail;
>>
>> +       /* I suggest create a dedicate function for initializing nop=
 sp.
>> +          First this "_host1x_syncpt_alloc" looks like an internal/=
static
>> +          function.
>> +          Then actually "host1x_syncpt_alloc" & "_host1x_syncpt_all=
oc" all
>> +          serve host1x client(e.g: gr2d) so it's not suitable to us=
e them
>> +          for nop sp.
>> +          Just create a wrapper function to call _host1x_syncpt_all=
oc is OK.
>> +          This will make the code more readable. */
>>         host->nop_sp =3D _host1x_syncpt_alloc(host, NULL, 0);
>=20
> _host1x_syncpt_alloc is an internal function, not exported.
> host1x_syncpt_alloc is exported. I think it's even better if I just m=
ove
> allocation of nop_sp to happen in host1x_syncpt_init.
>=20

Agree.

>>         if (!host->nop_sp)
>>                 goto fail;
[...]
>=20
>> diff --git a/drivers/gpu/host1x/intr.c b/drivers/gpu/host1x/intr.c
>> index efcb9be..e112001 100644
>> --- a/drivers/gpu/host1x/intr.c
>> +++ b/drivers/gpu/host1x/intr.c
>> @@ -329,8 +329,13 @@ void host1x_intr_deinit(struct host1x_intr *int=
r)
>>  void host1x_intr_start(struct host1x_intr *intr, u32 hz)
>>  {
>>         struct host1x *host1x =3D intr_to_host1x(intr);
>> +
>> +       /* Why we need to lock here? Seems like this function is
>> +          called by host1x's probe only. */
>>         mutex_lock(&intr->mutex);
>>
>> +       /* "init_host_sync" has already been called in function
>> +          host1x_intr_init. Remove this line. */
>>         host1x->intr_op.init_host_sync(intr);
>>         host1x->intr_op.set_host_clocks_per_usec(intr,
>>                         DIV_ROUND_UP(hz, 1000000));
>=20
> In future, we'll call host1x_intr_start() whenever host1x is turned o=
n.
> Thus we need locking.
>
> init_host_sync() should actually be called from host1x_intr_start(), =
not
> _init().
>=20

Got it. Thanks for explanation.

>> diff --git a/drivers/gpu/host1x/syncpt.c b/drivers/gpu/host1x/syncpt=
=2Ec
>> index 07cbca5..9a234ad 100644
>> --- a/drivers/gpu/host1x/syncpt.c
>> +++ b/drivers/gpu/host1x/syncpt.c
>> @@ -309,6 +309,8 @@ struct host1x_syncpt *host1x_syncpt_init(struct
>> host1x *host)
>>         struct host1x_syncpt *syncpt, *sp;
>>         int i;
>>
>> +       /* Consider devm_kzalloc here. Then you can forget the relea=
se
>> +          stuffs about this "syncpt". */
>>         syncpt =3D sp =3D kzalloc(sizeof(struct host1x_syncpt) * hos=
t->info.nb_pts,
>>                 GFP_KERNEL);
>>         if (!syncpt)
>=20
> Will do.
>=20
> Thanks!
>=20
> Terje
>=20
