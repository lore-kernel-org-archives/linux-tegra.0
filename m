From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH net-next 3/3] net: stmmac: Introducing support for Page
 Pool
Date: Mon, 29 Jul 2019 22:33:04 +0100
Message-ID: <8a60361f-b914-93ef-0d80-92ae4ad8b808@nvidia.com>
References: <cover.1562149883.git.joabreu@synopsys.com>
 <1b254bb7fc6044c5e6e2fdd9e00088d1d13a808b.1562149883.git.joabreu@synopsys.com>
 <7a79be5d-7ba2-c457-36d3-1ccef6572181@nvidia.com>
 <BYAPR12MB3269927AB1F67D46E150ED6BD3C10@BYAPR12MB3269.namprd12.prod.outlook.com>
 <9e695f33-fd9f-a910-0891-2b63bd75e082@nvidia.com>
 <BYAPR12MB3269B4A401E4DA10A07515C7D3C10@BYAPR12MB3269.namprd12.prod.outlook.com>
 <1e2ea942-28fe-15b9-f675-8d6585f9a33f@nvidia.com>
 <BYAPR12MB326922CDCB1D4B3D4A780CFDD3C30@BYAPR12MB3269.namprd12.prod.outlook.com>
 <MN2PR12MB327907D4A6FB378AC989571AD3DD0@MN2PR12MB3279.namprd12.prod.outlook.com>
 <b99b1e49-0cbc-2c66-6325-50fa6f263d91@nvidia.com>
 <MN2PR12MB327997BDF2EA5CEE00F45AC3D3DD0@MN2PR12MB3279.namprd12.prod.outlook.com>
 <fcf648d2-70cc-d734-871a-ca7f745791b7@arm.com>
 <MN2PR12MB3279ABF628C52883021123C5D3DD0@MN2PR12MB3279.namprd12.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <MN2PR12MB3279ABF628C52883021123C5D3DD0@MN2PR12MB3279.namprd12.prod.outlook.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jose Abreu <Jose.Abreu@synopsys.com>, Robin Murphy <robin.murphy@arm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Joao Pinto <Joao.Pinto@synopsys.com>, Alexandre Torgue <alexandre.torgue@st.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-tegra <linux-tegra@vger.kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, "David S . Miller" <davem@davemloft.net>
List-Id: linux-tegra@vger.kernel.org


On 29/07/2019 15:08, Jose Abreu wrote:

...

>>> Hi Catalin and Will,
>>>
>>> Sorry to add you in such a long thread but we are seeing a DMA issue
>>> with stmmac driver in an ARM64 platform with IOMMU enabled.
>>>
>>> The issue seems to be solved when buffers allocation for DMA based
>>> transfers are *not* mapped with the DMA_ATTR_SKIP_CPU_SYNC flag *OR*
>>> when IOMMU is disabled.
>>>
>>> Notice that after transfer is done we do use
>>> dma_sync_single_for_{cpu,device} and then we reuse *the same* page for
>>> another transfer.
>>>
>>> Can you please comment on whether DMA_ATTR_SKIP_CPU_SYNC can not be used
>>> in ARM64 platforms with IOMMU ?
>>
>> In terms of what they do, there should be no difference on arm64 between:
>>
>> dma_map_page(..., dir);
>> ...
>> dma_unmap_page(..., dir);
>>
>> and:
>>
>> dma_map_page_attrs(..., dir, DMA_ATTR_SKIP_CPU_SYNC);
>> dma_sync_single_for_device(..., dir);
>> ...
>> dma_sync_single_for_cpu(..., dir);
>> dma_unmap_page_attrs(..., dir, DMA_ATTR_SKIP_CPU_SYNC);
>>
>> provided that the first sync covers the whole buffer and any subsequent 
>> ones cover at least the parts of the buffer which may have changed. Plus 
>> for coherent hardware it's entirely moot either way.
> 
> Thanks for confirming. That's indeed what stmmac is doing when buffer is 
> received by syncing the packet size to CPU.
> 
>>
>> Given Jon's previous findings, I would lean towards the idea that 
>> performing the extra (redundant) cache maintenance plus barrier in 
>> dma_unmap is mostly just perturbing timing in the same way as the debug 
>> print which also made things seem OK.
> 
> Mikko said that Tegra186 is not coherent so we have to explicit flush 
> pipeline but I don't understand why sync_single() is not doing it ...
> 
> Jon, can you please remove *all* debug prints, hacks, etc ... and test 
> this one in attach with plain -net tree ?

So far I have just been testing on the mainline kernel branch. The issue
still persists after applying this on mainline. I can test on the -net
tree, but I am not sure that will make a difference.

Cheers
Jon

-- 
nvpublic
