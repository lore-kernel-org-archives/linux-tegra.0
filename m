From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v1 4/5] dmaengine: Add driver for NVIDIA Tegra AHB DMA
 controller
Date: Thu, 28 Sep 2017 15:17:52 +0300
Message-ID: <8893ef75-a4c0-e918-a1f2-f374f318f9e0@gmail.com>
References: <cover.1506380746.git.digetx@gmail.com>
 <0a45e058baba72124b91c663ce1d908d275f4044.1506380746.git.digetx@gmail.com>
 <20170928092949.GB30097@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170928092949.GB30097@localhost>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 28.09.2017 12:29, Vinod Koul wrote:
> On Tue, Sep 26, 2017 at 02:22:05AM +0300, Dmitry Osipenko wrote:
> 
>> +config TEGRA20_AHB_DMA
>> +	tristate "NVIDIA Tegra20 AHB DMA support"
>> +	depends on ARCH_TEGRA
> 
> Can we add COMPILE_TEST, helps me compile drivers
> 

Good point.

>> +#include <linux/clk.h>
>> +#include <linux/delay.h>
>> +#include <linux/interrupt.h>
>> +#include <linux/io.h>
>> +#include <linux/module.h>
>> +#include <linux/of_device.h>
>> +#include <linux/of_dma.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/reset.h>
>> +#include <linux/slab.h>
>> +#include <linux/spinlock.h>
> 
> no vchan.h, so i presume we are not using that here, any reason why?
> 

Jon Hunter asked the same question, I already reworked driver to use the
virt-dma. Turned out it is a really neat helper, -100 lines of driver code.

>> +
>> +#include "dmaengine.h"
>> +
>> +#define TEGRA_AHBDMA_CMD			0x0
>> +#define TEGRA_AHBDMA_CMD_ENABLE			BIT(31)
>> +
>> +#define TEGRA_AHBDMA_IRQ_ENB_MASK		0x20
>> +#define TEGRA_AHBDMA_IRQ_ENB_CH(ch)		BIT(ch)
>> +
>> +#define TEGRA_AHBDMA_CHANNEL_BASE(ch)		(0x1000 + (ch) * 0x20)
>> +
>> +#define TEGRA_AHBDMA_CHANNEL_CSR		0x0
>> +#define TEGRA_AHBDMA_CHANNEL_ADDR_WRAP		BIT(18)
>> +#define TEGRA_AHBDMA_CHANNEL_FLOW		BIT(24)
>> +#define TEGRA_AHBDMA_CHANNEL_ONCE		BIT(26)
>> +#define TEGRA_AHBDMA_CHANNEL_DIR_TO_XMB		BIT(27)
>> +#define TEGRA_AHBDMA_CHANNEL_IE_EOC		BIT(30)
>> +#define TEGRA_AHBDMA_CHANNEL_ENABLE		BIT(31)
>> +#define TEGRA_AHBDMA_CHANNEL_REQ_SEL_SHIFT	16
>> +#define TEGRA_AHBDMA_CHANNEL_WCOUNT_MASK	0xFFFC
> 
> GENMASK() ?
> 

Okay.

