From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V3 2/2] dma: tegra: add dmaengine based dma driver
Date: Wed, 23 May 2012 12:13:32 +0530
Message-ID: <4FBC8714.5030808@nvidia.com>
References: <1336734044-14275-1-git-send-email-ldewangan@nvidia.com> <1336734044-14275-3-git-send-email-ldewangan@nvidia.com> <4FB5657C.1010902@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4FB5657C.1010902-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org" <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org" <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org" <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Friday 18 May 2012 02:24 AM, Stephen Warren wrote:
> On 05/11/2012 05:00 AM, Laxman Dewangan wrote:
>> Adding dmaengine based NVIDIA's Tegra APB DMA driver.
>> This driver support the slave mode of data transfer from
>> peripheral to memory and vice versa.
>> The driver supports for the cyclic and non-cyclic mode
>> of data transfer.
>> diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
>

I have taken care of all your comments. Few clarification here.
>> +static int tegra_dma_allocate_desc(struct tegra_dma_channel *tdc,
>> +		int ndma_desc, int nsg_req)
> The queue management here seems a lot more complex than other drivers I
> briefly looked at, which don't (a) allocate multiple descriptors at once
> or (b) maintain a pool of free descriptors. I guess if this all works
> it's fine, but it sure makes it harder for me to understand the driver
> and review it. I'd personally love to have seen a much simpler driver
> and then add these optimizations later if they prove worthwhile.
>
> (As an aside, it seems like if this descriptor management logic is
> worthwhile, it should be part of the dmaengine core, not individual drivers)

This is done by Russel in one of his patch as virt_dma. I will use that 
later on, not on this series of patch as it is not available now.

>
> Given that the tasklet is just running the completion callbacks, is this
> condition really an error? Can't you just add some more entries onto the
> tail of the list of callbacks for the tasklet?
>
Taken care. Using ref count and calling clalback multiple times here. 
There was discussion on this topic and I went as per suggestion on that 
topic.


>> +	/* Pause DMA before checking the queue status */
>> +	tegra_dma_pause(tdc, true);
>> +
>> +	status = tdc_read(tdc, TEGRA_APBDMA_CHAN_STATUS);
>> +	if (status&  STATUS_ISE_EOC) {
>> +		dev_dbg(tdc2dev(tdc), "%s():handling isr\n", __func__);
>> +		tdc->isr_handler(tdc, true);
>> +		status = tdc_read(tdc, TEGRA_APBDMA_CHAN_STATUS);
>> +	}
> In the termination case, do we really need to run the isr handler?
> Presumably since the DMA is being aborted, the caller doesn't really
> care about getting the absolute latest up-to-date information, so the
> fact that something completed within the last
> EGRA_APBDMA_BURST_COMPLETE_TIME micro-seconds isn't something it's worth
> determining?
>

For serial case, we will need this info as on the serial communication, 
we will use abort most of time. Reson is that we do not know how much 
data is goign to arrive and so program dma for larger size and based on 
uart controller interrupt, abort dma and get actual bytes transfered by dma.
>> +	tdma->dma_clk = clk_get(&pdev->dev, NULL);
> Since this won't be applied until 3.6, I think you can use
> devm_clk_get() here.
>

Will use on later patch as on Vinod's tree may  not have this change now.

>> +static int tegra_dma_suspend_noirq(struct device *dev)
> Why do we need to implement the _noirq variants for system
> suspend/resume? In the mainline kernel, the existence of deferred probe
> most likely means we don't need to use _noirq any more.
>

Removed.
>
> If so, the above 11 lines can be replaced with:
>
> module_platform_driver(tegra_dmac_driver);
Done.

> Overall, I haven't reviewed the driver's interaction with dmaengine too
> much since I'm not familiar with dmaengine. I think Vinod has been
> covering those aspects fine. However, I did try to follow the DMA HW
> programming, and I think it does avoid the problems we were trying to
> solve in the existing APB DMA driver, perhaps mainly because dmaengine
> doesn't expose quite as many functions to client code.
>
> So overall, aside from the comments above, this looks good.
Thanks for review,
