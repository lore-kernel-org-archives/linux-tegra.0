From: =?UTF-8?B?VGVyamUgQmVyZ3N0csO2bQ==?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCHv5,RESEND 2/8] gpu: host1x: Add syncpoint wait and interrupts
Date: Wed, 6 Feb 2013 12:29:26 -0800
Message-ID: <5112BD26.5060800@nvidia.com>
References: <1358250244-9678-1-git-send-email-tbergstrom@nvidia.com> <1358250244-9678-3-git-send-email-tbergstrom@nvidia.com> <20130204103032.GB27443@avionic-0098.mockup.avionic-design.de> <51108A94.3060501@nvidia.com> <20130205084255.GB20437@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130205084255.GB20437-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "airlied-cv59FeDIM0c@public.gmane.org" <airlied-cv59FeDIM0c@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 05.02.2013 00:42, Thierry Reding wrote:
> On Mon, Feb 04, 2013 at 08:29:08PM -0800, Terje Bergstr=C3=B6m wrote:
>> host1x_get_host() actually needs that, so this #include should've al=
so
>> been in previous patch.
>=20
> No need to if you pass struct device * instead. You might need
> linux/device.h instead, though.

Can do.

> Another variant would be host1x_syncpt_irq() for the top-level handle=
r
> and something host1x_handle_syncpt() to handle individual syncpoints.=
 I
> like this one best, but this is pure bike-shedding and there's nothin=
g
> technically wrong with the names you chose, so I can't really object =
if
> you want to stick to them.

I could use these names. They sound logical to me,too.

>=20
>>>> +                     queue_work(intr->wq, &sp->work);
>>>
>>> Should the call to queue_work() perhaps be moved into
>>> host1x_intr_syncpt_thresh_isr().
>>
>> I'm not sure, either way would be ok to me. The current structure al=
lows
>> host1x_intr_syncpt_thresh_isr() to only take one parameter
>> (host1x_intr_syncpt). If we move queue_work, we'd also need to pass
>> host1x_intr.
>=20
> I think I'd still prefer to have all the code in one function because=
 it
> make subsequent modification easier and less error-prone.

Ok, I'll do that change.

> Yeah, in that case I think we should bail out. It's not like we're
> expecting any failures. If the interrupt cannot be requested, somethi=
ng
> must seriously be wrong and we should tell users about it so that it =
can
> be fixed. Trying to continue on a best effort basis isn't useful here=
, I
> think.

Yep, I agree.

>> In patch 3, at submit time we first allocate waiter, then take
>> submit_lock, write submit to channel, and add the waiter while havin=
g
>> the lock. I did this so that I host1x_intr_add_action() can always
>> succeed. Otherwise I'd need to write another code path to handle the
>> case where we wrote a job to channel, but we're not able to add a
>> submit_complete action to it.
>=20
> Okay. In that case why not allocate it on the stack in the first plac=
e
> so you don't have to bother with allocations (and potential failure) =
at
> all? The variable doesn't leave the function scope, so there shouldn'=
t
> be any issues, right?

The submit code in patch 3 allocates a waiter, and the waiter outlives
the function scope. That waiter will clean up job queue once a job is
complete.

> Or if that doesn't work it would still be preferable to allocate memo=
ry
> in host1x_syncpt_wait() directly instead of going through the wrapper=
=2E

This was done purely, because I'm hiding the struct size from the
caller. If the caller needs to allocate, I need to expose the struct in
a header, not just a forward declaration.

>>>> +int host1x_intr_init(struct host1x_intr *intr, u32 irq_sync)
>>>
>>> Maybe you should keep the type of the irq_sync here so that it prop=
erly
>>> propagates to the call to devm_request_irq().
>>
>> I'm not sure what you mean. Do you mean that I should use unsigned i=
nt,
>> as that's the type used in devm_request_irq()?
>=20
> Yes.

Ok, will do.

>>>> +void host1x_intr_stop(struct host1x_intr *intr)
>>>> +{
>>>> +     unsigned int id;
>>>> +     struct host1x *host1x =3D intr_to_host1x(intr);
>>>> +     struct host1x_intr_syncpt *syncpt;
>>>> +     u32 nb_pts =3D host1x_syncpt_nb_pts(intr_to_host1x(intr));
>>>> +
>>>> +     mutex_lock(&intr->mutex);
>>>> +
>>>> +     host1x->intr_op.disable_all_syncpt_intrs(intr);
>>>
>>> I haven't commented on this everywhere, but I think this could bene=
fit
>>> from a wrapper that forwards this to the intr_op. The same goes for=
 the
>>> sync_op.
>>
>> You mean something like "host1x_disable_all_syncpt_intrs"?
>=20
> Yes. I think that'd be useful for each of the op functions. Perhaps y=
ou
> could even pass in a struct host1x * to make calls more uniform.

Ok, I'll add the wrapper, and I'll check if passing struct host1x *
would make sense. In effect that'd render struct host1x_intr mostly
unused, so how about if we just merge the contents of host1x_intr to ho=
st1x?

Terje
