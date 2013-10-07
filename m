From: Erik Faye-Lund <kusmabite-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 08/27] drm/tegra: gr2d: Miscellaneous cleanups
Date: Mon, 7 Oct 2013 14:53:38 +0200
Message-ID: <CABPQNSb52HmS-2T=MUXteMFc1tndHdvtUnZqsVsPKjP1Dy6Esw@mail.gmail.com>
References: <1381134884-5816-1-git-send-email-treding@nvidia.com>
 <1381134884-5816-9-git-send-email-treding@nvidia.com> <CABPQNSbkS40_jyGz14s08+x3e+-pxnfy90V7pzAOfiqUF2ma2g@mail.gmail.com>
 <20131007121452.GA8324@ulmo.nvidia.com>
Reply-To: kusmabite-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131007121452.GA8324-AwZRO8vwLAwmlAP/+Wk3EA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Oct 7, 2013 at 2:14 PM, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Mon, Oct 07, 2013 at 01:34:44PM +0200, Erik Faye-Lund wrote:
>> On Mon, Oct 7, 2013 at 10:34 AM, Thierry Reding
>> <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> > Rework the address table code for the host1x firewall. The previous
>> > implementation allocated a bitfield but didn't check for a valid pointer
>> > so it could potentially crash.
>>
>> I don't think it could crash. The bitmaps was allocated as a 256-bit
>> field, and the register offset gets AND'ed with 0xFF before being
>> looked up. What am I missing?
>
> The pointer returned from the allocation is never checked, so it could
> theoretically be NULL and be used regardless.
>

Right. Thanks for clarifying.

> Also I'm not sure that AND'ing with 0xff is the right thing to do here.

Well, maybe not. I'm not entirely convinced it's *not*, though.

>> > Furthermore setting up a bitfield makes
>> > the code more complex than it needs to be.
>>
>> Doesn't this perform worse than the current implementation? Going from
>> 1 to 13 checks per write sounds less than ideal to me...
>
> I'm not so sure. Caching should alleviate the issue with the increased
> amount of data. Then there's the fact that previously we needed to
> divide and compute the remainder of the division for the BIT_MASK and
> BIT_WORD operations.

That's an AND and a shift, not division and modulo, both single-cycle
instructions on ARM. I'm pretty sure that'd be a win.

> One other added benefit of this approach is that the address registers
> are stored in a const array and therefore could reside in a read-only
> memory region. With the previous approach, once somebody had access to
> the bitmap, it could easily be overwritten with zeros and effectively
> make the firewall useless. I'm not sure how likely that would be, but it
> could be done.

Perhaps the bitmap could be generated compile-time and stuck in
read-only memory?

> I guess one could actually go and run a benchmark against both versions
> and balance the performance impact against the possible security
> implications. But given that we don't really have any benchmarks that's
> pretty hard to do.

Well, perhaps we could have both? :)
