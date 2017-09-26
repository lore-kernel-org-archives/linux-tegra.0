From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v1 4/5] dmaengine: Add driver for NVIDIA Tegra AHB DMA
 controller
Date: Wed, 27 Sep 2017 02:00:05 +0300
Message-ID: <55cd52ab-16b5-8073-0344-8fbdeca22b54@gmail.com>
References: <cover.1506380746.git.digetx@gmail.com>
 <0a45e058baba72124b91c663ce1d908d275f4044.1506380746.git.digetx@gmail.com>
 <481add20-9cea-a91a-e72c-45a824362e64@nvidia.com>
 <189ae234-86c4-02ed-698c-5b447e27bf27@gmail.com>
 <8fa6108d-421d-8054-c05c-9681a0e25518@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <8fa6108d-421d-8054-c05c-9681a0e25518-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 27.09.2017 00:37, Jon Hunter wrote:
> Hi Dmitry,
> 
> On 26/09/17 17:06, Dmitry Osipenko wrote:
>> Hi Jon,
>>
>> On 26.09.2017 17:45, Jon Hunter wrote:
>>> Hi Dmitry,
>>>
>>> On 26/09/17 00:22, Dmitry Osipenko wrote:
>>>> AHB DMA controller presents on Tegra20/30 SoC's, it supports transfers
>>>> memory <-> AHB bus peripherals as well as mem-to-mem transfers. Driver
>>>> doesn't yet implement transfers larger than 64K and scatter-gather
>>>> transfers that have NENT > 1, HW doesn't have native support for these
>>>> cases.
>>>>
>>>> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>>> ---
>>>>  drivers/dma/Kconfig           |   9 +
>>>>  drivers/dma/Makefile          |   1 +
>>>>  drivers/dma/tegra20-ahb-dma.c | 679 ++++++++++++++++++++++++++++++++++++++++++
>>>>  3 files changed, 689 insertions(+)
>>>>  create mode 100644 drivers/dma/tegra20-ahb-dma.c
>>>
>>> ...
>>>
>>>> diff --git a/drivers/dma/tegra20-ahb-dma.c b/drivers/dma/tegra20-ahb-dma.c
>>>> new file mode 100644
>>>> index 000000000000..8316d64e35e1
>>>> --- /dev/null
>>>> +++ b/drivers/dma/tegra20-ahb-dma.c
>>>> @@ -0,0 +1,679 @@
>>>> +/*
>>>> + * Copyright 2017 Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>>>> + *
>>>> + * This program is free software; you can redistribute it and/or modify it
>>>> + * under the terms and conditions of the GNU General Public License,
>>>> + * version 2, as published by the Free Software Foundation.
>>>> + *
>>>> + * This program is distributed in the hope it will be useful, but WITHOUT
>>>> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
>>>> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
>>>> + * more details.
>>>> + *
>>>> + * You should have received a copy of the GNU General Public License
>>>> + * along with this program.  If not, see <http://www.gnu.org/licenses/>.
>>>> + */
>>>> +
>>>> +#include <linux/clk.h>
>>>> +#include <linux/delay.h>
>>>> +#include <linux/interrupt.h>
>>>> +#include <linux/io.h>
>>>> +#include <linux/module.h>
>>>> +#include <linux/of_device.h>
>>>> +#include <linux/of_dma.h>
>>>> +#include <linux/platform_device.h>
>>>> +#include <linux/reset.h>
>>>> +#include <linux/slab.h>
>>>> +#include <linux/spinlock.h>
>>>> +
>>>> +#include "dmaengine.h"
>>>> +
>>>> +#define TEGRA_AHBDMA_CMD			0x0
>>>> +#define TEGRA_AHBDMA_CMD_ENABLE			BIT(31)
>>>> +
>>>> +#define TEGRA_AHBDMA_IRQ_ENB_MASK		0x20
>>>> +#define TEGRA_AHBDMA_IRQ_ENB_CH(ch)		BIT(ch)
>>>> +
>>>> +#define TEGRA_AHBDMA_CHANNEL_BASE(ch)		(0x1000 + (ch) * 0x20)
>>>> +
>>>> +#define TEGRA_AHBDMA_CHANNEL_CSR		0x0
>>>> +#define TEGRA_AHBDMA_CHANNEL_ADDR_WRAP		BIT(18)
>>>> +#define TEGRA_AHBDMA_CHANNEL_FLOW		BIT(24)
>>>> +#define TEGRA_AHBDMA_CHANNEL_ONCE		BIT(26)
>>>> +#define TEGRA_AHBDMA_CHANNEL_DIR_TO_XMB		BIT(27)
>>>> +#define TEGRA_AHBDMA_CHANNEL_IE_EOC		BIT(30)
>>>> +#define TEGRA_AHBDMA_CHANNEL_ENABLE		BIT(31)
>>>> +#define TEGRA_AHBDMA_CHANNEL_REQ_SEL_SHIFT	16
>>>> +#define TEGRA_AHBDMA_CHANNEL_WCOUNT_MASK	0xFFFC
>>>> +
>>>> +#define TEGRA_AHBDMA_CHANNEL_STA		0x4
>>>> +#define TEGRA_AHBDMA_CHANNEL_IS_EOC		BIT(30)
>>>> +
>>>> +#define TEGRA_AHBDMA_CHANNEL_AHB_PTR		0x10
>>>> +
>>>> +#define TEGRA_AHBDMA_CHANNEL_AHB_SEQ		0x14
>>>> +#define TEGRA_AHBDMA_CHANNEL_INTR_ENB		BIT(31)
>>>> +#define TEGRA_AHBDMA_CHANNEL_AHB_BURST_SHIFT	24
>>>> +#define TEGRA_AHBDMA_CHANNEL_AHB_BURST_1	2
>>>> +#define TEGRA_AHBDMA_CHANNEL_AHB_BURST_4	3
>>>> +#define TEGRA_AHBDMA_CHANNEL_AHB_BURST_8	4
>>>> +
>>>> +#define TEGRA_AHBDMA_CHANNEL_XMB_PTR		0x18
>>>> +
>>>> +#define TEGRA_AHBDMA_BUS_WIDTH			BIT(DMA_SLAVE_BUSWIDTH_4_BYTES)
>>>> +
>>>> +#define TEGRA_AHBDMA_DIRECTIONS			BIT(DMA_DEV_TO_MEM) | \
>>>> +						BIT(DMA_MEM_TO_DEV)
>>>> +
>>>> +struct tegra_ahbdma_tx_desc {
>>>> +	struct dma_async_tx_descriptor desc;
>>>> +	struct tasklet_struct tasklet;
>>>> +	struct list_head node;
>>>
>>> Any reason why we cannot use the virt-dma framework for this driver? I
>>> would hope it would simplify the driver a bit.
>>>
>>
>> IIUC virt-dma is supposed to provide virtually unlimited number of channels.
>> I've looked at it and decided that it would just add unnecessary functionality
>> and, as a result, complexity. As I wrote in the cover-letter, it is supposed
>> that this driver would have only one consumer - the host1x. It shouldn't be
>> difficult to implement virt-dma later, if desired.  But again it is very
>> unlikely that it would be needed.
> 
> I think that the biggest benefit is that is simplifies the linked list
> management. See the tegra210-adma driver.
> 

I'll take a more thorough look at it. Thank you for suggestion.

>>>> +	enum dma_transfer_direction dir;
>>>> +	dma_addr_t mem_paddr;
>>>> +	unsigned long flags;
>>>> +	size_t size;
>>>> +	bool in_fly;
>>>> +	bool cyclic;
>>>> +};
>>>> +
>>>> +struct tegra_ahbdma_chan {
>>>> +	struct dma_chan dma_chan;
>>>> +	struct list_head active_list;
>>>> +	struct list_head pending_list;
>>>> +	struct completion idling;
>>>> +	void __iomem *regs;
>>>> +	spinlock_t lock;
>>>> +	unsigned int id;
>>>> +};
>>>> +
>>>> +struct tegra_ahbdma {
>>>> +	struct tegra_ahbdma_chan channels[4];
>>>> +	struct dma_device dma_dev;
>>>> +	struct reset_control *rst;
>>>> +	struct clk *clk;
>>>> +	void __iomem *regs;
>>>> +};
>>>> +
>>>> +static inline struct tegra_ahbdma *to_ahbdma(struct dma_device *dev)
>>>> +{
>>>> +	return container_of(dev, struct tegra_ahbdma, dma_dev);
>>>> +}
>>>> +
>>>> +static inline struct tegra_ahbdma_chan *to_ahbdma_chan(struct dma_chan *chan)
>>>> +{
>>>> +	return container_of(chan, struct tegra_ahbdma_chan, dma_chan);
>>>> +}
>>>> +
>>>> +static inline struct tegra_ahbdma_tx_desc *to_ahbdma_tx_desc(
>>>> +				struct dma_async_tx_descriptor *tx)
>>>> +{
>>>> +	return container_of(tx, struct tegra_ahbdma_tx_desc, desc);
>>>> +}
>>>> +
>>>> +static void tegra_ahbdma_submit_tx(struct tegra_ahbdma_chan *chan,
>>>> +				   struct tegra_ahbdma_tx_desc *tx)
>>>> +{
>>>> +	u32 csr;
>>>> +
>>>> +	writel_relaxed(tx->mem_paddr,
>>>> +		       chan->regs + TEGRA_AHBDMA_CHANNEL_XMB_PTR);
>>>> +
>>>> +	csr = readl_relaxed(chan->regs + TEGRA_AHBDMA_CHANNEL_CSR);
>>>> +
>>>> +	csr &= ~TEGRA_AHBDMA_CHANNEL_WCOUNT_MASK;
>>>> +	csr &= ~TEGRA_AHBDMA_CHANNEL_DIR_TO_XMB;
>>>> +	csr |= TEGRA_AHBDMA_CHANNEL_ENABLE;
>>>> +	csr |= TEGRA_AHBDMA_CHANNEL_IE_EOC;
>>>> +	csr |= tx->size - sizeof(u32);
>>>> +
>>>> +	if (tx->dir == DMA_DEV_TO_MEM)
>>>> +		csr |= TEGRA_AHBDMA_CHANNEL_DIR_TO_XMB;
>>>> +
>>>> +	if (!tx->cyclic)
>>>> +		csr |= TEGRA_AHBDMA_CHANNEL_ONCE;
>>>> +
>>>> +	writel_relaxed(csr, chan->regs + TEGRA_AHBDMA_CHANNEL_CSR);
>>>> +
>>>> +	tx->in_fly = true;
>>>> +}
>>>> +
>>>> +static void tegra_ahbdma_tasklet(unsigned long data)
>>>> +{
>>>> +	struct tegra_ahbdma_tx_desc *tx = (struct tegra_ahbdma_tx_desc *)data;
>>>> +	struct dma_async_tx_descriptor *desc = &tx->desc;
>>>> +
>>>> +	dmaengine_desc_get_callback_invoke(desc, NULL);
>>>> +
>>>> +	if (!tx->cyclic && !dmaengine_desc_test_reuse(desc))
>>>> +		kfree(tx);
>>>> +}
>>>> +
>>>> +static bool tegra_ahbdma_tx_completed(struct tegra_ahbdma_chan *chan,
>>>> +				      struct tegra_ahbdma_tx_desc *tx)
>>>> +{
>>>> +	struct dma_async_tx_descriptor *desc = &tx->desc;
>>>> +	bool reuse = dmaengine_desc_test_reuse(desc);
>>>> +	bool interrupt = tx->flags & DMA_PREP_INTERRUPT;
>>>> +	bool completed = !tx->cyclic;
>>>> +
>>>> +	if (completed)
>>>> +		dma_cookie_complete(desc);
>>>> +
>>>> +	if (interrupt)
>>>> +		tasklet_schedule(&tx->tasklet);
>>>> +
>>>> +	if (completed) {
>>>> +		list_del(&tx->node);
>>>> +
>>>> +		if (reuse)
>>>> +			tx->in_fly = false;
>>>> +
>>>> +		if (!interrupt && !reuse)
>>>> +			kfree(tx);
>>>> +	}
>>>> +
>>>> +	return completed;
>>>> +}
>>>> +
>>>> +static bool tegra_ahbdma_next_tx_issued(struct tegra_ahbdma_chan *chan)
>>>> +{
>>>> +	struct tegra_ahbdma_tx_desc *tx;
>>>> +
>>>> +	tx = list_first_entry_or_null(&chan->active_list,
>>>> +				      struct tegra_ahbdma_tx_desc,
>>>> +				      node);
>>>> +	if (tx)
>>>> +		tegra_ahbdma_submit_tx(chan, tx);
>>>> +
>>>> +	return !!tx;
>>>> +}
>>>> +
>>>> +static void tegra_ahbdma_handle_channel(struct tegra_ahbdma_chan *chan)
>>>> +{
>>>> +	struct tegra_ahbdma_tx_desc *tx;
>>>> +	unsigned long flags;
>>>> +	u32 status;
>>>> +
>>>> +	status = readl_relaxed(chan->regs + TEGRA_AHBDMA_CHANNEL_STA);
>>>> +	if (!(status & TEGRA_AHBDMA_CHANNEL_IS_EOC))
>>>> +		return;
>>>> +
>>>> +	writel_relaxed(TEGRA_AHBDMA_CHANNEL_IS_EOC,
>>>> +		       chan->regs + TEGRA_AHBDMA_CHANNEL_STA);
>>>> +
>>>> +	spin_lock_irqsave(&chan->lock, flags);
>>>> +
>>>> +	if (!completion_done(&chan->idling)) {
>>>> +		tx = list_first_entry(&chan->active_list,
>>>> +				      struct tegra_ahbdma_tx_desc,
>>>> +				      node);
>>>> +
>>>> +		if (tegra_ahbdma_tx_completed(chan, tx) &&
>>>> +		    !tegra_ahbdma_next_tx_issued(chan))
>>>> +			complete_all(&chan->idling);
>>>> +	}
>>>> +
>>>> +	spin_unlock_irqrestore(&chan->lock, flags);
>>>> +}
>>>> +
>>>> +static irqreturn_t tegra_ahbdma_isr(int irq, void *dev_id)
>>>> +{
>>>> +	struct tegra_ahbdma *tdma = dev_id;
>>>> +	unsigned int i;
>>>> +
>>>> +	for (i = 0; i < ARRAY_SIZE(tdma->channels); i++)
>>>> +		tegra_ahbdma_handle_channel(&tdma->channels[i]);
>>>> +
>>>> +	return IRQ_HANDLED;
>>>> +}
>>>> +
>>>> +static dma_cookie_t tegra_ahbdma_tx_submit(struct dma_async_tx_descriptor *desc)
>>>> +{
>>>> +	struct tegra_ahbdma_tx_desc *tx = to_ahbdma_tx_desc(desc);
>>>> +	struct tegra_ahbdma_chan *chan = to_ahbdma_chan(desc->chan);
>>>> +	dma_cookie_t cookie;
>>>> +
>>>> +	cookie = dma_cookie_assign(desc);
>>>> +
>>>> +	spin_lock_irq(&chan->lock);
>>>> +	list_add_tail(&tx->node, &chan->pending_list);
>>>> +	spin_unlock_irq(&chan->lock);
>>>> +
>>>> +	return cookie;
>>>> +}
>>>> +
>>>> +static int tegra_ahbdma_tx_desc_free(struct dma_async_tx_descriptor *desc)
>>>> +{
>>>> +	kfree(to_ahbdma_tx_desc(desc));
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static struct dma_async_tx_descriptor *tegra_ahbdma_prep_slave_sg(
>>>> +					struct dma_chan *chan,
>>>> +					struct scatterlist *sgl,
>>>> +					unsigned int sg_len,
>>>> +					enum dma_transfer_direction dir,
>>>> +					unsigned long flags,
>>>> +					void *context)
>>>> +{
>>>> +	struct tegra_ahbdma_tx_desc *tx;
>>>> +
>>>> +	/* unimplemented */
>>>> +	if (sg_len != 1 || sg_dma_len(sgl) > SZ_64K)
>>>> +		return NULL;
>>>> +
>>>> +	tx = kzalloc(sizeof(*tx), GFP_KERNEL);
>>>> +	if (!tx)
>>>> +		return NULL;
>>>> +
>>>> +	dma_async_tx_descriptor_init(&tx->desc, chan);
>>>> +
>>>> +	tx->desc.tx_submit	= tegra_ahbdma_tx_submit;
>>>> +	tx->desc.desc_free	= tegra_ahbdma_tx_desc_free;
>>>> +	tx->mem_paddr		= sg_dma_address(sgl);
>>>> +	tx->size		= sg_dma_len(sgl);
>>>> +	tx->flags		= flags;
>>>> +	tx->dir			= dir;
>>>> +
>>>> +	tasklet_init(&tx->tasklet, tegra_ahbdma_tasklet, (unsigned long)tx);
>>>> +
>>>> +	return &tx->desc;
>>>> +}
>>>> +
>>>> +static struct dma_async_tx_descriptor *tegra_ahbdma_prep_dma_cyclic(
>>>> +					struct dma_chan *chan,
>>>> +					dma_addr_t buf_addr,
>>>> +					size_t buf_len,
>>>> +					size_t period_len,
>>>> +					enum dma_transfer_direction dir,
>>>> +					unsigned long flags)
>>>> +{
>>>> +	struct tegra_ahbdma_tx_desc *tx;
>>>> +
>>>> +	/* unimplemented */
>>>> +	if (buf_len != period_len || buf_len > SZ_64K)
>>>> +		return NULL;
>>>> +
>>>> +	tx = kzalloc(sizeof(*tx), GFP_KERNEL);
>>>> +	if (!tx)
>>>> +		return NULL;
>>>> +
>>>> +	dma_async_tx_descriptor_init(&tx->desc, chan);
>>>> +
>>>> +	tx->desc.tx_submit	= tegra_ahbdma_tx_submit;
>>>> +	tx->mem_paddr		= buf_addr;
>>>> +	tx->size		= buf_len;
>>>> +	tx->flags		= flags;
>>>> +	tx->cyclic		= true;
>>>> +	tx->dir			= dir;
>>>> +
>>>> +	tasklet_init(&tx->tasklet, tegra_ahbdma_tasklet, (unsigned long)tx);
>>>> +
>>>> +	return &tx->desc;
>>>> +}
>>>> +
>>>> +static void tegra_ahbdma_issue_pending(struct dma_chan *chan)
>>>> +{
>>>> +	struct tegra_ahbdma_chan *ahbdma_chan = to_ahbdma_chan(chan);
>>>> +	struct tegra_ahbdma_tx_desc *tx;
>>>> +	struct list_head *entry, *tmp;
>>>> +	unsigned long flags;
>>>> +
>>>> +	spin_lock_irqsave(&ahbdma_chan->lock, flags);
>>>> +
>>>> +	list_for_each_safe(entry, tmp, &ahbdma_chan->pending_list)
>>>> +		list_move_tail(entry, &ahbdma_chan->active_list);
>>>> +
>>>> +	if (completion_done(&ahbdma_chan->idling)) {
>>>> +		tx = list_first_entry_or_null(&ahbdma_chan->active_list,
>>>> +					      struct tegra_ahbdma_tx_desc,
>>>> +					      node);
>>>> +		if (tx) {
>>>> +			tegra_ahbdma_submit_tx(ahbdma_chan, tx);
>>>> +			reinit_completion(&ahbdma_chan->idling);
>>>> +		}
>>>> +	}
>>>> +
>>>> +	spin_unlock_irqrestore(&ahbdma_chan->lock, flags);
>>>> +}
>>>> +
>>>> +static enum dma_status tegra_ahbdma_tx_status(struct dma_chan *chan,
>>>> +					      dma_cookie_t cookie,
>>>> +					      struct dma_tx_state *state)
>>>> +{
>>>> +	struct tegra_ahbdma_chan *ahbdma_chan = to_ahbdma_chan(chan);
>>>> +	struct tegra_ahbdma_tx_desc *tx;
>>>> +	enum dma_status cookie_status;
>>>> +	unsigned long flags;
>>>> +	size_t residual;
>>>> +	u32 status;
>>>> +
>>>> +	spin_lock_irqsave(&ahbdma_chan->lock, flags);
>>>> +
>>>> +	cookie_status = dma_cookie_status(chan, cookie, state);
>>>> +	if (cookie_status != DMA_COMPLETE) {
>>>> +		list_for_each_entry(tx, &ahbdma_chan->active_list, node) {
>>>> +			if (tx->desc.cookie == cookie)
>>>> +				goto found;
>>>> +		}
>>>> +	}
>>>> +
>>>> +	goto unlock;
>>>> +
>>>> +found:
>>>> +	if (tx->in_fly) {
>>>> +		status = readl_relaxed(
>>>> +			ahbdma_chan->regs + TEGRA_AHBDMA_CHANNEL_STA);
>>>> +		status  &= TEGRA_AHBDMA_CHANNEL_WCOUNT_MASK;
>>>> +
>>>> +		residual = status;
>>>> +	} else
>>>> +		residual = tx->size;
>>>> +
>>>> +	dma_set_residue(state, residual);
>>>> +
>>>> +unlock:
>>>> +	spin_unlock_irqrestore(&ahbdma_chan->lock, flags);
>>>> +
>>>> +	return cookie_status;
>>>> +}
>>>> +
>>>> +static int tegra_ahbdma_terminate_all(struct dma_chan *chan)
>>>> +{
>>>> +	struct tegra_ahbdma_chan *ahbdma_chan = to_ahbdma_chan(chan);
>>>> +	struct tegra_ahbdma_tx_desc *tx;
>>>> +	struct list_head *entry, *tmp;
>>>> +	u32 csr;
>>>> +
>>>> +	spin_lock_irq(&ahbdma_chan->lock);
>>>> +
>>>> +	csr = readl_relaxed(ahbdma_chan->regs + TEGRA_AHBDMA_CHANNEL_CSR);
>>>> +	csr &= ~TEGRA_AHBDMA_CHANNEL_ENABLE;
>>>> +
>>>> +	writel_relaxed(csr, ahbdma_chan->regs + TEGRA_AHBDMA_CHANNEL_CSR);
>>>> +
>>>> +	list_for_each_safe(entry, tmp, &ahbdma_chan->active_list) {
>>>> +		tx = list_entry(entry, struct tegra_ahbdma_tx_desc, node);
>>>> +		list_del(entry);
>>>> +		kfree(tx);
>>>> +	}
>>>> +
>>>> +	list_for_each_safe(entry, tmp, &ahbdma_chan->pending_list) {
>>>> +		tx = list_entry(entry, struct tegra_ahbdma_tx_desc, node);
>>>> +		list_del(entry);
>>>> +		kfree(tx);
>>>> +	}
>>>> +
>>>> +	complete_all(&ahbdma_chan->idling);
>>>> +
>>>> +	spin_unlock_irq(&ahbdma_chan->lock);
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static int tegra_ahbdma_config(struct dma_chan *chan,
>>>> +			       struct dma_slave_config *sconfig)
>>>> +{
>>>> +	struct tegra_ahbdma_chan *ahbdma_chan = to_ahbdma_chan(chan);
>>>> +	enum dma_transfer_direction dir = sconfig->direction;
>>>> +	u32 burst, ahb_seq, ahb_addr;
>>>> +
>>>> +	if (sconfig->src_addr_width != DMA_SLAVE_BUSWIDTH_4_BYTES ||
>>>> +	    sconfig->dst_addr_width != DMA_SLAVE_BUSWIDTH_4_BYTES)
>>>> +		return -EINVAL;
>>>> +
>>>> +	if (dir == DMA_DEV_TO_MEM) {
>>>> +		burst    = sconfig->src_maxburst;
>>>> +		ahb_addr = sconfig->src_addr;
>>>> +	} else {
>>>> +		burst    = sconfig->dst_maxburst;
>>>> +		ahb_addr = sconfig->dst_addr;
>>>> +	}
>>>> +
>>>> +	switch (burst) {
>>>> +	case 1: burst = TEGRA_AHBDMA_CHANNEL_AHB_BURST_1; break;
>>>> +	case 4: burst = TEGRA_AHBDMA_CHANNEL_AHB_BURST_4; break;
>>>> +	case 8: burst = TEGRA_AHBDMA_CHANNEL_AHB_BURST_8; break;
>>>> +	default:
>>>> +		return -EINVAL;
>>>> +	}
>>>> +
>>>> +	ahb_seq  = burst << TEGRA_AHBDMA_CHANNEL_AHB_BURST_SHIFT;
>>>> +	ahb_seq |= TEGRA_AHBDMA_CHANNEL_ADDR_WRAP;
>>>> +	ahb_seq |= TEGRA_AHBDMA_CHANNEL_INTR_ENB;
>>>> +
>>>> +	writel_relaxed(ahb_seq,
>>>> +		       ahbdma_chan->regs + TEGRA_AHBDMA_CHANNEL_AHB_SEQ);
>>>> +
>>>> +	writel_relaxed(ahb_addr,
>>>> +		       ahbdma_chan->regs + TEGRA_AHBDMA_CHANNEL_AHB_PTR);
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static void tegra_ahbdma_synchronize(struct dma_chan *chan)
>>>> +{
>>>> +	wait_for_completion(&to_ahbdma_chan(chan)->idling);
>>>> +}
>>>> +
>>>> +static void tegra_ahbdma_free_chan_resources(struct dma_chan *chan)
>>>> +{
>>>> +	struct tegra_ahbdma_chan *ahbdma_chan = to_ahbdma_chan(chan);
>>>> +	struct tegra_ahbdma_tx_desc *tx;
>>>> +	struct list_head *entry, *tmp;
>>>> +
>>>> +	list_for_each_safe(entry, tmp, &ahbdma_chan->pending_list) {
>>>> +		tx = list_entry(entry, struct tegra_ahbdma_tx_desc, node);
>>>> +		list_del(entry);
>>>> +		kfree(tx);
>>>> +	}
>>>> +}
>>>> +
>>>> +static void tegra_ahbdma_init_channel(struct tegra_ahbdma *tdma,
>>>> +				      unsigned int chan_id)
>>>> +{
>>>> +	struct tegra_ahbdma_chan *ahbdma_chan = &tdma->channels[chan_id];
>>>> +	struct dma_chan *dma_chan = &ahbdma_chan->dma_chan;
>>>> +	struct dma_device *dma_dev = &tdma->dma_dev;
>>>> +
>>>> +	INIT_LIST_HEAD(&ahbdma_chan->active_list);
>>>> +	INIT_LIST_HEAD(&ahbdma_chan->pending_list);
>>>> +	init_completion(&ahbdma_chan->idling);
>>>> +	spin_lock_init(&ahbdma_chan->lock);
>>>> +	complete(&ahbdma_chan->idling);
>>>> +
>>>> +	ahbdma_chan->regs = tdma->regs + TEGRA_AHBDMA_CHANNEL_BASE(chan_id);
>>>> +	ahbdma_chan->id = chan_id;
>>>> +
>>>> +	dma_cookie_init(dma_chan);
>>>> +	dma_chan->device = dma_dev;
>>>> +
>>>> +	list_add_tail(&dma_chan->device_node, &dma_dev->channels);
>>>> +}
>>>> +
>>>> +static struct dma_chan *tegra_ahbdma_of_xlate(struct of_phandle_args *dma_spec,
>>>> +					      struct of_dma *ofdma)
>>>> +{
>>>> +	struct tegra_ahbdma *tdma = ofdma->of_dma_data;
>>>> +	struct dma_chan *chan;
>>>> +	u32 csr;
>>>> +
>>>> +	chan = dma_get_any_slave_channel(&tdma->dma_dev);
>>>> +	if (!chan)
>>>> +		return NULL;
>>>> +
>>>> +	/* enable channels flow control */
>>>> +	if (dma_spec->args_count == 1) {
>>>
>>> The DT doc says #dma-cells should be '1' and so if not equal 1, is this
>>> not an error?
>>>
>>
>> I wanted to differentiate slave/master modes here. But if we'd want to add
>> TRIG_SEL as another cell, then it probably would worth to implement a custom DMA
>> configure options, like documentation suggests - to wrap generic
>> dma_slave_config into the custom one. On the other hand that probably would add
>> an unused functionality to the driver.
>>
>>>> +		csr  = TEGRA_AHBDMA_CHANNEL_FLOW;
>>>> +		csr |= dma_spec->args[0] << TEGRA_AHBDMA_CHANNEL_REQ_SEL_SHIFT;
>>>
>>> What about the TRIG_REQ field?
>>>
>>
>> Not implemented, there is no test case for it yet.
>>
>>>> +
>>>> +		writel_relaxed(csr,
>>>> +			to_ahbdma_chan(chan)->regs + TEGRA_AHBDMA_CHANNEL_CSR);
>>>> +	}
>>>> +	
>>>> +	return chan;
>>>> +}
>>>> +
>>>> +static int tegra_ahbdma_init_hw(struct tegra_ahbdma *tdma, struct device *dev)
>>>> +{
>>>> +	int err;
>>>> +
>>>> +	err = reset_control_assert(tdma->rst);
>>>> +	if (err) {
>>>> +		dev_err(dev, "Failed to assert reset: %d\n", err);
>>>> +		return err;
>>>> +	}
>>>> +
>>>> +	err = clk_prepare_enable(tdma->clk);
>>>> +	if (err) {
>>>> +		dev_err(dev, "Failed to enable clock: %d\n", err);
>>>> +		return err;
>>>> +	}
>>>> +
>>>> +	usleep_range(1000, 2000);
>>>> +
>>>> +	err = reset_control_deassert(tdma->rst);
>>>> +	if (err) {
>>>> +		dev_err(dev, "Failed to deassert reset: %d\n", err);
>>>> +		return err;
>>>> +	}
>>>> +
>>>> +	writel_relaxed(TEGRA_AHBDMA_CMD_ENABLE, tdma->regs + TEGRA_AHBDMA_CMD);
>>>> +
>>>> +	writel_relaxed(TEGRA_AHBDMA_IRQ_ENB_CH(0) |
>>>> +		       TEGRA_AHBDMA_IRQ_ENB_CH(1) |
>>>> +		       TEGRA_AHBDMA_IRQ_ENB_CH(2) |
>>>> +		       TEGRA_AHBDMA_IRQ_ENB_CH(3),
>>>> +		       tdma->regs + TEGRA_AHBDMA_IRQ_ENB_MASK);
>>>> +
>>>> +	return 0;
>>>> +}
>>>
>>> Personally I would use the pm_runtime callbacks for this sort of thing
>>> and ...
>>>
>>
>> I decided that it probaby would be better to implement PM later if needed. I'm
>> not sure whether DMA controller consumes any substantial amounts of power while
>> idling. If it's not, why bother? Unnecessary power managment would just cause
>> CPU to waste its cycles (and power) doing PM.
> 
> Yes it probably does not but it is easy to do and so even though there
> are probably a ton of other clocks left running, I still think it is
> good practice.
> 

Okay, I'll take a look into implementing PM. Disabling AHBDMA clock won't stop
the actual clock, but only gate it to the controller.

Thank you for the comments!

-- 
Dmitry
