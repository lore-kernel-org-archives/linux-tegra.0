From: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 04/10] drm/nouveau/fb: add GK20A support
Date: Thu, 1 May 2014 13:49:28 +0900
Message-ID: <CAAVeFuJrs8Sv9UZg=Tj6gJeHOXj9YSX4gT1TNdrfXvVfrBHerQ@mail.gmail.com>
References: <1398060142-7937-1-git-send-email-acourbot@nvidia.com>
 <1398060142-7937-5-git-send-email-acourbot@nvidia.com> <20140422104052.GB22426@ulmo>
 <53572077.6090305@nvidia.com> <CAAVeFuKscuN-=HJOarbzFkG1ARq6-Nfc2pf1ibam9b61Cjbs6Q@mail.gmail.com>
 <20140428114437.GK19455@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140428114437.GK19455@ulmo>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Apr 28, 2014 at 8:44 PM, Thierry Reding
<thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> On Wed, Apr 23, 2014 at 03:11:01PM +0900, Alexandre Courbot wrote:
>> On Wed, Apr 23, 2014 at 11:07 AM, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>> > On 04/22/2014 07:40 PM, Thierry Reding wrote:
>> >>
>> >> * PGP Signed by an unknown key
>> >>
>> >>
>> >> On Mon, Apr 21, 2014 at 03:02:16PM +0900, Alexandre Courbot wrote:
>> >> [...]
>> >>>
>> >>> diff --git a/drivers/gpu/drm/nouveau/core/subdev/fb/ramgk20a.c
>> >>> b/drivers/gpu/drm/nouveau/core/subdev/fb/ramgk20a.c
>> >>
>> >> [...]
>> >>>
>> >>> +               pages = dma_alloc_from_contiguous(dev, ncmin, order);
>> >>> +               if (!pages) {
>> >>> +                       gk20a_ram_put(pfb, &mem);
>> >>> +                       return -ENOMEM;
>> >>> +               }
>> >>> +
>> >>> +               dma_addr = pfn_to_dma(nv_device_base(nv_device(pfb)),
>> >>> +                                     page_to_pfn(pages));
>> >>
>> >>
>> >> This breaks compilation on x86 because neither pfn_to_dma() nor
>> >> dma_to_pfn() are available. Is there some other way this can be
>> >> allocated so that these functions don't need to be called?
>> >
>> >
>> > Mmm, this is bad. There is probably another more portable way to do this.
>> > Let me look for it.
>>
>> page_to_phys()/phys_to_page() can be used by drivers and will work
>> just fine here since the CPU and GPU use the same physical addresses
>> to access memory.
>
> I'm wondering how this is going to pan out when we try adding IOMMU
> support. But I guess we can cross that bridge when we come to it.

Agreed. Besides I hope the day won't come where we have to go through
2 layers of memory translation for the GPU...
