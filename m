From: Vidya Sagar <vidyas@nvidia.com>
Subject: Re: [PATCH 0/6] PCI: tegra: Enable PCIe C5 controller of Tegra194 in
 p2972-0000 platform
Date: Wed, 28 Aug 2019 15:34:02 +0530
Message-ID: <57b55bde-0f59-27ef-8bd3-13408d6d4493@nvidia.com>
References: <20190826073143.4582-1-vidyas@nvidia.com>
 <20190828091028.GB2917@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190828091028.GB2917@ulmo>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: lorenzo.pieralisi@arm.com, bhelgaas@google.com, robh+dt@kernel.org, jonathanh@nvidia.com, kishon@ti.com, gustavo.pimentel@synopsys.com, digetx@gmail.com, mperttunen@nvidia.com, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kthota@nvidia.com, mmaddireddy@nvidia.com, sagar.tv@gmail.com
List-Id: linux-tegra@vger.kernel.org

On 8/28/2019 2:40 PM, Thierry Reding wrote:
> On Mon, Aug 26, 2019 at 01:01:37PM +0530, Vidya Sagar wrote:
>> This patch series enables Tegra194's C5 controller which owns x16 slot in
>> p2972-0000 platform. C5 controller's PERST# and CLKREQ# are not configured as
>> output and bi-directional signals by default and hence they need to be
>> configured explicitly. Also, x16 slot's 3.3V and 12V supplies are controlled
>> through GPIOs and hence they need to be enabled through regulator framework.
>> This patch series adds required infrastructural support to address both the
>> aforementioned requirements.
>> Testing done on p2972-0000 platform
>> - Able to enumerate devices connected to x16 slot (owned by C5 controller)
>> - Enumerated device's functionality verified
>> - Suspend-Resume sequence is verified with device connected to x16 slot
>>
>> Vidya Sagar (6):
>>    dt-bindings: PCI: tegra: Add sideband pins configuration entries
>>    arm64: tegra: Add configuration for PCIe C5 sideband signals
>>    PCI: tegra: Add support to configure sideband pins
>>    dt-bindings: PCI: tegra: Add PCIe slot supplies regulator entries
>>    arm64: tegra: Add PCIe slot supply information in p2972-0000 platform
>>    PCI: tegra: Add support to enable slot regulators
> 
> Hi Vidya,
> 
> when you resend with review comments addressed, can you please reorder
> the patches slightly? I think it's more natural to order them like this:
> 
>      dt-bindings: PCI: tegra: Add sideband pins configuration entries
>      PCI: tegra: Add support to configure sideband pins
>      dt-bindings: PCI: tegra: Add PCIe slot supplies regulator entries
>      PCI: tegra: Add support to enable slot regulators
>      arm64: tegra: Add configuration for PCIe C5 sideband signals
>      arm64: tegra: Add PCIe slot supply information in p2972-0000 platform
> 
> Or perhaps even like this:
> 
>      dt-bindings: PCI: tegra: Add sideband pins configuration entries
>      dt-bindings: PCI: tegra: Add PCIe slot supplies regulator entries
>      PCI: tegra: Add support to configure sideband pins
>      PCI: tegra: Add support to enable slot regulators
>      arm64: tegra: Add configuration for PCIe C5 sideband signals
>      arm64: tegra: Add PCIe slot supply information in p2972-0000 platform
> 
> That makes it more obvious that patches 1-2 need an Acked-by from Rob
> and patches 1-4 need to go through Lorenzo's tree and that I'll pick up
> patches 5-6.Sure.
I'll do that.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
	t=1566986650; bh=fKSn9tEu0u/7kvehjleUQGVzZJJHx0MojZ9eQ2aJqWM=;
	h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
	 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
	 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
	 Content-Transfer-Encoding;
	b=aSDWQiNYeJefaP3hT1F2Kc9CSOb6AJPVC1NOPnn4rLtaj7EOJb+j70r/h4+I3bKEk
	 N6siO4F51Zz49OC3S0601fPefcag3AJZZQEdvrpk3pIhqGZ+62QMXTeG4f7t/ETsLY
	 TPYf5ksG6Kb8vxeUEAY6ATiHOIhjJhbLjRn/uJ/Oat+8ZRv3VgTOtujSHpzsKf1rTz
	 gJZbRa8GsOlGBEvMoc7xxgRDx1/GzUqaHw8T8GqLV/JDOW9qNy44TVpHkk4Exc7g5+
	 bM5zCyghflgpfG+ZMzbwZEkd1b4gDyPfxYL2J+AzEjgQyVsBSU6+nXSjJg65VfzSd6
	 bM8cWEfkmyeMA==

Thanks,
Vidya Sagar

> 
> Thierry
> 
