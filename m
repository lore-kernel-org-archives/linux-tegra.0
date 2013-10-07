From: =?ISO-8859-1?Q?Terje_Bergstr=F6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 08/27] drm/tegra: gr2d: Miscellaneous cleanups
Date: Mon, 7 Oct 2013 15:52:28 +0300
Message-ID: <5252AE8C.9090609@nvidia.com>
References: <1381134884-5816-1-git-send-email-treding@nvidia.com> <1381134884-5816-9-git-send-email-treding@nvidia.com> <CABPQNSbkS40_jyGz14s08+x3e+-pxnfy90V7pzAOfiqUF2ma2g@mail.gmail.com> <20131007121452.GA8324@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131007121452.GA8324-AwZRO8vwLAwmlAP/+Wk3EA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Erik Faye-Lund <kusmabite-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 07.10.2013 15:14, Thierry Reding wrote:
> * PGP Signed by an unknown key
> 
> On Mon, Oct 07, 2013 at 01:34:44PM +0200, Erik Faye-Lund wrote:
>> On Mon, Oct 7, 2013 at 10:34 AM, Thierry Reding
>> <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>> Rework the address table code for the host1x firewall. The previous
>>> implementation allocated a bitfield but didn't check for a valid pointer
>>> so it could potentially crash.
>>
>> I don't think it could crash. The bitmaps was allocated as a 256-bit
>> field, and the register offset gets AND'ed with 0xFF before being
>> looked up. What am I missing?
> 
> The pointer returned from the allocation is never checked, so it could
> theoretically be NULL and be used regardless.
> 
> Also I'm not sure that AND'ing with 0xff is the right thing to do here.

Oops, there's a check for NULL missing. If that allocation fails, probe
should fail, so we just need to propagate the error condition. Otherwise
we might just leave the firewall off, and let everything go in unchecked.

AND 0xff is necessary, because the same registers are mirrored in
multiple contexts. AND removes the offset coming from context, and
leaves just the plain register offset.

> I'm not so sure. Caching should alleviate the issue with the increased
> amount of data. Then there's the fact that previously we needed to
> divide and compute the remainder of the division for the BIT_MASK and
> BIT_WORD operations.

Don't these get compiled into shifts and bitwise ands?

> One other added benefit of this approach is that the address registers
> are stored in a const array and therefore could reside in a read-only
> memory region. With the previous approach, once somebody had access to
> the bitmap, it could easily be overwritten with zeros and effectively
> make the firewall useless. I'm not sure how likely that would be, but it
> could be done.

If somebody gets access to the bitmap, he has access to kernel data
structures. GR2D firewall is the least of our worries in this case.

Terje
