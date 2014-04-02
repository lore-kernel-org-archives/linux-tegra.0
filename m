From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: [Nouveau] [PATCH 06/12] drm/nouveau/ibus: add GK20A support
Date: Wed, 2 Apr 2014 10:18:28 -0400
Message-ID: <CAKb7Uvj_+s+PTbziGD_jb=ryk372vgxSTOrmxOZVGUghHnveAw@mail.gmail.com>
References: <1395650554-31925-1-git-send-email-acourbot@nvidia.com>
	<1395650554-31925-7-git-send-email-acourbot@nvidia.com>
	<20140324223444.GF17218@mithrandir>
	<CAAVeFuKezGqPnmi=XJW1FrL-3e8hyqdjuY83VEh496SLm+0mFQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAAVeFuKezGqPnmi=XJW1FrL-3e8hyqdjuY83VEh496SLm+0mFQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Apr 2, 2014 at 9:52 AM, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Tue, Mar 25, 2014 at 7:34 AM, Thierry Reding
> <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> On Mon, Mar 24, 2014 at 05:42:28PM +0900, Alexandre Courbot wrote:
>> [...]
>>> diff --git a/drivers/gpu/drm/nouveau/core/subdev/ibus/nvea.c b/drivers/gpu/drm/nouveau/core/subdev/ibus/nvea.c
>> [...]
>>> +#include <subdev/ibus.h>
>>> +
>>> +struct nvea_ibus_priv {
>>> +     struct nouveau_ibus base;
>>> +};
>>> +
>>> +static void
>>> +nvea_ibus_init_priv_ring(struct nvea_ibus_priv *priv)
>>> +{
>>> +     nv_mask(priv, 0x137250, 0x3f, 0);
>>> +
>>> +     nv_mask(priv, 0x000200, 0x20, 0);
>>> +     udelay(20);
>>
>> usleep_range()?
>
> Sure.
>
>>
>>> +static void
>>> +nvea_ibus_intr(struct nouveau_subdev *subdev)
>>> +{
>> [...]
>>> +     /* Acknowledge interrupt */
>>> +     nv_mask(priv, 0x12004c, 0x2, 0x2);
>>> +
>>> +     while (--retry >= 0) {
>>> +             command = nv_rd32(priv, 0x12004c) & 0x3f;
>>> +             if (command == 0)
>>> +                     break;
>>> +     }
>>> +
>>> +     if (retry < 0)
>>> +             nv_warn(priv, "timeout waiting for ringmaster ack\n");
>>> +}
>>
>> Perhaps I'm being paranoid, but this loop now depends on the frequency
>> of the various clocks involved and therefore might break at some point
>> if the frequencies get sufficiently high.
>>
>> So a slightly safer implementation would use a proper timeout using a
>> combination of msecs_to_jiffies(), time_before() and usleep_range(),
>> like so:
>>
>>         timeout = jiffies + msecs_to_jiffies(...);
>>
>>         while (time_before(jiffies, timeout)) {
>>                 command = nv_rd32(...) & 0x3f;
>>                 if (command == 0)
>>                         break;
>>
>>                 usleep_range(...);
>>         }
>>
>>         if (time_after(jiffies, timeout))
>>                 nv_warn(...);
>
> Right, now that I look at this code again I don't even understand why
> I left it this way. Maybe I left some early test code slip into the
> final patch, sorry about that.

I just remembered about this, but there's also the nv_wait() macro,
which you could use, e.g.

if (!nv_wait(subdev, 0x12004c, 0x3f, 0x00))
  nv_warn(...)

It has built-in timeout logic/etc (although no sleeps in the middle).
It does use the timer subdev, so if that's not operational at this
point, you can't use it.

>
>> This assumes that there's some known timeout after which the ringmaster
>> is expected to have acked the interrupt. On that note, I wonder if the
>> warning is accurate here: it's my understanding that writing 0x2 to the
>> register does acknowledge the interrupt, so the ringmaster does in fact
>> "clear" it rather than "acknowledge" it, doesn't it?
>>
>> Although now that I mention it I seem to remember that this write is
>> actually sending a command to the ring master and perhaps waiting for
>> the register to return to 0 is indeed waiting for an ACK of sorts. Maybe
>> adding a comment or so describing what this sequence does would be
>> appropriate here?
>
> Can we from an IP point of view? AFAIK this sequence has never been
> publicly documented.
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
