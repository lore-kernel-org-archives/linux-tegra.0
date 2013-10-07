From: Erik Faye-Lund <kusmabite-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 08/27] drm/tegra: gr2d: Miscellaneous cleanups
Date: Mon, 7 Oct 2013 15:02:29 +0200
Message-ID: <CABPQNSZGyuS3wAvJ8fFj=LMXxFJz9x_sKqEWW7QbiqC1gneLKw@mail.gmail.com>
References: <1381134884-5816-1-git-send-email-treding@nvidia.com>
 <1381134884-5816-9-git-send-email-treding@nvidia.com> <CABPQNSbkS40_jyGz14s08+x3e+-pxnfy90V7pzAOfiqUF2ma2g@mail.gmail.com>
 <20131007121452.GA8324@ulmo.nvidia.com> <CABPQNSb52HmS-2T=MUXteMFc1tndHdvtUnZqsVsPKjP1Dy6Esw@mail.gmail.com>
Reply-To: kusmabite-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CABPQNSb52HmS-2T=MUXteMFc1tndHdvtUnZqsVsPKjP1Dy6Esw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Oct 7, 2013 at 2:53 PM, Erik Faye-Lund <kusmabite-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Mon, Oct 7, 2013 at 2:14 PM, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> On Mon, Oct 07, 2013 at 01:34:44PM +0200, Erik Faye-Lund wrote:
>>> On Mon, Oct 7, 2013 at 10:34 AM, Thierry Reding
>>> <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>> > Rework the address table code for the host1x firewall. The previous
>>> > implementation allocated a bitfield but didn't check for a valid pointer
>>> > so it could potentially crash.
>>>
>>> I don't think it could crash. The bitmaps was allocated as a 256-bit
>>> field, and the register offset gets AND'ed with 0xFF before being
>>> looked up. What am I missing?
>>
>> The pointer returned from the allocation is never checked, so it could
>> theoretically be NULL and be used regardless.
>>
>> Also I'm not sure that AND'ing with 0xff is the right thing to do here.
>
> Well, maybe not. I'm not entirely convinced it's *not*, though.
>

I'm sorry, I intended to fill out a bit more here before I hit send,
and totally forgot.

Point is, it seems only 0x00..0x4c is used (and then repeated at
multiples of 0x4000 for each context, but the offsets don't have
enough bits to reach that far), from looking at the TRM.

So the question is really how the hardware treats writes to
non-existent registers. My guess would be that they are simply not
recorded, and if that's the case it doesn't matter what we do. And
doing an unconditional AND is faster than doing a bit-test followed by
a conditional branch.

Of course, if the hardware does *not* ignore writes to non-existent
register, then we might be in trouble. But for that, we'd probably
want a full map of valid registers, not just saying that they aren't
pointers, no?
