From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: [RFC PATCH 7/7] DMA: tegra-adma: Add support for Tegra210 ADMA
Date: Mon, 24 Aug 2015 14:54:40 +0530
Message-ID: <20150824092440.GJ13546@localhost>
References: <1439905755-25150-1-git-send-email-jonathanh@nvidia.com>
 <1439905755-25150-8-git-send-email-jonathanh@nvidia.com>
 <20150823143328.GC13546@localhost>
 <55DADBE7.80006@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <55DADBE7.80006@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Aug 24, 2015 at 09:55:03AM +0100, Jon Hunter wrote:
> >> +static int tegra_adma_get_xfer_params(struct tegra_dma_channel *tdc,
> >> +				      struct tegra_adma_chan_regs *ch_regs,
> >> +				      enum dma_transfer_direction direction)
> >> +{
> >> +	u32 burst_size, ctrl, ctrl_mask, slave_id, fifo_mask, fifo_shift;
> >> +
> >> +	ch_regs->ahub_fifo_ctrl = tdc_read(tdc, ADMA_CH_AHUB_FIFO_CTRL);
> >> +	ch_regs->config = tdc_read(tdc, ADMA_CH_CONFIG);
> >> +	ch_regs->ctrl = tdc_read(tdc, ADMA_CH_CTRL);
> >> +	slave_id = tdc->dma_sconfig.slave_id;
> >> +
> >> +	switch (direction) {
> >> +	case DMA_MEM_TO_DEV:
> >> +		burst_size = fls(tdc->dma_sconfig.dst_maxburst);
> >> +		ctrl_mask = ADMA_CH_CTRL_TX_REQUEST_SELECT_MASK;
> >> +		ctrl = MEMORY_TO_AHUB << ADMA_CH_CTRL_TRANSFER_DIRECTION_SHIFT;
> >> +		ctrl |= slave_id << ADMA_CH_CTRL_TX_REQUEST_SELECT_SHIFT;
> >> +		fifo_mask = ADMA_CH_AHUB_FIFO_CTRL_TX_FIFO_SIZE_MASK;
> >> +		fifo_shift = ADMA_CH_AHUB_FIFO_CTRL_TX_FIFO_SIZE_SHIFT;
> >> +		break;
> > Empty line here pls
> 
> Ok, any reason why? Other dma drivers don't appear to do this.

This improves readablity. It is a good idea to sprinkle empty lines between
logial blocks

> >> +static int tegra_adma_pm_suspend(struct device *dev)
> >> +{
> >> +	struct tegra_dma *tdma = dev_get_drvdata(dev);
> >> +	int i;
> >> +	int ret;
> >> +
> >> +	ret = pm_runtime_get_sync(dev);
> > why is this required :)
> 
> To ensure that the clocks are enabled before the registers are read.
> This function saves the dma context before suspend, in case the hardware
> state is lost.
I think same reason here too, so based on my other argument, this may not be
required!

-- 
~Vinod
