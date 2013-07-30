From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 2/9] dma: tegra20-apbdma: move to generic device tree
 bindings
Date: Tue, 30 Jul 2013 10:44:18 -0600
Message-ID: <51F7ED62.4060404@wwwdotorg.org>
References: <1374639002-16753-1-git-send-email-rizhao@nvidia.com> <1374639002-16753-3-git-send-email-rizhao@nvidia.com> <51F2CDBE.40802@wwwdotorg.org> <20130730030644.GJ15855@rizhao-lap>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130730030644.GJ15855@rizhao-lap>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Richard Zhao <rizhao-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org" <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "djbw-b10kYP2dOMg@public.gmane.org" <djbw-b10kYP2dOMg@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 07/29/2013 09:06 PM, Richard Zhao wrote:
> On Sat, Jul 27, 2013 at 03:27:58AM +0800, Stephen Warren wrote:
>> (Stripping the Cc list a lot)
>>
>> On 07/23/2013 10:09 PM, Richard Zhao wrote:
>>> Update tegra20-apbdma driver to adopt generic DMA device tree bindings.
>>> It calls of_dma_controller_register() with of_dma_simple_xlate to get
>>> the generic DMA device tree helper support. The #dma-cells for apbdma
>>> must be 1, which is slave ID.
>>>
>>> The existing nvidia,dma-request-selector still works there, and the
>>> support will be removed after all clients get converted to generic DMA
>>> device tree helper.

>>> diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
>>
>>> +static bool tegra_dma_filter_fn(struct dma_chan *dc, void *param)
>>> +{
>>> +	if (dc->device->dev->driver == &tegra_dmac_driver.driver) {
>>> +		struct tegra_dma_channel *tdc = to_tegra_dma_chan(dc);
>>> +		unsigned req = *(unsigned *)param;
>>> +
>>> +		tdc->slave_id = req;
>>> +
>>> +		return true;
>>> +	}
>>> +	return false;
>>> +}
>>> +
>>> +static struct of_dma_filter_info tegra_dma_info = {
>>> +	.filter_fn = tegra_dma_filter_fn,
>>> +};
>>
>> Why does this driver need to define a filter function? I thought the
>> dmaengine's DT support would already match DMA clients/engines based on
>> the phandle in DT? Isn't the need to pass the slave channel ID into
>> drivers something pretty fundamental to dmaengine, and hence something
>> it already supports?
>
> of_dma_simple_xlate only pass slave id to filter function. It needs
> change to pass dt node too. I didn't start work on the common code
> change yet. Do you think we need to hold it until common code change?

Oh dear, I can't see how the core DT DMA support can work for anyone
without the ability to limit DMA clients to the specific DMA controller
that's specified in DT. If that functionality truly is missing, then it
certainly needs to be added first.
