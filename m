From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 2/3] dmaengine: Add driver for NVIDIA Tegra AHB DMA
 controller
Date: Fri, 6 Oct 2017 16:50:34 +0100
Message-ID: <d4885545-6af1-b240-a197-1ed530cc4172@nvidia.com>
References: <cover.1507073384.git.digetx@gmail.com>
 <9ef93a0054a6a2e27b72e5bfeebe81e5ab11a224.1507073384.git.digetx@gmail.com>
 <58f8c049-4408-d6a7-7452-f5be8041b7b5@nvidia.com>
 <72374a74-f6bd-256f-73c0-fa970a2e1576@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <72374a74-f6bd-256f-73c0-fa970a2e1576-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 06/10/17 16:26, Dmitry Osipenko wrote:
> On 06.10.2017 16:11, Jon Hunter wrote:
>>
>> On 04/10/17 00:58, Dmitry Osipenko wrote:
>>> AHB DMA controller presents on Tegra20/30 SoC's, it supports transfers
>>> memory <-> AHB bus peripherals as well as mem-to-mem transfers. Driver
>>> doesn't yet implement transfers larger than 64K and scatter-gather
>>> transfers that have NENT > 1, HW doesn't have native support for these
>>> cases, mem-to-mem isn't implemented as well.
>>
>> The APB DMA does not have h/w support for sg-transfers either, but
>> transfer request are placed on a list. Can we not do the same for AHB?
>>
> 
> We can, but I'm not going to implement it without a use-case. It could be done
> later if needed.

OK, that's fine, maybe state that above.

[...]

