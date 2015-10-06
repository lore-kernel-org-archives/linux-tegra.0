From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V2 2/2] dmaengine: tegra-adma: Add support for Tegra210
 ADMA
Date: Tue, 6 Oct 2015 10:45:01 +0100
Message-ID: <5613981D.3040503@nvidia.com>
References: <1444047007-30494-1-git-send-email-jonathanh@nvidia.com>
 <1444047007-30494-3-git-send-email-jonathanh@nvidia.com>
 <16524792.BmEijCQ1oc@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <16524792.BmEijCQ1oc@wuerfel>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 06/10/15 10:32, Arnd Bergmann wrote:
> On Monday 05 October 2015 13:10:07 Jon Hunter wrote:
>> Add support for the Tegra210 Audio DMA controller that is used for
>> transferring data between system memory and the Audio sub-system.
>> The driver only supports cyclic transfers because this is being solely
>> used for audio.
>>
>> This driver is based upon the work by Dara Ramesh <dramesh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>.
>>
>> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> This version looks much better!
> 
> Just one small comment:
> 
>> +	slave_req = dma_spec->args[0];
>> +	slave_dir = dma_spec->args[1];
>> +
>> +	if (slave_req == 0)
>> +		return NULL;
>> +
>> +	switch (slave_dir) {
>> +	case ADMA_AHUB_TO_MEM:
>> +		if (slave_req > tdma->rx_requests)
>> +			return NULL;
>> +
>> +		if (tdma->rx_requests_reserved & BIT(slave_req))
>> +			return NULL;
>> +
>> +		tdma->rx_requests_reserved |= BIT(slave_req);
>> +		break;
> 
> The rx_requests_reserved logic looks racy, if you have more than
> one concurrent request or release. Better use atomic_test_and_set()
> here and turn the variable into an atomic_t.

Ah yes, will update.

Thanks
Jon
