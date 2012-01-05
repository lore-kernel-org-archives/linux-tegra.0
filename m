From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH v3 0/2] ARM: IOMMU: tegra: Add iommu_ops for GART/SMMU
	driver
Date: Thu, 5 Jan 2012 14:46:31 +0000
Message-ID: <20120105144631.GV11810@n2100.arm.linux.org.uk>
References: <1325747509-29665-1-git-send-email-hdoyu@nvidia.com> <20120105091718.3fb378b2a1d390f9dd63c396@nvidia.com> <20120105125326.GT11810@n2100.arm.linux.org.uk> <20120105.162930.604365154868332443.hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20120105.162930.604365154868332443.hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linaro-mm-sig-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org" <linaro-mm-sig-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>, "iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org" <iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Jan 05, 2012 at 03:29:30PM +0100, Hiroshi Doyu wrote:
> Ok, the above function order should be as below?
> 
>   page = alloc_page(GFP_KERNEL);
>       cpu_addr = kmap(page);
>       memset(cpu_addr, 0xa5, PAGE_SIZE);
>   	dma_addr = dma_map_page(dev, page, 0, PAGE_SIZE, DMA_TO_DEVICE);
>   	    < expect GPU does something >
>   	dma_unmap_page(dev, dma_addr, PAGE_SIZE, DMA_TO_DEVICE);
>       < CPU can access data here again>
>       kunmap(cpu_addr);
>   __free_page(page);

That should work, but it's not particularly nice to wrap kmap around
the DMA API.

Bear in mind that alloc_page(GFP_KERNEL) will always give you a lowmem
page.  So, you might as well do:

	page = alloc_page(GFP_KERNEL);
	cpu_addr = page_address(page);
	memset()
	dma_addr = dma_map_single(dev, cpu_addr, PAGE_SIZE, DMA_TO_DEVICE);
		< GPU access >
	dma_unmap_single(dev, dma_ddr, PAGE_SIZE, DMA_TO_DEVICE);
	< CPU access >
	__free_page(page);

and this doesn't raise any issues with kmap vs DMA API.
