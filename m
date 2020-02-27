From: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH V3 5/5] PCI: tegra: Add support for PCIe endpoint mode in
 Tegra194
Date: Thu, 27 Feb 2020 11:48:16 +0000
Message-ID: <20200227114816.GA11443@e121166-lin.cambridge.arm.com>
References: <20200113181411.32743-1-vidyas@nvidia.com>
 <20200113181411.32743-6-vidyas@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200113181411.32743-6-vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, andrew.murray-5wv7dgnIgG8@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, gustavo.pimentel-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kthota-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, sagar.tv-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Jan 13, 2020 at 11:44:11PM +0530, Vidya Sagar wrote:
> Add support for the endpoint mode of Synopsys DesignWare core based
> dual mode PCIe controllers present in Tegra194 SoC.
> 
> Signed-off-by: Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> V3:
> * Addressed Thierry's review comments

I need his ACK to merge this series.

[...]

> +static int tegra_pcie_ep_work_thread(void *p)
> +{
> +	struct tegra_pcie_dw *pcie = (struct tegra_pcie_dw *)p;
> +	u32 event;
> +
> +	while (true) {
> +		wait_event_interruptible(pcie->wq,
> +					 !kfifo_is_empty(&pcie->event_fifo));
> +
> +		if (kthread_should_stop())
> +			break;
> +
> +		if (!kfifo_get(&pcie->event_fifo, &event)) {
> +			dev_warn(pcie->dev, "EVENT FIFO is empty\n");
> +			continue;
> +		}
> +
> +		switch (event) {
> +		case EP_PEX_RST_DEASSERT:
> +			dev_info(pcie->dev, "EVENT: EP_PEX_RST_DEASSERT\n");
> +			pex_ep_event_pex_rst_deassert(pcie);
> +			break;
> +
> +		case EP_PEX_RST_ASSERT:
> +			dev_info(pcie->dev, "EVENT: EP_PEX_RST_ASSERT\n");
> +			pex_ep_event_pex_rst_assert(pcie);
> +			break;
> +
> +		case EP_HOT_RST_DONE:
> +			dev_info(pcie->dev, "EVENT: EP_HOT_RST_DONE\n");
> +			pex_ep_event_hot_rst_done(pcie);
> +			break;
> +
> +		case EP_BME_CHANGE:
> +			dev_info(pcie->dev, "EVENT: EP_BME_CHANGE\n");
> +			pex_ep_event_bme_change(pcie);
> +			break;
> +
> +		case EP_EVENT_EXIT:
> +			dev_info(pcie->dev, "EVENT: EP_EVENT_EXIT\n");
> +			return 0;
> +
> +		default:
> +			dev_warn(pcie->dev, "Invalid PCIe EP event: %u\n",
> +				 event);
> +			break;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static irqreturn_t tegra_pcie_ep_pex_rst_irq(int irq, void *arg)
> +{
> +	struct tegra_pcie_dw *pcie = arg;
> +
> +	if (gpiod_get_value(pcie->pex_rst_gpiod)) {
> +		if (!kfifo_put(&pcie->event_fifo, EP_PEX_RST_ASSERT)) {
> +			dev_err(pcie->dev, "EVENT FIFO is full\n");
> +			return IRQ_HANDLED;
> +		}
> +	} else {
> +		if (!kfifo_put(&pcie->event_fifo, EP_PEX_RST_DEASSERT)) {
> +			dev_err(pcie->dev, "EVENT FIFO is full\n");
> +			return IRQ_HANDLED;
> +		}
> +	}
> +
> +	wake_up(&pcie->wq);
> +
> +	return IRQ_HANDLED;
> +}
> +

[...]

> +static int tegra_pcie_config_ep(struct tegra_pcie_dw *pcie,
> +				struct platform_device *pdev)
> +{
> +	struct dw_pcie *pci = &pcie->pci;
> +	struct device *dev = pcie->dev;
> +	struct dw_pcie_ep *ep;
> +	struct resource *res;
> +	char *name;
> +	int ret;
> +
> +	ep = &pci->ep;
> +	ep->ops = &pcie_ep_ops;
> +
> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "addr_space");
> +	if (!res)
> +		return -EINVAL;
> +
> +	ep->phys_base = res->start;
> +	ep->addr_size = resource_size(res);
> +	ep->page_size = SZ_64K;
> +
> +	ret = gpiod_set_debounce(pcie->pex_rst_gpiod, PERST_DEBOUNCE_TIME);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to set PERST GPIO debounce time: %d\n",
> +			ret);
> +		return ret;
> +	}
> +
> +	ret = gpiod_to_irq(pcie->pex_rst_gpiod);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to get IRQ for PERST GPIO: %d\n", ret);
> +		return ret;
> +	}
> +	pcie->pex_rst_irq = (unsigned int)ret;
> +
> +	name = devm_kasprintf(dev, GFP_KERNEL, "tegra_pcie_%u_pex_rst_irq",
> +			      pcie->cid);
> +	if (!name) {
> +		dev_err(dev, "Failed to create PERST IRQ string\n");
> +		return -ENOMEM;
> +	}
> +
> +	irq_set_status_flags(pcie->pex_rst_irq, IRQ_NOAUTOEN);
> +
> +	ret = devm_request_irq(dev, pcie->pex_rst_irq,
> +			       tegra_pcie_ep_pex_rst_irq,
> +			       IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING,
> +			       name, (void *)pcie);

I have the impression that a threaded IRQ is what you need, which
will also remove some boilerplate in the process. Any reason why
you can't use a threaded IRQ instead of a standalone kthread ?

Thanks,
Lorenzo
