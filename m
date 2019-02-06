From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH V11 3/5] i2c: tegra: Add DMA support
Date: Wed, 6 Feb 2019 17:56:02 +0300
Message-ID: <5e66803c-b13b-cb00-e2ff-d096a1650612@gmail.com>
References: <1549356985-25726-1-git-send-email-skomatineni@nvidia.com>
 <1549356985-25726-3-git-send-email-skomatineni@nvidia.com>
 <a9e264e2-87c9-e263-808a-b561e8ed4073@gmail.com> <20190206145343.GA3651@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190206145343.GA3651@ulmo>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Sowjanya Komatineni <skomatineni@nvidia.com>, jonathanh@nvidia.com, mkarthik@nvidia.com, smohammed@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

06.02.2019 17:53, Thierry Reding пишет:
> On Tue, Feb 05, 2019 at 05:26:25PM +0300, Dmitry Osipenko wrote:
> [...]
>> Oh, another important moment is that physically contiguous dma_buf
>> allocation isn't guaranteed by the DMA API. This may become a problem
>> for T186+ that can transfer up to 64K. We need to enforce the
>> contiguous-allocation requirement by using
>> dma_alloc_attrs(DMA_ATTR_FORCE_CONTIGUOUS) instead of the
>> dma_alloc_coherent(), please see my other comment below.
> 
> Actually I don't think that's necessary here. DMA_ATTR_FORCE_CONTIGUOUS
> only seems relevant if you've got an IOMMU attached to the device to
> make sure the physical memory is also contiguous.
> 
> See this extract from Documentation/DMA-attributes.txt:
> 
> | DMA_ATTR_FORCE_CONTIGUOUS
> | -------------------------
> | 
> | By default DMA-mapping subsystem is allowed to assemble the buffer
> | allocated by dma_alloc_attrs() function from individual pages if it can
> | be mapped as contiguous chunk into device dma address space. By
> | specifying this attribute the allocated buffer is forced to be contiguous
> | also in physical memory.
> 
> We don't have an IOMMU attached to I2C or APBDMA, so this can't happen
> and even if we had an IOMMU attached, all we care about is the device's
> DMA address space, which means IOVA space, and that would still be
> guaranteed to be contiguous, according to the above.

Yes, but doesn't T186+ have IOMMU support for the DMA controller?
