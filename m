From: Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: Re: [PATCH V2 3/5] PCI: tegra: Add support for PCIe endpoint mode
 in Tegra194
Date: Mon, 13 Jan 2020 23:42:55 +0530
Message-ID: <e4a806f5-6efb-d221-7627-a50a427bea99@nvidia.com>
References: <20200103124404.20662-1-vidyas@nvidia.com>
 <20200103124404.20662-4-vidyas@nvidia.com> <20200106131416.GD1955714@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200106131416.GD1955714@ulmo>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org, bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, andrew.murray-5wv7dgnIgG8@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, gustavo.pimentel-HKixBCOQz3hWk0Htik3J/w@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, kthota-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, sagar.tv-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org



On 1/6/20 6:44 PM, Thierry Reding wrote:
> On Fri, Jan 03, 2020 at 06:14:02PM +0530, Vidya Sagar wrote:
>> Add support for the endpoint mode of Synopsys DesignWare core based
>> dual mode PCIe controllers present in Tegra194 SoC.
>>
>> Signed-off-by: Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>> V2:
>> * Addressed Bjorn's review comments
>> * Made changes as part of addressing review comments for other patches
>>
>>   drivers/pci/controller/dwc/Kconfig         |  30 +-
>>   drivers/pci/controller/dwc/pcie-tegra194.c | 782 ++++++++++++++++++++-
>>   2 files changed, 796 insertions(+), 16 deletions(-)
>>
> [...]
>> diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
>> index cbe95f0ea0ca..6621ac79efee 100644
>> --- a/drivers/pci/controller/dwc/pcie-tegra194.c
>> +++ b/drivers/pci/controller/dwc/pcie-tegra194.c
> [...]
>> @@ -1427,8 +1620,553 @@ static int tegra_pcie_config_rp(struct tegra_pcie_dw *pcie)
> [...]
>> +static int tegra_pcie_config_ep(struct tegra_pcie_dw *pcie,
>> +				struct platform_device *pdev)
>> +{
> [...]
>> +	ret = devm_request_irq(dev, pcie->pex_rst_irq,
>> +			       tegra_pcie_ep_pex_rst_irq,
>> +			       IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING,
>> +			       name, (void *)pcie);
>> +	if (ret < 0) {
>> +		dev_err(dev, "Failed to request IRQ for PERST: %d\n", ret);
>> +		return ret;
>> +	}
>> +	disable_irq(pcie->pex_rst_irq);
> 
> I just came across this while reviewing another patch: it looks like a
> better way to handle "disabled by default" interrupts is to do this:
> 
> 	irq_set_status_flags(rtc->irq, IRQ_NOAUTOEN);
> 
> before calling devm_request_irq(). See here for an example:
> 
> 	http://patchwork.ozlabs.org/patch/1217944/
I'll take care of it.

Thanks for the review.
Vidya Sagar

> 
> Thierry
> 
