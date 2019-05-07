From: Vidya Sagar <vidyas@nvidia.com>
Subject: Re: [PATCH V5 04/16] PCI: dwc: Perform dbi regs write lock towards
 the end
Date: Tue, 7 May 2019 13:19:32 +0530
Message-ID: <2544621a-4c88-3f3e-786c-7ee8103e132d@nvidia.com>
References: <20190424052004.6270-1-vidyas@nvidia.com>
 <20190424052004.6270-5-vidyas@nvidia.com> <20190503111303.GD32400@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190503111303.GD32400@ulmo>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: lorenzo.pieralisi@arm.com, bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, kishon@ti.com, catalin.marinas@arm.com, will.deacon@arm.com, jingoohan1@gmail.com, gustavo.pimentel@synopsys.com, mperttunen@nvidia.com, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kthota@nvidia.com, mmaddireddy@nvidia.com, sagar.tv@gmail.com
List-Id: linux-tegra@vger.kernel.org

On 5/3/2019 4:43 PM, Thierry Reding wrote:
> On Wed, Apr 24, 2019 at 10:49:52AM +0530, Vidya Sagar wrote:
>> Remove multiple write enable and disable sequences of dbi registers as
>> Tegra194 implements writes to BAR-0 register (offset: 0x10) controlled by
>> DBI write-lock enable bit thereby not allowing any further writes to BAR-0
>> register in config space to take place. Hence disabling write permission
>> only towards the end.
>>
>> Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
>> ---
>> Changes since [v4]:
>> * None
>>
>> Changes since [v3]:
>> * None
>>
>> Changes since [v2]:
>> * None
>>
>> Changes since [v1]:
>> * None
>>
>>   drivers/pci/controller/dwc/pcie-designware-host.c | 3 ---
>>   1 file changed, 3 deletions(-)
>>
>> diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
>> index 36fd3f5b48f6..e5e3571dd2fe 100644
>> --- a/drivers/pci/controller/dwc/pcie-designware-host.c
>> +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
>> @@ -654,7 +654,6 @@ void dw_pcie_setup_rc(struct pcie_port *pp)
>>   	val &= 0xffff00ff;
>>   	val |= 0x00000100;
>>   	dw_pcie_writel_dbi(pci, PCI_INTERRUPT_LINE, val);
>> -	dw_pcie_dbi_ro_wr_dis(pci);
>>   
>>   	/* Setup bus numbers */
>>   	val = dw_pcie_readl_dbi(pci, PCI_PRIMARY_BUS);
>> @@ -686,8 +685,6 @@ void dw_pcie_setup_rc(struct pcie_port *pp)
>>   
>>   	dw_pcie_wr_own_conf(pp, PCI_BASE_ADDRESS_0, 4, 0);
>>   
>> -	/* Enable write permission for the DBI read-only register */
>> -	dw_pcie_dbi_ro_wr_en(pci);
>>   	/* Program correct class for RC */
>>   	dw_pcie_wr_own_conf(pp, PCI_CLASS_DEVICE, 2, PCI_CLASS_BRIDGE_PCI);
>>   	/* Better disable write permission right after the update */
> 
> Perhaps make this explicit by moving the write enable call to the
> beginning of the function and the write disable call to the end?
> 
> Currently it's pretty difficult to see where it's being disabled. Also,
> that would make it more resilient against instantiations that require a
> different register to be programmed with writes enabled.
Agree. I'll move enabling write to beginning of this function and disabling
to the end in the next patch series.

> 
> Thierry
> 