>> +static void tegra_ahbdma_tasklet(unsigned long data)
>> +{
>> +	struct tegra_ahbdma_tx_desc *tx = (struct tegra_ahbdma_tx_desc *)data;
>> +	struct dma_async_tx_descriptor *desc = &tx->desc;
>> +
>> +	dmaengine_desc_get_callback_invoke(desc, NULL);
>> +
>> +	if (!tx->cyclic && !dmaengine_desc_test_reuse(desc))
>> +		kfree(tx);
> 
> lot of code here can be reduced if we use vchan
> 

+1

>> +static struct dma_async_tx_descriptor *tegra_ahbdma_prep_dma_cyclic(
>> +					struct dma_chan *chan,
>> +					dma_addr_t buf_addr,
>> +					size_t buf_len,
>> +					size_t period_len,
>> +					enum dma_transfer_direction dir,
>> +					unsigned long flags)
>> +{
>> +	struct tegra_ahbdma_tx_desc *tx;
>> +
>> +	/* unimplemented */
>> +	if (buf_len != period_len || buf_len > SZ_64K)
>> +		return NULL;
>> +
>> +	tx = kzalloc(sizeof(*tx), GFP_KERNEL);
>> +	if (!tx)
>> +		return NULL;
>> +
>> +	dma_async_tx_descriptor_init(&tx->desc, chan);
>> +
>> +	tx->desc.tx_submit	= tegra_ahbdma_tx_submit;
>> +	tx->mem_paddr		= buf_addr;
>> +	tx->size		= buf_len;
>> +	tx->flags		= flags;
>> +	tx->cyclic		= true;
>> +	tx->dir			= dir;
>> +
>> +	tasklet_init(&tx->tasklet, tegra_ahbdma_tasklet, (unsigned long)tx);
> 
> why not precalulcate the register settings here. While submitting you are in
> hot path keeping dmaengine idle so faster you can submit, better the perf
> 

I may argue that the perf impact isn't measurable, but I agree that
precalculated register value would be a bit cleaner. Thanks for the suggestion.

>> +static void tegra_ahbdma_issue_pending(struct dma_chan *chan)
>> +{
>> +	struct tegra_ahbdma_chan *ahbdma_chan = to_ahbdma_chan(chan);
>> +	struct tegra_ahbdma_tx_desc *tx;
>> +	struct list_head *entry, *tmp;
>> +	unsigned long flags;
>> +
>> +	spin_lock_irqsave(&ahbdma_chan->lock, flags);
>> +
>> +	list_for_each_safe(entry, tmp, &ahbdma_chan->pending_list)
>> +		list_move_tail(entry, &ahbdma_chan->active_list);
>> +
>> +	if (completion_done(&ahbdma_chan->idling)) {
>> +		tx = list_first_entry_or_null(&ahbdma_chan->active_list,
>> +					      struct tegra_ahbdma_tx_desc,
>> +					      node);
>> +		if (tx) {
>> +			tegra_ahbdma_submit_tx(ahbdma_chan, tx);
> 
> what is chan is already running?
> 

It can't run here, we just checked whether it is idling. That would be a HW bug.

>> +			reinit_completion(&ahbdma_chan->idling);
>> +		}
>> +	}
>> +
>> +	spin_unlock_irqrestore(&ahbdma_chan->lock, flags);
>> +}
>> +
>> +static enum dma_status tegra_ahbdma_tx_status(struct dma_chan *chan,
>> +					      dma_cookie_t cookie,
>> +					      struct dma_tx_state *state)
>> +{
>> +	struct tegra_ahbdma_chan *ahbdma_chan = to_ahbdma_chan(chan);
>> +	struct tegra_ahbdma_tx_desc *tx;
>> +	enum dma_status cookie_status;
>> +	unsigned long flags;
>> +	size_t residual;
>> +	u32 status;
>> +
>> +	spin_lock_irqsave(&ahbdma_chan->lock, flags);
>> +
>> +	cookie_status = dma_cookie_status(chan, cookie, state);
>> +	if (cookie_status != DMA_COMPLETE) {
> 
> residue can be NULL so check it before proceeding ahead
> 

Yeah, I noticed it too and fixed it in the upcoming V2 yesterday.

>> +static int tegra_ahbdma_config(struct dma_chan *chan,
>> +			       struct dma_slave_config *sconfig)
>> +{
>> +	struct tegra_ahbdma_chan *ahbdma_chan = to_ahbdma_chan(chan);
>> +	enum dma_transfer_direction dir = sconfig->direction;
>> +	u32 burst, ahb_seq, ahb_addr;
>> +
>> +	if (sconfig->src_addr_width != DMA_SLAVE_BUSWIDTH_4_BYTES ||
>> +	    sconfig->dst_addr_width != DMA_SLAVE_BUSWIDTH_4_BYTES)
>> +		return -EINVAL;
>> +
>> +	if (dir == DMA_DEV_TO_MEM) {
>> +		burst    = sconfig->src_maxburst;
>> +		ahb_addr = sconfig->src_addr;
>> +	} else {
>> +		burst    = sconfig->dst_maxburst;
>> +		ahb_addr = sconfig->dst_addr;
>> +	}
>> +
>> +	switch (burst) {
>> +	case 1: burst = TEGRA_AHBDMA_CHANNEL_AHB_BURST_1; break;
>> +	case 4: burst = TEGRA_AHBDMA_CHANNEL_AHB_BURST_4; break;
>> +	case 8: burst = TEGRA_AHBDMA_CHANNEL_AHB_BURST_8; break;
> 
> pls make this statement and break on subsequent lines, readablity matters
> 

Okay.

>> +	default:
>> +		return -EINVAL;
>> +	}
>> +
>> +	ahb_seq  = burst << TEGRA_AHBDMA_CHANNEL_AHB_BURST_SHIFT;
>> +	ahb_seq |= TEGRA_AHBDMA_CHANNEL_ADDR_WRAP;
>> +	ahb_seq |= TEGRA_AHBDMA_CHANNEL_INTR_ENB;
>> +
>> +	writel_relaxed(ahb_seq,
>> +		       ahbdma_chan->regs + TEGRA_AHBDMA_CHANNEL_AHB_SEQ);
>> +
>> +	writel_relaxed(ahb_addr,
>> +		       ahbdma_chan->regs + TEGRA_AHBDMA_CHANNEL_AHB_PTR);
> 
> oh no, you don't write to HW here. This can be called anytime when you have
> txn running! You should save these and use them in prep_ calls.
> 

Okay.

>> +static int tegra_ahbdma_remove(struct platform_device *pdev)
>> +{
>> +	struct tegra_ahbdma *tdma = platform_get_drvdata(pdev);
>> +
>> +	of_dma_controller_free(pdev->dev.of_node);
>> +	dma_async_device_unregister(&tdma->dma_dev);
>> +	clk_disable_unprepare(tdma->clk);
> 
> not ensuring tasklets are killed and irq is freed so no more tasklets can
> run? I think that needs to be done...
> 

Already fixed in V2 by using vchan_synchronize() that kills tasklet in
tegra_ahbdma_synchronize(). DMA core invokes synchronization upon channels
resource freeing.

>> +MODULE_DESCRIPTION("NVIDIA Tegra AHB DMA Controller driver");
>> +MODULE_AUTHOR("Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>");
>> +MODULE_LICENSE("GPL");
> 
> MODULE_ALIAS?
> 

Not needed, driver is "OF-only". It's default alias is "tegra20-ahb-dma".

-- 
Dmitry
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
