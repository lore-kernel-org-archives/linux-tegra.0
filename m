From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH v3 0/2] ARM: IOMMU: tegra: Add iommu_ops for GART/SMMU
	driver
Date: Thu, 5 Jan 2012 12:53:26 +0000
Message-ID: <20120105125326.GT11810@n2100.arm.linux.org.uk>
References: <1325747509-29665-1-git-send-email-hdoyu@nvidia.com> <20120105091718.3fb378b2a1d390f9dd63c396@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20120105091718.3fb378b2a1d390f9dd63c396-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linaro-mm-sig-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org" <linaro-mm-sig-bounces-cunTk1MwBs8s++Sfvej+rw@public.gmane.org>, "iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org" <iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Jan 05, 2012 at 09:17:18AM +0200, Hiroshi Doyu wrote:
> Just for DMA mapping test from MPU side, the following one is used.

This patch is buggy.

> +static void dmaapi_test_map_page(struct device *dev)
> +{
> +	struct page *page;
> +	dma_addr_t dma_addr;
> +	void *cpu_addr;
> +
> +	page = alloc_page(GFP_KERNEL);
> +	BUG_ON(!page);
> +
> +	dma_addr = dma_map_page(dev, page, 0, PAGE_SIZE, DMA_TO_DEVICE);
> +	BUG_ON(!dma_addr);
> +
> +	cpu_addr = kmap(page);
> +	BUG_ON(!cpu_addr);
> +	memset(cpu_addr, 0xa5, PAGE_SIZE);
> +	kunmap(cpu_addr);

The DMA API works like this:

- The CPU owns the page or buffer and can access it.
- You map the page or buffer.
- The device owns the page or buffer; the CPU must explicitly access it.
- You unmap the page or buffer.
- The CPU again owns the page/buffer and can access it.

Please respect the DMA API rules.

So.  Once dma_map_page() has returned, you must not kmap() or otherwise
access the data contained in that page until after you have unmapped it.
