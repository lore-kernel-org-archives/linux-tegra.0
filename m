From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 2/3] dmaengine: Add driver for NVIDIA Tegra AHB DMA
 controller
Date: Fri, 6 Oct 2017 22:11:42 +0300
Message-ID: <35dd2e3a-1f97-b82e-4763-a9d064761bc8@gmail.com>
References: <cover.1507073384.git.digetx@gmail.com>
 <9ef93a0054a6a2e27b72e5bfeebe81e5ab11a224.1507073384.git.digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <9ef93a0054a6a2e27b72e5bfeebe81e5ab11a224.1507073384.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vinod Koul <vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 04.10.2017 02:58, Dmitry Osipenko wrote:
> AHB DMA controller presents on Tegra20/30 SoC's, it supports transfers
> memory <-> AHB bus peripherals as well as mem-to-mem transfers. Driver
> doesn't yet implement transfers larger than 64K and scatter-gather
> transfers that have NENT > 1, HW doesn't have native support for these
> cases, mem-to-mem isn't implemented as well.
> 
> Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/dma/Kconfig           |  10 +
>  drivers/dma/Makefile          |   1 +
>  drivers/dma/tegra20-ahb-dma.c | 630 ++++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 641 insertions(+)
>  create mode 100644 drivers/dma/tegra20-ahb-dma.c
> 
> diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
> index 04e381b522b4..7d132aa85174 100644
> --- a/drivers/dma/Kconfig
> +++ b/drivers/dma/Kconfig
> @@ -512,6 +512,16 @@ config TXX9_DMAC
>  	  Support the TXx9 SoC internal DMA controller.  This can be
>  	  integrated in chips such as the Toshiba TX4927/38/39.
>  
> +config TEGRA20_AHB_DMA
> +	tristate "NVIDIA Tegra20 AHB DMA support"
> +	depends on ARCH_TEGRA || COMPILE_TEST
> +	select DMA_ENGINE
> +	select DMA_VIRTUAL_CHANNELS
> +	help
> +	  Enable support for the NVIDIA Tegra20 AHB DMA controller driver.
> +	  This DMA controller transfers data from memory to AHB peripherals
> +	  or vice versa, it supports memory to memory data transfer as well.
> +
>  config TEGRA20_APB_DMA
>  	bool "NVIDIA Tegra20 APB DMA support"
>  	depends on ARCH_TEGRA
> diff --git a/drivers/dma/Makefile b/drivers/dma/Makefile
> index a145ad1426bc..f3d284bf6d65 100644
> --- a/drivers/dma/Makefile
> +++ b/drivers/dma/Makefile
> @@ -62,6 +62,7 @@ obj-$(CONFIG_STM32_DMA) += stm32-dma.o
>  obj-$(CONFIG_STM32_DMAMUX) += stm32-dmamux.o
>  obj-$(CONFIG_S3C24XX_DMAC) += s3c24xx-dma.o
>  obj-$(CONFIG_TXX9_DMAC) += txx9dmac.o
> +obj-$(CONFIG_TEGRA20_AHB_DMA) += tegra20-ahb-dma.o
>  obj-$(CONFIG_TEGRA20_APB_DMA) += tegra20-apb-dma.o
>  obj-$(CONFIG_TEGRA210_ADMA) += tegra210-adma.o
>  obj-$(CONFIG_TIMB_DMA) += timb_dma.o
> diff --git a/drivers/dma/tegra20-ahb-dma.c b/drivers/dma/tegra20-ahb-dma.c
> new file mode 100644
> index 000000000000..2d176a5536aa
> --- /dev/null
> +++ b/drivers/dma/tegra20-ahb-dma.c
> @@ -0,0 +1,630 @@
> +/*
> + * Copyright 2017 Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program.  If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/of_dma.h>
> +#include <linux/platform_device.h>
> +#include <linux/reset.h>
> +#include <linux/slab.h>
> +
> +#include <dt-bindings/dma/tegra-ahb-dma.h>
> +
> +#include "virt-dma.h"
> +
> +#define AHBDMA_CMD			0x0
> +#define AHBDMA_CMD_ENABLE		BIT(31)
> +
> +#define AHBDMA_IRQ_ENB_MASK		0x20
> +#define AHBDMA_IRQ_ENB_CH(ch)		BIT(ch)
> +
> +#define AHBDMA_CH_BASE(ch)		(0x1000 + (ch) * 0x20)
> +
> +#define AHBDMA_CH_CSR			0x0
> +#define AHBDMA_CH_ADDR_WRAP		BIT(18)
> +#define AHBDMA_CH_FLOW			BIT(24)
> +#define AHBDMA_CH_ONCE			BIT(26)
> +#define AHBDMA_CH_DIR_TO_XMB		BIT(27)
> +#define AHBDMA_CH_IE_EOC		BIT(30)
> +#define AHBDMA_CH_ENABLE		BIT(31)
> +#define AHBDMA_CH_REQ_SEL_SHIFT		16
> +#define AHBDMA_CH_WCOUNT_MASK		GENMASK(15, 2)
> +
> +#define AHBDMA_CH_STA			0x4
> +#define AHBDMA_CH_IS_EOC		BIT(30)
> +
> +#define AHBDMA_CH_AHB_PTR		0x10
> +
> +#define AHBDMA_CH_AHB_SEQ		0x14
> +#define AHBDMA_CH_INTR_ENB		BIT(31)
> +#define AHBDMA_CH_AHB_BURST_SHIFT	24
> +#define AHBDMA_CH_AHB_BURST_1		2
> +#define AHBDMA_CH_AHB_BURST_4		3
> +#define AHBDMA_CH_AHB_BURST_8		4
> +
> +#define AHBDMA_CH_XMB_PTR		0x18
> +
> +#define AHBDMA_BUS_WIDTH		BIT(DMA_SLAVE_BUSWIDTH_4_BYTES)
> +
> +#define AHBDMA_DIRECTIONS		BIT(DMA_DEV_TO_MEM) | \
> +					BIT(DMA_MEM_TO_DEV)
> +
> +#define AHBDMA_BURST_COMPLETE_TIME	20
> +
> +struct tegra_ahbdma_tx_desc {
> +	struct virt_dma_desc vdesc;
> +	dma_addr_t mem_addr;
> +	phys_addr_t ahb_addr;
> +	u32 ahb_seq;
> +	u32 csr;
> +};
> +
> +struct tegra_ahbdma_chan {
> +	struct tegra_ahbdma_tx_desc *active_tx;
> +	struct virt_dma_chan vchan;
> +	struct completion idling;
> +	void __iomem *regs;
> +	phys_addr_t ahb_addr;
> +	u32 ahb_seq;
> +	u32 csr;
> +	unsigned int of_req_sel;
> +	bool of_slave;
> +};
> +
> +struct tegra_ahbdma {
> +	struct tegra_ahbdma_chan channels[4];
> +	struct dma_device dma_dev;
> +	struct reset_control *rst;
> +	struct clk *clk;
> +	void __iomem *regs;
> +};
> +
> +static inline struct tegra_ahbdma_chan *to_ahbdma_chan(struct dma_chan *chan)
> +{
> +	return container_of(chan, struct tegra_ahbdma_chan, vchan.chan);
> +}
> +
> +static inline struct tegra_ahbdma_tx_desc *to_ahbdma_tx_desc(
> +						struct virt_dma_desc *vdesc)
> +{
> +	return container_of(vdesc, struct tegra_ahbdma_tx_desc, vdesc);
> +}
> +
> +static struct tegra_ahbdma_tx_desc *tegra_ahbdma_get_next_tx(
> +						struct tegra_ahbdma_chan *chan)
> +{
> +	struct virt_dma_desc *vdesc = vchan_next_desc(&chan->vchan);
> +
> +	if (vdesc)
> +		list_del(&vdesc->node);

I just noticed that this is incorrect. Node must be deleted after TX completion,
otherwise vchan_find_desc won't find TX and residual won't be reported by
dmaengine_tx_status.

Jon, I think you ADMA driver has the same issue, as well as several other DMA
drivers that use virt-dma.

> +
> +	return vdesc ? to_ahbdma_tx_desc(vdesc) : NULL;
> +}
> +
> +static void tegra_ahbdma_issue_next_tx(struct tegra_ahbdma_chan *chan)
> +{
> +	struct tegra_ahbdma_tx_desc *tx = tegra_ahbdma_get_next_tx(chan);
> +
> +	if (tx) {
> +		writel_relaxed(tx->ahb_seq,  chan->regs + AHBDMA_CH_AHB_SEQ);
> +		writel_relaxed(tx->ahb_addr, chan->regs + AHBDMA_CH_AHB_PTR);
> +		writel_relaxed(tx->mem_addr, chan->regs + AHBDMA_CH_XMB_PTR);
> +		writel_relaxed(tx->csr,      chan->regs + AHBDMA_CH_CSR);
> +
> +		reinit_completion(&chan->idling);
> +	} else
> +		complete_all(&chan->idling);
> +
> +	chan->active_tx = tx;
> +}
> +
> +static bool tegra_ahbdma_clear_interrupt(struct tegra_ahbdma_chan *chan)
> +{
> +	u32 status = readl_relaxed(chan->regs + AHBDMA_CH_STA);
> +
> +	if (status & AHBDMA_CH_IS_EOC) {
> +		writel_relaxed(AHBDMA_CH_IS_EOC, chan->regs + AHBDMA_CH_STA);
> +
> +		return true;
> +	}
> +
> +	return false;
> +}
> +
> +static bool tegra_ahbdma_handle_channel(struct tegra_ahbdma_chan *chan)
> +{
> +	struct tegra_ahbdma_tx_desc *tx;
> +	unsigned long flags;
> +	bool intr = false;
> +	bool cyclic;
> +
> +	spin_lock_irqsave(&chan->vchan.lock, flags);
> +
> +	tx = chan->active_tx;
> +	if (tx)
> +		intr = tegra_ahbdma_clear_interrupt(chan);
> +
> +	if (intr) {
> +		cyclic = !(tx->csr & AHBDMA_CH_ONCE);
> +
> +		if (!cyclic)
> +			tegra_ahbdma_issue_next_tx(chan);
> +
> +		if (cyclic)
> +			vchan_cyclic_callback(&tx->vdesc);
> +		else
> +			vchan_cookie_complete(&tx->vdesc);
> +	}
> +
> +	spin_unlock_irqrestore(&chan->vchan.lock, flags);
> +
> +	return intr;
> +}
> +
> +static irqreturn_t tegra_ahbdma_isr(int irq, void *dev_id)
> +{
> +	struct tegra_ahbdma *tdma = dev_id;
> +	bool handled;
> +
> +	handled  = tegra_ahbdma_handle_channel(&tdma->channels[0]);
> +	handled |= tegra_ahbdma_handle_channel(&tdma->channels[1]);
> +	handled |= tegra_ahbdma_handle_channel(&tdma->channels[2]);
> +	handled |= tegra_ahbdma_handle_channel(&tdma->channels[3]);
> +
> +	return handled ? IRQ_HANDLED : IRQ_NONE;
> +}
> +
> +static void tegra_ahbdma_tx_desc_free(struct virt_dma_desc *vdesc)
> +{
> +	kfree(to_ahbdma_tx_desc(vdesc));
> +}
> +
> +static struct dma_async_tx_descriptor *tegra_ahbdma_prep(
> +					struct dma_chan *chan,
> +					enum dma_transfer_direction dir,
> +					unsigned long flags,
> +					dma_addr_t paddr,
> +					size_t size,
> +					bool cyclic)
> +{
> +	struct tegra_ahbdma_chan *ahbdma_chan = to_ahbdma_chan(chan);
> +	struct tegra_ahbdma_tx_desc *tx;
> +	u32 csr = ahbdma_chan->csr;
> +
> +	/* size and alignments should fulfill HW requirements */
> +	if (size < 4 || size & 3 || paddr & 3)
> +		return NULL;
> +
> +	tx = kzalloc(sizeof(*tx), GFP_NOWAIT);
> +	if (!tx)
> +		return NULL;
> +
> +	if (dir == DMA_DEV_TO_MEM)
> +		csr |= AHBDMA_CH_DIR_TO_XMB;
> +
> +	if (!cyclic)
> +		csr |= AHBDMA_CH_ONCE;
> +
> +	tx->csr = csr | (size - sizeof(u32));
> +	tx->ahb_seq = ahbdma_chan->ahb_seq;
> +	tx->ahb_addr = ahbdma_chan->ahb_addr;
> +	tx->mem_addr = paddr;
> +
> +	return vchan_tx_prep(&ahbdma_chan->vchan, &tx->vdesc, flags);
> +}
> +
> +static struct dma_async_tx_descriptor *tegra_ahbdma_prep_slave_sg(
> +					struct dma_chan *chan,
> +					struct scatterlist *sgl,
> +					unsigned int sg_len,
> +					enum dma_transfer_direction dir,
> +					unsigned long flags,
> +					void *context)
> +{
> +	/* unimplemented */
> +	if (sg_len != 1 || sg_dma_len(sgl) > SZ_64K)
> +		return NULL;
> +
> +	return tegra_ahbdma_prep(chan, dir, flags, sg_dma_address(sgl),
> +				 sg_dma_len(sgl), false);
> +}
> +
> +static struct dma_async_tx_descriptor *tegra_ahbdma_prep_dma_cyclic(
> +					struct dma_chan *chan,
> +					dma_addr_t buf_addr,
> +					size_t buf_len,
> +					size_t period_len,
> +					enum dma_transfer_direction dir,
> +					unsigned long flags)
> +{
> +	/* unimplemented */
> +	if (buf_len != period_len || buf_len > SZ_64K)
> +		return NULL;
> +
> +	return tegra_ahbdma_prep(chan, dir, flags, buf_addr, buf_len, true);
> +}
> +
> +static void tegra_ahbdma_issue_pending(struct dma_chan *chan)
> +{
> +	struct tegra_ahbdma_chan *ahbdma_chan = to_ahbdma_chan(chan);
> +	struct virt_dma_chan *vchan = &ahbdma_chan->vchan;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&vchan->lock, flags);
> +
> +	if (vchan_issue_pending(vchan) && !ahbdma_chan->active_tx)
> +		tegra_ahbdma_issue_next_tx(ahbdma_chan);
> +
> +	spin_unlock_irqrestore(&vchan->lock, flags);
> +}
> +
> +static size_t tegra_ahbdma_residual(struct tegra_ahbdma_chan *chan)
> +{
> +	u32 status = readl_relaxed(chan->regs + AHBDMA_CH_STA);
> +
> +	return (status & AHBDMA_CH_WCOUNT_MASK);
> +}
> +
> +static enum dma_status tegra_ahbdma_tx_status(struct dma_chan *chan,
> +					      dma_cookie_t cookie,
> +					      struct dma_tx_state *state)
> +{
> +	struct tegra_ahbdma_chan *ahbdma_chan = to_ahbdma_chan(chan);
> +	struct tegra_ahbdma_tx_desc *tx;
> +	struct virt_dma_desc *vdesc;
> +	enum dma_status cookie_status;
> +	unsigned long flags;
> +	size_t residual;
> +
> +	spin_lock_irqsave(&ahbdma_chan->vchan.lock, flags);
> +
> +	cookie_status = dma_cookie_status(chan, cookie, state);
> +	if (cookie_status == DMA_COMPLETE)
> +		goto unlock;
> +
> +	vdesc = vchan_find_desc(&ahbdma_chan->vchan, cookie);
> +	if (!vdesc)
> +		residual = 0;
> +	else {
> +		tx = to_ahbdma_tx_desc(vdesc);
> +
> +		if (tx == ahbdma_chan->active_tx)
> +			residual = tegra_ahbdma_residual(ahbdma_chan);
> +		else
> +			residual = tx->csr & AHBDMA_CH_WCOUNT_MASK;
> +
> +		residual += sizeof(u32);
> +	}
> +
> +	dma_set_residue(state, residual);
> +
> +unlock:
> +	spin_unlock_irqrestore(&ahbdma_chan->vchan.lock, flags);
> +
> +	return cookie_status;
> +}
> +
> +static int tegra_ahbdma_terminate_all(struct dma_chan *chan)
> +{
> +	struct tegra_ahbdma_chan *ahbdma_chan = to_ahbdma_chan(chan);
> +	unsigned long flags;
> +	LIST_HEAD(head);
> +	u32 csr;
> +
> +	spin_lock_irqsave(&ahbdma_chan->vchan.lock, flags);
> +
> +	csr = readl_relaxed(ahbdma_chan->regs + AHBDMA_CH_CSR);
> +	writel_relaxed(csr & ~AHBDMA_CH_ENABLE,
> +		       ahbdma_chan->regs + AHBDMA_CH_CSR);
> +
> +	if (ahbdma_chan->active_tx) {
> +		udelay(AHBDMA_BURST_COMPLETE_TIME);
> +
> +		writel_relaxed(AHBDMA_CH_IS_EOC,
> +			       ahbdma_chan->regs + AHBDMA_CH_STA);
> +
> +		ahbdma_chan->active_tx = NULL;
> +	}
> +
> +	vchan_get_all_descriptors(&ahbdma_chan->vchan, &head);
> +	complete_all(&ahbdma_chan->idling);
> +
> +	spin_unlock_irqrestore(&ahbdma_chan->vchan.lock, flags);
> +
> +	vchan_dma_desc_free_list(&ahbdma_chan->vchan, &head);
> +
> +	return 0;
> +}
> +
> +static int tegra_ahbdma_config(struct dma_chan *chan,
> +			       struct dma_slave_config *sconfig)
> +{
> +	struct tegra_ahbdma_chan *ahbdma_chan = to_ahbdma_chan(chan);
> +	enum dma_transfer_direction dir = sconfig->direction;
> +	u32 burst, ahb_seq, csr;
> +	unsigned int slave_id;
> +	phys_addr_t ahb_addr;
> +
> +	if (sconfig->src_addr_width != DMA_SLAVE_BUSWIDTH_4_BYTES ||
> +	    sconfig->dst_addr_width != DMA_SLAVE_BUSWIDTH_4_BYTES)
> +		return -EINVAL;
> +
> +	switch (dir) {
> +	case DMA_DEV_TO_MEM:
> +		burst    = sconfig->src_maxburst;
> +		ahb_addr = sconfig->src_addr;
> +		break;
> +	case DMA_MEM_TO_DEV:
> +		burst    = sconfig->dst_maxburst;
> +		ahb_addr = sconfig->dst_addr;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	switch (burst) {
> +	case 1:
> +		burst = AHBDMA_CH_AHB_BURST_1;
> +		break;
> +	case 4:
> +		burst = AHBDMA_CH_AHB_BURST_4;
> +		break;
> +	case 8:
> +		burst = AHBDMA_CH_AHB_BURST_8;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	if (ahb_addr & 3)
> +		return -EINVAL;
> +
> +	ahb_seq  = burst << AHBDMA_CH_AHB_BURST_SHIFT;
> +	ahb_seq |= AHBDMA_CH_INTR_ENB;
> +
> +	csr  = AHBDMA_CH_ENABLE;
> +	csr |= AHBDMA_CH_IE_EOC;
> +
> +	if (ahbdma_chan->of_slave || sconfig->device_fc) {
> +		if (ahbdma_chan->of_req_sel < TEGRA_AHBDMA_REQ_N_A)
> +			slave_id = ahbdma_chan->of_req_sel;
> +		else
> +			slave_id = sconfig->slave_id;
> +
> +		if (slave_id > 15)
> +			return -EINVAL;
> +
> +		ahb_seq |= AHBDMA_CH_ADDR_WRAP;
> +
> +		csr |= slave_id << AHBDMA_CH_REQ_SEL_SHIFT;
> +		csr |= AHBDMA_CH_FLOW;
> +	}
> +
> +	ahbdma_chan->csr = csr;
> +	ahbdma_chan->ahb_seq = ahb_seq;
> +	ahbdma_chan->ahb_addr = ahb_addr;
> +
> +	return 0;
> +}
> +
> +static void tegra_ahbdma_synchronize(struct dma_chan *chan)
> +{
> +	struct tegra_ahbdma_chan *ahbdma_chan = to_ahbdma_chan(chan);
> +
> +	wait_for_completion(&ahbdma_chan->idling);
> +	vchan_synchronize(&ahbdma_chan->vchan);
> +}
> +
> +static void tegra_ahbdma_free_chan_resources(struct dma_chan *chan)
> +{
> +	vchan_free_chan_resources(to_virt_chan(chan));
> +}
> +
> +static void tegra_ahbdma_init_channel(struct tegra_ahbdma *tdma,
> +				      unsigned int chan_id)
> +{
> +	struct tegra_ahbdma_chan *ahbdma_chan = &tdma->channels[chan_id];
> +	struct dma_device *dma_dev = &tdma->dma_dev;
> +
> +	vchan_init(&ahbdma_chan->vchan, dma_dev);
> +	init_completion(&ahbdma_chan->idling);
> +	complete(&ahbdma_chan->idling);
> +
> +	ahbdma_chan->regs = tdma->regs + AHBDMA_CH_BASE(chan_id);
> +	ahbdma_chan->vchan.desc_free = tegra_ahbdma_tx_desc_free;
> +	ahbdma_chan->of_req_sel = TEGRA_AHBDMA_REQ_N_A;
> +}
> +
> +static struct dma_chan *tegra_ahbdma_of_xlate(struct of_phandle_args *dma_spec,
> +					      struct of_dma *ofdma)
> +{
> +	struct tegra_ahbdma *tdma = ofdma->of_dma_data;
> +	struct dma_chan *chan;
> +
> +	chan = dma_get_any_slave_channel(&tdma->dma_dev);
> +	if (!chan)
> +		return NULL;
> +
> +	to_ahbdma_chan(chan)->of_req_sel = dma_spec->args[0];
> +	to_ahbdma_chan(chan)->of_slave = true;
> +
> +	return chan;
> +}
> +
> +static int tegra_ahbdma_init_hw(struct tegra_ahbdma *tdma, struct device *dev)
> +{
> +	int err;
> +
> +	err = reset_control_assert(tdma->rst);
> +	if (err) {
> +		dev_err(dev, "Failed to assert reset: %d\n", err);
> +		return err;
> +	}
> +
> +	err = clk_prepare_enable(tdma->clk);
> +	if (err) {
> +		dev_err(dev, "Failed to enable clock: %d\n", err);
> +		return err;
> +	}
> +
> +	usleep_range(1000, 2000);
> +
> +	err = reset_control_deassert(tdma->rst);
> +	if (err) {
> +		dev_err(dev, "Failed to deassert reset: %d\n", err);
> +		return err;
> +	}
> +
> +	writel_relaxed(AHBDMA_CMD_ENABLE, tdma->regs + AHBDMA_CMD);
> +
> +	writel_relaxed(AHBDMA_IRQ_ENB_CH(0) |
> +		       AHBDMA_IRQ_ENB_CH(1) |
> +		       AHBDMA_IRQ_ENB_CH(2) |
> +		       AHBDMA_IRQ_ENB_CH(3),
> +		       tdma->regs + AHBDMA_IRQ_ENB_MASK);
> +
> +	return 0;
> +}
> +
> +static int tegra_ahbdma_probe(struct platform_device *pdev)
> +{
> +	struct dma_device *dma_dev;
> +	struct tegra_ahbdma *tdma;
> +	struct resource *res_regs;
> +	unsigned int i;
> +	int irq;
> +	int err;
> +
> +	tdma = devm_kzalloc(&pdev->dev, sizeof(*tdma), GFP_KERNEL);
> +	if (!tdma)
> +		return -ENOMEM;
> +
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq < 0) {
> +		dev_err(&pdev->dev, "Failed to get IRQ\n");
> +		return irq;
> +	}
> +
> +	err = devm_request_irq(&pdev->dev, irq, tegra_ahbdma_isr, 0,
> +			       dev_name(&pdev->dev), tdma);
> +	if (err) {
> +		dev_err(&pdev->dev, "Failed to request IRQ\n");
> +		return -ENODEV;
> +	}
> +
> +	res_regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!res_regs)
> +		return -ENODEV;
> +
> +	tdma->regs = devm_ioremap_resource(&pdev->dev, res_regs);
> +	if (IS_ERR(tdma->regs))
> +		return PTR_ERR(tdma->regs);
> +
> +	tdma->clk = devm_clk_get(&pdev->dev, NULL);
> +	if (IS_ERR(tdma->clk)) {
> +		dev_err(&pdev->dev, "Failed to get AHB-DMA clock\n");
> +		return PTR_ERR(tdma->clk);
> +	}
> +
> +	tdma->rst = devm_reset_control_get(&pdev->dev, NULL);
> +	if (IS_ERR(tdma->rst)) {
> +		dev_err(&pdev->dev, "Failed to get AHB-DMA reset\n");
> +		return PTR_ERR(tdma->rst);
> +	}
> +
> +	err = tegra_ahbdma_init_hw(tdma, &pdev->dev);
> +	if (err)
> +		return err;
> +
> +	dma_dev = &tdma->dma_dev;
> +
> +	INIT_LIST_HEAD(&dma_dev->channels);
> +
> +	for (i = 0; i < ARRAY_SIZE(tdma->channels); i++)
> +		tegra_ahbdma_init_channel(tdma, i);
> +
> +	dma_cap_set(DMA_PRIVATE, dma_dev->cap_mask);
> +	dma_cap_set(DMA_CYCLIC, dma_dev->cap_mask);
> +	dma_cap_set(DMA_SLAVE, dma_dev->cap_mask);
> +
> +	dma_dev->max_burst		= 8;
> +	dma_dev->directions		= AHBDMA_DIRECTIONS;
> +	dma_dev->src_addr_widths	= AHBDMA_BUS_WIDTH;
> +	dma_dev->dst_addr_widths	= AHBDMA_BUS_WIDTH;
> +	dma_dev->descriptor_reuse	= true;
> +	dma_dev->residue_granularity	= DMA_RESIDUE_GRANULARITY_BURST;
> +	dma_dev->device_free_chan_resources = tegra_ahbdma_free_chan_resources;
> +	dma_dev->device_prep_slave_sg	= tegra_ahbdma_prep_slave_sg;
> +	dma_dev->device_prep_dma_cyclic	= tegra_ahbdma_prep_dma_cyclic;
> +	dma_dev->device_terminate_all	= tegra_ahbdma_terminate_all;
> +	dma_dev->device_issue_pending	= tegra_ahbdma_issue_pending;
> +	dma_dev->device_tx_status	= tegra_ahbdma_tx_status;
> +	dma_dev->device_config		= tegra_ahbdma_config;
> +	dma_dev->device_synchronize	= tegra_ahbdma_synchronize;
> +	dma_dev->dev			= &pdev->dev;
> +
> +	err = dma_async_device_register(dma_dev);
> +	if (err) {
> +		dev_err(&pdev->dev, "Device registration failed %d\n", err);
> +		return err;
> +	}
> +
> +	err = of_dma_controller_register(pdev->dev.of_node,
> +					 tegra_ahbdma_of_xlate, tdma);
> +	if (err) {
> +		dev_err(&pdev->dev, "OF registration failed %d\n", err);
> +		dma_async_device_unregister(dma_dev);
> +		return err;
> +	}
> +
> +	platform_set_drvdata(pdev, tdma);
> +
> +	return 0;
> +}
> +
> +static int tegra_ahbdma_remove(struct platform_device *pdev)
> +{
> +	struct tegra_ahbdma *tdma = platform_get_drvdata(pdev);
> +
> +	of_dma_controller_free(pdev->dev.of_node);
> +	dma_async_device_unregister(&tdma->dma_dev);
> +	clk_disable_unprepare(tdma->clk);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id tegra_ahbdma_of_match[] = {
> +	{ .compatible = "nvidia,tegra20-ahbdma" },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, tegra_ahbdma_of_match);
> +
> +static struct platform_driver tegra_ahbdma_driver = {
> +	.driver = {
> +		.name = "tegra-ahbdma",
> +		.of_match_table = tegra_ahbdma_of_match,
> +	},
> +	.probe	= tegra_ahbdma_probe,
> +	.remove	= tegra_ahbdma_remove,
> +};
> +module_platform_driver(tegra_ahbdma_driver);
> +
> +MODULE_DESCRIPTION("NVIDIA Tegra AHB DMA Controller driver");
> +MODULE_AUTHOR("Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>");
> +MODULE_LICENSE("GPL");
> 
