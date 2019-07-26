From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH net-next 3/3] net: stmmac: Introducing support for Page
 Pool
Date: Fri, 26 Jul 2019 15:11:00 +0100
Message-ID: <1e2ea942-28fe-15b9-f675-8d6585f9a33f@nvidia.com>
References: <cover.1562149883.git.joabreu@synopsys.com>
 <1b254bb7fc6044c5e6e2fdd9e00088d1d13a808b.1562149883.git.joabreu@synopsys.com>
 <7a79be5d-7ba2-c457-36d3-1ccef6572181@nvidia.com>
 <BYAPR12MB3269927AB1F67D46E150ED6BD3C10@BYAPR12MB3269.namprd12.prod.outlook.com>
 <9e695f33-fd9f-a910-0891-2b63bd75e082@nvidia.com>
 <BYAPR12MB3269B4A401E4DA10A07515C7D3C10@BYAPR12MB3269.namprd12.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <BYAPR12MB3269B4A401E4DA10A07515C7D3C10@BYAPR12MB3269.namprd12.prod.outlook.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jose Abreu <Jose.Abreu@synopsys.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Cc: Joao Pinto <Joao.Pinto@synopsys.com>, Alexandre Torgue <alexandre.torgue@st.com>, Maxime Ripard <maxime.ripard@bootlin.com>, Chen-Yu Tsai <wens@csie.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, linux-tegra <linux-tegra@vger.kernel.org>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Robin Murphy <robin.murphy@arm.com>, "David S . Miller" <davem@davemloft.net>
List-Id: linux-tegra@vger.kernel.org


On 25/07/2019 16:12, Jose Abreu wrote:
> From: Jon Hunter <jonathanh@nvidia.com>
> Date: Jul/25/2019, 15:25:59 (UTC+00:00)
> 
>>
>> On 25/07/2019 14:26, Jose Abreu wrote:
>>
>> ...
>>
>>> Well, I wasn't expecting that :/
>>>
>>> Per documentation of barriers I think we should set descriptor fields 
>>> and then barrier and finally ownership to HW so that remaining fields 
>>> are coherent before owner is set.
>>>
>>> Anyway, can you also add a dma_rmb() after the call to 
>>> stmmac_rx_status() ?
>>
>> Yes. I removed the debug print added the barrier, but that did not help.
> 
> So, I was finally able to setup NFS using your replicated setup and I 
> can't see the issue :(
> 
> The only difference I have from yours is that I'm using TCP in NFS 
> whilst you (I believe from the logs), use UDP.

So I tried TCP by setting the kernel boot params to 'nfsvers=3' and
'proto=tcp' and this does appear to be more stable, but not 100% stable.
It still appears to fail in the same place about 50% of the time.

> You do have flow control active right ? And your HW FIFO size is >= 4k ?

How can I verify if flow control is active?

The documentation for this device indicates a max transfer size of 16kB
for TX and RX.

Cheers
Jon

-- 
nvpublic
