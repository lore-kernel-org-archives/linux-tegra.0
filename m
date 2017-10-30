From: Manikanta Maddireddy <mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 04/12] PCI: tegra: Advertise AER capability
Date: Mon, 30 Oct 2017 09:24:15 +0530
Message-ID: <10a9ba6c-7a4d-6eab-2c8c-dbd86de67727@nvidia.com>
References: <1509132569-9398-1-git-send-email-mmaddireddy@nvidia.com>
 <1509132569-9398-5-git-send-email-mmaddireddy@nvidia.com>
 <64d00808-9c79-86b5-130d-835e3e5d5c1c@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <64d00808-9c79-86b5-130d-835e3e5d5c1c-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kthota-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org



On 29-Oct-17 3:09 PM, Vidya Sagar wrote:
> 
> 
> On Saturday 28 October 2017 12:59 AM, Manikanta Maddireddy wrote:
>> Default root port settings hide AER capability. This patch enables the
>> advertisement of AER capability by root port.
>>
>> Signed-off-by: Manikanta Maddireddy <mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>>   drivers/pci/host/pci-tegra.c | 14 ++++++++++++++
>>   1 file changed, 14 insertions(+)
>>
>> diff --git a/drivers/pci/host/pci-tegra.c b/drivers/pci/host/pci-tegra.c
>> index 15df60e13a14..c0cd88103e9e 100644
>> --- a/drivers/pci/host/pci-tegra.c
>> +++ b/drivers/pci/host/pci-tegra.c
>> @@ -187,6 +187,9 @@
>>   #define RP_VEND_XP    0x00000f00
>>   #define  RP_VEND_XP_DL_UP    (1 << 30)
>>   +#define RP_VEND_CTL1    0xf48
>> +#define  RP_VEND_CTL1_ERPT    (1 << 13)
> BIT macro is preferred here.
Left shift is used everywhere, so to be inline with that I used same format
>> +
>>   #define RP_VEND_CTL2 0x00000fa8
>>   #define  RP_VEND_CTL2_PCA_ENABLE (1 << 7)
>>   @@ -2055,6 +2058,16 @@ static void tegra_pcie_apply_pad_settings(struct tegra_pcie *pcie)
>>           pads_writel(pcie, soc->pads_refclk_cfg1, PADS_REFCLK_CFG1);
>>   }
>>   +static void tegra_pcie_enable_rp_features(struct tegra_pcie_port *port)
>> +{
>> +    unsigned long value;
>> +
>> +    /* Enable AER capability */
>> +    value = readl(port->base + RP_VEND_CTL1);
>> +    value |= RP_VEND_CTL1_ERPT;
>> +    writel(value, port->base + RP_VEND_CTL1);
>> +}
>> +
>>   /*
>>    * FIXME: If there are no PCIe cards attached, then calling this function
>>    * can result in the increase of the bootup time as there are big timeout
>> @@ -2119,6 +2132,7 @@ static void tegra_pcie_enable_ports(struct tegra_pcie *pcie)
>>                port->index, port->lanes);
>>             tegra_pcie_port_enable(port);
>> +        tegra_pcie_enable_rp_features(port);
>>       }
>>         /* take the PCIe interface module out of reset */
> 
