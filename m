From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v6 11/16] dmaengine: tegra-apb: Keep clock enabled only
 during of DMA transfer
Date: Fri, 31 Jan 2020 09:02:28 +0000
Message-ID: <315241b5-f5a2-aaa0-7327-24055ff306c7@nvidia.com>
References: <20200130043804.32243-1-digetx@gmail.com>
 <20200130043804.32243-12-digetx@gmail.com>
 <2442aee7-2c2a-bacc-7be9-8eed17498928@nvidia.com>
 <0c766352-700a-68bf-cf7b-9b1686ba9ca9@gmail.com>
 <e72d00ee-abee-9ae2-4654-da77420b440e@nvidia.com>
 <cedbf558-b15b-81ca-7833-c94aedce5c5c@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cedbf558-b15b-81ca-7833-c94aedce5c5c-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vinod Koul <vkoul-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>
Cc: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 30/01/2020 20:04, Dmitry Osipenko wrote:

...

>>> The tegra_dma_stop() should put RPM anyways, which is missed in yours
>>> sample. Please see handle_continuous_head_request().
>>
>> Yes and that is deliberate. The cyclic transfers the transfers *should*
>> not stop until terminate_all is called. The tegra_dma_stop in
>> handle_continuous_head_request() is an error condition and so I am not
>> sure it is actually necessary to call pm_runtime_put() here.
> 
> But then tegra_dma_stop() shouldn't unset the "busy" mark.

True.

>>> I'm also finding the explicit get/put a bit easier to follow in the
>>> code, don't you think so?
>>
>> I can see that, but I was thinking that in the case of cyclic transfers,
>> it should only really be necessary to call the get/put at the beginning
>> and end. So in my mind there should only be two exit points which are
>> the ISR handler for SG and terminate_all for SG and cyclic.
> 
> Alright, I'll update this patch.

Hmmm ... I am wondering if we should not mess with that and leave how
you have it.

-- 
nvpublic