>>> +static void tegra_ahbdma_issue_next_tx(struct tegra_ahbdma_chan *chan)
>>> +{
>>> +	struct tegra_ahbdma_tx_desc *tx = tegra_ahbdma_get_next_tx(chan);
>>> +
>>> +	if (tx) {
>>> +		writel_relaxed(tx->ahb_seq,  chan->regs + AHBDMA_CH_AHB_SEQ);
>>> +		writel_relaxed(tx->ahb_addr, chan->regs + AHBDMA_CH_AHB_PTR);
>>> +		writel_relaxed(tx->mem_addr, chan->regs + AHBDMA_CH_XMB_PTR);
>>> +		writel_relaxed(tx->csr,      chan->regs + AHBDMA_CH_CSR);
>>> +
>>> +		reinit_completion(&chan->idling);
>>
>> Should this be done before actually starting the DMA?

OK, then that's fine.

[...]

>>> +	else {
>>> +		tx = to_ahbdma_tx_desc(vdesc);
>>> +
>>> +		if (tx == ahbdma_chan->active_tx)
>>> +			residual = tegra_ahbdma_residual(ahbdma_chan);
>>> +		else
>>> +			residual = tx->csr & AHBDMA_CH_WCOUNT_MASK;
>>> +
>>> +		residual += sizeof(u32);
>>> +	}
>>> +
>>> +	dma_set_residue(state, residual);
>>
>> I believe residue needs to be bytes.

Oops yes indeed!

>>> +static int tegra_ahbdma_terminate_all(struct dma_chan *chan)
>>> +{
>>> +	struct tegra_ahbdma_chan *ahbdma_chan = to_ahbdma_chan(chan);
>>> +	unsigned long flags;
>>> +	LIST_HEAD(head);
>>> +	u32 csr;
>>> +
>>> +	spin_lock_irqsave(&ahbdma_chan->vchan.lock, flags);
>>> +
>>> +	csr = readl_relaxed(ahbdma_chan->regs + AHBDMA_CH_CSR);
>>> +	writel_relaxed(csr & ~AHBDMA_CH_ENABLE,
>>> +		       ahbdma_chan->regs + AHBDMA_CH_CSR);
>>> +
>>> +	if (ahbdma_chan->active_tx) {
>>> +		udelay(AHBDMA_BURST_COMPLETE_TIME);
>>
>> Why not poll the status register and wait for the channel to stop?
>>
> 
> That probably would also work. But I'm not sure whether status depends on the
> channels "enable" state..

Well if it is not enabled, then we probably don't care about the state.
However, a quick test should tell us.

>>> +
>>> +		writel_relaxed(AHBDMA_CH_IS_EOC,
>>> +			       ahbdma_chan->regs + AHBDMA_CH_STA);
>>> +
>>> +		ahbdma_chan->active_tx = NULL;
>>> +	}
>>> +
>>> +	vchan_get_all_descriptors(&ahbdma_chan->vchan, &head);
>>> +	complete_all(&ahbdma_chan->idling);
>>> +
>>> +	spin_unlock_irqrestore(&ahbdma_chan->vchan.lock, flags);
>>> +
>>> +	vchan_dma_desc_free_list(&ahbdma_chan->vchan, &head);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int tegra_ahbdma_config(struct dma_chan *chan,
>>> +			       struct dma_slave_config *sconfig)
>>> +{
>>> +	struct tegra_ahbdma_chan *ahbdma_chan = to_ahbdma_chan(chan);
>>> +	enum dma_transfer_direction dir = sconfig->direction;
>>> +	u32 burst, ahb_seq, csr;
>>> +	unsigned int slave_id;
>>> +	phys_addr_t ahb_addr;
>>> +
>>> +	if (sconfig->src_addr_width != DMA_SLAVE_BUSWIDTH_4_BYTES ||
>>> +	    sconfig->dst_addr_width != DMA_SLAVE_BUSWIDTH_4_BYTES)
>>> +		return -EINVAL;
>>> +
>>> +	switch (dir) {
>>> +	case DMA_DEV_TO_MEM:
>>> +		burst    = sconfig->src_maxburst;
>>> +		ahb_addr = sconfig->src_addr;
>>> +		break;
>>> +	case DMA_MEM_TO_DEV:
>>> +		burst    = sconfig->dst_maxburst;
>>> +		ahb_addr = sconfig->dst_addr;
>>> +		break;
>>> +	default:
>>> +		return -EINVAL;
>>> +	}
>>> +
>>> +	switch (burst) {
>>> +	case 1:
>>> +		burst = AHBDMA_CH_AHB_BURST_1;
>>> +		break;
>>> +	case 4:
>>> +		burst = AHBDMA_CH_AHB_BURST_4;
>>> +		break;
>>> +	case 8:
>>> +		burst = AHBDMA_CH_AHB_BURST_8;
>>> +		break;
>>> +	default:
>>> +		return -EINVAL;
>>> +	}
>>> +
>>> +	if (ahb_addr & 3)
>>> +		return -EINVAL;
>>> +
>>> +	ahb_seq  = burst << AHBDMA_CH_AHB_BURST_SHIFT;
>>> +	ahb_seq |= AHBDMA_CH_INTR_ENB;
>>> +
>>> +	csr  = AHBDMA_CH_ENABLE;
>>> +	csr |= AHBDMA_CH_IE_EOC;
>>> +
>>> +	if (ahbdma_chan->of_slave || sconfig->device_fc) {
>>> +		if (ahbdma_chan->of_req_sel < TEGRA_AHBDMA_REQ_N_A)
>>> +			slave_id = ahbdma_chan->of_req_sel;
>>> +		else
>>> +			slave_id = sconfig->slave_id;
>>> +
>>> +		if (slave_id > 15)
>>> +			return -EINVAL;
>>
>> Why not ...
>>
>> 	if (ahbdma_chan->of_req_sel < TEGRA_AHBDMA_REQ_N_A)
>> 		slave_id = ahbdma_chan->of_req_sel;
>> 	else if (slave_id = sconfig->slave_id < TEGRA_AHBDMA_REQ_N_A)
>> 		slave_id = sconfig->slave_id;
>> 	else
>> 		return -EINVAL;
>>
> 
> Because I'm finding variant like yours more difficult to read. I'll stick with
> my variant if you don't mind.

Ha! I prefer mine :-)

>>> +
>>> +		ahb_seq |= AHBDMA_CH_ADDR_WRAP;
>>> +
>>> +		csr |= slave_id << AHBDMA_CH_REQ_SEL_SHIFT;
>>> +		csr |= AHBDMA_CH_FLOW;
>>> +	}
>>> +
>>> +	ahbdma_chan->csr = csr;
>>> +	ahbdma_chan->ahb_seq = ahb_seq;
>>> +	ahbdma_chan->ahb_addr = ahb_addr;
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static void tegra_ahbdma_synchronize(struct dma_chan *chan)
>>> +{
>>> +	struct tegra_ahbdma_chan *ahbdma_chan = to_ahbdma_chan(chan);
>>> +
>>> +	wait_for_completion(&ahbdma_chan->idling);
>>> +	vchan_synchronize(&ahbdma_chan->vchan);
>>> +}
>>> +
>>> +static void tegra_ahbdma_free_chan_resources(struct dma_chan *chan)
>>> +{
>>> +	vchan_free_chan_resources(to_virt_chan(chan));
>>> +}
>>> +
>>> +static void tegra_ahbdma_init_channel(struct tegra_ahbdma *tdma,
>>> +				      unsigned int chan_id)
>>> +{
>>> +	struct tegra_ahbdma_chan *ahbdma_chan = &tdma->channels[chan_id];
>>> +	struct dma_device *dma_dev = &tdma->dma_dev;
>>> +
>>> +	vchan_init(&ahbdma_chan->vchan, dma_dev);
>>> +	init_completion(&ahbdma_chan->idling);
>>> +	complete(&ahbdma_chan->idling);
>>> +
>>> +	ahbdma_chan->regs = tdma->regs + AHBDMA_CH_BASE(chan_id);
>>> +	ahbdma_chan->vchan.desc_free = tegra_ahbdma_tx_desc_free;
>>> +	ahbdma_chan->of_req_sel = TEGRA_AHBDMA_REQ_N_A;
>>> +}
>>> +
>>> +static struct dma_chan *tegra_ahbdma_of_xlate(struct of_phandle_args *dma_spec,
>>> +					      struct of_dma *ofdma)
>>> +{
>>> +	struct tegra_ahbdma *tdma = ofdma->of_dma_data;
>>> +	struct dma_chan *chan;
>>> +
>>> +	chan = dma_get_any_slave_channel(&tdma->dma_dev);
>>> +	if (!chan)
>>> +		return NULL;
>>> +
>>> +	to_ahbdma_chan(chan)->of_req_sel = dma_spec->args[0];
>>
>> Test for args[0] < TEGRA_AHBDMA_REQ_N_A?
>>
> 
> It would duplicate slave_id checking done in tegra_ahbdma_config(), so not
> needed here.

But surely we should not let them request a channel in the first place?

>>> +	to_ahbdma_chan(chan)->of_slave = true;
>>
>> Is this really needed? Doesn't a value of 0..TEGRA_AHBDMA_REQ_N_A-1 tell
>> us it is valid?
>>
> 
> I think we should enforce channels flow control in a case of OF xlate'd channel,
> no? To avoid abusing channels usage by client. Seems tegra_ahbdma_config isn't
> correct, should be:

Absolutely. However, I don't see the need for the additional 'of_slave'
variable. If we validate the slave id here, we can get rid of the extra
variable. It does not simplify the code really by adding this IMO.

> 	if (ahbdma_chan->of_slave || sconfig->device_fc) {
> -		if (ahbdma_chan->of_req_sel < TEGRA_AHBDMA_REQ_N_A)
> +		if (ahbdma_chan->of_slave)
> 			slave_id = ahbdma_chan->of_req_sel;
> 		else
> 			slave_id = sconfig->slave_id;
> 
> 		if (slave_id >= TEGRA_AHBDMA_REQ_N_A)
> 			return -EINVAL;
> 
> I'm finding OF-requsted channel + ability of DMA API to override requested
> channels parameters quite vague. So I'm not exactly sure how to handle it
> correctly. It looks like each driver is free to do its own thing, which is kinda
> a mess. Suggestions?

I think it is fine how you have it and limit OF-requested channels to
actual REQ_SEL values.

Cheers
Jon

-- 
nvpublic
