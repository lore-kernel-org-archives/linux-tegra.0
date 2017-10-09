From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 2/3] dmaengine: Add driver for NVIDIA Tegra AHB DMA
 controller
Date: Mon, 9 Oct 2017 14:43:19 +0300
Message-ID: <25f8bb02-eb63-950b-7cc8-213be33358b2@gmail.com>
References: <cover.1507073384.git.digetx@gmail.com>
 <9ef93a0054a6a2e27b72e5bfeebe81e5ab11a224.1507073384.git.digetx@gmail.com>
 <35dd2e3a-1f97-b82e-4763-a9d064761bc8@gmail.com>
 <b66c06cb-a63e-b13d-02f4-f7bacfd35112@nvidia.com>
 <20171009103909.GZ30097@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171009103909.GZ30097@localhost>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 09.10.2017 13:39, Vinod Koul wrote:
> On Mon, Oct 09, 2017 at 10:43:54AM +0100, Jon Hunter wrote:
>>
>>
>> On 06/10/17 20:11, Dmitry Osipenko wrote:
>>> On 04.10.2017 02:58, Dmitry Osipenko wrote:
>>>> AHB DMA controller presents on Tegra20/30 SoC's, it supports transfers
>>>> memory <-> AHB bus peripherals as well as mem-to-mem transfers. Driver
>>>> doesn't yet implement transfers larger than 64K and scatter-gather
>>>> transfers that have NENT > 1, HW doesn't have native support for these
>>>> cases, mem-to-mem isn't implemented as well.
>>>>
>>>> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>>> ---
>>>>  drivers/dma/Kconfig           |  10 +
>>>>  drivers/dma/Makefile          |   1 +
>>>>  drivers/dma/tegra20-ahb-dma.c | 630 ++++++++++++++++++++++++++++++++++++++++++
>>>>  3 files changed, 641 insertions(+)
>>>>  create mode 100644 drivers/dma/tegra20-ahb-dma.c
>>
>>
>> ...
>>
>>>> +static struct tegra_ahbdma_tx_desc *tegra_ahbdma_get_next_tx(
>>>> +						struct tegra_ahbdma_chan *chan)
>>>> +{
>>>> +	struct virt_dma_desc *vdesc = vchan_next_desc(&chan->vchan);
>>>> +
>>>> +	if (vdesc)
>>>> +		list_del(&vdesc->node);
>>>
>>> I just noticed that this is incorrect. Node must be deleted after TX completion,
>>> otherwise vchan_find_desc won't find TX and residual won't be reported by
>>> dmaengine_tx_status.
>>>
>>> Jon, I think you ADMA driver has the same issue, as well as several other DMA
>>> drivers that use virt-dma.
>>
>> Actually, I think that the above is correct. If vchan_find_desc() finds
>> the descriptor then this indicates that the transfer has not started yet
>> and so the residual is equal to the transfer size.
> 
> That is correct, so you can do a quick calculation and find the residue only
> for current one
> 

Yeah, the problem was that the current *active* one wasn't found.

>> If you look at the adma driver, you will see the if vchan_find_desc()
>> does not find the descriptor, then we check to see if the current
>> transfer is the one we are querying and if so return the bytes
>> remaining. Looking at this driver again, what you have in
>> tegra_ahbdma_tx_status() does not look correct. You should have
>> something like ...
>>
>> 	vdesc = vchan_find_desc(&ahbdma_chan->vchan, cookie);
>> 	if (vdesc) {
>> 		tx = to_ahbdma_tx_desc(vdesc);
>> 		residual = tx->csr & AHBDMA_CH_WCOUNT_MASK;
>> 	} else if (ahbdma_chan->tx_active && 	
>> 		   ahbdma_chan->tx_active->vd.tx.cookie == cookie) {
>> 		residual = tegra_ahbdma_residual(ahbdma_chan);
>> 	} else {
>> 		residual = 0;
>> 	}

I've moved list_del() to the TX completion handler, but I agree that it is not
entirely correct even though that solution works fine. Your variant also works
and does the right thing, thanks!

ADMA driver is correct. Sorry for the 'false alarm' :)
