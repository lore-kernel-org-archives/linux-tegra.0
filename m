From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 0/2] Add memcpy support for tegra210-adma
Date: Tue, 6 Sep 2016 15:03:43 +0300
Message-ID: <5db4d7db-b1f4-c6af-de56-e8bb13ebc465@gmail.com>
References: <cover.1472857934.git.nicoleotsuka@gmail.com>
 <319ca097-4b10-83b9-841c-52adccbb48ad@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <319ca097-4b10-83b9-841c-52adccbb48ad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Nicolin Chen <nicoleotsuka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 06.09.2016 14:33, Jon Hunter wrote:
> 
> On 03/09/16 01:32, Nicolin Chen wrote:
>> This series of patches add memcpy support for tegra210 ADMA engine.
> 
> Thanks. Any reason you choose this DMA and not the APB DMA? The APB DMA
> is more of a generic DMA and so for memcpy it would seem to be a good
> choice and it is available on all Tegras not just Tegra210.
> 

Just a small clarification:

If I'm not mistaken, APB DMA is mem-to-device, while AHB DMA is mem-to-mem. So,
you probably meant AHB and not the APB.

> Furthermore, from a power standpoint the ADMA is in the audio power
> domain and so using it for memcpy would mean the audio power domain is
> turned on. It may not be a big deal for some, but given the APB is in
> the CORE domain (always on when not in low-power) it seems like a better
> choice for power as well.
> 

-- 
Dmitry
