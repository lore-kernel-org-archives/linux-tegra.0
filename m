From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 2/3] dmaengine: Add driver for NVIDIA Tegra AHB DMA
 controller
Date: Fri, 6 Oct 2017 22:25:44 +0300
Message-ID: <163a6cff-d620-e80e-a4c3-2975c536012f@gmail.com>
References: <cover.1507073384.git.digetx@gmail.com>
 <9ef93a0054a6a2e27b72e5bfeebe81e5ab11a224.1507073384.git.digetx@gmail.com>
 <58f8c049-4408-d6a7-7452-f5be8041b7b5@nvidia.com>
 <72374a74-f6bd-256f-73c0-fa970a2e1576@gmail.com>
 <d4885545-6af1-b240-a197-1ed530cc4172@nvidia.com>
 <fc684b85-b4a7-c68d-613c-adbe0b154c6c@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <fc684b85-b4a7-c68d-613c-adbe0b154c6c-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 06.10.2017 20:23, Dmitry Osipenko wrote:
> On 06.10.2017 18:50, Jon Hunter wrote:
>>
>> On 06/10/17 16:26, Dmitry Osipenko wrote:
>>> On 06.10.2017 16:11, Jon Hunter wrote:
>>>>
>>>> On 04/10/17 00:58, Dmitry Osipenko wrote:
>>>>> AHB DMA controller presents on Tegra20/30 SoC's, it supports transfers
>>>>> memory <-> AHB bus peripherals as well as mem-to-mem transfers. Driver
>>>>> doesn't yet implement transfers larger than 64K and scatter-gather
>>>>> transfers that have NENT > 1, HW doesn't have native support for these
>>>>> cases, mem-to-mem isn't implemented as well.
>>>>
>>>> The APB DMA does not have h/w support for sg-transfers either, but
>>>> transfer request are placed on a list. Can we not do the same for AHB?
>>>>
>>>
>>> We can, but I'm not going to implement it without a use-case. It could be done
>>> later if needed.
>>
>> OK, that's fine, maybe state that above.
>>
> 
> Well, I think it is explicitly mentioned in the commit message.
> 
> "Driver doesn't yet implement transfers larger than 64K and scatter-gather
> transfers that have NENT > 1".
> 
> Isn't it enough?
> 
>> [...]
>>
>>>>> +static void tegra_ahbdma_issue_next_tx(struct tegra_ahbdma_chan *chan)
>>>>> +{
>>>>> +	struct tegra_ahbdma_tx_desc *tx = tegra_ahbdma_get_next_tx(chan);
>>>>> +
>>>>> +	if (tx) {
>>>>> +		writel_relaxed(tx->ahb_seq,  chan->regs + AHBDMA_CH_AHB_SEQ);
>>>>> +		writel_relaxed(tx->ahb_addr, chan->regs + AHBDMA_CH_AHB_PTR);
>>>>> +		writel_relaxed(tx->mem_addr, chan->regs + AHBDMA_CH_XMB_PTR);
>>>>> +		writel_relaxed(tx->csr,      chan->regs + AHBDMA_CH_CSR);
>>>>> +
>>>>> +		reinit_completion(&chan->idling);
>>>>
>>>> Should this be done before actually starting the DMA?
>>
>> OK, then that's fine.
>>
>> [...]
>>
>>>>> +	else {
>>>>> +		tx = to_ahbdma_tx_desc(vdesc);
>>>>> +
>>>>> +		if (tx == ahbdma_chan->active_tx)
>>>>> +			residual = tegra_ahbdma_residual(ahbdma_chan);
>>>>> +		else
>>>>> +			residual = tx->csr & AHBDMA_CH_WCOUNT_MASK;
>>>>> +
>>>>> +		residual += sizeof(u32);
>>>>> +	}
>>>>> +
>>>>> +	dma_set_residue(state, residual);
>>>>
>>>> I believe residue needs to be bytes.
>>
>> Oops yes indeed!
>>
>>>>> +static int tegra_ahbdma_terminate_all(struct dma_chan *chan)
>>>>> +{
>>>>> +	struct tegra_ahbdma_chan *ahbdma_chan = to_ahbdma_chan(chan);
>>>>> +	unsigned long flags;
>>>>> +	LIST_HEAD(head);
>>>>> +	u32 csr;
>>>>> +
>>>>> +	spin_lock_irqsave(&ahbdma_chan->vchan.lock, flags);
>>>>> +
>>>>> +	csr = readl_relaxed(ahbdma_chan->regs + AHBDMA_CH_CSR);
>>>>> +	writel_relaxed(csr & ~AHBDMA_CH_ENABLE,
>>>>> +		       ahbdma_chan->regs + AHBDMA_CH_CSR);
>>>>> +
>>>>> +	if (ahbdma_chan->active_tx) {
>>>>> +		udelay(AHBDMA_BURST_COMPLETE_TIME);
>>>>
>>>> Why not poll the status register and wait for the channel to stop?
>>>>
>>>
>>> That probably would also work. But I'm not sure whether status depends on the
>>> channels "enable" state..
>>
>> Well if it is not enabled, then we probably don't care about the state.
>> However, a quick test should tell us.
>>
> 
> Okay, I'll try to check it.
>
I have checked the 'busy' bit and it indeed reflects the real channels busy
state. I'll change code to poll the busy bit instead of the delaying. Thank you
for the suggestion!
