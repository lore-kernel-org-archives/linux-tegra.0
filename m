From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 04/10] drm/nouveau/fb: add GK20A support
Date: Wed, 23 Apr 2014 11:07:51 +0900
Message-ID: <53572077.6090305@nvidia.com>
References: <1398060142-7937-1-git-send-email-acourbot@nvidia.com> <1398060142-7937-5-git-send-email-acourbot@nvidia.com> <20140422104052.GB22426@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140422104052.GB22426@ulmo>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 04/22/2014 07:40 PM, Thierry Reding wrote:
> * PGP Signed by an unknown key
>
> On Mon, Apr 21, 2014 at 03:02:16PM +0900, Alexandre Courbot wrote:
> [...]
>> diff --git a/drivers/gpu/drm/nouveau/core/subdev/fb/ramgk20a.c b/drivers/gpu/drm/nouveau/core/subdev/fb/ramgk20a.c
> [...]
>> +		pages = dma_alloc_from_contiguous(dev, ncmin, order);
>> +		if (!pages) {
>> +			gk20a_ram_put(pfb, &mem);
>> +			return -ENOMEM;
>> +		}
>> +
>> +		dma_addr = pfn_to_dma(nv_device_base(nv_device(pfb)),
>> +				      page_to_pfn(pages));
>
> This breaks compilation on x86 because neither pfn_to_dma() nor
> dma_to_pfn() are available. Is there some other way this can be
> allocated so that these functions don't need to be called?

Mmm, this is bad. There is probably another more portable way to do 
this. Let me look for it.

Thanks,
Alex.
