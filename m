From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH] [RFC] gpu: host1x: shut up warning about DMA API misuse
Date: Thu, 20 Apr 2017 12:05:47 +0200
Message-ID: <CAK8P3a2u5aDhEj5mSnw=utB4ctGJuPPhNeNTbtA5vqnSLtNv0g@mail.gmail.com>
References: <20170419182413.866327-1-arnd@arndb.de> <8df7c5a9-c71c-4ee9-9bc2-9c861cf9796c@kapsi.fi>
 <CAK8P3a3JJrA_4Zur47ngWmR7VeKBopJLNZCaqOPzzmnFoV3=Ew@mail.gmail.com> <20170420094932.GM17774@n2100.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170420094932.GM17774-l+eeeJia6m9URfEZ8mYm6t73F7V6hmMc@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>
Cc: Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Linux ARM <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Apr 20, 2017 at 11:49 AM, Russell King - ARM Linux
<linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org> wrote:
> On Thu, Apr 20, 2017 at 10:25:01AM +0200, Arnd Bergmann wrote:
>> On Thu, Apr 20, 2017 at 9:02 AM, Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org> wrote:
>> > I think we have a "policy" on Tegra that the DMA API will never allocate
>> > using the IOMMU (Thierry can elaborate on this), which is why I wrote the
>> > code with that assumption. Essentially, we have made the DMA API into the
>> > API that allocates CPU-visible memory.
>>
>> I don't think this can be a per-platform policy.
>>
>> > Considering that, I'm wondering if we can just have a temporary local
>> > dma_addr_t and then cast that to phys_addr_t, combined with a good comment?
>>
>> That was my first approach, and it does address the warning, but
>> I did not send it because it still felt too wrong.
>
> Sounds to me like the warning is justified - it's saying that there's
> something not right here which could be a problem.

Absolutely.

> So I'd say, don't
> fix the warning, it's doing its job, highlighting a potential problem
> with the code.
>
> (Consider hiding the warning and then running on a platform where the
> assumptions are broken.)

The problem is that I'm probably the only one who ever sees that
warning since you don't see it in any defconfig builds that all have
the same width for dma_addr_t and phys_addr_t.

The other alternative would be to ask for the patch that introduced
the warning to get reverted before it makes it into v4.12, if we can't
come up with a proper way to do this.

      Arnd
